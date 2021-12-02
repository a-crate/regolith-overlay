# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

DESCRIPTION="Regolith branding and configuration for LightDM display manager."
HOMEPAGE="https://github.com/regolith-linux/regolith-lightdm-config"
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

RDEPEND="
	x11-wm/lightdm
	x11-misc/lightdm-gtk-greeter
	x11-themes/adwaita-icon-theme
	x11-themes/ayu-gtk-theme
	media-fonts/jetbrains-mono
"

src_install() {
	insinto /usr/share/lightdm/lightdm-gtk-greeter.conf.d/
	doins 02_regolith.conf
	insinto /usr/share/backgrounds/
	doins dennis-schweizer-18nR85wWyLY-unsplash.jpg
}
