#!/bin/bash

version=$1
debrel=$2
if [ ! $version ] || [ ! $debrel ]; then
    echo "Usage: $0 <new-version> <debrel>"
    exit 1
fi

source common.sh

# Fedora/openSUSE
sed -i 's/Version: .*$/Version: '$version'/' openrazer.spec
sed -i 's/%define dkms_version .*$/%define dkms_version '$version'/' openrazer.spec
# Debian/Ubuntu
sed -i 's/^Version: .*$/Version: '$version'-'$debrel'/' openrazer.dsc

echo "Removing _service file, press Ctrl+C in 2 seconds to abort!"
sleep 2
cp _service /tmp/_service
echo "Backup in /tmp/_service"
rm _service*

echo "ATTENTION! Update _service manually! See https://github.com/openSUSE/osc/issues/905"
#osc add $repourl/releases/download/v$version/openrazer-$version.tar.xz

# --- UPDATE CHECKSUMS ---
checksum=$(grep "checksum" _service | cut -d '>' -f2 | cut -d '<' -f1)

filesize_orig=$(stat --printf="%s" openrazer_$version.orig.tar.xz)
filesize_debian=$(stat --printf="%s" openrazer_$version-$debrel.debian.tar.xz)
md5_orig=$(md5sum openrazer_$version.orig.tar.xz  | awk '{ print $1 }')
md5_debian=$(md5sum openrazer_$version-$debrel.debian.tar.xz  | awk '{ print $1 }')

# Debian/Ubuntu (don't really understand the sed command here)
sed -i -e '/Files:/,+3d' openrazer.dsc
echo "Files:" >> openrazer.dsc
echo " $md5_orig $filesize_orig openrazer_$version.orig.tar.xz" >> openrazer.dsc
echo " $md5_debian $filesize_debian openrazer_$version-$debrel.debian.tar.xz" >> openrazer.dsc

