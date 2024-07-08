# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit udev tmpfiles

COMMIT="8181bdcb67eaffdb9cb884e4a1fd4c3aed1918fd"
MY_PN="CachyOS-Settings"

DESCRIPTION="Settings from CachyOS"
HOMEPAGE="https://github.com/CachyOS/CachyOS-Settings"
SRC_URI="https://github.com/CachyOS/${MY_PN}/archive/${COMMIT}.tar.gz -> ${PN}-${COMMIT}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${MY_PN}-${COMMIT}"

src_install() {
	into /usr/local
	dobin \
		usr/bin/amdpstate-guided \
		usr/bin/game-performance \
		usr/bin/pci-latency \
		usr/bin/topmem
	insinto /usr/lib
	doins -r "usr/lib/sysctl.d"
	doins -r "usr/lib/tmpfiles.d"
	udev_dorules "usr/lib/udev/rules.d/30-zram.rules"
	udev_dorules "usr/lib/udev/rules.d/40-hpet-permissions.rules"
	udev_dorules "usr/lib/udev/rules.d/50-sata.rules"
	udev_dorules "usr/lib/udev/rules.d/60-ioschedulers.rules"
	udev_dorules "usr/lib/udev/rules.d/69-hdparm.rules"
	udev_dorules "usr/lib/udev/rules.d/71-nvidia.rules"
	udev_dorules "usr/lib/udev/rules.d/99-cpu-dma-latency.rules"
}

pkg_postinst() {
	udev_reload
	tmpfiles_process thp.conf
}

pkg_postrm() {
	udev_reload
}
