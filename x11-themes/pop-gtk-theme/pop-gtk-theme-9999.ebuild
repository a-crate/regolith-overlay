# Copyright 1999-2020 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

inherit meson

DESCRIPTION="System76 Pop GTK+ Theme, based in adapta-gtk-theme"
HOMEPAGE="https://github.com/pop-os/gtk-theme"
LICENSE="GPL-2"
SLOT="0"

if [[ ${PV} == 9999 ]];then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pop-os/gtk-theme.git"
else
	SRC_URI="https://github.com/pop-os/gtk-theme/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/gtk-theme-${PV}"
fi

DEPEND="
	>=x11-libs/gtk+-2.24.30:2
	>=x11-libs/gtk+-3.22:3
	>=x11-libs/gdk-pixbuf-2.24.30
	>=x11-themes/gtk-engines-murrine-0.98.1
	=dev-libs/glib-2*
	gnome-base/librsvg
	dev-libs/libxml2
"
BDEPEND="
	dev-lang/sassc
	media-gfx/inkscape
	media-gfx/optipng
"
