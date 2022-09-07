#!/bin/bash

set -e

cd "$(dirname "${BASH_SOURCE[0]}")"

dotnet fantomas --check \
  ./app/Program.fs \
  ./public-suffix-list/Generated.fs
