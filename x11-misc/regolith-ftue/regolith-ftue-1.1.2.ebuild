# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

DESCRIPTION="Logic and assets for Regolith first-time user experience. "
HOMEPAGE="https://github.com/regolith-linux/regolith-ftue"
LICENSE="MIT"
SLOT="0"
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
	app-shells/bash
	sys-apps/util-linux
	gnome-base/dconf
	sys-apps/coreutils
	dev-libs/glib
	x11-terms/gnome-terminal
	x11-misc/rofi
	x11-misc/remontoire
"

src_install() {
	dobin regolith-ftue remontoire-toggle create-regolith-term-profile
}
