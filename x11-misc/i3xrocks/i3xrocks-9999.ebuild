# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

inherit autotools git-r3

DESCRIPTION="A fork of i3blocks that can read Xresources."
HOMEPAGE="https://github.com/regolith-linux/i3xrocks"
EGIT_REPO_URI="https://github.com/regolith-linux/i3xrocks.git"

SLOT="0"
LICENSE="GPL-3"

src_prepare() {
	default
	eautoreconf
}
