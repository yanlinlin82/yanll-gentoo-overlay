# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A developer platform for building all your app"
HOMEPAGE="https://dotnet.microsoft.com/"
SRC_URI="https://download.visualstudio.microsoft.com/download/pr/38269fba-9fdb-4723-a14c-067cc316827d/53e4161da346d70404375fb8804ee91a/${P}-linux-x64.tar.gz"
S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dodir /opt/dotnet
	cp -arv * ${D}/opt/dotnet

	dodir /usr/bin
	dosym /opt/dotnet/dotnet /usr/bin/dotnet # keep symbolic, make sure 'dotnet' could locate 'host/fxr/'
	dolib.so /opt/dotnet/host/fxr/3.1.2/libhostfxr.so # copy file, to archive ebuild QA standard

	dodir /etc/profile.d
	echo 'export DOTNET_ROOT=/opt/dotnet' > ${D}/etc/profile.d/dotnet.sh
}
