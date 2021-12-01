# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

inherit cmake
DESCRIPTION="Record and restore window and workspace containment structure in i3-wm."
HOMEPAGE="https://github.com/regolith-linux/i3-snapshot"
SLOT="0"
LICENSE="GPL-3"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/regolith-linux/${PN}.git"
	EGIT_SUBMODULES=('*')
else
	SRC_URI="https://launchpad.net/~regolith-linux/+archive/ubuntu/release/+sourcefiles/${PN}/${PV}-2hirsute/${PN}_${PV}.orig.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	src_unpack() {
		default
		mv "${WORKDIR}/${PN}" "${WORKDIR}/${P}"
	}
fi
BDEPEND="
	dev-libs/jsoncpp
	dev-libs/libsigc++:2
"
DEPEND="
	|| (
		x11-wm/i3
		x11-wm/i3-gaps
	)
"
