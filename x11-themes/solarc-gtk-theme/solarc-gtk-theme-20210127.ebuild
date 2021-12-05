# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the ISC License

EAPI=7

inherit meson

DESCRIPTION="A flat theme with transparent elements."
HOMEPAGE="https://github.com/schemar/solarc-theme"
__COMMIT="34c449d8f1977089f52ae7019f1101f06afa8d77"
SRC_URI="https://github.com/schemar/solarc-theme/archive/${__COMMIT}.zip -> ${P}.zip https://github.com/jnsh/arc-theme/releases/download/${PV}/arc-theme-${PV}.tar.xz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
# upstream won't release new versions with new versions of arc
# so I'm just going to version based on the arc version
# and use specific commits
IUSE="
	cinnamon
	gnome-shell
	+gtk2
	+gtk3
	+gtk4
	mate
	xfce
"
DEPEND="
	gtk3? ( =x11-libs/gtk+-3.24*:3 )
"
RDEPEND="
	gtk2? ( x11-themes/gnome-themes-standard )
	x11-themes/gtk-engines-murrine
"
BDEPEND="
	cinnamon? ( gnome-extra/cinnamon )
	gnome-shell? ( >=gnome-base/gnome-shell-3.18 )
	dev-lang/sassc
	media-gfx/optipng
	media-gfx/inkscape
	virtual/pkgconfig
	net-misc/wget
	app-arch/unzip
"
S="${WORKDIR}/solarc-theme-${__COMMIT}"

src_prepare() {
	mv "${WORKDIR}/arc-theme-${PV}" "${S}/arc-theme-${PV}" || die "Error staging arc theme files"
	eapply "${FILESDIR}/${PV}-solarizedsh.patch" || die "Failed to patch solarized.sh"
	${S}/solarize.sh || die "Solarize.sh failed."
	eapply "${FILESDIR}/${PV}-mesonbuild.patch" || die "Failed to patch meson.build"
	for f in $(ls "${S}/arc-theme-${PV}"); do
		mv -f "${S}/arc-theme-${PV}/$f" "${S}"
	done
	default
}

src_configure() {
	local themes=$(
		printf "%s," \
		$(usev cinnamon) \
		$(usev gnome-shell) \
		$(usev gtk2) \
		$(usev gtk3) \
		$(usex mate metacity "") \
		$(usex xfce xfwm "")
	)
	local emesonargs=(
		-Dthemes="${themes%,}"
		-Dgtk3_version=3.24
		-Dgtk4_version=4.2 # 4.0 dropped in Gentoo, works with 4.4.
	)
	meson_src_configure
}
