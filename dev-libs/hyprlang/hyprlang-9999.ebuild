# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake toolchain-funcs

DESCRIPTION="Official implementation library for the hypr config language"
HOMEPAGE="https://github.com/hyprwm/hyprlang"

if [[ ${PV} == 9999 ]] ; then
	EGIT_REPO_URI="https://github.com/hyprwm/hyprlang.git"
	inherit git-r3
else
	SRC_URI="https://github.com/hyprwm/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="amd64"
fi

LICENSE="LGPL-3"
SLOT="0"

RDEPEND=">=gui-libs/hyprutils-0.7.1:="
DEPEND="${RDEPEND}"
BDEPEND="|| ( >=sys-devel/gcc-14:* >=llvm-core/clang-18:* )"

pkg_setup() {
	[[ ${MERGE_TYPE} == binary ]] && return

	tc-check-min_ver gcc 14
	tc-check-min_ver clang 18
}
