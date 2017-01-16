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
//!cryptographic computing protocols require to prevent side channel 
//!timing attacks. 
//!
//!These algorithms are not implemented to be efficient. But to take the
//!same number of processor cycles if their outcome/path is true, or false.
//!The reference used for this crate is [Go-Lang's
//!crypto/subtile](https://golang.org/src/crypto/subtle/constant_time.go)
//!Which implements a handful of constant time algorithms.
//!
//!I took the liberity of generalizing them out to all unsigned sizes
//!supported by Rust-Lang. Everything inside of this crate is defined
//!as a macro. This makes writing the extremely repetive code for all
//!types a lot easier.
//!
//!There is internal unsafe code to handle converting `bool` to `u8`
//!and vice versa. The machine instructions generated for these
//!operations involve no branches or comparison operators,
//!see the notes in the source code.
//!
//!As of the most recent commit there has been an _extreme_ divergence
//!from the Go-Lang source. LLVM does MUCH heavier optimizations then 
//!Go-ASM does and some _combat_ was necessary. As of
//!
//!`consistenttime = "0.2"`
//!
//!I am reasonably confident it provides the advertised guarantees.

#![no_std]
use core::mem::transmute as trans;


/*
 * Rust booleans are effectively u8's with typing sugar.
 * True = 0x01
 * False = 0x00
 *
 * One can recover the true/false value via unsafe function
 *
 * fn to_val<X>(b: bool) -> X {
 *      let val: u8 = unsafe{ ::core::mem::transmute(b) };
 *      val as X
 * }
 *
 * For the type u64 (and using the sugar [#inline(never)]
 * this will compile down to:
 *
 *    mov rax dil
 *    ret
 *
 * One can likely from that example determine how _other_
 * integer formats are dervived.
 *
 * The test below asserts this behavior.
 *
 * :.:.:
 *
 * When converting from ~some~ uint to a bool the reverse
 * is sligtly true. Consider the equality operation
 *
 *    let mut z: u16 = MAX ^ (x^y);
 *    z >> 8;
 *    z >> 4;
 *    z >> 2;
 *    z >> 1;
 *    let val = z as u8;
 *    unsafe{ ::core::mem::transmute(val) }; //returns bool
 *
 * The ASM generated for the last two operations
 *
 *    let val = z as u8;
 *    unsafe{ ::core::mem::transmute(val)};
 *
 * It is simply
 *
 *    andl $1, %eax
 *    retq
 *
 * The typing is gone at compile time.
 */
#[test]
fn test_bool_representation() {
    let t: bool = true;
    let f: bool = false;
    let t_val: u8 = unsafe{ ::core::mem::transmute(t) };
    let f_val: u8 = unsafe{ ::core::mem::transmute(f) };
    assert_eq!( t_val, 0x01u8);
    assert_eq!( f_val, 0x00u8);
}

pub trait ConstantTime : Sized {
    #[inline(always)]
    fn ct_eq(x: Self, y: Self) -> bool;
    #[inline(always)]
    fn ct_eq_slice(x: &[Self], y: &[Self]) -> bool;
    #[inline(always)]
    fn ct_select(flag: bool, x: Self, y: Self) -> Self;
    #[inline(always)]
    fn ct_copy(flag: bool, x: &mut [Self], y: &[Self]);
}
pub fn ct_eq<T>(x: T, y: T) -> bool
  where T: ConstantTime {
    #[inline(always)]
    <T as ConstantTime>::ct_eq(x,y)
}
pub fn ct_eq_slice<T>(x: &[T], y: &[T]) -> bool
  where T: ConstantTime {
    #[inline(always)]
    <T as ConstantTime>::ct_eq_slice(x,y)
}
pub fn ct_select<T>(flag: bool, x: T, y: T) -> T
  where T: ConstantTime {
    #[inline(always)]
    <T as ConstantTime>::ct_select(flag,x,y)
}
pub fn ct_copy<T>(flag: bool, x: &mut [T], y: &[T])
  where T: ConstantTime {
    #[inline(always)]
    <T as ConstantTime>::ct_copy(flag,x,y);
}

macro_rules! impl_ConstantTime {
    ($code: ident, $eq: ident, $slice_eq: ident, $select: ident, $copy: ident) => {
        pub use $code::{$eq,$slice_eq,$select,$copy};

        impl ConstantTime for $code {
            #[inline(always)]
            fn ct_eq( x: $code, y: $code) -> bool {
                $eq(x,y)
            }
            #[inline(always)]
            fn ct_eq_slice( x: &[$code], y: &[$code]) -> bool {
                $slice_eq(x,y)
            }
            #[inline(always)]
            fn ct_select(flag: bool, x: $code, y: $code) -> $code {
                $select(flag,x,y)
            }
            #[inline(always)]
            fn ct_copy(flag: bool, x: &mut [$code], y: &[$code]) {
                $copy(flag,x,y)
            }
        }
    }
}

impl_ConstantTime!(u8, ct_u8_eq, ct_u8_slice_eq, ct_select_u8, ct_copy_u8);
impl_ConstantTime!(u16, ct_u16_eq, ct_u16_slice_eq, ct_select_u16, ct_copy_u16);
impl_ConstantTime!(u32, ct_u32_eq, ct_u32_slice_eq, ct_select_u32, ct_copy_u32);
impl_ConstantTime!(u64, ct_u64_eq, ct_u64_slice_eq, ct_select_u64, ct_copy_u64);
impl_ConstantTime!(usize, ct_usize_eq, ct_usize_slice_eq, ct_select_usize, ct_copy_usize);


/*
 * The purpose of the below macro is two fold. 
 *  1. Define the function to do constant unsigned integer comparisons
 *  2. Define a *fairly* comphensive test to validate that function.
 *
 */
macro_rules! ct_eq_gen {
    ($name: ident, $($shr: expr),*
        ;; $test_v0: expr, $test_v1: expr) => {
        ///Tests if two values are equal in constant time.
        ///
        ///Completely avoids branching.
        #[no_mangle]
        #[inline(never)]
        pub extern "C" fn $name( x: C, y: C) -> bool {
            let mut z: C = MAX ^ (x^y);
            $(
                z &= z.wrapping_shr($shr);
            )*
            /* 
             * Convert to a boolean
             * This is 99% syntax sugar
             * z will get moved eax about 5 instructions before this
             * The only operation done here is
             *
             *    andl $1, %eax
             *
             *  Which just asserts the structure of a boolean
             *  remain 0x01 or 0x00.
             */
            let val = z as u8;
            unsafe{super::trans::<u8,bool>(val)}
        }
        #[test]
        fn test_ct_eq() {
            use super::ct_eq;
            let x: C = $test_v0;
            let y: C = $test_v1;
            assert_eq!( ct_eq(MAX,MAX), true);
            assert_eq!( ct_eq(x,x), true);
            assert_eq!( ct_eq(y,y), true);
            assert_eq!( ct_eq::<C>(0,0), true);
            assert_eq!( ct_eq::<C>(1,1), true);
            assert_eq!( ct_eq::<C>(MAX,0), false);
            assert_eq!( ct_eq::<C>(MAX,1), false);
            assert_eq!( ct_eq(MAX,x), false);
            assert_eq!( ct_eq(MAX,y), false);
            assert_eq!( ct_eq(y,1), false);
            assert_eq!( ct_eq(x,1), false);
            assert_eq!( ct_eq(y,0), false);
            assert_eq!( ct_eq(x,0), false);
            assert_eq!( ct_eq(x,y), false);
            $(
                assert_eq!( ct_eq::<C>($shr,$shr), true);
                assert_eq!( ct_eq::<C>($shr,0), false);
                assert_eq!( ct_eq::<C>($shr,MAX), false);
            )*
        }
    }
}

macro_rules! ct_eq_slice_gen {
    ($name:ident) => {
        ///Check the equality of slices.
        ///
        ///This will transverse the entire slice reguardless of if a
        ///conflict is found early or not. This way an external hacker
        ///can not guess the contents of a buffer byte by byte and 
        ///carefully measure the timing responses.
        #[no_mangle]
        pub extern "C" fn $name( x: &[C], y: &[C]) -> bool {
            let x_len = x.len();
            let y_len = y.len();
            if x_len != y_len {
               return false;
            }
            let mut flag: C = 0;
            for i in 0..x_len {
                flag |= x[i] ^ y[i];
            }
            <C as super::ConstantTime>::ct_eq(flag,0)
        }
        #[test]
        fn test_ct_slice_eq() {
            use super::ct_eq_slice;
            let x: [C;10] = [0,0,0,0,0,0,0,0,0,0];
            let y: [C;10] = [MAX,MAX,MAX,MAX,MAX,MAX,MAX,MAX,MAX,MAX];
            let z: [C;10] = [1,1,1,1,1,1,1,1,1,1];
            assert_eq!( ct_eq_slice( &x, &x), true);
            assert_eq!( ct_eq_slice( &y, &y), true);
            assert_eq!( ct_eq_slice( &z, &z), true);
            assert_eq!( ct_eq_slice( &x, &y), false);
            assert_eq!( ct_eq_slice( &x, &y), false);
            assert_eq!( ct_eq_slice( &y, &z), false);
        }
    }
}


macro_rules! ct_select_gen {
    ($name:ident; $v0:expr,$v1:expr) => {
        ///Optional swapping.
        ///
        ///Allow to set a varible optionally at the same speed without
        ///branching, or changing speed.
        ///
        ///Returns X if flag == True.
        ///
        ///Returns Y if flag == False.
        ///
        ///At compile time this becomes a CMOV. This _is_ a brach.
        ///The branch misprediction cost is ~20cycles. And if this
        ///is incurred does not depend on the input, but the 
        ///random state of our machine + quantum winds.
        ///
        ///This should provide a consistent guarantee of speed.
        #[no_mangle]
        #[inline(never)]
        pub extern "C" fn $name(flag: bool, x: C, y: C) -> C {
            let val: u8 = unsafe{super::trans::<bool,u8>(flag)};
            let flag = val as C;
            ((MAX ^ flag.wrapping_sub(1))&x)|(flag.wrapping_sub(1)&y)
        }
        #[test]
        fn test_ct_select() {
            use super::ct_select;
            assert_eq!( ct_select::<C>(true,$v0,$v1), $v0);
            assert_eq!( ct_select::<C>(false,$v0,$v1), $v1);
            assert_eq!( ct_select::<C>(true,$v1,$v0), $v1);
            assert_eq!( ct_select::<C>(false,$v1,$v0), $v0);
            assert_eq!( ct_select::<C>(true,$v0,MAX), $v0);
            assert_eq!( ct_select::<C>(false,$v0,MAX), MAX);
            assert_eq!( ct_select::<C>(true,MAX,$v0), MAX);
            assert_eq!( ct_select::<C>(false,MAX,$v0), $v0);
            assert_eq!( ct_select::<C>(true,MAX,$v1), MAX);
            assert_eq!( ct_select::<C>(false,MAX,$v1), $v1);
            assert_eq!( ct_select::<C>(true,$v1,MAX), $v1);
            assert_eq!( ct_select::<C>(false,$v1,MAX), MAX);
        }
    }
}


macro_rules! ct_constant_copy_gen {
    ($ct_copy: ident) => {
        ///Optional buffer copying
        ///
        ///IF flag == True THEN X will be set to Y
        ///
        ///If flag == False THEN X is unchanged
        ///
        ///#Panic:
        ///
        ///This function will panic if X and Y are not equal length. 
        #[no_mangle]
        pub extern "C" fn $ct_copy(flag: bool, x: &mut [C], y: &[C]) {
            let x_len = x.len();
            let y_len = y.len();
            if x_len != y_len {
                panic!("Consistent Time: Attempted to copy between non-equal lens");
            }
            for i in 0..x_len {
                let y_temp = y[i].clone();
                let x_temp = x[i].clone();
                x[i] = <C as super::ConstantTime>::ct_select(flag,y_temp,x_temp);
            }
        }
        #[test]
        fn test_ct_copy() {
            let base: [C;10] = [0,0,0,0,0,0,0,0,0,0];
            let mut x: [C;10] = [0,0,0,0,0,0,0,0,0,0];
            let y: [C;10] = [MAX,MAX,MAX,MAX,MAX,MAX,MAX,MAX,MAX,MAX];
            $ct_copy(false,&mut x, &y);
            assert_eq!( <C as super::ConstantTime>::ct_eq_slice(&x,&base), true);
            $ct_copy(true,&mut x, &y);
            assert_eq!( <C as super::ConstantTime>::ct_eq_slice(&x,&base), false);
            assert_eq!( <C as super::ConstantTime>::ct_eq_slice(&x,&y), true);
        }
        #[test]
        #[should_panic]
        fn test_ct_copy_panic() {
            let base: [C;10] = [0,0,0,0,0,0,0,0,0,0];
            let mut x: [C;9] = [0,0,0,0,0,0,0,0,0];
            //trigger panic
            //even on false evaluation
            //value of flag is irrelevant
            $ct_copy(false,&mut x,&base);
        }
    }
}


macro_rules! ct_mod_gen {
    ($code: ident) => {
        type C = $code;
        const MAX: $code = ::core::$code::MAX;
    }
}

mod u8 {
    ct_mod_gen!(u8);

    ct_eq_gen!(ct_u8_eq, 4,2,1;;
        155, 15);

    ct_eq_slice_gen!(ct_u8_slice_eq);
    ct_select_gen!(ct_select_u8; 155,4);
    ct_constant_copy_gen!(ct_copy_u8);
}

mod u16 {
    ct_mod_gen!(u16);

    ct_eq_gen!(ct_u16_eq, 8,4,2,1;;
        32000, 5);

    ct_eq_slice_gen!(ct_u16_slice_eq);
    ct_select_gen!(ct_select_u16; 30597,4);
    ct_constant_copy_gen!(ct_copy_u16);
}

mod u32 {
    ct_mod_gen!(u32);

    ct_eq_gen!(ct_u32_eq, 16,8,4,2,1;;
        2000000, 15);

    ct_eq_slice_gen!(ct_u32_slice_eq);
    ct_select_gen!(ct_select_u32; 0x0DD74AA2,4);
    ct_constant_copy_gen!(ct_copy_u32);
}

mod u64 {
    ct_mod_gen!(u64);

    ct_eq_gen!(ct_u64_eq, 32,16,8,4,2,1;;
        25893654215879, 2);

    ct_eq_slice_gen!(ct_u64_slice_eq);
    ct_select_gen!(ct_select_u64; 155,4);
    ct_constant_copy_gen!(ct_copy_u64);
}

mod usize {
    ct_mod_gen!(usize);

    #[cfg(target_pointer_width = "32")]
    ct_eq_gen!(ct_usize_eq, 16,8,4,2,1;;
        test_ct_u32_eq, 2082600, 15);
    #[cfg(target_pointer_width = "64")]
    ct_eq_gen!(ct_usize_eq, 32,16,8,4,2,1;;
        859632175648921456, 5);

    ct_eq_slice_gen!(ct_usize_slice_eq);
    ct_select_gen!(ct_select_usize; 155,4);
    ct_constant_copy_gen!(ct_copy_usize);
}



