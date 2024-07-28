# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit udev tmpfiles

COMMIT="2ac3844ae4d9d90905de5c29259b1db67a4d79f7"
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
	udev_dorules "usr/lib/udev/rules.d/99-cpu-dma-latency.rules"
	udev_dorules "usr/lib/udev/rules.d/99-ntsync.rules"
}

pkg_postinst() {
	udev_reload
	tmpfiles_process thp.conf
}

pkg_postrm() {
	udev_reload
}
