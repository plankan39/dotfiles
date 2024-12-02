#!/usr/bin/env sh

sudo dnf install --assumeyes gnome-shell-extension-pop-shell
gnome-extensions enable pop-shell@system76.com

gsettings set org.gnome.shell.extensions.pop-shell active-hint true
gsettings set org.gnome.shell.extensions.pop-shell active-hint-border-radius "uint32 12"
gsettings set org.gnome.shell.extensions.pop-shell gap-inner "uint32 5"
gsettings set org.gnome.shell.extensions.pop-shell gap-outer "uint32 2"
gsettings set org.gnome.shell.extensions.pop-shell pop-monitor-down "['<Shift><Control><Super>Down', '<Shift><Control><Super>J']"
gsettings set org.gnome.shell.extensions.pop-shell pop-monitor-up "['<Shift><Control><Super>Up', '<Shift><Control><Super>K']"
gsettings set org.gnome.shell.extensions.pop-shell pop-monitor-left "['<Shift><Control><Super>Left', '<Shift><Control><Super>H']"
gsettings set org.gnome.shell.extensions.pop-shell pop-monitor-right "['<Shift><Control><Super>Right', '<Shift><Control><Super>L']"
gsettings set org.gnome.shell.extensions.pop-shell pop-workspace-down "@as []"
gsettings set org.gnome.shell.extensions.pop-shell pop-workspace-up "@as []"
gsettings set org.gnome.shell.extensions.pop-shell toggle-stacking-global "['<Super><Control>S']"
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down "@as []"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left "@as []"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right "@as []"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up "@as []"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Super>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Super>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Super>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Super>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Shift><Super>Left', '<Shift><Super>H']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Shift><Super>Right', '<Shift><Super>L']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "@as []"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Alt><Super>Left', '<Alt><Super>H']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Alt><Super>Right', '<Alt><Super>L']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "@as []"
gsettings set org.gnome.shell.keybindings toggle-overview "@as []"

# GTK4DIR="${XDG_CONFIG_HOME:-"$HOME/.config"}/gtk-4.0"
# hexaccent=$(cat ${GTK4DIR}/gtk.css |
# 	grep accent_color |
#	cut -d \# -f 2 |
#	cut -d \; -f 1 |
#	tr '[:lower:]' '[:upper:]')

# a=$(echo $hexaccent | cut -c-2)
# b=$(echo $hexaccent | cut -c3-4)
# c=$(echo $hexaccent | cut -c5-6)

# r=$(echo "ibase=16; $a" | bc)
# g=$(echo "ibase=16; $b" | bc)
# b=$(echo "ibase=16; $c" | bc)

# gsettings set org.gnome.shell.extensions.pop-shell hint-color-rgba "rgba($r,$g,$b,0.7)"
gsettings set org.gnome.shell.extensions.pop-shell hint-color-rgba "rgb(47,129,227)"

