# Copyright 2021
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Moka is an icon project for the FreeDesktop"
HOMEPAGE="https://snwh.org/moka#faba-icon-theme"
LICENSE="CC-BY-SA-4"
SLOT="0"

if [[ ${PV} == *9999 ]];then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/snwh/faba-icon-theme.git"
else
	SRC_URI="https://github.com/snwh/faba-icon-theme/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi
