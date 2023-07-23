#!/bin/bash

set -mex

mkdir -p build
cd build
cp -r /workspace/* .
mb2 -t SailfishOS-${INPUT_RELEASE}-${INPUT_ARCH} build-init
mb2 -t SailfishOS-${INPUT_RELEASE}-${INPUT_ARCH} build-requires
mb2 -t SailfishOS-${INPUT_RELEASE}-${INPUT_ARCH} prepare
mb2 -t SailfishOS-${INPUT_RELEASE}-${INPUT_ARCH} apply
mb2 -t SailfishOS-${INPUT_RELEASE}-${INPUT_ARCH} build
sudo mkdir -p /workspace/RPMS
sudo cp -r RPMS/*.rpm /workspace/RPMS
