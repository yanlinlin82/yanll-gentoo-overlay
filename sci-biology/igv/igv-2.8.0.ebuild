# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Integrative Genomics Viewer"
HOMEPAGE="https://igv.org/"
SRC_URI="https://data.broadinstitute.org/igv/projects/downloads/2.8/IGV_Linux_${PV}.zip -> ${P}.zip"
S="${WORKDIR}/IGV_Linux_${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dodir /opt/${P}
	cp -ar "${S}"/* "${D}"/opt/${P}

	dodir /usr/bin
	dosym /opt/${P}/igv.sh /usr/bin/igv.sh
	dosym /opt/${P}/igv_hidpi.sh /usr/bin/igv_hidpi.sh

	dodir /usr/share/applications
	cat >"${D}"/usr/share/applications/${PN}.desktop <<EOF
[Desktop Entry]
Name=IGV
Type=Application
Comment=${DESCRIPTION}
Exec=/usr/bin/igv.sh
Icon=/opt/${P}/IGV_64.png
Categories=Science;
EOF
	cat >"${D}"/usr/share/applications/${PN}-hidpi.desktop <<EOF
[Desktop Entry]
Name=IGV (HiDPI)
Type=Application
Comment=${DESCRIPTION}
Exec=/usr/bin/igv_hidpi.sh
Icon=/opt/${P}/IGV_64.png
Categories=Science;
EOF
}
