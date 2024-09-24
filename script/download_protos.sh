#!/bin/bash -e

BASE=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT="${BASE%/*}"
TARGET="$ROOT/builder/proto"

rm "$TARGET"/a* "$TARGET"/i* > /dev/null || true

download() {
	local source="$1"
	local dest="$TARGET"

	wget -P "$dest" "$source"
}

get_current_version() {
    local base
    base=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
    local root="${base%/*}"
    cat "$root/iam_runtime_version.txt"
}

version=$(get_current_version)

download "https://raw.githubusercontent.com/metal-toolbox/iam-runtime/$version/proto/authentication/authentication.proto"
download "https://raw.githubusercontent.com/metal-toolbox/iam-runtime/$version/proto/authorization/authorization.proto"
download "https://raw.githubusercontent.com/metal-toolbox/iam-runtime/$version/proto/identity/identity.proto"
