# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Re-using bashrc.d scripts from the deprecated GentooLTO project"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="app-portage/portage-bashrc-mv"
DEPEND="${RDEPEND}"

pkg_preinst() {
	insinto /etc/portage/bashrc.d
	insopts -m 0755
	doins "${FILESDIR}/42-flag-o-matic.sh"
	doins "${FILESDIR}/43-no-common.sh"
}
