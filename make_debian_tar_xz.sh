#!/bin/bash

version=$1
debrel=$2
if [ ! $version ] || [ ! $debrel ]; then
    echo "Usage: $0 <new-version> <debrel>"
    exit 1
fi

source common.sh

# Store the original location
origloc=$(pwd)
# Go into a new temporary folder
cd $(mktemp -d)
# Download the tarball.
curl -L -O $repourl/releases/download/v$version/openrazer-$version.tar.xz
# Extract the debian/ folder from the archive.
tar xf openrazer-$version.tar.xz openrazer-$version/debian
# Move the debian/ folder out of the new folder.
mv openrazer-$version/debian .
# Remove the linux-headers-generic line.
sed -i '/linux-headers-generic/d' debian/control
# TEMPORARY: Remove python3-evdev dependency
sed -i '/python3-evdev/d' debian/control
# Add revision to version number
sed -i 's/'$version'/'$version'-'$debrel'/' debian/changelog

# Repack the folder.
tar cf - debian/ | xz -c > openrazer_$version-$debrel.debian.tar.xz
# Move the resulting file back.
mv openrazer_$version-$debrel.debian.tar.xz $origloc
