#!/bin/bash
set -eu

GIT_REF=ef09e5787cb0fda3eee1f4aee7d5e147690484b7
TMP_CLONE_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_CLONE_DIR"' EXIT

echo "Downloading libphonenumber repository (git ref ${GIT_REF})..."
curl -sL "https://github.com/google/libphonenumber/archive/${GIT_REF}.tar.gz" | tar -C $TMP_CLONE_DIR -xz --strip-components=1

cp -vf $TMP_CLONE_DIR/resources/*.xml .
rm -rf carrier geocoding
cp -r $TMP_CLONE_DIR/resources/carrier $TMP_CLONE_DIR/resources/geocoding .
