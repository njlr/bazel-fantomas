#!/bin/bash

set -e

export HOME=$(mktemp -d || mktemp -d -t bazel-tmp)

trap "rm -rf $HOME" EXIT

export DOTNET_NOLOGO=1
export DOTNET_SKIP_FIRST_RUN_EXPERIENCE=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1

EXEC_ROOT=$(pwd)

if test "${BUILD_WORKING_DIRECTORY+x}"; then
  cd $BUILD_WORKING_DIRECTORY
fi

dotnet $EXEC_ROOT/external/fantomas/tools/net6.0/any/fantomas.dll ${@:1}
