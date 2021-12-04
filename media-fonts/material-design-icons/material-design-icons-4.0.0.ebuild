# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

inherit font

DESCRIPTION="Google's Material Design icons fonts"
HOMEPAGE="https://google.github.io/material-design-icons/"
SRC_URI="https://github.com/google/material-design-icons/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

FONT_SUFFIX="otf ttf"
S="${WORKDIR}/${P}/font"

