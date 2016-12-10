Auditing

I don't know if this useful, and I don't 100% know if this is what anyone
needs. 


Build Notes:

Compiler:		rustc 1.13.0 (2c6933acc 2016-11-07) x64 MSVC
	https://www.rust-lang.org/en-US/downloads.html
Oject Dumper:		Agner Fog objconv 
	http://www.agner.org/optimize/#objconv


NOTE: This commit was modified to use the preable #[no_mangle] which makes
the object dumps easier to read

NOTE: The functions had extern "C" added to their definatinos so their
ABI will follow normal C ABI.

NOTE: A build file is located in the src/ file.


Contents:

- Object Dumps 
	all objconv.exe formats

- build script
	I use git-for-windows which is a MINGW64 knock off bourne shell
	which integrates OKAY with windows.

- lib_expanded.rs
	All macro's removed, this is the file POST macro expansion

