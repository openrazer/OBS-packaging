#!/bin/bash

version=$1
if [ ! $version ]; then
    echo "Usage: $0 <new-version>"
    exit 1
fi

source common.sh

curl -L $repourl/releases/download/v$version/openrazer-$version.tar.xz -o openrazer_$version.orig.tar.xz
