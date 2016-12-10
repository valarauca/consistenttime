#!/bin/sh
rustc \
	--emit obj \
	--crate-type lib \
	--codegen no-stack-check\
	--codegen debuginfo=0 \
	--codegen opt-level=3 \
	lib.rs
