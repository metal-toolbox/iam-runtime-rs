#!/bin/bash -ex

upstream_release() {
    curl -s
    "https://api.github.com/repos/metal-toolbox/iam-runtime/releases/latest" \
        | awk -F'"' '/tag_name/ {printf $4}'
}

crate_release() {
    local base
    base=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
    local root="${base%/*}"
    grep version "$root/iam-runtime/Cargo.toml" | awk '{print $3}' | tr -d '"'
}

should_bump() {
    latest=$(upstream_release)
    current=$(crate_release)
    result="false"
    if [[ "v$current" != *"$latest"* ]]; then
        result="true"
    fi
    echo "$result" "$latest"
}

read -r bump latest < <(should_bump)
if [[ "$bump" == "true" ]]; then
    echo "$latest"
fi
