Format: 3.0 (quilt)
Source: openrazer
Binary: openrazer-meta, openrazer-driver-dkms, openrazer-daemon, python3-openrazer, openrazer-doc
Architecture: all
Version: 3.10.3-0
Maintainer: Luca Weiss <debian@lucaweiss.eu>
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
 ee9db452f3f116a368df4c10e7af664e 189840 openrazer_3.10.3.orig.tar.xz
 11e56fb955f09de70b002870697eb2f0 11812 openrazer_3.10.3-0.debian.tar.xz
