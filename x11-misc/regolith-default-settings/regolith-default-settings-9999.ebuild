# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

DESCRIPTION="Default configuration for the Regolith Desktop Environment. "
HOMEPAGE="https://github.com/regolith-linux/regolith-default-settings"
SLOT="0"
LICENSE="GPL-2"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/regolith-linux/${PN}.git"
	src_install() {
		insinto /usr/share/applications
		doins usr/share/applications/logout.desktop usr/share/applications/reboot.desktop usr/share/applications/shutdown.desktop
		insinto /usr/share/glib-2.0/schemas
		newins debian/regolith-default-settings.gsettings-override 10_regolith-default-settings.gschema.override
	}
else
	# we are grabbing the amd64 deb package but it doesn't really matter this isn't a compile packaged
	# it's just 3 desktop entries and a gsettings override file
	# unfortunately upstream doesn't package the gsettings override file with the source tarball
	# so we have to do this .deb unpacking kludge temporarily
	SRC_URI="https://launchpad.net/~regolith-linux/+archive/ubuntu/release/+files/regolith-default-settings_1.0.8-1hirsute_amd64.deb -> ${P}.deb"
	KEYWORDS="~amd64"
	inherit unpacker
	src_unpack() {
		unpack_deb ${P}.deb || die "failed to unpack .deb file"
		mkdir "${WORKDIR}/${P}" || die "failed unpacking"
		mv "${WORKDIR}/usr" "${WORKDIR}/${P}/" || die "failed unpacking"
	}
	src_install() {
		insinto /usr/share/applications
		doins usr/share/applications/logout.desktop usr/share/applications/reboot.desktop usr/share/applications/shutdown.desktop
		insinto /usr/share/glib-2.0/schemas
		doins usr/share/glib-2.0/schemas/10_regolith-default-settings.gschema.override
	}
fi

RDEPEND="
	dev-libs/glib
"

pkg_postinst() {
	elog "You should run glib-compile-schemas /usr/share/glib-2.0/schemas/"
	elog "as root to ensure that regolith's default settings are present"
	elog "before launching the environment."
}
