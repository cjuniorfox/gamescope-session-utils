#!/usr/bin/env bash

set -euo pipefail

INSTALL_ROOT="/usr"

install_files() {
  echo "Installing files..."

  install -Dm755 "usr/share/gamescope-session/gamescope-session" "$INSTALL_ROOT/share/gamescope-session/gamescope-session"
  install -Dm755 "usr/share/gamescope-session/steam-session-autologin" "$INSTALL_ROOT/share/gamescope-session/steam-session-autologin"
  install -Dm755 "usr/share/gamescope-session/restart-to-gamemode" "$INSTALL_ROOT/share/gamescope-session/restart-to-gamemode"
  install -Dm755 "usr/bin/steamos-session-select" "$INSTALL_ROOT/bin/steamos-session-select"

  install -Dm644 "usr/share/wayland-sessions/steam-gamescope.desktop" "$INSTALL_ROOT/share/wayland-sessions/steam-gamescope.desktop"
  install -Dm644 "usr/share/applications/start-steam-session.desktop" "$INSTALL_ROOT/share/applications/start-steam-session.desktop"
  install -Dm644 "usr/share/icons/hicolor/scalable/actions/steamdeck-gaming-return.svg" "$INSTALL_ROOT/share/icons/hicolor/scalable/actions/steamdeck-gaming-return.svg"

  echo -e "\n✅ Installation complete.\n"
  echo "➡️  Add a sudoers rule to run without password:"
  echo "   sudo visudo -f /etc/sudoers.d/steamos-session"
  echo ""
  echo "   $(whoami) ALL=(ALL) NOPASSWD: /usr/share/gamescope-session/steam-session-autologin start"
}

uninstall_files() {
  echo "Uninstalling..."

  rm -f "$INSTALL_ROOT/share/gamescope-session/gamescope-session"
  rm -f "$INSTALL_ROOT/share/gamescope-session/steam-session-autologin"
  rm -f "$INSTALL_ROOT/share/gamescope-session/restart-to-gamemode"
  rm -f "$INSTALL_ROOT/bin/steamos-session-select"
  rm -f "$INSTALL_ROOT/share/wayland-sessions/steam-gamescope.desktop"
  rm -f "$INSTALL_ROOT/share/applications/start-steam-session.desktop"
  rm -f "$INSTALL_ROOT/share/icons/hicolor/scalable/actions/steamdeck-gaming-return.svg"

  echo -e "\n🗑️  Uninstallation complete."
}

case "${1:-}" in
  install)
    install_files
    ;;
  uninstall)
    uninstall_files
    ;;
  *)
    echo "Usage: $0 {install|uninstall}"
    exit 1
    ;;
esac

