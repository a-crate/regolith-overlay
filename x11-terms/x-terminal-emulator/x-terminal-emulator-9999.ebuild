# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

DESCRIPTION="A script to launch the default terminal emulator. A shim for non-debian systems."
HOMEPAGE="https://github.com/a-crate/x-terminal-emulator"
SLOT="0"
LICENSE="CC0-1.0"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/a-crate/x-terminal-emulator.git"
else
	SRC_URI="https://github.com/a-crate/x-terminal-emulator/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi
RDEPEND="
	>=app-shells/bash-4.2
	dev-libs/glib
"

src_install() {
	dobin x-terminal-emulator
}
