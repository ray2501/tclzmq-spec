#
# spec file for package tclzmq
#

Name:           tclzmq
Version:        4.0.1
Release:        0
License:        LGPL-3.0-only
Summary:        Tcl wrapper for zeromq
Url:            https://github.com/jdc8/tclzmq
Group:          Development/Libraries/Tcl
Source:         %{name}-%{version}.tar.gz
BuildRequires:  tcl >= 8.5
BuildRequires:  tcllib
BuildRequires:  critcl >= 3.0
BuildRequires:  critcl-devel >= 3.0
BuildRequires:  libuuid-devel
BuildRequires:  zeromq-devel >= 3.3
Requires:       tcl >= 8.5
BuildRoot:      %{_tmppath}/%{name}-%{version}-build

%description
tclzmq is a wrapper for the zeromq library.

%prep
%setup -q -n %{name}-%{version}

%build

%install
tclsh build.tcl install %{buildroot}%{tcl_archdir} -dynamic

%files
%defattr(-,root,root)
%doc README COPYING.LESSER
%{tcl_archdir}/zmq%{version}

