# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A developer platform for building all your app"
HOMEPAGE="https://dotnet.microsoft.com/"
SRC_URI="https://download.visualstudio.microsoft.com/download/pr/2d72ee67-ac4d-42c6-97d9-a26a28201fc8/977ad14b99b6ed03dcefd6655789e43a/${P}-linux-x64.tar.gz"
S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-util/dotnet-runtime"
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT=strip

src_install() {
	dodir /opt/dotnet/shared
	cp -ar shared/Microsoft.AspNetCore.App ${D}/opt/dotnet/shared
}
