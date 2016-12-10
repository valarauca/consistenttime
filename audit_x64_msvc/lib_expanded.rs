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
//!cryptographic computing protocols require to prevent side channeling 
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
//!
//!There is internal unsafe code to handle converting `bool` to `u8`
//!and vice versa. The machine instructions generated for these
//!operations involve no branches or comparison operators,
//!see the notes in the source code.
#![no_std]
#[prelude_import]
use core::prelude::v1::*;
#[macro_use]
extern crate core as core;
use core::mem::transmute as trans;
const MAX_U8: u8 = ::core::u8::MAX;
const MAX_U16: u16 = ::core::u16::MAX;
const MAX_U32: u32 = ::core::u32::MAX;
const MAX_U64: u64 = ::core::u64::MAX;
const MAX_USIZE: usize = ::core::usize::MAX;
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
/*
 * The purpose of the below macro is two fold. 
 *  1. Define the function to do constant unsigned integer comparisons
 *  2. Define a *fairly* comphensive test to validate that function.
 *
 */
///Tests if two values are equal in constant time.
///
///XORs, Shift Rights, AND are all that are used. There is
///no branching.
#[no_mangle]
pub extern "C" fn ct_u8_eq(x:
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
                               u8, y: u8) -> bool {
    let mut z: u8 = MAX_U8 ^ (x ^ y);
    z &= z.wrapping_shr(4);
    z &= z.wrapping_shr(2);
    z &= z.wrapping_shr(1);
    let val = z as u8;
    unsafe { trans(val) }
}
///Tests if two values are equal in constant time.
///
///XORs, Shift Rights, AND are all that are used. There is
///no branching.
#[no_mangle]
pub extern "C" fn ct_u16_eq(x: u16, y: u16) -> bool {
    let mut z: u16 = MAX_U16 ^ (x ^ y);
    z &= z.wrapping_shr(8);
    z &= z.wrapping_shr(4);
    z &= z.wrapping_shr(2);
    z &= z.wrapping_shr(1);
    let val = z as u8;
    unsafe { trans(val) }
}
///Tests if two values are equal in constant time.
///
///XORs, Shift Rights, AND are all that are used. There is
///no branching.
#[no_mangle]
pub extern "C" fn ct_u32_eq(x: u32, y: u32) -> bool {
    let mut z: u32 = MAX_U32 ^ (x ^ y);
    z &= z.wrapping_shr(16);
    z &= z.wrapping_shr(8);
    z &= z.wrapping_shr(4);
    z &= z.wrapping_shr(2);
    z &= z.wrapping_shr(1);
    let val = z as u8;
    unsafe { trans(val) }
}
///Tests if two values are equal in constant time.
///
///XORs, Shift Rights, AND are all that are used. There is
///no branching.
#[no_mangle]
pub extern "C" fn ct_u64_eq(x: u64, y: u64) -> bool {
    let mut z: u64 = MAX_U64 ^ (x ^ y);
    z &= z.wrapping_shr(32);
    z &= z.wrapping_shr(16);
    z &= z.wrapping_shr(8);
    z &= z.wrapping_shr(4);
    z &= z.wrapping_shr(2);
    z &= z.wrapping_shr(1);
    let val = z as u8;
    unsafe { trans(val) }
}
///Tests if two values are equal in constant time.
///
///XORs, Shift Rights, AND are all that are used. There is
///no branching.
#[no_mangle]
pub extern "C" fn ct_usize_eq(x: usize, y: usize) -> bool {
    let mut z: usize = MAX_USIZE ^ (x ^ y);
    z &= z.wrapping_shr(32);
    z &= z.wrapping_shr(16);
    z &= z.wrapping_shr(8);
    z &= z.wrapping_shr(4);
    z &= z.wrapping_shr(2);
    z &= z.wrapping_shr(1);
    let val = z as u8;
    unsafe { trans(val) }
}
///Check the equality of slices.
///
///This will transverse the entire slice reguardless of if a
///conflict is found early. 
#[no_mangle]
pub extern "C" fn ct_u8_slice_eq(x: &[u8], y: &[u8]) -> bool {
    let x_len = x.len();
    let y_len = y.len();
    if x_len != y_len { return false; }
    let mut flag: u8 = 0;
    for i in 0..x_len { flag |= x[i] ^ y[i]; }
    ct_u8_eq(flag, 0)
}
///Check the equality of slices.
///
///This will transverse the entire slice reguardless of if a
///conflict is found early. 
#[no_mangle]
pub extern "C" fn ct_u16_slice_eq(x: &[u16], y: &[u16]) -> bool {
    let x_len = x.len();
    let y_len = y.len();
    if x_len != y_len { return false; }
    let mut flag: u16 = 0;
    for i in 0..x_len { flag |= x[i] ^ y[i]; }
    ct_u16_eq(flag, 0)
}
///Check the equality of slices.
///
///This will transverse the entire slice reguardless of if a
///conflict is found early. 
#[no_mangle]
pub extern "C" fn ct_u32_slice_eq(x: &[u32], y: &[u32]) -> bool {
    let x_len = x.len();
    let y_len = y.len();
    if x_len != y_len { return false; }
    let mut flag: u32 = 0;
    for i in 0..x_len { flag |= x[i] ^ y[i]; }
    ct_u32_eq(flag, 0)
}
///Check the equality of slices.
///
///This will transverse the entire slice reguardless of if a
///conflict is found early. 
#[no_mangle]
pub extern "C" fn ct_u64_slice_eq(x: &[u64], y: &[u64]) -> bool {
    let x_len = x.len();
    let y_len = y.len();
    if x_len != y_len { return false; }
    let mut flag: u64 = 0;
    for i in 0..x_len { flag |= x[i] ^ y[i]; }
    ct_u64_eq(flag, 0)
}
///Check the equality of slices.
///
///This will transverse the entire slice reguardless of if a
///conflict is found early. 
#[no_mangle]
pub extern "C" fn ct_usize_slice_eq(x: &[usize], y: &[usize]) -> bool {
    let x_len = x.len();
    let y_len = y.len();
    if x_len != y_len { return false; }
    let mut flag: usize = 0;
    for i in 0..x_len { flag |= x[i] ^ y[i]; }
    ct_usize_eq(flag, 0)
}
///Optional value selection.
///
///Allow to set a varible optionally at the same speed without
///branching, or changing speed.
///
///Returns X if flag == True.
///
///Returns Y if flag == False.
#[no_mangle]
pub extern "C" fn ct_select_u8(flag: bool, x: u8, y: u8) -> u8 {
    let val: u8 = unsafe { trans(flag) };
    let flag = val as u8;
    ((MAX_U8 ^ flag.wrapping_sub(1)) & x) | (flag.wrapping_sub(1) & y)
}
///Optional value selection.
///
///Allow to set a varible optionally at the same speed without
///branching, or changing speed.
///
///Returns X if flag == True.
///
///Returns Y if flag == False.
#[no_mangle]
pub extern "C" fn ct_select_u16(flag: bool, x: u16, y: u16) -> u16 {
    let val: u8 = unsafe { trans(flag) };
    let flag = val as u16;
    ((MAX_U16 ^ flag.wrapping_sub(1)) & x) | (flag.wrapping_sub(1) & y)
}
///Optional value selection.
///
///Allow to set a varible optionally at the same speed without
///branching, or changing speed.
///
///Returns X if flag == True.
///
///Returns Y if flag == False.
#[no_mangle]
pub extern "C" fn ct_select_u32(flag: bool, x: u32, y: u32) -> u32 {
    let val: u8 = unsafe { trans(flag) };
    let flag = val as u32;
    ((MAX_U32 ^ flag.wrapping_sub(1)) & x) | (flag.wrapping_sub(1) & y)
}
///Optional value selection.
///
///Allow to set a varible optionally at the same speed without
///branching, or changing speed.
///
///Returns X if flag == True.
///
///Returns Y if flag == False.
#[no_mangle]
pub extern "C" fn ct_select_u64(flag: bool, x: u64, y: u64) -> u64 {
    let val: u8 = unsafe { trans(flag) };
    let flag = val as u64;
    ((MAX_U64 ^ flag.wrapping_sub(1)) & x) | (flag.wrapping_sub(1) & y)
}
///Optional value selection.
///
///Allow to set a varible optionally at the same speed without
///branching, or changing speed.
///
///Returns X if flag == True.
///
///Returns Y if flag == False.
#[no_mangle]
pub extern "C" fn ct_select_usize(flag: bool, x: usize, y: usize) -> usize {
    let val: u8 = unsafe { trans(flag) };
    let flag = val as usize;
    ((MAX_USIZE ^ flag.wrapping_sub(1)) & x) | (flag.wrapping_sub(1) & y)
}
///Constant time optional buffer copying
///
///Copies the value of Y into X (provides slices are equal length)
///IF flag == True
///
///If flag == False X is left unchanged.
///
///#Panic:
///
///This function will panic if X and Y are not equal length. 
#[no_mangle]
pub extern "C" fn ct_copy_u8(flag: bool,
                             x:
                                 &mut [
                                      //constant time boolean to unsigned int conversion
                                      //see note above
                                      //trigger panic
                                      //even on false evaluation
                                      //value of flag is irrelevant
                                      u8], y: &[u8]) {
    let x_len = x.len();
    let y_len = y.len();
    if x_len != y_len {
        {
            static _MSG_FILE_LINE: (&'static str, &'static str, u32) =
                ("Consistent Time: Attempted to copy between non-equal lens",
                 "lib.rs", 324u32);
            ::core::panicking::panic(&_MSG_FILE_LINE)
        };
    }
    let val: u8 = unsafe { trans(flag) };
    let flag = val as u8;
    let x_mask: u8 = flag.wrapping_sub(1);
    let y_mask: u8 = MAX_U8 ^ flag.wrapping_sub(1);
    for i in 0..x_len { x[i] = (x[i] & x_mask) | (y[i] & y_mask) }
}
///Constant time optional buffer copying
///
///Copies the value of Y into X (provides slices are equal length)
///IF flag == True
///
///If flag == False X is left unchanged.
///
///#Panic:
///
///This function will panic if X and Y are not equal length. 
#[no_mangle]
pub extern "C" fn ct_copy_u16(flag: bool, x: &mut [u16], y: &[u16]) {
    let x_len = x.len();
    let y_len = y.len();
    if x_len != y_len {
        {
            static _MSG_FILE_LINE: (&'static str, &'static str, u32) =
                ("Consistent Time: Attempted to copy between non-equal lens",
                 "lib.rs", 326u32);
            ::core::panicking::panic(&_MSG_FILE_LINE)
        };
    }
    let val: u8 = unsafe { trans(flag) };
    let flag = val as u16;
    let x_mask: u16 = flag.wrapping_sub(1);
    let y_mask: u16 = MAX_U16 ^ flag.wrapping_sub(1);
    for i in 0..x_len { x[i] = (x[i] & x_mask) | (y[i] & y_mask) }
}
///Constant time optional buffer copying
///
///Copies the value of Y into X (provides slices are equal length)
///IF flag == True
///
///If flag == False X is left unchanged.
///
///#Panic:
///
///This function will panic if X and Y are not equal length. 
#[no_mangle]
pub extern "C" fn ct_copy_u32(flag: bool, x: &mut [u32], y: &[u32]) {
    let x_len = x.len();
    let y_len = y.len();
    if x_len != y_len {
        {
            static _MSG_FILE_LINE: (&'static str, &'static str, u32) =
                ("Consistent Time: Attempted to copy between non-equal lens",
                 "lib.rs", 328u32);
            ::core::panicking::panic(&_MSG_FILE_LINE)
        };
    }
    let val: u8 = unsafe { trans(flag) };
    let flag = val as u32;
    let x_mask: u32 = flag.wrapping_sub(1);
    let y_mask: u32 = MAX_U32 ^ flag.wrapping_sub(1);
    for i in 0..x_len { x[i] = (x[i] & x_mask) | (y[i] & y_mask) }
}
///Constant time optional buffer copying
///
///Copies the value of Y into X (provides slices are equal length)
///IF flag == True
///
///If flag == False X is left unchanged.
///
///#Panic:
///
///This function will panic if X and Y are not equal length. 
#[no_mangle]
pub extern "C" fn ct_copy_u64(flag: bool, x: &mut [u64], y: &[u64]) {
    let x_len = x.len();
    let y_len = y.len();
    if x_len != y_len {
        {
            static _MSG_FILE_LINE: (&'static str, &'static str, u32) =
                ("Consistent Time: Attempted to copy between non-equal lens",
                 "lib.rs", 330u32);
            ::core::panicking::panic(&_MSG_FILE_LINE)
        };
    }
    let val: u8 = unsafe { trans(flag) };
    let flag = val as u64;
    let x_mask: u64 = flag.wrapping_sub(1);
    let y_mask: u64 = MAX_U64 ^ flag.wrapping_sub(1);
    for i in 0..x_len { x[i] = (x[i] & x_mask) | (y[i] & y_mask) }
}
///Constant time optional buffer copying
///
///Copies the value of Y into X (provides slices are equal length)
///IF flag == True
///
///If flag == False X is left unchanged.
///
///#Panic:
///
///This function will panic if X and Y are not equal length. 
#[no_mangle]
pub extern "C" fn ct_copy_usize(flag: bool, x: &mut [usize], y: &[usize]) {
    let x_len = x.len();
    let y_len = y.len();
    if x_len != y_len {
        {
            static _MSG_FILE_LINE: (&'static str, &'static str, u32) =
                ("Consistent Time: Attempted to copy between non-equal lens",
                 "lib.rs", 332u32);
            ::core::panicking::panic(&_MSG_FILE_LINE)
        };
    }
    let val: u8 = unsafe { trans(flag) };
    let flag = val as usize;
    let x_mask: usize = flag.wrapping_sub(1);
    let y_mask: usize = MAX_USIZE ^ flag.wrapping_sub(1);
    for i in 0..x_len { x[i] = (x[i] & x_mask) | (y[i] & y_mask) }
}
