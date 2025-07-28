#!/bin/bash
set -ex -o pipefail
. /Users/aaronlabomascus/dev/axivion/bauhaus-suite-7.10.1-with-python/bauhaus-suite/bauhaus-kshrc
export BAUHAUS_CONFIG="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
axivion_ci "$@"
