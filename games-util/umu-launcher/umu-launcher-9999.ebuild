# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	autocfg@1.4.0
	base16ct@0.2.0
	base64ct@1.6.0
	block-buffer@0.10.4
	cfg-if@1.0.0
	cipher@0.4.4
	cpufeatures@0.2.16
	crypto-common@0.1.6
	curve25519-dalek-derive@0.1.1
	curve25519-dalek@4.1.3
	digest@0.10.7
	ed25519-dalek@2.1.1
	ed25519@2.2.3
	fiat-crypto@0.2.9
	generic-array@0.14.7
	heck@0.5.0
	indoc@2.0.5
	inout@0.1.3
	libc@0.2.169
	memoffset@0.9.1
	once_cell@1.20.2
	pem-rfc7468@0.7.0
	portable-atomic@1.10.0
	proc-macro2@1.0.92
	pyo3-build-config@0.23.4
	pyo3-ffi@0.23.4
	pyo3-macros-backend@0.23.4
	pyo3-macros@0.23.4
	pyo3@0.23.4
	quote@1.0.38
	rand_core@0.6.4
	rustc_version@0.4.1
	semver@1.0.24
	sha2@0.10.8
	signature@2.2.0
	ssh-cipher@0.2.0
	ssh-encoding@0.2.0
	ssh-key@0.6.7
	subtle@2.6.1
	syn@2.0.96
	target-lexicon@0.12.16
	typenum@1.17.0
	unicode-ident@1.0.14
	unindent@0.2.3
	version_check@0.9.5
	zeroize@1.8.1
"

inherit cargo python-utils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Open-Wine-Components/umu-launcher"
	src_unpack() {
		git-r3_src_unpack
		cargo_live_src_unpack
	}
else
	SRC_URI="https://github.com/Open-Wine-Components/umu-launcher/archive/refs/tags/${PV}.tar.gz
	${CARGO_CRATE_URIS}"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Unified Launcher for WINE, to run Proton with fixes outside of Steam"
HOMEPAGE="https://github.com/Open-Wine-Components/umu-launcher"

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	app-text/scdoc
	dev-vcs/git
	dev-python/installer
	dev-python/build
	dev-python/hatchling"

RDEPEND="
	${DEPEND}
	dev-python/python-xlib
	dev-python/filelock"

BDEPEND=""

src_configure() {
	./configure.sh --prefix=/usr
	emake
}

src_install() {
	make DESTDIR="${D}" install
}
