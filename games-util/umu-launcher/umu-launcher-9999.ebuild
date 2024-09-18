# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Open-Wine-Components/umu-launcher"
else
	KEYWORDS="~amd64"
fi

DESCRIPTION="Unified Launcher for WINE, to run Proton with fixes outside of Steam"
HOMEPAGE="https://github.com/Open-Wine-Components/umu-launcher"
SRC_URI=""

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

src_prepare() {
	default
}

src_configure() {
	default
	./configure.sh --prefix=/usr/local
}

src_compile() {
	emake
}
