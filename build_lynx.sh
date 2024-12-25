#!/bin/bash
# SPDX-License-Identifier: GPL-2.0

test -d out/ && rm -rf out/

tools/bazel run \
    --config=stamp \
    --config=lynx \
    //private/devices/google/lynx:gs201_lynx_dist "$@" && DEVICE=lynx private/devices/google/common/sign_kernel_modules.sh
