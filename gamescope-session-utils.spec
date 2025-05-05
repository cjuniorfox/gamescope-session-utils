Name:           gamescope-session-utils
Version:        1.2
Release:        1%{?dist}
Summary:        Steam/Gamescope session switch utilities

License:        MIT
URL:            https://juniorfox.net
Source0:        %{name}-%{version}.tar.gz

BuildArch:      noarch

%description
A set of utilities to manage switching between Steam session and desktop session.

%prep
%setup -q

%build

%install
make DESTDIR=%{buildroot} install

%files
%license LICENSE
%doc README.md
/usr/bin/steamos-session-select
/usr/share/gamescope-session/*
/usr/share/wayland-sessions/steam-gamescope.desktop
/usr/share/applications/start-steam-session.desktop
/usr/share/icons/hicolor/scalable/actions/steamdeck-gaming-return.svg

%changelog
* Sun May 04 2025 Junior <cjuniorfox@gmail.com> 1.2-1
- 

* Sun May 04 2025 Junior <cjuniorfox@gmail.com> 1.1-1
- Added README and LICENSE (cjuniorfox@gmail.com)
- fixed icons path (cjuniorfox@gmail.com)

* Sun May 04 2025 Junior <cjuniorfox@gmail.com> 1.0-1
- new package built with tito
