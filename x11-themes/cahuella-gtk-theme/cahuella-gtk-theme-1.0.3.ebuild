# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

inherit git-r3

DESCRIPTION="GTK+ Theme based on Adwaita using the Nord color palette "
HOMEPAGE="https://github.com/regolith-linux/Cahuella"
SLOT="0"
LICENSE="GPL-3"
EGIT_REPO_URI="https://github.com/regolith-linux/Cahuella.git"

if [[ ${PV} == 1.0.3 ]]; then
	# upstream's packing of this on launchpad is a binary package
	# even the source tarball is precompiled, and there are no release tags on git
	# so I'm manually specifying commits for now
	EGIT_COMMIT="e7fadf4489a08d268faac71180ed123766e7e0a0"
	KEYWORDS="~amd64"
fi
RDEPEND="
	x11-themes/gtk-engines-adwaita
"
BDEPEND="
	dev-lang/sassc
	media-gfx/optipng
	media-gfx/inkscape
"

src_compile() {
	${WORKDIR}/${P}/render-assets.sh || die "failed to render assets"
	emake -j1
}

src_install() {
	insinto /usr/share/themes/Cahuella
	doins -r dist/Cahuella/gtk-3.0 dist/Cahuella/gtk-2.0 index.theme
}

pkg_postinst() {
	elog "warnings about broken symlinks for this package are normal"
	elog "this is an upstream issue but it shouldn't affect normal usage"
}
