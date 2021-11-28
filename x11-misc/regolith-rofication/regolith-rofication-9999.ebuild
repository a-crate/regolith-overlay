# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the ISC License

EAPI=7

PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

DESCRIPTION="Notification system that provides a Rofi front-end "
HOMEPAGE="https://github.com/regolith-linux/regolith-rofication"
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

RDEPEND="${DEPEND}
	$(python_gen_cond_dep 'dev-python/pygobject[${PYTHON_USEDEP}]')
	$(python_gen_cond_dep 'dev-python/dbus-python[${PYTHON_USEDEP}]')
	x11-misc/xrescat
"
