#constanttime

[Documentation](https://valarauca.github.io/consistenttime/consistenttime/index.html)

A crate that supports _many_ constant time operations. The reference is [Go-Lang's crypto/subtile](https://golang.org/src/crypto/subtle/constant_time.go)
which implements the orginal form of these constant time operations. I took the library of extrapolating the `uint8` and `uint32` into _all_ Rust
integer types.

These operations are not designed to be _fast_. They are designed to take the same if they suceeded or fail. This is to prevent side channel attacks on cryptographic libraries and applications.

This crate is `core` only. So it does not require `std` therefore it can be
used without an operating system for OS and Embedded Development. 

To use this crate include:

```
[dependencies]
constanttime = "0.1.0"
```

####Legal

This project can be considered licensed under Apache2.0 Software License.
A full copy can of this license can found [here](https://www.apache.org/licenses/LICENSE-2.0). 

A large thank you goes to the Go-Lang standard library development team for
creating the `crypto/subtile/constant_time.go` library which was used for
reference.

No Go-Lang source code exists within this project.
Nonethless the orginal Go-Lang reference source is [here](https://golang.org/src/crypto/subtle/constant_time.go),
and is it's license is [here](https://golang.org/LICENSE). For future
reference purporses. 
