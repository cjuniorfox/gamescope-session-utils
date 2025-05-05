Name:           gamescope-session-utils
Version:        1.0
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
* Fri May 03 2025 Your Name <cjuniorfox@gmail.com> - 1.0-1
- Initial package

