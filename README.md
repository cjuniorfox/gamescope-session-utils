# gamescope-session

This project provides a custom session manager and helper tools to integrate Steam Gaming Mode (via Gamescope) with your desktop environment.

## Features

- Launch a dedicated Gamescope-based Steam session from your desktop.
- Automatically configure `sddm` for autologin into the Steam session.
- Compatible with both `sway` and `Hyprland` compositors.
- Desktop entry to trigger session switch with one click.

## Included

- `restart-to-gamemode`: Script to initiate the Gamescope session.
- `steam-session-autologin`: Writes or removes SDDM configuration for autologin.
- `gamescope-session`: Helper script called by the session definition.
- Desktop entry: `Start Steam Session` (via `.desktop` file).
- Session file: `steam-gamescope.desktop`.
- Custom icon for launcher.

## Usage

To switch into the Steam Gaming session:

```bash
Start Steam Session
````

This will:

* Set autologin to the `steam-gamescope` session.
* Exit the current Wayland compositor (Sway/Hyprland).

To revert:

```bash
sudo /usr/share/gamescope-session/steam-session-autologin stop
```

## Installation

To install system-wide:

```bash
sudo dnf install gamescope-session
```

(Or manually run `install.sh install`.)

## Notes

* Requires `sudo` privileges to write into `/etc/sddm.conf.d/`.
* Be sure to grant NOPASSWD access to the `steam-session-autologin` script:

```bash
sudo visudo -f /etc/sudoers.d/steamos-session
```

Add the line:

```bash
your-username ALL=(ALL) NOPASSWD: /usr/share/gamescope-session/steam-session-autologin start
```

## License

MIT License – see [`LICENSE`](LICENSE) for details.

