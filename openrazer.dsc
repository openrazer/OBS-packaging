Format: 3.0 (quilt)
Source: openrazer
Binary: openrazer-kernel-modules-dkms, openrazer-daemon, python3-openrazer, openrazer-doc
Architecture: amd64 i386 all
Version: 2.0.0-0
Maintainer: Terry Cain <terry@terrys-home.co.uk>
Homepage: https://openrazer.github.io/
Standards-Version: 3.9.5
Vcs-Browser: https://github.com/openrazer/openrazer/
Vcs-Git: git://git@github.com:openrazer/openrazer.git
Build-Depends: debhelper (>= 8.0.0), linux-headers-generic, python3, python3-setuptools
Package-List:
 openrazer-meta deb misc optional arch=all
 python3-openrazer deb misc optional arch=all
 openrazer-daemon deb misc optional arch=amd64,i386
 openrazer-doc deb doc optional arch=all
 openrazer-kernel-modules-dkms deb kernel optional arch=amd64,i386
Files:
 19bc39bec3e8b02c82e3c2903744939f 166190 openrazer_2.0.0.orig.tar.gz
 5ee2e446017f1b6e3e915b433ed12c8e 7092 openrazer_2.0.0-0.debian.tar.xz
