# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils

DESCRIPTION="A full-featured mind mapping and brainstorming tool"
HOMEPAGE="https://www.xmind.net/"
SRC_URI="https://www.xmind.cn/xmind/downloads/XMind-ZEN-for-Linux-amd-64bit-10.0.0-201911260056.deb -> ${P}.deb"
S="${WORKDIR}"

LICENSE="xmind"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT=strip

src_unpack() {
	default
	tar xf control.tar.gz
	tar xf data.tar.xz
}

src_install() {
	cp -a opt usr ${D}
	mv ${D}/usr/share/doc/xmind-vana/ ${D}/usr/share/doc/${P}/
	gunzip ${D}/usr/share/doc/${P}/changelog.gz
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
