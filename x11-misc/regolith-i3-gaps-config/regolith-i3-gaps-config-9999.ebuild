# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

DESCRIPTION="Regolith configuration for i3-gaps in Regolith 1.x "
HOMEPAGE="https://github.com/regolith-linux/i3-gaps-config"
SLOT="0"
LICENSE="MIT"

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

RDEPEND="
	x11-wm/i3-gaps
	x11-misc/xdg-utils
	x11-misc/xdotool
	x11-terms/x-terminal-emulator
"

src_install() {
	insinto /etc/regolith/i3
	doins config
}
