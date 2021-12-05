# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

DESCRIPTION="🧛🏻‍♂️ Dark theme for GTK "
HOMEPAGE="https://github.com/dracula/gtk"
SLOT="0"
LICENSE="GPL-3"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dracula/gtk.git"
else
	SRC_URI="https://github.com/dracula/gtk/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/gtk-2.0"
fi

src_install() {
	default
	insinto /usr/share/themes/Ant-Dracula
	doins -r *
}
