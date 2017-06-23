#![feature(test)]

extern crate test;
extern crate consistenttime;

macro_rules! bench {
    ($ty: ty, $name: ident) => {
        mod $name {
            use std::mem;
            use test::{Bencher, black_box};
            use consistenttime::ct_copy;

            #[bench]
            fn f_small(b: &mut Bencher) {
                let mut left = black_box([0; 32]);
                let right = black_box([0; 32]);
                b.bytes = mem::size_of_val(&left) as u64;
                b.iter(|| ct_copy::<$ty>(false, &mut left, &right))
            }

            #[bench]
            fn t_small(b: &mut Bencher) {
                let mut left = black_box([0; 32]);
                let right = black_box([0; 32]);
                b.bytes = mem::size_of_val(&left) as u64;
                b.iter(|| ct_copy::<$ty>(true, &mut left, &right))
            }

            #[bench]
            fn f_large(b: &mut Bencher) {
                let mut left = black_box([0; 4096]);
                let right = black_box([0; 4096]);
                b.bytes = mem::size_of_val(&left) as u64;
                b.iter(|| ct_copy::<$ty>(false, &mut left, &right))
            }

            #[bench]
            fn t_large(b: &mut Bencher) {
                let mut left = black_box([0; 4096]);
                let right = black_box([0; 4096]);
                b.bytes = mem::size_of_val(&left) as u64;
                b.iter(|| ct_copy::<$ty>(true, &mut left, &right))
            }
        }
    }
}

bench!(u8, bench_u8);
bench!(u16, bench_u16);
bench!(u32, bench_u32);
bench!(u64, bench_u64);
bench!(usize, bench_usize);
