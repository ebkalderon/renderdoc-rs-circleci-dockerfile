#!/usr/bin/env sh

#
# Parses the `FROM` statement in the `Dockerfile` to extract the underlying Rust
# toolchain version number to use as a tag name.
#

readonly TAG_NAME="$(grep 'FROM circleci/rust:' ./Dockerfile | cut -d ':' -f 2)"

if [ -z "${TAG_NAME}" ]; then
  echo 'latest'
else
  echo "${TAG_NAME}"
fi
