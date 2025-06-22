# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit dot-a toolchain-funcs

DESCRIPTION="Hardware-based performance monitoring interface for Linux"
HOMEPAGE="https://perfmon2.sourceforge.net"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://git.code.sf.net/p/perfmon2/libpfm4"
	EGIT_BRANCH="master"
	inherit git-r3
	SLOT="9999"
else
	SRC_URI="https://downloads.sourceforge.net/perfmon2/${PN}4/${P}.tar.gz"
	KEYWORDS="~alpha amd64 arm arm64 ~loong ~mips ppc ppc64 ~riscv sparc x86"

	PATCHES=(
		"${FILESDIR}"/libpfm-4.13.0-musl-WORDSIZE_undeclared.patch
	)
	SLOT="0/4"
fi

LICENSE="GPL-2 MIT"
IUSE="static-libs"

src_prepare() {
	default

	sed -e "s:SLDFLAGS=:SLDFLAGS=\$(LDFLAGS) :g" \
		-i lib/Makefile || die
	sed -e "s:LIBDIR=\$(PREFIX)/lib:LIBDIR=\$(PREFIX)/$(get_libdir):g" \
		-i config.mk || die
}

src_compile() {
	use static-libs && lto-guarantee-fat
	# 'DBG=' unsets '-Werror' and other optional flags, bug #664294
	emake AR="$(tc-getAR)" CC="$(tc-getCC)" DBG=
}

src_test() {
	./tests/validate -A || die
}

src_install() {
	emake DESTDIR="${D}" LDCONFIG=true PREFIX="${EPREFIX}/usr" install
	dodoc README

	if ! use static-libs ; then
		find "${ED}" -name '*.a' -delete || die
	fi

	strip-lto-bytecode
}
