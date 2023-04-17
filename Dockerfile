# This is free and unencumbered software released into the public domain.

ARG BASE_IMAGE

FROM ${BASE_IMAGE}

ARG ARCH
ARG RUSTUP_VERSION
ARG RUST_VERSION

# Environment variables
ENV \
    ARCH=${ARCH} \
    CARGO_HOME=/opt/cargo \
    PATH=${PATH}:/opt/cargo/bin \
    RUSTUP_HOME=/opt/rustup \
    RUSTUP_VERSION=${RUSTUP_VERSION} \
    RUST_VERSION=${RUST_VERSION}

# Install the Rust toolchain with oci-build
RUN \
    --mount=target=/tmp,type=tmpfs \
    --mount=target=/tmp/build,readwrite \
    --mount=target=/tmp/build/oci-build.sh,source=oci-build/oci-build.sh \
    ["sh", "-x", "/tmp/build/oci-build.sh"]
