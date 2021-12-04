# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

DESCRIPTION="Virtual package for pop-fonts."
# Pop os doesn't have their own fonts, they just redistribute the ones this package depends on.
# This virtual only exists to make my life easier when I'm translating upstream's packaging into ebuilds
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="
	media-fonts/fira-sans
	media-fonts/fira-mono
	media-fonts/roboto-slab
"
