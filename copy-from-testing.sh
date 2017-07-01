#!/bin/bash

if [ "openrazer-testing" == "$(basename $PWD)" ]; then
    echo "Aborting. Already in testing package directory."
    exit 1
fi

echo "Copying..."
cp ../openrazer-testing/* .
echo "Copied."
