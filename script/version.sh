#!/bin/bash

if [ -z "$VERSION" ]; then
	printf "Usage: \nexport VERSION=0.0.0 && ./version.sh\n"
	exit 1
fi

PLATFORM=$(uname)

if [[ "$PLATFORM" == "Linux" ]]; then
	sed -i "s/^version .*$/version = \"$VERSION\"/" Cargo.toml
elif [[ "$PLATFORM" == "Darwin" ]]; then
	sed -i "s/^version .*$/version = \"$VERSION\"/" Cargo.toml
else
	echo "unknown platform: $PLATFORM"
	exit 1
fi
