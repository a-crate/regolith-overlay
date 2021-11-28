# Copyright 2021 Amelia Crate <acrate@waldn.net>
# Distributed under the terms of the BSD License

EAPI=7

PYTHON_COMPAT=( python3_{9..10} )
inherit python-single-r1

DESCRIPTION="Regolith customization of i3xrocks."
HOMEPAGE="https://github.com/regolith-linux/regolith-i3xrocks-config"
SLOT="0"
LICENSE="GPL-3"
if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/regolith-linux/${PN}.git"
else
	SRC_URI="https://launchpad.net/~regolith-linux/+archive/ubuntu/release/+sourcefiles/${PN}/${PV}-1/${PN}_${PV}.orig.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	src_unpack() {
		default
		mv "${WORKDIR}/${PN}" "${WORKDIR}/${P}"
	}
fi
IUSE="+time +disk-capacity +remontoire +net-traffic +memory +cpu-usage +focused-window-name +battery +keyboard-layout +key-indicator +media-player +networkmanager +openvpn +temp +volume +microphone +weather +wifi +bluetooth +next-workspace +rofication +app-launcher"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="$(python_gen_impl_dep)"

RDEPEND="
	>=app-shells/bash-3.0
	x11-misc/i3xrocks
	x11-misc/xrescat
	time? (
		gnome-base/gnome-control-center
	)
	disk-capacity? (
		sys-apps/gnome-disk-utility
		>=sys-apps/coreutils-8.0
	)
	remontoire? (
		x11-misc/remontoire
		x11-misc/regolith-ftue
	)
	net-traffic? (
		sys-devel/bc
		sys-apps/iproute2
	)
	memory? (
		gnome-extra/gnome-system-monitor
	)
	cpu-usage? (
		gnome-extra/gnome-system-monitor
		app-admin/sysstat
	)
	focused-window-name? (
		$(python_gen_cond_dep 'dev-python/i3ipc[${PYTHON_USEDEP}]')
	)
	battery? (
		sys-power/upower
	)
	keyboard-layout? (
		=dev-libs/glib-2*
	)
	key-indicator? (
		x11-apps/xset
	)
	media-player? (
		media-sound/playerctl
	)
	networkmanager? (
		net-misc/networkmanager
	)
	openvpn? (
		dev-lang/perl
	)
	temp? (
		sys-apps/lmsensors
	)
	volume? (
		media-sound/alsa-utils
	)
	microphone? (
		media-sound/alsa-utils
	)
	weather? (
		media-fonts/noto-emoji
		x11-misc/xdg-utils
		net-misc/curl
	)
	wifi? (
		net-misc/networkmanager
	)
	bluetooth? (
		$(python_gen_cond_dep 'dev-python/dbus-python[${PYTHON_USEDEP}]')
	)
	next-workspace? (
		$(python_gen_cond_dep 'dev-python/i3ipc[${PYTHON_USEDEP}]')
		$(python_gen_cond_dep 'dev-python/i3-next-workspace[${PYTHON_USEDEP}]')
	)
	rofication? (
		x11-misc/regolith-rofication
	)
	app-launcher? (
		x11-misc/rofi
	)
"

src_install() {
	insinto /usr/share/i3xrocks
	if use time; then
		doins scripts/time
	fi
	if use disk-capacity; then
		doins scripts/disk-capacity
	fi
	if use net-traffic; then
		doins scripts/net-traffic
	fi
	if use memory; then
		doins scripts/memory
	fi
	if use cpu-usage; then
		doins scripts/cpu-usage
	fi
	if use focused-window-name; then
		doins scripts/focused-window-name
	fi
	if use battery; then
		doins scripts/battery
	fi
	if use keyboard-layout; then
		doins scripts/keyboard-layout
	fi
	if use key-indicator; then
		doins scripts/key-indicator
	fi
	if use media-player; then
		doins scripts/media-player
	fi
	if use networkmanager; then
		doins scripts/nm-vpn
	fi
	if use openvpn; then
		doins scripts/openvpn
	fi
	if use temp; then
		doins scripts/temp
	fi
	if use volume; then
		doins scripts/volume
	fi
	if use microphone; then
		doins scripts/microphone
	fi
	if use weather; then
		doins scripts/weather
	fi
	if use wifi; then
		doins scripts/wifi
	fi
	if use bluetooth; then
		doins scripts/bluetooth
	fi
	if use next-workspace; then
		doins scripts/next-workspace-widget
	fi
	if use app-launcher; then
		doins scripts/app-launcher
	fi

	insinto /etc/regolith/i3xrocks/conf.d
	doins conf.d/01_setup

	if use time; then
		doins conf.d/90_time
	fi
	if use disk-capacity; then
		doins conf.d/50_disk-capacity
	fi
	if use remontoire; then
		doins conf.d/20_info
	fi
	if use net-traffic; then
		doins conf.d/30_net-traffic
	fi
	if use memory; then
		doins conf.d/50_memory
	fi
	if use cpu-usage; then
		doins conf.d/40_cpu-usage
	fi
	if use focused-window-name; then
		doins conf.d/10_focused-window-name
	fi
	if use battery; then
		doins conf.d/80_battery
	fi
	if use keyboard-layout; then
		doins conf.d/20_keyboard-layout
	fi
	if use key-indicator; then
		doins conf.d/20_key-indicator
	fi
	if use media-player; then
		doins conf.d/30_media-player
	fi
	if use networkmanager; then
		doins conf.d/40_nm-vpn
	fi
	if use openvpn; then
		doins conf.d/40_openvpn
	fi
	if use temp; then
		doins conf.d/40_temp
	fi
	if use volume; then
		doins conf.d/80_volume
	fi
	if use microphone; then
		doins conf.d/80_microphone
	fi
	if use weather; then
		doins conf.d/20_weather
	fi
	if use wifi; then
		doins conf.d/30_wifi
	fi
	if use bluetooth; then
		doins conf.d/30_bluetooth
	fi
	if use next-workspace; then
		doins conf.d/10_next-workspace
	fi
	if use rofication; then
		doins conf.d/80_rofication
	fi
	if use app-launcher; then
		doins conf.d/10_app-launcher
	fi
}
