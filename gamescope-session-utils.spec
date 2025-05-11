Name:           gamescope-session-utils
Version:        1.3
Release:        1%{?dist}
Summary:        Custom Steam Gamescope session switcher

License:        MIT
URL:            https://github.com/cjuniorfox/gamescope-session-utils
Source0:        %{name}-%{version}.tar.gz

Requires:       lsb_release
Requires:       gamescope
Requires:       steam
Requires:       sudo

BuildArch:      noarch
BuildRequires:  make

%description
Custom Steam session management tools for switching between Steam gaming and regular desktop sessions using SDDM autologin.

%{!?_userunitdir:%global _userunitdir %{_prefix}/lib/systemd/user}

%prep
%autosetup

%build
# No build steps required

%install
%make_install

%files
%license LICENSE
%doc README.md

%{_bindir}/jupiter-biosupdate
%{_bindir}/steamos-select-branch
%{_bindir}/steamos-session-select
%{_bindir}/steamos-update
%{_bindir}/steamos-polkit-helpers/steamos-set-timezone
%{_bindir}/steamos-polkit-helpers/steamos-update

%{_datadir}/gamescope-session/gamescope-session
%{_datadir}/gamescope-session/restart-to-gamemode
%{_datadir}/gamescope-session/steam-session-autologin
%{_datadir}/gamescope-session/start-session

%{_datadir}/applications/start-steam-session.desktop
%{_datadir}/wayland-sessions/steam-gamescope.desktop
%{_datadir}/icons/hicolor/scalable/actions/steamdeck-gaming-return.svg

%{_userunitdir}/gamescope-session.service

%changelog
* Sun May 11 2025 Junior Fox <cjuniorfox@gmail.com> 1.3-1
- Switched to Makefile-based install
- Replaced hardcoded /usr/share with macros
- Improved maintainability

