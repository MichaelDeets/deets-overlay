# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Scripts for bashrc.d and package.cflags, updated and changed from GentooLTO."

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="app-portage/portage-bashrc-mv"
DEPEND="${RDEPEND}"

pkg_preinst() {
	insopts -m 0644
	insinto /etc/portage/package.cflags
	doins "${FILESDIR}/package.cflags/world"
	doins "${FILESDIR}/package.cflags/legacy"
	doins "${FILESDIR}/package.cflags/other"
	insopts -m 0755
	insinto /etc/portage/bashrc.d
	doins "${FILESDIR}/bashrc.d/42-flag-o-matic.sh"
	doins "${FILESDIR}/bashrc.d/43-no-common.sh"
}
