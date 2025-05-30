# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake toolchain-funcs flag-o-matic

DESCRIPTION="Ananicy rewritten in C++ for much lower CPU and memory usage"
HOMEPAGE="https://gitlab.com/ananicy-cpp/ananicy-cpp"

if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://gitlab.com/${PN}/${PN}.git"
	inherit git-r3
else
	SRC_URI="https://gitlab.com/ananicy-cpp/ananicy-cpp/-/archive/v${PV}/${PN}-v${PV}.tar.bz2"
	S="${WORKDIR}/${PN}-v${PV}"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="bpf cachyos-rules clang systemd"
REQUIRED_USE="
	bpf? ( clang )
"

RDEPEND="
	!app-admin/ananicy
	>=dev-cpp/nlohmann_json-3.9
	>=dev-libs/libfmt-8:=
	>=dev-libs/spdlog-1.9:=
	bpf? (
		 dev-libs/elfutils
		 dev-libs/libbpf:=
		 dev-util/bpftool
	)
	cachyos-rules? ( app-admin/ananicy-rules-cachyos )
	systemd? ( sys-apps/systemd )
"
DEPEND="
	>=dev-build/cmake-3.17
	clang? ( >=llvm-core/clang-10 )
	${RDEPEND}
"

PATCHES=(
	"${FILESDIR}/${P}-remove-debug-flags.patch"
	"${FILESDIR}/${P}-include-unistd.patch"
)

pkg_setup() {
	if use bpf ; then
		CONFIG_CHECK+="~BPF ~BPF_EVENTS ~BPF_SYSCALL ~HAVE_EBPF_JIT"
	fi
}

src_configure() {
	# std::jthread is experimental in libc++ (18.1.X)
	if [[ "$(tc-get-cxx-stdlib)" == "libc++" ]]; then
		ewarn "std::jthread support in libc++ is experimental"
		ewarn "passing -fexperimental-library to allow build"
		append-cxxflags -fexperimental-library
	fi

	local mycmakeargs=(
		-DENABLE_SYSTEMD=$(usex systemd)
		-DUSE_BPF_PROC_IMPL=$(usex bpf)
		-DUSE_EXTERNAL_FMTLIB=ON
		-DUSE_EXTERNAL_JSON=ON
		-DUSE_EXTERNAL_SPDLOG=ON
		-DVERSION=${PV}
	)

	if use clang; then
		local version_clang=$(clang --version 2>/dev/null | grep -F -- 'clang version' | awk '{ print $3 }')
		[[ -n ${version_clang} ]] && version_clang=$(ver_cut 1 "${version_clang}")
		[[ -z ${version_clang} ]] && die "Failed to read clang version!"
		CC=${CHOST}-clang-${version_clang}
		CXX=${CHOST}-clang++-${version_clang}

		if use bpf ; then
			mycmakeargs+=( -DBPF_BUILD_LIBBPF=OFF )
		fi
	fi

	cmake_src_configure
}

src_install() {
	cmake_src_install

	if ! use systemd ; then
		doinitd "${FILESDIR}/${PN}.initd"
	fi

	keepdir /etc/ananicy.d
}

