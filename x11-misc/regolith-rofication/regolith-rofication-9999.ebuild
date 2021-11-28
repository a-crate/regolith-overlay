# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the ISC License

EAPI=7

PYTHON_COMPAT=( python3_{9..10} )

inherit git-r3 distutils-r1

DESCRIPTION="Notification system that provides a Rofi front-end "
HOMEPAGE="https://github.com/regolith-linux/regolith-rofication"
EGIT_REPO_URI="https://github.com/regolith-linux/regolith-rofication.git"
LICENSE="MIT"

SLOT="0"
RDEPEND="${DEPEND}
	$(python_gen_cond_dep 'dev-python/pygobject[${PYTHON_USEDEP}]')
	$(python_gen_cond_dep 'dev-python/dbus-python[${PYTHON_USEDEP}]')
	x11-misc/xrescat
"
