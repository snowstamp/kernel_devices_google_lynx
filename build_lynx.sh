#!/bin/bash
# SPDX-License-Identifier: GPL-2.0

function exit_if_error {
  if [ $1 -ne 0 ]; then
    echo "ERROR: $2: retval=$1" >&2
    exit $1
  fi
}

export LTO=${LTO:-thin}
export BUILD_CONFIG=private/devices/google/lynx/build.config.lynx
export KLEAF_SUPPRESS_BUILD_SH_DEPRECATION_WARNING=1

if [ -z "${GKI_PREBUILTS_DIR}" ]; then
  GKI_BUILD_CONFIG=common/build.config.gki.aarch64 \
    build/build.sh "$@"
else
  build/build.sh "$@"
fi

exit_if_error $? "Failed to create mixed build"
