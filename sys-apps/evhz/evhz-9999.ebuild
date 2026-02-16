# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Show mouse refresh rate under linux + evdev"
HOMEPAGE="https://git.sr.ht/~iank/evhz"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~iank/evhz"
else
	SRC_URI="https://git.sr.ht/~iank/evhz/archive/${PH}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/evhz-${PH}"
	KEYWORDS="~amd64"
fi

LICENSE="Apache-2.0 GPL-3+"
SLOT="0"

DEPEND="
	virtual/libc
"
RDEPEND="${DEPEND}"
BDEPEND="
	sys-kernel/linux-headers
"

src_compile() {
	cc evhz.c -o evhz
}

src_install() {
	dosbin evhz
}

