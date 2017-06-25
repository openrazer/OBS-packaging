#!/bin/bash

gitcommit=$1
if [ ${#gitcommit} != 40 ]; then
    echo "Malformed commit id, please try again!"
    echo "Usage: $0 <commit-hash>"
    exit 1
fi

source common.sh

sed -i 's/gitcommit .*$/gitcommit '$gitcommit'/' razer-drivers.spec
sed -i 's/_commit=.*$/_commit='$gitcommit'/' PKGBUILD
updpkgsums # only works on arch, we could take the sum from the _service file
echo "Removing _service file, press Ctrl+C in 2 seconds to abort!"
sleep 2
cp _service /tmp/_service
echo "Backup in /tmp/_service"
rm _service
osc add $repourl/archive/$gitcommit.tar.gz
