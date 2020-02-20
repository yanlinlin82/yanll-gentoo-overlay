# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Utilities for Gentoo Linux"
HOMEPAGE="https://github.com/yanlinlin82/gentoo-utils"
SRC_URI="https://github.com/yanlinlin82/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dodir /etc/profile.d
	cp -av gentoo-utils.sh ${D}/etc/profile.d
	dodir /usr/share/doc/${P}
	cp -av README.md LICENSE ${D}/usr/share/doc/${P}
}
