# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the ISC License

EAPI=7

PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

DESCRIPTION="Notification system that provides a Rofi front-end "
HOMEPAGE="https://github.com/regolith-linux/regolith-rofication"
SRC_URI="https://launchpad.net/~regolith-linux/+archive/ubuntu/release/+sourcefiles/regolith-rofication/1.3.3-1/regolith-rofication_1.3.3.orig.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="0"
RDEPEND="${DEPEND}
	$(python_gen_cond_dep 'dev-python/pygobject[${PYTHON_USEDEP}]')
	$(python_gen_cond_dep 'dev-python/dbus-python[${PYTHON_USEDEP}]')
	x11-misc/xrescat
"

src_unpack() {
	default
	mv "${WORKDIR}/regolith-rofication" "${WORKDIR}/${P}"
}
