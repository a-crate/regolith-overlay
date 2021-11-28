# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

inherit git-r3 vala meson

DESCRIPTION="A keybinding viewer for i3 and other programs. "
HOMEPAGE="https://github.com/regolith-linux/remontoire"

EGIT_REPO_URI="https://github.com/regolith-linux/remontoire.git"
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

src_prepare() {
	default
	vala_src_prepare
}
