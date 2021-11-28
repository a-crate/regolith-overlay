# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

inherit vala meson

DESCRIPTION="A keybinding viewer for i3 and other programs. "
HOMEPAGE="https://github.com/regolith-linux/remontoire"
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
BDEPEND="${BDEPEND}
	sys-devel/gettext
	dev-lang/vala
"
DEPEND="${DEPEND}
	dev-libs/libgee[introspection]
	dev-libs/jsonrpc-glib
"
RDEPEND="
	dev-libs/glib
	x11-libs/gtk+:3
"

src_prepare() {
	default
	vala_src_prepare
}
