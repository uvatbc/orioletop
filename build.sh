#!/bin/bash

set -ex

main() {
    export COMPILER=gcc
    export CHECK_TYPE=normal
    export GITHUB_WORKSPACE=$(pwd)

	./orioledb/ci/build.sh
}

main $*
