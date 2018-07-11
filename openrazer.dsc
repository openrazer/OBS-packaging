Format: 3.0 (quilt)
Source: openrazer
Binary: openrazer-kernel-modules-dkms, openrazer-meta, openrazer-daemon, python3-openrazer, openrazer-doc
Architecture: amd64 i386 all
Version: 2.3.1-1
Maintainer: Terry Cain <terry@terrys-home.co.uk>
Homepage: https://openrazer.github.io/
Standards-Version: 3.9.5
Vcs-Browser: https://github.com/openrazer/openrazer/
Vcs-Git: https://github.com/openrazer/openrazer.git
Build-Depends: debhelper (>= 8.0.0), linux-headers-generic, python3, python3-setuptools, dh-python, lsb-release, dkms
Package-List:
 openrazer-daemon deb misc optional arch=amd64,i386
 openrazer-doc deb doc optional arch=all
 openrazer-kernel-modules-dkms deb kernel optional arch=amd64,i386
 openrazer-meta deb misc optional arch=all
 python3-openrazer deb misc optional arch=all
Files:
 e651ccc159b35e701d1f9bf9d9d6879e 128240 openrazer_2.3.1.orig.tar.xz
 be60530e38adaeda950b58af22905378 7188 openrazer_2.3.1-1.debian.tar.xz
