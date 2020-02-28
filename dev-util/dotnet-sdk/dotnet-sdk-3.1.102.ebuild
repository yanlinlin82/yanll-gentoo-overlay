# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A developer platform for building all your app"
HOMEPAGE="https://dotnet.microsoft.com/"
SRC_URI="https://download.visualstudio.microsoft.com/download/pr/57e63f03-ebdf-4c22-96ff-2b85dc70cf7f/988576869e82a80f4a97ca5a733a5295/${P}-linux-x64.tar.gz"
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
	dodir /opt/dotnet
	cp -ar packs sdk templates ${D}/opt/dotnet
	dodir /opt/dotnet/shared
	cp -ar shared/Microsoft.AspNetCore.App ${D}/opt/dotnet/shared
}
