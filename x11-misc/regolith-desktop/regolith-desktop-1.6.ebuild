# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

DESCRIPTION="Virtual package for the regolith desktop environment."
SLOT="0"
KEYWORDS="~amd64"
IUSE="+picom compton xcompmgr no-compositor lightdm"
REQUIRED_USE="^^ ( picom compton xcompmgr no-compositor )"

RDEPEND="
	x11-wm/i3-gaps
	x11-misc/regolith-i3-gaps-config
	picom? ( x11-misc/regolith-compositor-picom-glx )
	compton? ( x11-misc/regolith-compositor-compton-glx )
	xcompmgr? ( x11-misc/regolith-compositor-xcompmgr )
	no-compositor? ( x11-misc/regolith-compositor-none )
	x11-misc/i3xrocks
	x11-misc/regolith-i3xrocks-config
	x11-misc/regolith-gnome-flashback
	x11-misc/xrescat
	x11-misc/i3-snapshot
	x11-misc/regolith-rofication
	x11-misc/regolith-rofi-config
	x11-misc/remontoire
	x11-themes/regolith-styles
	lightdm? ( x11-misc/regolith-lightdm-config )
"
