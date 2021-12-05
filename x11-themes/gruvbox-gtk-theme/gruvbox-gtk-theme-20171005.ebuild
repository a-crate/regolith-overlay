# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

DESCRIPTION="Gruvbox theme for gtk - created with oomox"
HOMEPAGE="https://github.com/3ximus/gruvbox-gtk"
SLOT="0"
LICENSE="GPL-3"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/3ximus/gruvbox-gtk.git"
elif [[ ${PV} == 20171005 ]]; then
	__COMMIT="fda45c127bd5ed3cdd2dfcc6c396e7aef99abd8e"
	SRC_URI="https://github.com/3ximus/gruvbox-gtk/archive/${__COMMIT}.zip -> ${P}.zip"
	KEYWORDS="~amd64"
	S="${WORKDIR}/gruvbox-gtk-${__COMMIT}"
fi

BDEPEND="
	dev-lang/sassc
	app-arch/unzip
	sys-apps/sed
"

src_compile() {
	emake -j1
}

src_install() {
	mv ${S}/gtk-3.20/dist/* ${S}/gtk-3.20
	mv ${S}/gtk-3.0/dist/* ${S}/gtk-3.0
	insinto /usr/share/themes/gruvbox
	doins -r *
}
