#!/bin/bash

set -mex

echo "Version 1.1"

if [ "$INPUT_RELEASE" = "last" ]; then
  INPUT_RELEASE="4.5.0.16"
fi

if [ "$INPUT_RELEASE" = "4.5.0.16" ]; then
  provider="robang74"
else
  provider="coderus"
fi

docker run --rm --privileged \
    -v $GITHUB_WORKSPACE:/workspace \
    -v $GITHUB_ACTION_PATH:/action \
    -e INPUT_RELEASE \
    -e INPUT_ARCH \
    $provider/sailfishos-platform-sdk:$INPUT_RELEASE \
    "/bin/bash" "/action/docker.sh"
