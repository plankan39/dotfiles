#!/usr/bin/env bash

# Install dependencies
sudo dnf install --assumeyes gnome-tweaks gnome-extensions-app
gnome-extensions disable background-logo@fedorahosted.org
gnome-extensions disable apps-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions disable \
	launch-new-instance@gnome-shell-extensions.gcampax.github.com
gnome-extensions disable places-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions disable window-list@gnome-shell-extensions.gcampax.github.com

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
