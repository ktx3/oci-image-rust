BASE_IMAGE := localhost/alpine:3

# Find new versions at:
# - https://github.com/rust-lang/rustup/tags
# - https://github.com/rust-lang/rust/releases
RUSTUP_VERSION := 1.24.3
RUST_VERSION := 1.61.0

# Optional variables
RUSTUP_BIN := rustup-init-$(RUSTUP_VERSION)
RUSTUP_URL := https://static.rust-lang.org/rustup/archive/$(RUSTUP_VERSION)/x86_64-unknown-linux-musl

# Common configuration
IMAGE_NAME := rust
IMAGE_VERSION := $(firstword $(subst ., ,$(RUST_VERSION)))
include oci-build/oci-build.mk

# Target recipes
.PHONY: clean

build: BUILD_OPTS += --build-arg=BASE_IMAGE=$(BASE_IMAGE)
build: BUILD_OPTS += --build-arg=RUSTUP_BIN=$(RUSTUP_BIN)
build: BUILD_OPTS += --build-arg=RUSTUP_VERSION=$(RUSTUP_VERSION)
build: BUILD_OPTS += --build-arg=RUST_VERSION=$(RUST_VERSION)
build: $(RUSTUP_BIN)

clean:
	rm -f -- $(wildcard rustup-init-*)

rustup-init-%:
	$(CURL) $(CURL_OPTS) -o $@ --url $(RUSTUP_URL)/rustup-init
	chmod -- +x $@
