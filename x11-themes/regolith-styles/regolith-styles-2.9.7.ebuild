# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7


DESCRIPTION="A convention for organizing Xresource-based theme data."
HOMEPAGE="https://github.com/regolith-linux/regolith-styles"
SLOT="0"
LICENSE="GPL-3"
if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/regolith-linux/${PN}.git"
else
	SRC_URI="https://launchpad.net/~regolith-linux/+archive/ubuntu/release/+sourcefiles/${PN}/${PV}-1/${PN}_${PV}.orig.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	src_unpack() {
		default
		mv "${WORKDIR}/${PN}" "${WORKDIR}/${P}"
	}
fi
IUSE="+ayu +ayu-dark +ayu-mirage +cahuella +dracula +gruvbox +lascaille +midnight +nord +pop-os +solarized-dark +solarized-light +ubuntu"

RDEPEND="
	app-shells/bash
	dev-libs/glib
	x11-apps/xrdb
	x11-misc/xrescat
	x11-misc/regolith-ftue
	|| ( x11-wm/i3 x11-wm/i3-gaps )

	ayu? (
		x11-themes/ayu-gtk-theme[ayu]
		media-fonts/fontawesome
		media-fonts/source-code-pro
		x11-themes/arc-icon-theme
	)
	ayu-dark? (
		x11-themes/ayu-gtk-theme[ayu-dark]
		media-fonts/fontawesome
		media-fonts/source-code-pro
		x11-themes/arc-icon-theme
	)
	ayu-mirage? (
		x11-themes/ayu-gtk-theme[ayu-mirage-dark]
		media-fonts/fontawesome
		media-fonts/source-code-pro
		x11-themes/arc-icon-theme
	)
	cahuella? (
		x11-themes/cahuella-gtk-theme
		media-fonts/material-design-icons
		media-fonts/source-code-pro
		x11-themes/arc-icon-theme
	)
	dracula? (
		x11-themes/dracula-gtk-theme
		x11-themes/moka-icon-theme
		media-fonts/material-design-icons
		media-fonts/jetbrains-mono
	)
	gruvbox? (
		x11-themes/gruvbox-gtk-theme
		x11-themes/moka-icon-theme
		media-fonts/material-design-icons
		media-fonts/jetbrains-mono
	)
	lascaille? (
		x11-themes/ayu-gtk-theme[ayu-mirage-dark]
		x11-themes/moka-icon-theme
		media-fonts/material-design-icons
		media-fonts/jetbrains-mono
	)
	midnight? (
		x11-themes/midnight-gtk-theme
		x11-themes/qogir-icon-theme
		media-fonts/iosevka
	)
	nord? (
		x11-themes/nordic-gtk-theme
		x11-themes/arc-icon-theme
		media-fonts/fontawesome
		media-fonts/source-code-pro
	)
	pop-os? (
		x11-themes/pop-gtk-theme
		x11-themes/pop-icon-theme
		media-fonts/fontawesome
		media-fonts/pop-fonts
	)
	solarized-light? (
		x11-themes/solarc-gtk-theme
		x11-themes/arc-icon-theme
		media-fonts/fontawesome
		media-fonts/source-code-pro
	)
	solarized-dark? (
		x11-themes/solarc-gtk-theme
		x11-themes/arc-icon-theme
		media-fonts/fontawesome
		media-fonts/source-code-pro
	)
	ubuntu? (
		x11-themes/adwaita-icon-theme
		media-fonts/fontawesome
		media-fonts/ubuntu-font-family
		x11-themes/ubuntu-wallpapers
	)
"

src_install() {
	dobin regolith-look
	insinto /etc/regolith/styles
	doins Xresources/st-term Xresources/i3-wm Xresources/i3xrocks Xresources/rofi Xresources/gnome Xresources/root

	if use ayu; then
		insinto /etc/regolith/styles/ayu
		doins ayu/color ayu/typeface ayu/theme ayu/root ayu/rofi.rasi
	fi
	if use ayu-dark; then
		insinto /etc/regolith/styles/ayu-dark
		doins ayu-dark/color ayu-dark/typeface ayu-dark/theme ayu-dark/root ayu-dark/rofi.rasi
	fi
	if use ayu-mirage; then
		insinto /etc/regolith/styles/ayu-mirage
		doins ayu-mirage/color ayu-mirage/typeface ayu-mirage/theme ayu-mirage/root ayu-mirage/rofi.rasi
	fi
	if use cahuella; then
    		insinto /etc/regolith/styles/cahuella
    		doins cahuella/color cahuella/typeface cahuella/theme cahuella/root cahuella/rofi.rasi
    		insinto /usr/share/backgrounds
		doins cahuella/regolith-structure-7.png cahuella/nord-dark.png
		insinto /usr/share/gnome-background-properties
		doins cahuella/regolith-cahuella.xml
	fi
	if use dracula; then
    		insinto /etc/regolith/styles/dracula
    		doins dracula/color dracula/typeface dracula/theme dracula/root dracula/rofi.rasi dracula/i3-wm dracula/st-term
	fi
	if use gruvbox; then
		insinto /etc/regolith/styles/gruvbox
		doins gruvbox/color gruvbox/typeface gruvbox/theme gruvbox/root gruvbox/rofi.rasi gruvbox/i3-wm gruvbox/st-term
	fi
	if use lascaille; then
    		insinto /etc/regolith/styles/lascaille
    		doins lascaille/color lascaille/typeface lascaille/theme lascaille/root lascaille/rofi.rasi lascaille/i3-wm
    		insinto /usr/share/backgrounds
    		doins lascaille/joel-filipe-unsplash.jpg lascaille/ESP_016895_1525_desktop.jpg
    		insinto /usr/share/gnome-background-properties
    		doins lascaille/lascaille.xml
	fi
	if use midnight; then
		insinto /etc/regolith/styles/midnight
		doins midnight/color midnight/typeface midnight/theme midnight/root midnight/rofi.rasi midnight/i3-wm
		insinto /usr/share/backgrounds
		doins midnight/regolith-matt-mcnulty-nyc-2nd-ave.jpg
	fi
	if use nord; then
    		insinto /etc/regolith/styles/nord
    		doins nord/color nord/typeface nord/theme nord/root nord/rofi.rasi
    		insinto /usr/share/backgrounds
    		doins nord/luca-bravo-xnqVGsbXgV4-unsplash.jpg
    		insinto /usr/share/gnome-background-properties
    		doins nord/regolith-nord.xml
	fi
	if use pop-os; then
    		insinto /etc/regolith/styles/pop-os
    		doins pop-os/color pop-os/typeface pop-os/theme pop-os/root pop-os/rofi.rasi
    		insinto /usr/share/backgrounds
    		doins pop-os/regolith-kate-hazen-unleash-your-robot-blue.png
    		insinto /usr/share/gnome-background-properties
    		doins pop-os/pop-os.xml
	fi
	if use solarized-light; then
    		insinto /etc/regolith/styles/solarized-light
    		doins solarized-light/color solarized-light/typeface solarized-light/theme solarized-light/root solarized-light/rofi.rasi
    		insinto /usr/share/backgrounds
    		doins solarized-light/themer-wallpaper-burst-light-2880x1800.png
    		insinto /usr/share/gnome-background-properties
    		doins solarized-light/solarized-light.xml
	fi
	if use solarized-dark; then
    		insinto /etc/regolith/styles/solarized-dark
    		doins solarized-dark/color solarized-dark/typeface solarized-dark/theme solarized-dark/root solarized-dark/rofi.rasi
    		insinto /usr/share/backgrounds
    		doins solarized-dark/ESP_020528_1750_desktop.jpg
    		insinto /usr/share/gnome-background-properties
    		doins solarized-dark/solarized-dark.xml
	fi
	if use ubuntu; then
    		insinto /etc/regolith/styles/ubuntu
    		doins ubuntu/color ubuntu/typeface ubuntu/theme ubuntu/root ubuntu/rofi.rasi
	fi
}
