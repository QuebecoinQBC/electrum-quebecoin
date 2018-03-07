#!/bin/bash
BUILD_REPO_URL=https://github.com/akhavr/electrum-quebecoin.git

cd build

if [[ -z $TRAVIS_TAG ]]; then
  exit 0
else
  git clone --branch $TRAVIS_TAG $BUILD_REPO_URL electrum-quebecoin
fi

docker run --rm -v $(pwd):/opt -w /opt/electrum-quebecoin -t akhavr/electrum-quebecoin-release:Linux /opt/build_linux.sh
docker run --rm -v $(pwd):/opt -v $(pwd)/electrum-quebecoin/:/root/.wine/drive_c/electrum -w /opt/electrum-quebecoin -t akhavr/electrum-quebecoin-release:Wine /opt/build_wine.sh
