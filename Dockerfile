# This is free and unencumbered software released into the public domain.

ARG BASE_IMAGE

FROM ${BASE_IMAGE}

ARG RUSTUP_BIN
ARG RUSTUP_VERSION
ARG RUST_VERSION

# Environment variables
ENV \
    CARGO_HOME=/opt/cargo \
    PATH=${PATH}:/opt/cargo/bin \
    RUSTUP_HOME=/opt/rustup \
    RUSTUP_VERSION=${RUSTUP_VERSION} \
    RUST_VERSION=${RUST_VERSION}

# Install the Rust toolchain with oci-build
COPY ["oci-build/oci-build.sh", "oci-build-config.sh", "packages.txt", "${RUSTUP_BIN}", "/tmp/"]
RUN ["sh", "-x", "/tmp/oci-build.sh"]
