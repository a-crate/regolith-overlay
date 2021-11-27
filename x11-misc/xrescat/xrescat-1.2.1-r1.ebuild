# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

inherit eutils

DESCRIPTION="A simple utility which prints the value of an xresource without the need for a linefeed."
HOMEPAGE="https://github.com/regolith-linux/xrescat"

SRC_URI="https://launchpad.net/~regolith-linux/+archive/ubuntu/release/+sourcefiles/xrescat/1.2.1-1/xrescat_1.2.1.orig.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"

DEPEND="x11-libs/libX11"

src_unpack() {
	default
	mv "${WORKDIR}/xrescat" "${WORKDIR}/${P}"
}
