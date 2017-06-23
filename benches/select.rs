#![feature(test)]

extern crate test;
extern crate consistenttime;

macro_rules! bench {
    ($ty: ty, $name: ident) => {
        mod $name {
            use test::Bencher;
            use consistenttime::ct_select;

            #[bench]
            fn f(b: &mut Bencher) {
                b.iter(|| ct_select::<$ty>(false, 0, !0))
            }

            #[bench]
            fn t(b: &mut Bencher) {
                b.iter(|| ct_select::<$ty>(true, 0, !0))
            }
        }
    }
}

bench!(u8, bench_u8);
bench!(u16, bench_u16);
bench!(u32, bench_u32);
bench!(u64, bench_u64);
bench!(usize, bench_usize);
