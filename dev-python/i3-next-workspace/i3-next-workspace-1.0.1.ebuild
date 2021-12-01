# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the ISC License

EAPI=7

PYTHON_COMPAT=( python3_{9..10} )

inherit python-single-r1

DESCRIPTION="Navigate to the next unused workspace in i3"
HOMEPAGE="https://github.com/regolith-linux/i3-next-workspace"
SLOT="0"
LICENSE="GPL-3"

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

RDEPEND="${DEPEND}
	x11-apps/xrdb
	$(python_gen_cond_dep 'dev-python/i3ipc[${PYTHON_USEDEP}]')
	|| (
		x11-wm/i3
		x11-wm/i3-gaps
	)
"

src_install() {
	default
	dobin i3-next-workspace
}
