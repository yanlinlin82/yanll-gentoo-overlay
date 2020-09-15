# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The world’s fastest framework for building websites"
HOMEPAGE="https://gohugo.io/"
SRC_URI="https://github.com/gohugoio/hugo/releases/download/v${PV}/${PN}_${PV}_Linux-64bit.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin hugo
	dodoc README.md
	dodoc LICENSE
}
