# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

inherit font

DESCRIPTION="Monospaced font family for user interface and coding environments "
HOMEPAGE="https://adobe-fonts.github.io/source-code-pro/"
LICENSE="OFL-1.1"
SLOT="0"
SRC_URI="https://github.com/adobe-fonts/source-code-pro/releases/download/2.038R-ro%2F1.058R-it%2F1.018R-VAR/TTF-source-code-pro-2.038R-ro-1.058R-it.zip -> ${P}.zip"

KEYWORDS="~amd64"

BDEPEND="app-arch/unzip"

S="${WORKDIR}"
FONT_SUFFIX="ttf"
