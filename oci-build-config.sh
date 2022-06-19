# This is free and unencumbered software released into the public domain.

# Configuration for oci-build.sh

# Required environment variables from the Dockerfile
: "${RUSTUP_VERSION:?}"
: "${RUST_VERSION:?}"

post_install() {
    # Download and install the Rust toolchain with rustup
    "./rustup-init-${RUSTUP_VERSION:?}" -y --no-modify-path \
        --component=clippy \
        --component=rustfmt \
        --default-host=x86_64-unknown-linux-musl \
        "--default-toolchain=${RUST_VERSION:?}" \
        --profile=minimal \
        --target=wasm32-unknown-unknown \
        --target=x86_64-unknown-linux-musl
}
