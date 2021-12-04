# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

DESCRIPTION="A flat theme with transparent elements"
HOMEPAGE="https://github.com/regolith-linux/ayu-theme"
SLOT="0"
LICENSE="GPL-3"
IUSE="+ayu ayu-dark ayu-darker ayu-mirage ayu-mirage-dark ayu-mirage-darker"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/regolith-linux/ayu-theme.git"
else
	SRC_URI="https://launchpad.net/~regolith-linux/+archive/ubuntu/release/+sourcefiles/ayu-theme/${PV}-1/ayu-theme_${PV}.orig.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	src_unpack() {
		default
		mv "${WORKDIR}/ayu-theme" "${WORKDIR}/${P}"
	}
fi

src_install() {
	insinto /usr/share/themes
	if use ayu; then
		doins -r usr/share/themes/Ayu
	fi
	if use ayu-dark; then
		doins -r usr/share/themes/Ayu-Dark
	fi
	if use ayu-darker; then
		doins -r usr/share/themes/Ayu-Darker
	fi
	if use ayu-mirage; then
		doins -r usr/share/themes/Ayu-Mirage
	fi
	if use ayu-mirage-dark; then
		doins -r usr/share/themes/Ayu-Mirage-Dark
	fi
	if use ayu-mirage-darker; then
		doins -r usr/share/themes/Ayu-Mirage-Darker
	fi
}
