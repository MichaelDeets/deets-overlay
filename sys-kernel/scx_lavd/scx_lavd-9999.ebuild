# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	addr2line@0.24.2
	adler2@2.0.0
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.21
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.6
	anstyle@1.0.10
	anyhow@1.0.95
	arraydeque@0.5.1
	async-broadcast@0.7.2
	async-channel@2.3.1
	async-executor@1.13.1
	async-fs@2.1.2
	async-io@2.4.0
	async-lock@3.4.0
	async-process@2.3.0
	async-recursion@1.1.1
	async-signal@0.2.10
	async-task@4.7.1
	async-trait@0.1.85
	atomic-waker@1.1.2
	autocfg@1.4.0
	backtrace@0.3.74
	base64@0.21.7
	bindgen@0.71.1
	bitflags@1.3.2
	bitflags@2.6.0
	bitvec@1.0.1
	block-buffer@0.10.4
	blocking@1.6.1
	bumpalo@3.16.0
	bytes@1.9.0
	camino@1.1.9
	cargo-platform@0.1.9
	cargo_metadata@0.15.4
	cargo_metadata@0.18.1
	cassowary@0.3.0
	castaway@0.2.3
	cc@1.2.7
	cexpr@0.6.0
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	cgroupfs@0.7.1
	chrono@0.4.39
	clang-sys@1.8.1
	clap@4.5.25
	clap_builder@4.5.25
	clap_derive@4.5.24
	clap_lex@0.7.4
	colorchoice@1.0.3
	colored@2.2.0
	compact_str@0.8.1
	concurrent-queue@2.5.0
	config@0.14.1
	const-random-macro@0.1.16
	const-random@0.1.18
	const_format@0.2.31
	const_format_proc_macros@0.2.31
	convert_case@0.6.0
	core-foundation-sys@0.8.7
	cpufeatures@0.2.16
	crossbeam-channel@0.5.14
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.12
	crossbeam-utils@0.8.21
	crossbeam@0.8.4
	crossterm@0.28.1
	crossterm_winapi@0.9.1
	crunchy@0.2.2
	crypto-common@0.1.6
	ctrlc@3.4.5
	darling@0.20.10
	darling_core@0.20.10
	darling_macro@0.20.10
	deranged@0.3.11
	derive_deref@1.1.1
	digest@0.10.7
	directories@5.0.1
	dirs-sys@0.4.1
	dlv-list@0.5.2
	either@1.13.0
	encoding_rs@0.8.35
	endi@1.1.0
	enumflags2@0.7.10
	enumflags2_derive@0.7.10
	equivalent@1.0.1
	errno@0.3.10
	event-listener-strategy@0.5.3
	event-listener@5.4.0
	fastrand@2.3.0
	fb_procfs@0.7.1
	filetime@0.2.25
	fnv@1.0.7
	foldhash@0.1.4
	funty@2.0.0
	futures-channel@0.3.31
	futures-core@0.3.31
	futures-executor@0.3.31
	futures-io@0.3.31
	futures-lite@2.5.0
	futures-macro@0.3.31
	futures-sink@0.3.31
	futures-task@0.3.31
	futures-util@0.3.31
	futures@0.3.31
	generic-array@0.14.7
	getrandom@0.2.15
	gimli@0.31.1
	glob@0.3.2
	gpoint@0.2.1
	hashbrown@0.14.5
	hashbrown@0.15.2
	hashlink@0.8.4
	heck@0.5.0
	hermit-abi@0.3.9
	hermit-abi@0.4.0
	hex@0.4.3
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.61
	ident_case@1.0.1
	indexmap@2.7.0
	indoc@2.0.5
	instability@0.3.6
	is_terminal_polyfill@1.70.1
	itertools@0.13.0
	itoa@1.0.14
	js-sys@0.3.76
	json5@0.4.1
	lazy_static@1.5.0
	libbpf-cargo@0.25.0-beta.1
	libbpf-rs@0.24.8
	libbpf-rs@0.25.0-beta.1
	libbpf-sys@1.4.6+v1.4.7
	libc@0.2.169
	libloading@0.8.6
	libredox@0.1.3
	linux-raw-sys@0.4.15
	lock_api@0.4.12
	log@0.4.22
	lru@0.12.5
	maplit@1.0.2
	matchers@0.1.0
	memchr@2.7.4
	memmap2@0.5.10
	memoffset@0.6.5
	memoffset@0.9.1
	minimal-lexical@0.2.1
	miniz_oxide@0.8.2
	mio@1.0.3
	nix@0.25.1
	nix@0.29.0
	nom@7.1.3
	ntapi@0.4.1
	nu-ansi-term@0.46.0
	num-conv@0.1.0
	num-traits@0.2.19
	num_cpus@1.16.0
	num_threads@0.1.7
	nvml-wrapper-sys@0.8.0
	nvml-wrapper@0.10.0
	object@0.36.7
	once_cell@1.20.2
	openat@0.1.21
	option-ext@0.2.0
	ordered-float@3.9.2
	ordered-multimap@0.7.3
	ordered-stream@0.2.0
	overload@0.1.1
	parking@2.2.1
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	paste@1.0.15
	pathdiff@0.2.3
	perf-event-open-sys@4.0.0
	pest@2.7.15
	pest_derive@2.7.15
	pest_generator@2.7.15
	pest_meta@2.7.15
	pin-project-lite@0.2.16
	pin-utils@0.1.0
	piper@0.2.4
	pkg-config@0.3.31
	plain@0.2.3
	polling@3.7.4
	powerfmt@0.2.0
	prettyplease@0.2.27
	proc-macro-crate@3.2.0
	proc-macro2@1.0.92
	quote@1.0.38
	radium@0.7.0
	ratatui@0.29.0
	rayon-core@1.12.1
	rayon@1.10.0
	redox_syscall@0.5.8
	redox_users@0.4.6
	regex-automata@0.1.10
	regex-automata@0.4.9
	regex-syntax@0.6.29
	regex-syntax@0.8.5
	regex@1.11.1
	ron@0.8.1
	rust-ini@0.20.0
	rustc-demangle@0.1.24
	rustc-hash@2.1.0
	rustix@0.38.43
	rustversion@1.0.19
	ryu@1.0.18
	same-file@1.0.6
	scopeguard@1.2.0
	semver@1.0.24
	serde@1.0.217
	serde_derive@1.0.217
	serde_json@1.0.135
	serde_repr@0.1.19
	serde_spanned@0.6.8
	sha2@0.10.8
	sharded-slab@0.1.7
	shlex@1.3.0
	signal-hook-mio@0.2.4
	signal-hook-registry@1.4.2
	signal-hook@0.3.17
	simple_logger@5.0.0
	simplelog@0.12.2
	slab@0.4.9
	smallvec@1.13.2
	socket2@0.5.8
	sorted-vec@0.8.5
	sscanf@0.4.2
	sscanf_macro@0.4.2
	static_assertions@1.1.0
	strip-ansi-escapes@0.2.0
	strsim@0.10.0
	strsim@0.11.1
	strum@0.26.3
	strum_macros@0.26.4
	syn@1.0.109
	syn@2.0.95
	sysinfo@0.31.4
	tap@1.0.1
	tar@0.4.43
	tempfile@3.15.0
	termcolor@1.4.1
	terminal_size@0.4.1
	thiserror-impl@1.0.69
	thiserror-impl@2.0.10
	thiserror@1.0.69
	thiserror@2.0.10
	thread_local@1.1.8
	threadpool@1.8.1
	time-core@0.1.2
	time-macros@0.2.19
	time@0.3.37
	tiny-keccak@2.0.2
	tokio-macros@2.5.0
	tokio-util@0.7.13
	tokio@1.43.0
	toml@0.8.19
	toml_datetime@0.6.8
	toml_edit@0.22.22
	tracing-attributes@0.1.28
	tracing-core@0.1.33
	tracing-error@0.2.1
	tracing-log@0.2.0
	tracing-subscriber@0.3.19
	tracing@0.1.41
	typenum@1.17.0
	ucd-trie@0.1.7
	uds_windows@1.1.0
	unicase@2.8.1
	unicode-ident@1.0.14
	unicode-segmentation@1.12.0
	unicode-truncate@1.1.0
	unicode-width@0.1.12
	unicode-width@0.2.0
	unicode-xid@0.2.6
	utf8parse@0.2.2
	valuable@0.1.0
	vergen@8.3.2
	version-compare@0.1.1
	version_check@0.9.5
	vsprintf@2.0.0
	vte@0.11.1
	vte_generate_state_changes@0.1.2
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.99
	wasm-bindgen-macro-support@0.2.99
	wasm-bindgen-macro@0.2.99
	wasm-bindgen-shared@0.2.99
	wasm-bindgen@0.2.99
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-core@0.57.0
	windows-implement@0.57.0
	windows-interface@0.57.0
	windows-result@0.1.2
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows@0.57.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winnow@0.6.22
	wrapcenum-derive@0.4.1
	wyz@0.5.1
	xattr@1.4.0
	xdg-home@1.3.0
	yaml-rust2@0.8.1
	zbus@5.2.0
	zbus_macros@5.2.0
	zbus_names@4.1.0
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
	zvariant@5.1.0
	zvariant_derive@5.1.0
	zvariant_utils@3.0.2
"

inherit cargo

DESCRIPTION="A Latency-criticality Aware Virtual Deadline (LAVD) scheduler based on sched_ext, which is a Linux kernel feature which enables implementing kernel thread schedulers in BPF and dynamically loading them. https://github.com/sched-ext/scx/tree/main"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="homepage field in Cargo.toml inaccessible to cargo metadata"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 GPL-2 ISC LGPL-2.1 MIT Unicode-DFS-2016 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/sched-ext/scx.git"
	SRC_URI="https://github.com/sched-ext/scx/archive/refs/heads/main.tar.gz -> scx_lavd.tar.gz
	${CARGO_CRATE_URIS}"
	S="${WORKDIR}/scx_lavd-9999/scheds/rust/scx_lavd"
	src_unpack() {
		git-r3_src_unpack
		cargo_live_src_unpack
	}
else
	COMMIT="18a80977bb26c5f625b087bd8275e1bfd51df4f3"
	SRC_URI="https://github.com/sched-ext/scx/archive/${COMMIT}.tar.gz -> scx_lavd.tar.gz
	${CARGO_CRATE_URIS}"
	S="${WORKDIR}/scx-main/scheds/rust/scx_lavd"
fi

