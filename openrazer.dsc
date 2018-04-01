Format: 3.0 (quilt)
Source: openrazer
Binary: openrazer-kernel-modules-dkms, openrazer-meta, openrazer-daemon, python3-openrazer, openrazer-doc
Architecture: amd64 i386 all
Version: 2.3.0-1
Maintainer: Terry Cain <terry@terrys-home.co.uk>
Homepage: https://openrazer.github.io/
Standards-Version: 3.9.5
Vcs-Browser: https://github.com/openrazer/openrazer/
Vcs-Git: git://git@github.com:openrazer/openrazer.git
Build-Depends: debhelper (>= 8.0.0), linux-headers-generic, python3, python3-setuptools, lsb-release
Package-List:
 openrazer-meta deb misc optional arch=all
 python3-openrazer deb misc optional arch=all
 openrazer-daemon deb misc optional arch=amd64,i386
 openrazer-doc deb doc optional arch=all
 openrazer-kernel-modules-dkms deb kernel optional arch=amd64,i386
Files:
 4ca6a8d929bec31019cd544ecc50dbef 128736 openrazer_2.3.0.orig.tar.xz
 637ba7033e761f52851b8514be3fa12f 7464 openrazer_2.3.0-1.debian.tar.xz
