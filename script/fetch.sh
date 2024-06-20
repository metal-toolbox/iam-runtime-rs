#!/bin/bash

if [ -z "$VERSION" ]; then
	printf "Usage: \nexport VERSION=0.0.0 && ./fetch.sh\n"
	exit 1
fi

BASE=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT="${BASE%/*}"
TARGET="$ROOT/proto"

rm proto/a* proto/i* &>/dev/null

download() {
	local source="$1"
	local dest="$TARGET"

	wget -P "$dest" "$source"
}

download "https://raw.githubusercontent.com/metal-toolbox/iam-runtime/v$VERSION/proto/authentication/authentication.proto"
download "https://raw.githubusercontent.com/metal-toolbox/iam-runtime/v$VERSION/proto/authorization/authorization.proto"
download "https://raw.githubusercontent.com/metal-toolbox/iam-runtime/v$VERSION/proto/identity/identity.proto"
