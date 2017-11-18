Format: 3.0 (quilt)
Source: openrazer
Binary: openrazer-kernel-modules-dkms, openrazer-meta, openrazer-daemon, python3-openrazer, openrazer-doc
Architecture: amd64 i386 all
Version: 2.1.1-0
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
 a763773faf7573c510779d8f06612817 127152 openrazer_2.1.1.orig.tar.xz
 86d1040d77607bfdd86e22ee09c3daf0 7432 openrazer_2.1.1-0.debian.tar.xz
