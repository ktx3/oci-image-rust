# This is free and unencumbered software released into the public domain.

ifndef ARCH
    ARCH := $(shell uname -m)
    ifeq "arm64" "$(ARCH)"
        ARCH := aarch64
    endif
endif

ifndef RUST_VERSION
RUST_VERSION := $(shell $(SHELL) version.sh rust)
endif

ifndef RUSTUP_VERSION
RUSTUP_VERSION := $(shell $(SHELL) version.sh rustup)
endif

# Optional variables
BASE_IMAGE ?= localhost/alpine:3
RUSTUP_BIN ?= rustup-init-$(RUSTUP_VERSION)
RUSTUP_URL ?= https://static.rust-lang.org/rustup/archive/$(RUSTUP_VERSION)/$(ARCH)-unknown-linux-musl

# Common configuration
IMAGE_NAME ?= rust
IMAGE_VERSION ?= $(firstword $(subst ., ,$(RUST_VERSION)))
include oci-build/oci-build.mk

# Target recipes
.PHONY: clean update

build: BUILD_OPTS += --build-arg=ARCH=$(ARCH)
build: BUILD_OPTS += --build-arg=BASE_IMAGE=$(BASE_IMAGE)
build: BUILD_OPTS += --build-arg=RUSTUP_BIN=$(RUSTUP_BIN)
build: BUILD_OPTS += --build-arg=RUSTUP_VERSION=$(RUSTUP_VERSION)
build: BUILD_OPTS += --build-arg=RUST_VERSION=$(RUST_VERSION)
build: $(RUSTUP_BIN)

clean:
	rm -f -- $(wildcard rustup-init-* version-*.lock)

rustup-init-%:
	$(CURL) $(CURL_OPTS) -o $@ --url $(RUSTUP_URL)/rustup-init
	chmod -- +x $@

update:
	rm -f -- $(wildcard version-*.lock)
	$(SHELL) version.sh rust
	$(SHELL) version.sh rustup
