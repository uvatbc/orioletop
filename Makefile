COMPILER=gcc
export COMPILER
CHECK_TYPE=normal
export CHECK_TYPE
GITHUB_WORKSPACE=$(shell pwd)
export GITHUB_WORKSPACE

TARGET?=local

DOCKER_PREFIX=docker run \
		--rm -it \
		-v ${GITHUB_WORKSPACE}:/src \
		-w /src \
		accupara/orioledb:ubuntu_2004

in_docker:
	${DOCKER_PREFIX} \
		make ${TARGET}

it:
	${DOCKER_PREFIX} \
		bash

local:
	./build.sh

ci:
	ls -la ./orioledb/ci/build.sh
	bash -c ./orioledb/ci/build.sh

test:
	cd postgresql ; ./configure --disable-debug --disable-cassert --enable-tap-tests --with-icu --prefix=$(shell readlink -f ..)/pgsql
	cd pgbld ; make -j `nproc`
	cd pgbld ; make -j `nproc` install
