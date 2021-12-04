# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

DESCRIPTION="Gnome Flashback configuration for Regolith Linux "
HOMEPAGE="https://github.com/regolith-linux/regolith-gnome-flashback"
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
	gnome-base/gnome-flashback
	gnome-base/gnome-session
	x11-misc/regolith-i3-gaps-config
	x11-themes/regolith-styles
	x11-apps/xrdb
	sys-apps/dbus[user-session]
"
PATCHES=("${FILESDIR}/flashback.patch")

src_install() {
	dobin usr/bin/regolith-session usr/bin/regolith-session-init
	insinto /usr/share/applications
	doins usr/share/applications/regolith.desktop
	insinto /usr/share/gnome-session/sessions
	doins usr/share/gnome-session/sessions/regolith.session
	insinto /usr/share/xsessions
	doins usr/share/xsessions/regolith.desktop
}
