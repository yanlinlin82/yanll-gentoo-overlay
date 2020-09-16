# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="An easy, open source way for everyone to ask questions and learn from data."
HOMEPAGE="https://www.metabase.com/"
SRC_URI="https://downloads.metabase.com/v${PV}/metabase.jar -> ${P}.jar"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	mkdir -p ${S}
	cp ${DISTDIR}/${P}.jar ${S}/${PN}.jar
}

src_prepare() {
	default
}

src_install() {
	dodir /opt/${P}
	cp -arv ${S}/${PN}.jar ${D}/opt/${P}/

	dodir /usr/bin
	cat >"${D}"/usr/bin/${PN} <<EOF
#!/bin/bash

java -jar /opt/${P}/${PN}.jar \"\$*\"
EOF
	chmod +x "${D}"/usr/bin/${PN}
}
