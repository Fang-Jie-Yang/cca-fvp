#! /bin/bash

CONFIG="cca-3world.yaml"
export PATH=$PWD/build/shrinkwrap/shrinkwrap:$PATH
export SHRINKWRAP_BUILD=$PWD/build/shrinkwrap_build
export SHRINKWRAP_PACKAGE=$PWD/build/shrinkwrap_package
if [[ -z ${SSH_AUTH_SOCK+x} ]]; then
	SSH_AGENT="--ssh-agent"
fi
shrinkwrap ${SSH_AGENT} build --overlay=ntussl-overlay.yaml ${CONFIG}
