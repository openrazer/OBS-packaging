Format: 3.0 (quilt)
Source: openrazer
Binary: openrazer-meta, openrazer-driver-dkms, openrazer-daemon, python3-openrazer, openrazer-doc
Architecture: all
Version: 3.6.0-0
Maintainer: Terry Cain <terry@terrys-home.co.uk>
Homepage: https://openrazer.github.io/
Standards-Version: 4.6.0
Vcs-Browser: https://github.com/openrazer/openrazer/
Vcs-Git: https://github.com/openrazer/openrazer.git
Build-Depends: debhelper (>= 11), dh-python, python3, python3-setuptools
Build-Depends-Indep: dh-dkms | dkms (<< 3.0.10)
Package-List:
 openrazer-daemon deb misc optional arch=all
 openrazer-doc deb doc optional arch=all
 openrazer-driver-dkms deb kernel optional arch=all
 openrazer-meta deb misc optional arch=all
 python3-openrazer deb python optional arch=all
Files:
 d0dbd0527a9f900ef8e78775341b5ffb 180380 openrazer_3.6.0.orig.tar.xz
 10e062dac6026bd560b22262a4425bd4 11672 openrazer_3.6.0-0.debian.tar.xz
