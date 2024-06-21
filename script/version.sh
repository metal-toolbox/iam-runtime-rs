#!/bin/bash

if [ -z "$VERSION" ]; then
	printf "Usage: \nexport VERSION=0.0.0 && ./version.sh\n"
	exit 1
fi

PLATFORM=$(uname)
FILE=iam-runtime/Cargo.toml

if [[ "$PLATFORM" == "Linux" ]]; then
	sed -i "s/^version .*$/version = \"$VERSION\"/" "$FILE"
elif [[ "$PLATFORM" == "Darwin" ]]; then
	sed -i "s/^version .*$/version = \"$VERSION\"/" "$FILE"
else
	echo "unknown platform: $PLATFORM"
	exit 1
fi
