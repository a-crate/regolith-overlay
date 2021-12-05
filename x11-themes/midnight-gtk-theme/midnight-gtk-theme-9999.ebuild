# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

DESCRIPTION="Midnight gtk theme for regolith"
HOMEPAGE="https://github.com/naib864/regolith-midnight-gtk"
SLOT="0"
LICENSE="GPL-3"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/naib864/regolith-midnight-gtk.git"
elif [[ ${PV} == 1.1 ]]; then
	__COMMIT="876ebadf53ac159fe8e5be91115bbaabf2c7441a"
	SRC_URI="https://github.com/naib864/regolith-midnight-gtk/archive/${__COMMIT}.zip -> ${P}.zip"
	KEYWORDS="~amd64"
	S="${WORKDIR}/regolith-midnight-gtk-${__COMMIT}"
fi

BDEPEND="
	app-arch/unzip
"

src_install() {
	insinto /usr/share/themes
	doins -r usr/share/themes/Midnight-GrayNight
}
