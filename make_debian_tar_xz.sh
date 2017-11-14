#!/bin/bash

version=$1
if [ ! $version ]; then
    echo "Usage: $0 <new-version>"
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

# Repack the folder.
tar cf - debian/ | xz -c > openrazer_$version-0.debian.tar.xz
# Move the resulting file back.
mv openrazer_$version-0.debian.tar.xz $origloc
