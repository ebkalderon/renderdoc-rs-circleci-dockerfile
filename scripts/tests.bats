#!/usr/bin/env bats

#
# Integration tests for validating the container built from the Dockerfile
# generated by `scripts/generate.sh`.
#

@test "dockerize" {
    if [ $DOCKERIZE != "true" ] ; then
        skip "dockerize not installed"
    fi

    dockerize --version
}

@test "renderdoc" {
    renderdoccmd --version
}

@test "rust version" {
    rustc --version | cut -d ' ' -f 2 | grep "${IMAGE_TAG}"
}