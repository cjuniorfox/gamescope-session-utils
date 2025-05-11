PREFIX ?= /usr
DESTDIR ?=

BIN_DIR := $(DESTDIR)$(PREFIX)/bin
POLKIT_HELPERS_DIR := $(BIN_DIR)/steamos-polkit-helpers
SHARE_DIR := $(DESTDIR)$(PREFIX)/share/gamescope-session
DESKTOP_DIR := $(DESTDIR)$(PREFIX)/share/applications
WAYLAND_SESSION_DIR := $(DESTDIR)$(PREFIX)/share/wayland-sessions
ICON_DIR := $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/actions
SYSTEMD_USER_DIR := $(DESTDIR)$(PREFIX)/lib/systemd/user

all:
	@echo "Run 'make install' or 'make uninstall'."

install:
	@echo "📦 Installing to $(DESTDIR)$(PREFIX)..."

	# Binaries
	install -Dm755 usr/bin/jupiter-biosupdate $(BIN_DIR)/jupiter-biosupdate
	install -Dm755 usr/bin/steamos-select-branch $(BIN_DIR)/steamos-select-branch
	install -Dm755 usr/bin/steamos-session-select $(BIN_DIR)/steamos-session-select
	install -Dm755 usr/bin/steamos-update $(BIN_DIR)/steamos-update

	# steamos-polkit-helpers
	install -Dm755 usr/bin/steamos-polkit-helpers/steamos-set-timezone $(POLKIT_HELPERS_DIR)/steamos-set-timezone
	install -Dm755 usr/bin/steamos-polkit-helpers/steamos-update $(POLKIT_HELPERS_DIR)/steamos-update

	# Gamescope session scripts
	install -Dm755 usr/share/gamescope-session/gamescope-session $(SHARE_DIR)/gamescope-session
	install -Dm755 usr/share/gamescope-session/restart-to-gamemode $(SHARE_DIR)/restart-to-gamemode
	install -Dm755 usr/share/gamescope-session/start-session $(SHARE_DIR)/start-session
	install -Dm755 usr/share/gamescope-session/steam-session-autologin $(SHARE_DIR)/steam-session-autologin

	# Desktop entry
	install -Dm644 usr/share/applications/start-steam-session.desktop $(DESKTOP_DIR)/start-steam-session.desktop

	# Wayland session file
	install -Dm644 usr/share/wayland-sessions/steam-gamescope.desktop $(WAYLAND_SESSION_DIR)/steam-gamescope.desktop

	# Icon
	install -Dm644 usr/share/icons/hicolor/scalable/actions/steamdeck-gaming-return.svg $(ICON_DIR)/steamdeck-gaming-return.svg

	# Systemd user service
	install -Dm644 usr/lib/systemd/user/gamescope-session.service $(SYSTEMD_USER_DIR)/gamescope-session.service

	@echo "✅ Installed successfully."
	@echo ""
	@echo "➡️  To allow running steam-session-autologin without password:"
	@echo "   sudo visudo -f /etc/sudoers.d/steamos-session"
	@echo ""
	@echo "   <your-username> ALL=(ALL) NOPASSWD: $(PREFIX)/share/gamescope-session/steam-session-autologin start"

uninstall:
	@echo "🧹 Uninstalling from $(DESTDIR)$(PREFIX)..."

	# Binaries
	rm -f $(BIN_DIR)/jupiter-biosupdate
	rm -f $(BIN_DIR)/steamos-select-branch
	rm -f $(BIN_DIR)/steamos-session-select
	rm -f $(BIN_DIR)/steamos-update

	# steamos-polkit-helpers
	rm -f $(POLKIT_HELPERS_DIR)/steamos-set-timezone
	rm -f $(POLKIT_HELPERS_DIR)/steamos-update
	rmdir --ignore-fail-on-non-empty $(POLKIT_HELPERS_DIR) 2>/dev/null || true

	# Gamescope session scripts
	rm -f $(SHARE_DIR)/gamescope-session
	rm -f $(SHARE_DIR)/restart-to-gamemode
	rm -f $(SHARE_DIR)/start-session
	rm -f $(SHARE_DIR)/steam-session-autologin

	# Desktop entry
	rm -f $(DESKTOP_DIR)/start-steam-session.desktop

	# Wayland session
	rm -f $(WAYLAND_SESSION_DIR)/steam-gamescope.desktop

	# Icon
	rm -f $(ICON_DIR)/steamdeck-gaming-return.svg

	# Systemd user service
	rm -f $(SYSTEMD_USER_DIR)/gamescope-session.service

	@echo "🗑️  Uninstalled successfully."

