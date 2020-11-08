#!/bin/bash

if [ "openrazer" == "$(basename $PWD)" ]; then
    echo "Aborting. Already in stable package directory."
    exit 1
fi

echo "Copying..."
cp ../../hardware:razer/openrazer/* .
echo "Copied."
