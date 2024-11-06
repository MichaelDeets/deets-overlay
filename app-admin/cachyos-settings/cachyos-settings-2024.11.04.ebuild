# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit udev tmpfiles

COMMIT="c4da0f79ee883903bfb5d4bda1b2f545cb75247d"
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
		usr/bin/ksmctl \
		usr/bin/ksmstats \
		usr/bin/topmem
	insinto /usr/lib
	doins -r \
		usr/lib/sysctl.d \
		usr/lib/tmpfiles.d
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
