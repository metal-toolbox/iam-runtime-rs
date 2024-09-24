#!/bin/bash -e

get_latest_version() {
    curl -s \
        "https://api.github.com/repos/metal-toolbox/iam-runtime/releases/latest" \
        | awk -F'"' '/tag_name/ {printf $4}'
}

get_current_version() {
    local base
    base=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
    local root="${base%/*}"
    cat "$root/iam_runtime_version.txt"
}

latest=$(get_latest_version)
current=$(get_current_version)

if [[ "$current" != "$latest" ]]; then
  echo "$latest"
fi
