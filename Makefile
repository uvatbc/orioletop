COMPILER=gcc
export COMPILER
CHECK_TYPE=normal
export CHECK_TYPE
GITHUB_WORKSPACE=$(shell pwd)
export GITHUB_WORKSPACE

local:
	bash ./orioledb/ci/build.sh

in_docker:
	docker run --rm -it \
		-v ${GITHUB_WORKSPACE}:/tmp/src \
		-w /tmp/src \
		accupara/orioledb:ubuntu_2004 \
		make local
