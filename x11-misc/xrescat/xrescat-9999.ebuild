# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

inherit eutils

DESCRIPTION="A simple utility which prints the value of an xresource without the need for a linefeed."
HOMEPAGE="https://github.com/regolith-linux/xrescat"

EGIT_REPO_URI="https://github.com/regolith-linux/xrescat.git"
LICENSE="MIT"
SLOT="0"

DEPEND="x11-libs/libX11"
