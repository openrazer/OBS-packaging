Format: 3.0 (quilt)
Source: openrazer
Binary: openrazer-kernel-modules-dkms, openrazer-meta, openrazer-daemon, python3-openrazer, openrazer-doc
Architecture: amd64 i386 all
Version: 2.1-0
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
 ad8de9e4b77b97d927b1227a68032d29 126936 openrazer_2.1.orig.tar.xz
 bee9cbb4db0d4f653d07ee539eef8ec4 7416 openrazer_2.1-0.debian.tar.xz
