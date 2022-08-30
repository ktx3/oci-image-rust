# This is free and unencumbered software released into the public domain.

# Get the version of package ($1) to be used

set -e -u

# Change to the script directory
cd -- "$(dirname -- "${0:?}")"

: "${RUST_GIT_URL:=https://github.com/rust-lang/rust.git}"
: "${RUSTUP_GIT_URL:=https://github.com/rust-lang/rustup.git}"

# Verify the package name is valid
case "${1:-}" in
    rust) git_url="${RUST_GIT_URL:?}";;
    rustup) git_url="${RUSTUP_GIT_URL:?}";;
    *) printf 'error: invalid package: %s\n' "${1:-}" >&2 && exit 1;;
esac

# Return the version from the lockfile, if it exists, or get the latest
if test -e "version-${1:?}.lock"; then
    cat "version-${1:?}.lock"
    exit 0
fi

git ls-remote --tags -- "${git_url:?}" \
| grep -F -v -e '^{}' \
| cut -f 2 \
| sed -e 's/^refs\/tags\///' \
| grep -E -e '^[[:digit:]]+(\.[[:digit:]]+)+$' \
| sort -V \
| tail -n 1 \
| tee "version-${1:?}.lock"
