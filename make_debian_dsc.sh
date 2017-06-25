#!/bin/bash

cp openrazer.dsc openrazer-Debian.dsc

# Package name is different on Ubuntu: linux-headers-generic -> linux-headers-amd64
sed -i 's/linux-headers-generic/linux-headers-amd64/' openrazer-Debian.dsc

cp openrazer-Debian.dsc openrazer-Debian_8.0.dsc
cp openrazer-Debian.dsc openrazer-Debian_9.0.dsc
cp openrazer-Debian.dsc openrazer-Debian_Sid.dsc

rm openrazer-Debian.dsc
