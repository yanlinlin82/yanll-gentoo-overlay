# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Visual Studio Code"
HOMEPAGE="https://code.visualstudio.com/"
SRC_URI="https://az764295.vo.msecnd.net/stable/c47d83b293181d9be64f27ff093689e8e7aed054/code-stable-1581433181.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/VSCode-linux-x64"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dodir /opt/${P}
	cp -arv ${S}/* ${D}/opt/${P}

	dodir /usr/bin
	dosym /opt/${P}/code /usr/bin/code

	dodir /usr/share/applications
	cat >"${D}"/usr/share/applications/${PN}.desktop <<EOF
[Desktop Entry]
Name=VSCode
Type=Application
Comment=${DESCRIPTION}
Exec=/usr/bin/code
Icon=/opt/${P}/resources/app/resources/linux/code.png
Categories=Development;
EOF
}