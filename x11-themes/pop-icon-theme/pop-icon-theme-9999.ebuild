# Copyright 1999-2020 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

inherit meson

DESCRIPTION="System76 Pop icon theme for Linux"
HOMEPAGE="https://github.com/pop-os/icon-theme"
LICENSE="CC-BY-SA-4"
SLOT="0"

if [[ ${PV} == 9999 ]];then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pop-os/icon-theme.git"
elif [[ ${PV} == 20211117 ]];then
	__COMMIT="9998b20b78f3ff65ecbf2253bb863d1e669abe74"
	SRC_URI="https://github.com/pop-os/icon-theme/archive/${__COMMIT}.zip -> ${P}.zip"
	KEYWORDS="~amd64"
	S="${WORKDIR}/icon-theme-${__COMMIT}"
fi

BDEPEND="
	dev-lang/python
	app-arch/unzip
"
