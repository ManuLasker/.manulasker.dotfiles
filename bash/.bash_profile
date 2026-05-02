# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
. "$HOME/.cargo/env"

# ============================================================
# Wayland Session Variables
# ============================================================

export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64

# export MOZ_ENABLE_WAYLAND=1
# export NIXOS_OZONE_WL=1
# export QT_QPA_PLATFORM=wayland
# export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
# export ELECTRON_OZONE_PLATFORM_HINT=wayland
# export GDK_BACKEND=wayland
# export SDL_VIDEODRIVER=wayland

# ── GNOME Keyring (para Chrome, VSCode, etc.) ──
# eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
# export SSH_AUTH_SOCK
# export GNOME_KEYRING_CONTROL

# 3. Auto-iniciar Sway al entrar al TTY3
if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty2" ]; then
	exec sway
fi


