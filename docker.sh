#!/bin/bash
#
# (C) 2020 and 2022, CODeRUS <coderusinbox@gmail.com>
# (C) 2021, Oskar Roesler (bionade24) <o.roesler@oscloud.info>
# (C) 2022, Andrea Scarpino <andrea@scarpino.dev>
#
# (C) 2023, Roberto A. Foglietta <roberto.foglietta@gmail.com>
#           Released and re-licensed under the GPLv2 license terms.
#
################################################################################

set -mex

mkdir -p build
cd build
ret=0
cp -r /workspace/* .
mb2 -t SailfishOS-${INPUT_RELEASE}-${INPUT_ARCH} build-init             # RAF
mb2 -t SailfishOS-${INPUT_RELEASE}-${INPUT_ARCH} build-requires         # RAF
mb2 -t SailfishOS-${INPUT_RELEASE}-${INPUT_ARCH} prepare                # RAF
if ! mb2 -t SailfishOS-${INPUT_RELEASE}-${INPUT_ARCH} apply; then       # RAF
  #RAF: sometimes fails but could be fine                               # RAF
  echo "WARNING: some patches did not apply, check the log."            # RAF
  ret=1                                                                 # RAF
fi                                                                      # RAF
mb2 -t SailfishOS-${INPUT_RELEASE}-${INPUT_ARCH} build
sudo mkdir -p /workspace/RPMS
sudo cp -r RPMS/*.rpm /workspace/RPMS
exit $ret                                                               # RAF
