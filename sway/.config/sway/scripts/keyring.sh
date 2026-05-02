#!/bin/bash
# Start gnome-keyring and export variables to systemd/dbus
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
systemctl --user import-environment SSH_AUTH_SOCK GNOME_KEYRING_CONTROL
dbus-update-activation-environment --systemd SSH_AUTH_SOCK GNOME_KEYRING_CONTROL
