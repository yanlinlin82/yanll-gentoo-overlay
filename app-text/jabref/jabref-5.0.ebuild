# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Graphical Java application for managing BibTeX and biblatex (.bib) databases"
HOMEPAGE="https://www.jabref.org/"
SRC_URI="https://github.com/JabRef/jabref/releases/download/v5.0/JabRef-5.0-portable_linux.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/JabRef"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dodir /opt/${P}
	cp -r * ${D}/opt/${P}

	dosym /opt/${P}/bin/JabRef /usr/bin/JabRef

	dodir /usr/share/applications
	cat >"${D}"/usr/share/applications/${PN}.desktop <<EOF
[Desktop Entry]
Name=JabRef
Type=Application
Comment=${DESCRIPTION}
Exec=/usr/bin/JabRef
Icon=/opt/${P}/lib/JabRef.png
Categories=Science;
EOF
}
