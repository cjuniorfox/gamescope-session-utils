PREFIX ?= /usr
DESTDIR ?=

all:
	@echo "Run 'make install' or 'make uninstall'."

install:
	@echo "Installing to $(DESTDIR)$(PREFIX)..."
	install -Dm755 usr/bin/steamos-session-select $(DESTDIR)$(PREFIX)/bin/steamos-session-select
	install -Dm755 usr/share/gamescope-session/gamescope-session $(DESTDIR)$(PREFIX)/share/gamescope-session/gamescope-session
	install -Dm755 usr/share/gamescope-session/restart-to-gamemode $(DESTDIR)$(PREFIX)/share/gamescope-session/restart-to-gamemode
	install -Dm755 usr/share/gamescope-session/start-session $(DESTDIR)$(PREFIX)/share/gamescope-session/start-session
	install -Dm755 usr/share/gamescope-session/steam-session-autologin $(DESTDIR)$(PREFIX)/share/gamescope-session/steam-session-autologin
	install -Dm644 usr/share/wayland-sessions/steam-gamescope.desktop $(DESTDIR)$(PREFIX)/share/wayland-sessions/steam-gamescope.desktop
	install -Dm644 usr/share/applications/start-steam-session.desktop $(DESTDIR)$(PREFIX)/share/applications/start-steam-session.desktop
	install -Dm644 usr/share/icons/hicolor/scalable/actions/steamdeck-gaming-return.svg $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/actions/steamdeck-gaming-return.svg
	install -Dm644 usr/lib/systemd/user/steam-session.service $(DESTDIR)$(PREFIX)/lib/systemd/user/steam-session.service
	@echo "✅ Installed successfully."
	@echo ""
	@echo "➡️  To allow running steam-session-autologin without password:"
	@echo "   sudo visudo -f /etc/sudoers.d/steamos-session"
	@echo ""
	@echo "   <your-username> ALL=(ALL) NOPASSWD: $(PREFIX)/share/gamescope-session/steam-session-autologin start"

uninstall:
	@echo "Uninstalling from $(DESTDIR)$(PREFIX)..."
	rm -f $(DESTDIR)$(PREFIX)/bin/steamos-session-select
	rm -f $(DESTDIR)$(PREFIX)/share/gamescope-session/gamescope-session
	rm -f $(DESTDIR)$(PREFIX)/share/gamescope-session/restart-to-gamemode
	rm -f $(DESTDIR)$(PREFIX)/share/gamescope-session/steam-session-autologin
	rm -f $(DESTDIR)$(PREFIX)/share/gamescope-session/start-session
	rm -f $(DESTDIR)$(PREFIX)/share/wayland-sessions/steam-gamescope.desktop
	rm -f $(DESTDIR)$(PREFIX)/share/applications/start-steam-session.desktop
	rm -f $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/actions/steamdeck-gaming-return.svg
	rm -f $(DESTDIR)$(PREFIX)/lib/systemd/user/steam-session.service
	@echo "🗑️  Uninstalled."

