# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

inherit git-r3 vala meson

DESCRIPTION="A keybinding viewer for i3 and other programs. "
HOMEPAGE="https://github.com/regolith-linux/remontoire"

SRC_URI="https://launchpad.net/~regolith-linux/+archive/ubuntu/release/+sourcefiles/remontoire/1.4.1-1/remontoire_1.4.1.orig.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"

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

src_unpack() {
	default
	mv "${WORKDIR}/remontoire" "${WORKDIR}/${P}"
}

src_prepare() {
	default
	vala_src_prepare
}
