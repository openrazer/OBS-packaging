Format: 3.0 (quilt)
Source: openrazer
Binary: openrazer-meta, openrazer-driver-dkms, openrazer-daemon, python3-openrazer, openrazer-doc
Architecture: all
Version: 3.12.2-0
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
 fb546beb38a06e6c59a40e3ae5a5fab2 195188 openrazer_3.12.2.orig.tar.xz
 dab49899216078edd05edc18dc6c6f0e 11860 openrazer_3.12.2-0.debian.tar.xz
