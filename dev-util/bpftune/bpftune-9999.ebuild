# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit flag-o-matic toolchain-funcs

DESCRIPTION="BPF/tracing tools for auto-tuning Linux"
HOMEPAGE="https://github.com/libbpf/libbpf"

if [[ ${PV} =~ [9]{4,} ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/oracle/bpftune.git"
fi
S="${WORKDIR}/${P}/"

LICENSE="GPL-2 LGPL-2.1 BSD-2"
SLOT="0/$(ver_cut 1-2)"
IUSE=""

DEPEND="
	sys-kernel/linux-headers
	virtual/libelf
"
RDEPEND="
	${DEPEND}
"
BDEPEND="
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}"/fix-makefile.patch
)

src_configure() {
	tc-export CC AR PKG_CONFIG
	export PREFIX="${EPREFIX}/usr"
	export V=1
}

src_install() {
	emake DESTDIR="${D}" install
}
