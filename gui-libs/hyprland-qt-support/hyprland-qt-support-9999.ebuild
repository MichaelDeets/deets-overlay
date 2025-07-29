# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="QML style provider for hypr* Qt apps"
HOMEPAGE="https://github.com/hyprwm/hyprland-qt-support"

if [[ ${PV} == 9999 ]] ; then
	EGIT_REPO_URI="https://github.com/hyprwm/hyprland-qt-support.git"
	inherit git-r3
else
	SRC_URI="https://github.com/hyprwm/${PN}/archive/refs/tags/v${PV}/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="amd64"
fi

LICENSE="BSD"
SLOT="0"

RDEPEND="
	dev-qt/qtbase:6
	dev-qt/qtdeclarative:6
	>=dev-libs/hyprlang-0.6.0
"

DEPEND="${RDEPEND}"

BDEPEND="
	virtual/pkgconfig
"

src_configure() {
	local mycmakeargs=(
		-DINSTALL_QML_PREFIX="${EPFREIX}/$(get_libdir)/qt6/qml"
	)

	cmake_src_configure
}
