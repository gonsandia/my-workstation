#!/usr/bin/env bash

# Icons on the desktop <- Disabled
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false

# Favorite apps
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'slack_slack.desktop', 'thunderbird.desktop', 'google-chrome.desktop', 'org.gnome.Terminal.desktop', 'jetbrains-toolbox.desktop','code.desktop']"

# Date in the top bar <- Activated
gsettings set org.gnome.desktop.interface clock-show-weekday true

# Action when pressing in the central part of a window <- None
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'none'

# Night mode <- Activated
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

# Diodon keybinding
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'Diodon'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'<Primary><Shift>v'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'/usr/bin/diodon'"

