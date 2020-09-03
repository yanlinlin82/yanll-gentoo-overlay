# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Tools (in Java) for manipulating HTS data (SAM/BAM/CRAM/VCF)"
HOMEPAGE="https://broadinstitute.github.io/picard/"
SRC_URI="https://github.com/broadinstitute/picard/releases/download/${PV}/picard.jar -> ${P}.jar"
S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	: # disable 'unpack'
}

src_install() {
	dodir /opt/${P}
	cp -aL ${DISTDIR}/${P}.jar ${D}/opt/${P}/picard.jar

	mkdir -p ${D}/usr/bin
	cat >${D}/usr/bin/picard <<EOF
#!/bin/bash
java -jar /opt/${P}/picard.jar "\$*"
EOF
	chmod +x ${D}/usr/bin/picard
}
