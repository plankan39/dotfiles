#!/usr/bin/env bash

# Install dependencies
if [[ -x gnome-extensions ]]; then
	gnome-extensions disable background-logo@fedorahosted.org
	gnome-extensions disable apps-menu@gnome-shell-extensions.gcampax.github.com
	gnome-extensions disable \
		launch-new-instance@gnome-shell-extensions.gcampax.github.com
	gnome-extensions disable places-menu@gnome-shell-extensions.gcampax.github.com
	gnome-extensions disable window-list@gnome-shell-extensions.gcampax.github.com
fi

gsettings set org.gnome.desktop.wm.preferences button-layout \
	'appmenu:minimize,maximize,close'
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface clock-format '24h'
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
gsettings set org.gnome.desktop.wm.preferences audible-bell false
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button "true"
gsettings set org.gnome.clocks world-clocks \
	"[
    {
      'location': <(
	      uint32 2, 
        <('New York', 'KNYC', true, 
          [(0.71180344078725644, -1.2909618758762367)],
		      [(0.71059804659265924, -1.2916478949920254)]
        )>
      )>
    },
    {
      'location': <(
        uint32 2,
        <('Tokyo', 'RJTI', true,
          [(0.62191898430954862, 2.4408429589140699)], 
          [(0.62282074357417661, 2.4391218722853854)]
        )>
      )>
    }
  ]"
gsettings set org.gnome.Weather locations \
	"[
    <(
	    uint32 2, 
	    <('Malmö', 'ESMS', true,
        [(0.96953039948285002, 0.23329234916767289)],
        [(0.97040306410884714, 0.22689280275926285)]
	    )>
    )>
  ]"

gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q', '<Alt>F4']"

gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down "['<Super><Shift><Control>Down', '<Super><Shift><Control>J']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left "['<Super><Shift><Control>Left', '<Super><Shift><Control>H']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right "['<Super><Shift><Control>Right', '<Super><Shift><Control>L']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up "['<Super><Shift><Control>Up', '<Super><Shift><Control>K']"

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Super><Shift>Down', '<Super><Shift>J']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Super><Shift>Page_Up', '<Super><Shift>Left', '<Super><Shift>H']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Super><Shift>Page_Down', '<Super><Shift>Right', '<Super><Shift>L']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Super><Shift>Up', '<Super><Shift>K']"


gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super><Control>Down','<Super><Control>J']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>Page_Up', '<Super><Alt>Left', '<Super><Control>Left', '<Super><Control>H']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>Page_Down', '<Super><Alt>Right', '<Super><Control>Right', '<Super><Control>L']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super><Control>Up','<Super><Control>K']"

for i in {1..9}
do
  gsettings set org.gnome.shell.keybindings "switch-to-application-$i" "@as []"
  gsettings set org.gnome.shell.keybindings "open-new-window-application-$i" "@as []"
  gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-$i" "['<Super>$i']"
  gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-$i" "['<Super><Shift>$i']"
done


gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Super>b']"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>f']"
