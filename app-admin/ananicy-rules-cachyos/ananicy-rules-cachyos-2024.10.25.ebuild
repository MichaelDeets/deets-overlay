# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

COMMIT="707b16506be2c54028546181461ebf47cfe72d83"
MY_PN="${PN%-cachyos}"

DESCRIPTION="ananicy-cpp-rules from CachyOS"
HOMEPAGE="https://github.com/CachyOS/ananicy-rules"
SRC_URI="https://github.com/CachyOS/${MY_PN}/archive/${COMMIT}.tar.gz -> ${PN}-${COMMIT}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${MY_PN}-${COMMIT}"

src_install() {
	insinto /etc/ananicy.d/
	doins -r \
		00-default \
		00-cgroups.cgroups \
		00-types.types \
		ananicy.conf
}

