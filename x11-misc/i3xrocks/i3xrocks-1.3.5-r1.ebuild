# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

inherit autotools

DESCRIPTION="A fork of i3blocks that can read Xresources."
HOMEPAGE="https://github.com/regolith-linux/i3xrocks#installation"
SRC_URI="https://launchpad.net/~regolith-linux/+archive/ubuntu/release/+sourcefiles/i3xrocks/1.3.5-1/i3xrocks_1.3.5.orig.tar.gz -> {P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64"
LICENSE="GPL-3"

src_unpack() {
	default
	mv "${WORKDIR}/i3xrocks" "${WORKDIR}/${P}"
}

src_prepare() {
	default
	eautoreconf
}
