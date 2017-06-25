#!/bin/bash

version=$1
if [ ! $version ]; then
    echo "Usage: $0 <new-version>"
    exit 1
fi

source common.sh

curl -L $repourl/archive/v$version.tar.gz -o razer_$version.orig.tar.gz
