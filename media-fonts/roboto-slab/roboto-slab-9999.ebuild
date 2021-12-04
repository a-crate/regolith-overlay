# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

inherit font git-r3

DESCRIPTION="Roboto Slab Typeface by Google"
HOMEPAGE="https://fonts.google.com/specimen/Roboto+Slab"
EGIT_REPO_URI="https://github.com/googlefonts/robotoslab"

# Upstream doesn't do versions, so the best I can do is update the commit with the
# latest version which built successfully on github actions
# that makes this not truly live but it does let me add KEYWORDS
# since I can verify that it's the same source

EGIT_COMMIT="56bcfeddeae694babdb34c19ebe3956b17829699"

LICENSE="Apache-2.0"
KEYWORDS="~amd64"
SLOT="0"

FONT_SUFFIX="ttf"
S="${WORKDIR}/roboto-slab-9999/fonts/ttf"

