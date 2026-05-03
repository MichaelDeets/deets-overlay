# Copyright 2023-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
inherit meson-multilib python-single-r1 xdg

DESCRIPTION="Overlay for monitoring FPS, temperatures, CPU/GPU load and more"
HOMEPAGE="https://github.com/flightlessmango/MangoHud"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/flightlessmango/MangoHud"

else
	MY_PV="${PV/_r/-r}"
	SRC_URI="
		https://github.com/flightlessmango/MangoHud/archive/refs/tags/v${MY_PV}.tar.gz
			-> ${P}.tar.gz
	"
	S="${WORKDIR}/MangoHud-${MY_PV}"

	# dont keyword release candidates
	if ! [[ ${PV} =~ _rc ]]; then
		KEYWORDS="~amd64"
	fi
fi

VULKAN_HEADER_VER="1.4.346"
VULKAN_UTILITY_VER="1.4.346"
IMGUI_VER="1.91.6"
IMGUI_WRAP="${IMGUI_VER}-3"
IMPLOT_VER="0.16"
IMPLOT_WRAP="${IMPLOT_VER}-1"

SRC_URI+="
	https://github.com/KhronosGroup/Vulkan-Headers/archive/v${VULKAN_HEADER_VER}.tar.gz
		-> vulkan-headers-${VULKAN_HEADER_VER}.tar.gz
	https://github.com/KhronosGroup/Vulkan-Utility-Libraries/archive/v${VULKAN_UTILITY_VER}.tar.gz
		-> vulkan-utility-libraries-${VULKAN_UTILITY_VER}.tar.gz
	https://github.com/ocornut/imgui/archive/refs/tags/v${IMGUI_VER}.tar.gz
		-> imgui-${IMGUI_VER}.tar.gz
	https://wrapdb.mesonbuild.com/v2/imgui_${IMGUI_WRAP}/get_patch
		-> imgui_${IMGUI_WRAP}_patch.zip
	https://github.com/epezent/implot/archive/refs/tags/v${IMPLOT_VER}.tar.gz
		-> implot-${IMPLOT_VER}.tar.gz
	https://wrapdb.mesonbuild.com/v2/implot_${IMPLOT_WRAP}/get_patch
		-> implot_${IMPLOT_WRAP}_patch.zip
"

LICENSE="MIT"
SLOT="0"

IUSE="dbus mangoapp plots wayland +X"

REQUIRED_USE="
	|| ( wayland X )
	mangoapp? ( X )
	${PYTHON_REQUIRED_USE}
"

COMMON_DEPEND="
	dev-libs/libfmt:=
	dev-libs/spdlog:=
	media-libs/glfw
	media-libs/libglvnd
	x11-libs/libxkbcommon
	X? ( x11-libs/libX11 )
	wayland? ( dev-libs/wayland )
"
DEPEND="
	${COMMON_DEPEND}
	dbus? ( sys-apps/dbus )
"
RDEPEND="
	${COMMON_DEPEND}
	${PYTHON_DEPS}
	plots? (
		$(python_gen_cond_dep '
			dev-python/matplotlib[${PYTHON_USEDEP}]
			dev-python/numpy[${PYTHON_USEDEP}]
		')
	)
"
BDEPEND="
	${PYTHON_DEPS}
	app-arch/unzip
	dev-util/glslang
	$(python_gen_cond_dep '
		dev-python/mako[${PYTHON_USEDEP}]
	')
"

PATCHES=(
	"${FILESDIR}"/mangohud-0.8.3-fix-llvm.patch
)

python_check_deps() {
	python_has_version "dev-python/mako[${PYTHON_USEDEP}]"
}

src_unpack() {
	if [[ "${PV}" == "9999" ]]; then
		git-r3_src_unpack
	fi
	default
}

src_prepare() {
	default

	mv "${WORKDIR}/Vulkan-Headers-${VULKAN_HEADER_VER}" \
		"${S}/subprojects/Vulkan-Headers-${VULKAN_HEADER_VER}" || die
	cp -r "${S}/subprojects/packagefiles/vulkan-headers/"* \
		"${S}/subprojects/Vulkan-Headers-${VULKAN_HEADER_VER}" || die
	mv "${WORKDIR}/Vulkan-Utility-Libraries-${VULKAN_UTILITY_VER}" \
		"${S}/subprojects/Vulkan-Utility-Libraries-${VULKAN_UTILITY_VER}" || die
	cp -r "${S}/subprojects/packagefiles/vulkan-utility-libraries/"* \
		"${S}/subprojects/Vulkan-Utility-Libraries-${VULKAN_UTILITY_VER}" || die
	mv "${WORKDIR}/imgui-${IMGUI_VER}" "${S}/subprojects/imgui-${IMGUI_VER}" || die
	mv "${WORKDIR}/implot-${IMPLOT_VER}" "${S}/subprojects/implot-${IMPLOT_VER}" || die

	# Install documents into versioned dir
	sed -i "s/'doc', 'mangohud'/'doc', '${PF}'/" data/meson.build || die
}

src_configure() {
	local emesonargs=(
		$(meson_feature X with_x11)
		$(meson_feature dbus with_dbus)
		$(meson_native_use_bool mangoapp)
		$(meson_native_use_feature plots mangoplot)
		# tests not hooked up anymore
		-Dtests=disabled
		$(meson_feature wayland with_wayland)
		-Dappend_libdir_mangohud=true
		-Ddynamic_string_tokens=true
		-Dglibcxx_asserts=false
		-Dinclude_doc=true
		$(meson_native_true mangohudctl)
		-Duse_system_spdlog=enabled
		-Dwith_xnvctrl=disabled
		--force-fallback-for=imgui,implot
	)

	meson-multilib_src_configure
}

src_install() {
	meson-multilib_src_install --skip-subprojects

	if use plots; then
		python_optimize "${D}"
		python_fix_shebang "${D}"
	fi
}

