# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A blazing fast wayland wallpaper utility"
HOMEPAGE="https://github.com/hyprwm/hyprpaper"

if [[ ${PV} == 9999 ]] ; then
	EGIT_REPO_URI="https://github.com/hyprwm/hyprpaper.git"
	inherit git-r3
else
	SRC_URI="https://github.com/hyprwm/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="BSD"
SLOT="0"

RDEPEND="
	dev-util/hyprtoolkit
	gui-wm/hyprwire
	dev-libs/hyprgraphics
	>=dev-libs/hyprlang-0.6.0
	dev-libs/wayland
	>=gui-libs/hyprutils-0.2.4:=
	media-libs/libglvnd
	media-libs/libjpeg-turbo:=
	media-libs/libwebp:=
	x11-libs/cairo
	x11-libs/pango
"
DEPEND="
	${RDEPEND}
	dev-libs/wayland-protocols
"
BDEPEND="
	>=dev-util/hyprwayland-scanner-0.4.4
	dev-util/wayland-scanner
	dev-vcs/git
	virtual/pkgconfig
"

DOCS=( README.md )

src_compile() {
	emake protocols
	cmake_src_compile
}
