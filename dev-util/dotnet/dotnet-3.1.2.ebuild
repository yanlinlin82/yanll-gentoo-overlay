# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A developer platform for building all your app"
HOMEPAGE="https://dotnet.microsoft.com/"
SRC_URI="https://download.visualstudio.microsoft.com/download/pr/38269fba-9fdb-4723-a14c-067cc316827d/53e4161da346d70404375fb8804ee91a/dotnet-runtime-3.1.2-linux-x64.tar.gz"
S="${WORKDIR}"

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
	dosym /opt/${P}/dotnet /usr/bin/dotnet
}
