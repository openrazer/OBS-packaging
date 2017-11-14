#!/bin/bash

version=$1
if [ ! $version ]; then
    echo "Usage: $0 <new-version>"
    exit 1
fi

# Remove old debian files
rm openrazer_*
# Run various scripts
./make_debian_orig_tar_xz.sh $version
./make_debian_tar_xz.sh $version
./update_release.sh $version
./make_debian_dsc.sh

# Remove _service:download_url:* file as I don't want it in the history
rm _service:download_url:*

echo "Everything should be updated!"
