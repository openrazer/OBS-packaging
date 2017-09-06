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
curl -L -O $repourl/archive/v$version.tar.gz
# Extract the debian/ folder from the archive.
tar xzf v$version.tar.gz openrazer-$version/debian
# Move the debian/ folder out of the new folder.
mv openrazer-$version/debian .
# Remove the linux-headers-generic line.
sed -i '/linux-headers-generic/d' debian/control

# Add new meta package
cat <<EOF >> debian/control

Package: openrazer-meta
Section: misc
Architecture: all
Depends: python3-razer,
         razer-daemon,
         razer-kernel-modules-dkms
Description: Meta package for openrazer
EOF

# Repack the folder.
tar cf - debian/ | xz -c > razer_$version-0.debian.tar.xz
# Move the resulting file back.
mv razer_$version-0.debian.tar.xz $origloc
