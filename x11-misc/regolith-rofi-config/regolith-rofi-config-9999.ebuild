# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

DESCRIPTION="Regolith configuration for the rofi launcher."
HOMEPAGE="https://github.com/regolith-linux/regolith-rofi-config"
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
	x11-misc/rofi
"

src_install() {
	insinto /usr/share/rofi/modi
	doins modi/finder.sh modi/look-selector.sh
}
