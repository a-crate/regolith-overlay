# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

DESCRIPTION="snowflake Dark Gtk3.20+ theme created using the awesome Nord color pallete."
HOMEPAGE="https://github.com/EliverLara/Nordic"
SLOT="0"
LICENSE="GPL-3"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/EliverLara/Nordic.git"
else
	SRC_URI="https://github.com/EliverLara/Nordic/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/Nordic-${PV}"
fi

src_install() {
	default
	insinto /usr/share/themes/Nordic
	doins -r *
}
