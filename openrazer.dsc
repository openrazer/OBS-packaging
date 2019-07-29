Format: 3.0 (quilt)
Source: openrazer
Binary: openrazer-meta, openrazer-driver-dkms, openrazer-daemon, python3-openrazer, openrazer-doc
Architecture: all
Version: 2.6.0-0
Maintainer: Terry Cain <terry@terrys-home.co.uk>
Homepage: https://openrazer.github.io/
Standards-Version: 4.2.1
Vcs-Browser: https://github.com/openrazer/openrazer/
Vcs-Git: https://github.com/openrazer/openrazer.git
Build-Depends: debhelper (>= 9), dh-python, dkms, python3, python3-setuptools, lsb-release
Package-List:
 openrazer-daemon deb misc optional arch=all
 openrazer-doc deb doc optional arch=all
 openrazer-driver-dkms deb kernel optional arch=all
 openrazer-meta deb misc optional arch=all
 python3-openrazer deb python optional arch=all
Files:
 33794bb639e07f8aaa24b363b949b6b3 137564 openrazer_2.6.0.orig.tar.xz
 badc4ab18bde4a25e6377856e4e7b5e3 11668 openrazer_2.6.0-0.debian.tar.xz
