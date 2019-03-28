Format: 3.0 (quilt)
Source: openrazer
Binary: openrazer-meta, openrazer-driver-dkms, openrazer-daemon, python3-openrazer, openrazer-doc
Architecture: all
Version: 2.5.0-0
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
 da3fa74ccb7061988792bdd9b0f402a4 133300 openrazer_2.5.0.orig.tar.xz
 6e8cb6bcb287fc1e0ee80c88cb7ec0b6 11644 openrazer_2.5.0-0.debian.tar.xz
