# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

inherit font

DESCRIPTION="A free and open-source typeface for developers"
HOMEPAGE="https://www.jetbrains.com/mono/"
LICENSE="OFL-1.1"
SLOT="0"
SRC_URI="https://github.com/JetBrains/JetBrainsMono/archive/refs/tags/v${PV}.tar.gz -> ${P}.zip"

KEYWORDS="~amd64"

BDEPEND="app-arch/unzip"

S="${WORKDIR}/fonts/ttf"
FONT_SUFFIX="ttf"
