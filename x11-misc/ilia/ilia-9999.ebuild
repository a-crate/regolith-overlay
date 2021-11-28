# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License
# this ebuild does not work and will not be support until regolith 2.0 is released

EAPI=7

inherit vala meson

DESCRIPTION="Desktop executor"
HOMEPAGE="https://github.com/regolith-linux/ilia"
LICENSE="GPL-3"
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
DEPEND="${DEPEND}
	=app-misc/tracker-2*
"
RDEPEND="
	dev-libs/glib
	x11-libs/gtk+:3
	x11-misc/rofication
	x11-misc/remontoire
	dev-libs/json-glib
"

src_prepare() {
	default
	vala_src_prepare
}
