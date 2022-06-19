# Rust toolchain OCI container image

This is free and unencumbered software released into the public domain.

To build the image:

    $ make

The following variables can be set to customize the build (see
`oci-build/oci-build.mk` for other options):

- `BASE_IMAGE`: the base image used in the `Dockerfile`
- `RUSTUP_BIN`: path to the downloaded `rustup-init` binary
- `RUSTUP_URL`: rustup URL
- `RUSTUP_VERSION`: rustup version
- `RUST_VERSION`: Rust version
