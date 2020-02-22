# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A new way to see and navigate directory trees"
HOMEPAGE="https://dystroy.org/broot"
SRC_URI="https://github.com/Canop/${PN}/releases/download/v${PV}/release.zip -> ${P}.zip"
S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin build/x86_64-linux/broot
	dodir /etc/profile.d
	cp -av build/completion/br.bash ${D}/etc/profile.d/br.sh
}
