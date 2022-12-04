Format: 3.0 (quilt)
Source: openrazer
Binary: openrazer-meta, openrazer-driver-dkms, openrazer-daemon, python3-openrazer, openrazer-doc
Architecture: all
Version: 3.5.1-0
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
 e9d57b1845274b46215aab4b26bef29d 177572 openrazer_3.5.1.orig.tar.xz
 cb5e7e17f80149965e2714c0f990b6a1 11584 openrazer_3.5.1-0.debian.tar.xz
