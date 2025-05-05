Name:           gamescope-session
Version:        1.0
Release:        1%{?dist}
Summary:        Custom Steam Gamescope session switcher

License:        MIT
URL:            https://yourprojecturl.example
Source0:        %{name}-%{version}.tar.gz

Requires:       steam
Requires:       sudo

BuildArch:      noarch
BuildRequires:  make

%description
Custom Steam session management tools for switching between Steam gaming and regular desktop sessions using SDDM autologin.

%prep
%autosetup

%install
mkdir -p %{buildroot}/usr/bin
install -Dm755 usr/bin/steamos-session-select %{buildroot}/usr/bin/steamos-session-select

mkdir -p %{buildroot}/usr/share/gamescope-session
install -Dm755 usr/share/gamescope-session/gamescope-session %{buildroot}/usr/share/gamescope-session/gamescope-session
install -Dm755 usr/share/gamescope-session/restart-to-gamemode %{buildroot}/usr/share/gamescope-session/restart-to-gamemode
install -Dm755 usr/share/gamescope-session/steam-session-autologin %{buildroot}/usr/share/gamescope-session/steam-session-autologin

mkdir -p %{buildroot}/usr/share/applications
install -Dm644 usr/share/applications/start-steam-session.desktop %{buildroot}/usr/share/applications/start-steam-session.desktop

mkdir -p %{buildroot}/usr/share/wayland-sessions
install -Dm644 usr/share/wayland-sessions/steam-gamescope.desktop %{buildroot}/usr/share/wayland-sessions/steam-gamescope.desktop

mkdir -p %{buildroot}/usr/share/icons/hicolor/scalable/actions
install -Dm644 usr/share/icons/hicolor/scalable/actions/steamdeck-gaming-return.svg %{buildroot}/usr/share/icons/hicolor/scalable/actions/steamdeck-gaming-return.svg

%files
%license LICENSE
%doc README.md

/usr/bin/steamos-session-select
/usr/share/gamescope-session/*
/usr/share/applications/start-steam-session.desktop
/usr/share/wayland-sessions/steam-gamescope.desktop
/usr/share/icons/hicolor/scalable/actions/steamdeck-gaming-return.svg

%changelog
* Sat May 04 2025 Junior Fox <cjuniorfox@gmail.com> - 1.0-1
- Initial build

