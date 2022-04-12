%define debug_package %{nil}

Name: openrazer-kmod-common

Version:        3.2.0
Release:        1%{?dist}.1
Summary:        OpenRazer UDev rules

Group:          System Environment/Kernel

License:        GPL-2.0
URL:            https://github.com/openrazer/openrazer
Source0:        https://github.com/openrazer/openrazer/releases/download/v%{version}/openrazer-%{version}.tar.xz
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildRequires:  make
Provides:       openrazer-kernel-modules-dkms
Requires:       kmod-openrazer


%description
UDev rules for Razer devices


%prep
%autosetup -n openrazer-%{version}


%setup -q -c -T -a 0


%build


%install
rm -rf ${RPM_BUILD_ROOT}
make -C openrazer-%{version} DESTDIR=${RPM_BUILD_ROOT} udev_install


%clean
rm -rf ${RPM_BUILD_ROOT}


%files
%{_udevrulesdir}/../razer_mount
%{_udevrulesdir}/99-razer.rules
