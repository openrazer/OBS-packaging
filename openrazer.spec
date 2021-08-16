# This spec file should work on Fedora, openSUSE and Mageia
#
# for kmp builds to get signed kernel modules
#
# needssslcertforbuild

%define dkms_name openrazer-driver
%define dkms_version 3.1.0

%if 0%{?suse_version}
%define openrazer_driver_package openrazer-kmp
%bcond_without openrazer_kmp
%else
%define openrazer_driver_package openrazer-kernel-modules-dkms
%bcond_with    openrazer_kmp
%endif

#define gitcommit 6ae1f7d55bf10cc6b5cb62a5ce99ff22c43e0701

Name:           openrazer
Version:        3.1.0
Release:        1%{?dist}
Summary:        Open source driver and user-space daemon for managing Razer devices

License:        GPL-2.0
URL:            https://github.com/openrazer/openrazer

%if 0%{?gitcommit:1}
Source0:        https://github.com/openrazer/openrazer/archive/%{gitcommit}.tar.gz
%else
Source0:        https://github.com/openrazer/openrazer/releases/download/v%{version}/openrazer-%{version}.tar.xz
%endif

# preamble file for the kmp
Source1:        preamble

# directory ownership of the udev files
BuildRequires:  pkgconfig(systemd)
# building and installing the python part
BuildRequires:  python3-devel
BuildRequires:  python3-setuptools

%if %{with openrazer_kmp}

BuildRequires:  %{kernel_module_package_buildreqs}

# setup subpackages for the different kmp packages
%if 0%{?is_opensuse}
%kernel_module_package -p %{_sourcedir}/preamble
%else
%kernel_module_package -c %_sourcedir/_projectcert.crt -p %{_sourcedir}/preamble
%endif

%endif

%description
A collection of Linux drivers for Razer devices - providing kernel drivers,
DBus services and Python bindings to interact with the DBus interface.

# after renaming the main package back to openrazer, set up a new meta package
%package -n openrazer-meta
Summary:        Open source driver and user-space daemon for managing Razer devices

# remove dkms requires here as it is handled in openrazer-daemon
Requires:       openrazer-daemon
Requires:       python3-openrazer

BuildArch:      noarch
%description -n openrazer-meta
Meta package for installing all required openrazer packages.

%package -n openrazer-udev
Summary:        Open source driver and user-space daemon for managing Razer devices - udev rules
BuildArch:      noarch
%description -n openrazer-udev
A collection of Linux drivers for Razer devices - providing kernel drivers,
DBus services and Python bindings to interact with the DBus interface.

udev rules to set proper permissions.

%if %{without openrazer_kmp}

%package -n openrazer-kernel-modules-dkms
Requires:       python3-openrazer
Summary:        OpenRazer Driver DKMS package
Group:          System Environment/Kernel
Obsoletes:      razer-kernel-modules-dkms
Provides:       razer-kernel-modules-dkms
Requires:       dkms
Requires:       make
Requires:       openrazer-udev = %{version}
# OBS fails without that
#
# actually this requires needs to be there at runtime as well because a requires
# does not mean that the package is already or still around when those scriptlets run
# Requires only means "at the end of the installation we want dkms, Requires(post) means
# we need dkms when finishing this installation.
#
Requires(post): dkms
Requires(preun): dkms
Requires(post): make
Requires(preun): make

%description -n openrazer-kernel-modules-dkms
Kernel driver for Razer devices (DKMS-variant)

%endif

%package -n openrazer-daemon
Summary:        OpenRazer Service package
Group:          System Environment/Daemons
BuildArch:      noarch
Obsoletes:      razer-daemon
Provides:       razer-daemon
Requires:       %{openrazer_driver_package}
Requires:       python3
%if 0%{?suse_version}
Requires:       dbus-1-python3
Requires:       typelib(Gdk) = 3.0
%else
Requires:       python3-dbus
%endif
%if 0%{?mageia}
Requires:       python3-gobject3
%else
Requires:       python3-gobject
%endif
Requires:       python3-setproctitle
Requires:       python3-pyudev
Requires:       python3-daemonize
Requires:       xautomation
Requires:       udev
%if 0%{?suse_version}
Requires(pre):  shadow
%else
Requires(pre):  shadow-utils
%endif

%description -n openrazer-daemon
Userspace daemon that abstracts access to the kernel driver. Provides a DBus service for applications to use.


%package -n python3-openrazer
Summary:        OpenRazer Python library
Group:          System Environment/Libraries
BuildArch:      noarch
Obsoletes:      python3-razer
Provides:       python3-razer
Requires:       openrazer-daemon
Requires:       python3
%if 0%{?suse_version}
Requires:       dbus-1-python3
%else
Requires:       python3-dbus
%endif
%if 0%{?mageia}
Requires:       python3-gobject3
%else
Requires:       python3-gobject
%endif
Requires:       python3-numpy
%description -n python3-openrazer
Python library for accessing the daemon from Python.

%prep
%if 0%{?gitcommit:1}
%autosetup -n openrazer-%{gitcommit}
%else
%autosetup -n openrazer-%{version}
%endif

%if %{with openrazer_kmp}
set -- driver/*
mkdir source
mv "$@" source/
mkdir obj
%endif

%build
# noop

%if %{with openrazer_kmp}
for flavor in %{flavors_to_build}; do
	rm -rf obj/$flavor
	cp -r source obj/$flavor
	make V=1 %{?_smp_mflags} -C %{kernel_source $flavor} %{?linux_make_arch} modules M=$PWD/obj/$flavor
done
%endif

%install
# setup_dkms & udev_install -> razer-kernel-modules-dkms
# daemon_install -> razer_daemon
# python_library_install -> python3-razer
make DESTDIR=$RPM_BUILD_ROOT \
    %if %{without openrazer_kmp}
    setup_dkms \
    %endif
    udev_install \
    daemon_install \
    python_library_install

%if %{with openrazer_kmp}
export INSTALL_MOD_PATH=%{buildroot}
export INSTALL_MOD_DIR='%{kernel_module_package_moddir}'
for flavor in %{flavors_to_build}; do
	make V=1 -C %{kernel_source $flavor} modules_install M=$PWD/obj/$flavor
done

export BRP_PESIGN_FILES='*.ko'
%endif

%clean
rm -rf $RPM_BUILD_ROOT

%pre -n openrazer-daemon
#!/bin/sh
set -e
getent group plugdev >/dev/null || groupadd -r plugdev

%if %{without openrazer_kmp}

%if 0%{?mageia}

%post -n openrazer-kernel-modules-dkms
if [ ! -e /.buildenv ] ; then
dkms add -m %{dkms_name} -v %{dkms_version} --rpm_safe_upgrade
dkms build -m %{dkms_name} -v %{dkms_version} --rpm_safe_upgrade
dkms install -m %{dkms_name} -v %{dkms_version} --rpm_safe_upgrade

echo -e "\e[31m********************************************"
echo -e "\e[31m* To complete installation, please run:    *"
echo -e "\e[31m* # sudo gpasswd -a <yourUsername> plugdev *"
echo -e "\e[31m********************************************"
echo -e -n "\e[39m"
fi

%preun -n openrazer-kernel-modules-dkms
if [ ! -e /.buildenv ] ; then
dkms remove -m %{dkms_name} -v %{dkms_version} --rpm_safe_upgrade --all
fi

%else

%post -n openrazer-kernel-modules-dkms
#!/bin/sh
set -e

if [ ! -e /.buildenv ] ; then
dkms install %{dkms_name}/%{dkms_version}

echo -e "\e[31m********************************************"
echo -e "\e[31m* To complete installation, please run:    *"
echo -e "\e[31m* # sudo gpasswd -a <yourUsername> plugdev *"
echo -e "\e[31m********************************************"
echo -e -n "\e[39m"
fi

%preun -n openrazer-kernel-modules-dkms
#!/bin/sh

if [ ! -e /.buildenv ] ; then
if [ "$(dkms status -m %{dkms_name} -v %{dkms_version})" ]; then
  dkms remove -m %{dkms_name} -v %{dkms_version} --all
fi
fi

%endif

%files -n openrazer-kernel-modules-dkms
%defattr(-,root,root,-)
%{_usrsrc}/%{dkms_name}-%{dkms_version}/

%endif

%files -n openrazer-udev
# A bit hacky but it works
%{_udevrulesdir}/../razer_mount
%{_udevrulesdir}/99-razer.rules
#

%files -n openrazer-daemon
%{_bindir}/openrazer-daemon
%{python3_sitelib}/openrazer_daemon/
%{python3_sitelib}/openrazer_daemon-*.egg-info/
%{_datadir}/openrazer/
%{_datadir}/dbus-1/services/org.razer.service
%{_prefix}/lib/systemd/user/openrazer-daemon.service
%{_mandir}/man5/razer.conf.5*
%{_mandir}/man8/openrazer-daemon.8*

%files -n openrazer-meta
# meta package is empty

%files -n python3-openrazer
%{python3_sitelib}/openrazer/
%{python3_sitelib}/openrazer-*.egg-info/

%changelog
