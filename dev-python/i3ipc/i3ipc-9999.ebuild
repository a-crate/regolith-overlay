# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the ISC License

EAPI=7

PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

DESCRIPTION="An improved Python library to control i3wm and sway."
HOMEPAGE="https://github.com/altdesktop/i3ipc-python/"
LICENSE="BSD"
SLOT="0"
if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/altdesktop/i3ipc-python.git"
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi
RDEPEND="${DEPEND}
	$(python_gen_cond_dep 'dev-python/python-xlib[${PYTHON_USEDEP}]')
"
