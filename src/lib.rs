//Copyright 2016 William Cody Laeder
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//you may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distrubuted under the License is distrubuted on as "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.


//!Consistent Time
//!
//!The goal of this crate is to offer constant time functions which most
//!cryptographic computing protocols require to prevent side channelling 
//!timing attacks. 
//!
//!These algorithms are not implemented to be efficient. But to take the
//!same number of processor cycles if their outcome is true, or false.
//!The reference used for this crate is [Go-Lang's
//!crypto/subtile](https://golang.org/src/crypto/subtle/constant_time.go)
//!Which implements a handful of constant time algorithms.
//!
//!I took the liberity of generalizing them out to all unsigned sizes
//!supported by Rust-Lang. Everything inside of this crate is defined
//!as a macro. This makes writing the extremely repetive code for all
//!types a lot easier.


#![no_std]

const MAX_U8: u8 = ::core::u8::MAX;
const MAX_U16: u16 = ::core::u16::MAX;
const MAX_U32: u32 = ::core::u32::MAX;
const MAX_U64: u64 = ::core::u64::MAX;
const MAX_USIZE: usize = ::core::usize::MAX;

/*
 * The purpose of the below macro is two fold. 
 *  1. Define the function to do constant unsigned integer comparisons
 *  2. Define a *fairly* comphensive test to validate that function.
 *
 */
macro_rules! ct_eq_gen {
    ($name: ident, $code: ty, $max: expr, $($shr: expr),*
        ;; $test_name: ident, $test_v0: expr, $test_v1: expr) => {
        ///Returns 1usize if x==y, otherwise returns 0usize
        pub fn $name( x: $code, y: $code) -> usize {
            let mut z: $code = $max ^ (x^y);
            $(
                z &= z.wrapping_shr($shr);
            )*
            z as usize
        }
        #[test]
        fn $test_name() {
            let x: $code = $test_v0;
            let y: $code = $test_v1;
            assert_eq!( $name($max,$max), 1);
            assert_eq!( $name(x,x), 1);
            assert_eq!( $name(y,y), 1);
            assert_eq!( $name(0,0), 1);
            assert_eq!( $name(1,1), 1);
            assert_eq!( $name($max,0), 0);
            assert_eq!( $name($max,1), 0);
            assert_eq!( $name($max,x), 0);
            assert_eq!( $name($max,y), 0);
            assert_eq!( $name(y,1), 0);
            assert_eq!( $name(x,1), 0);
            assert_eq!( $name(y,0), 0);
            assert_eq!( $name(x,0), 0);
            assert_eq!( $name(x,y), 0);
            $(
                assert_eq!( $name($shr,$shr), 1);
                assert_eq!( $name($shr,0), 0);
                assert_eq!( $name($shr,$max), 0);
            )*
        }
    }
}
ct_eq_gen!(ct_u8_eq,u8,MAX_U8,4,2,1;;
    test_ct_u8_eq, 155, 15);
ct_eq_gen!(ct_u16_eq,u16,MAX_U16,8,4,2,1;;
    test_ct_u16_eq, 32000, 5);
ct_eq_gen!(ct_u32_eq,u32,MAX_U32,16,8,4,2,1;;
    test_ct_u32_eq, 2000000, 15);
ct_eq_gen!(ct_u64_eq,u64,MAX_U64,32,16,8,4,2,1;;
    test_ct_u64_eq, 25893654215879, 2);
#[cfg(target_pointer_width = "32")]
ct_eq_gen!(ct_usize_eq,usize,MAX_USIZE,16,8,4,2,1;;
    test_ct_u32_eq, 2082600, 15);
#[cfg(target_pointer_width = "64")]
ct_eq_gen!(ct_usize_eq,usize,MAX_USIZE,32,16,8,4,2,1;;
    test_ct_usize_eq, 859632175648921456, 5);


/*
 * The purpose of the below macro is the same as the above.
 *
 *  1. Produce a function to perform the comparison between
 *      two slices which will take place in constant time
 *  2. Define a test to validate the behavior of the above
 *      defined function
 */
macro_rules! ct_eq_slice_gen {
    ($name:ident,$eq:ident,$code: ty;;$test_name:ident,$max: expr) => {
        ///Compares two slices.
        ///Returns 1usize if x==y, and 0usize if x!=y. Will always
        ///return 0 if lens are not equal
        pub fn $name( x: &[$code], y: &[$code]) -> usize {
            let x_len = x.len();
            let y_len = y.len();
            if x_len != y_len {
               return 0;
            }
            let mut flag: $code = 0;
            for i in 0..x_len {
                flag |= x[i] ^ y[i];
            }
            $eq(flag,0)
        }
        #[test]
        fn $test_name() {
            let x: [$code;10] = [0,0,0,0,0,0,0,0,0,0];
            let y: [$code;10] = [$max,$max,$max,$max,$max,$max,$max,$max,$max,$max];
            let z: [$code;10] = [1,1,1,1,1,1,1,1,1,1];
            assert_eq!( $name( &x, &x), 1);
            assert_eq!( $name( &y, &y), 1);
            assert_eq!( $name( &z, &z), 1);
            assert_eq!( $name( &x, &y), 0);
            assert_eq!( $name( &x, &y), 0);
            assert_eq!( $name( &y, &z), 0);
        }
    }
}
ct_eq_slice_gen!(ct_u8_slice_eq,ct_u8_eq,u8;;
    test_ct_u8_slice_eq, MAX_U8);
ct_eq_slice_gen!(ct_u16_slice_eq,ct_u16_eq,u16;;
    test_ct_u16_slice_eq, MAX_U16);
ct_eq_slice_gen!(ct_u32_slice_eq,ct_u32_eq,u32;;
    test_ct_u32_slice_eq, MAX_U32);
ct_eq_slice_gen!(ct_u64_slice_eq,ct_u64_eq,u64;;
    test_ct_u64_slice_eq, MAX_U64);
ct_eq_slice_gen!(ct_usize_slice_eq,ct_usize_eq,usize;;
    test_ct_usize_slice_eq, MAX_USIZE);


macro_rules! ct_select_gen {
    ($name:ident,$max:expr,$code:ty;;$test_name:ident,$v0:expr,$v1:expr) => {
        ///Constant Time Selection.
        ///
        ///Returns X if flag == 1.
        ///
        ///Returns Y if flag == 0.
        ///
        ///Behavior is undefined for all other values.
        pub fn $name(flag: $code, x: $code, y: $code) -> $code {
            (($max ^ flag.wrapping_sub(1))&x)|(flag.wrapping_sub(1)&y)
        }
        #[test]
        fn $test_name() {
            assert_eq!( $name(1,$v0,$v1), $v0);
            assert_eq!( $name(0,$v0,$v1), $v1);
            assert_eq!( $name(1,$v1,$v0), $v1);
            assert_eq!( $name(0,$v1,$v0), $v0);
            assert_eq!( $name(1,$v0,$max), $v0);
            assert_eq!( $name(0,$v0,$max), $max);
            assert_eq!( $name(1,$max,$v0), $max);
            assert_eq!( $name(0,$max,$v0), $v0);
            assert_eq!( $name(1,$max,$v1), $max);
            assert_eq!( $name(0,$max,$v1), $v1);
            assert_eq!( $name(1,$v1,$max), $v1);
            assert_eq!( $name(0,$v1,$max), $max);
        }
    }
}

ct_select_gen!(ct_select_u8,MAX_U8,u8;;
    test_ct_select_u8,155,4);
ct_select_gen!(ct_select_u16,MAX_U16,u16;;
    test_ct_select_u16,30597,4);
ct_select_gen!(ct_select_u32,MAX_U32,u32;;
    test_ct_select_u32,0x0DD74AA2,4);
ct_select_gen!(ct_select_u64,MAX_U64,u64;;
    test_ct_select_u64,155,4);
ct_select_gen!(ct_select_usize,MAX_USIZE,usize;;
    test_ct_select_usize,155,4);

macro_rules! ct_constant_copy_gen {
    ($name:ident,$max:expr,$code:ty;;$test_name:ident,$sl_eq:ident,$other_test:ident) => {
        ///Constant Time Copy
        ///
        ///Copies the value of Y into X (provides slices are equal length)
        ///IF flag == 1 
        ///
        ///If flag == 0 X is left unchanged.
        ///
        ///The behavior of this function is undefined if flag has a value
        ///not 1 or 0.
        ///
        ///#Panic:
        ///
        ///This function will panic if X and Y are not equal length. 
        pub fn $name(flag: $code, x: &mut [$code], y: &[$code]) {
            let x_len = x.len();
            let y_len = y.len();
            if x_len != y_len {
                panic!("Consistent Time: Attempted to copy between non-equal lens");
            }
            let x_mask: $code = flag.wrapping_sub(1);
            let y_mask: $code = $max ^ flag.wrapping_sub(1);
            for i in 0..x_len {
                x[i] = (x[i]&x_mask)|(y[i]&y_mask)
            }
        }
        #[test]
        fn $test_name() {
            let base: [$code;10] = [0,0,0,0,0,0,0,0,0,0];
            let mut x: [$code;10] = [0,0,0,0,0,0,0,0,0,0];
            let y: [$code;10] = [$max,$max,$max,$max,$max,$max,$max,$max,$max,$max];
            $name(0,&mut x, &y);
            assert_eq!( $sl_eq(&x,&base), 1);
            $name(1,&mut x, &y);
            assert_eq!( $sl_eq(&x,&base), 0);
            assert_eq!( $sl_eq(&x,&y), 1);
        }
        #[test]
        #[should_panic]
        fn $other_test() {
            let base: [$code;10] = [0,0,0,0,0,0,0,0,0,0];
            let mut x: [$code;9] = [0,0,0,0,0,0,0,0,0];
            //trigger panic
            //even on false evaluation
            //value of flag is irrelevant
            $name(0,&mut x,&base);
        }
    }
}
ct_constant_copy_gen!(ct_copy_u8,MAX_U8,u8;;
    test_ct_copy_u8,ct_u8_slice_eq,test_ct_copy_u8_panic);
ct_constant_copy_gen!(ct_copy_u16,MAX_U16,u16;;
    test_ct_copy_u16,ct_u16_slice_eq,test_ct_copy_u16_panic);
ct_constant_copy_gen!(ct_copy_u32,MAX_U32,u32;;
    test_ct_copy_u32,ct_u32_slice_eq,test_ct_copy_u32_panic);
ct_constant_copy_gen!(ct_copy_u64,MAX_U64,u64;;
    test_ct_copy_u64,ct_u64_slice_eq,test_ct_copy_u64_panic);
ct_constant_copy_gen!(ct_copy_usize,MAX_USIZE,usize;;
    test_ct_copy_usize,ct_usize_slice_eq,test_ct_copy_usize_panic);
