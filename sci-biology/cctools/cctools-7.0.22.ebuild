# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="large scale distributed computations on clusters"
HOMEPAGE="http://ccl.cse.nd.edu/"
SRC_URI="https://github.com/cooperative-computing-lab/${PN}/archive/release/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-release-${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${P}-soname.patch"
)

src_configure() {
	CFLAGS="${CFLAGS} -O0"           # disable gcc optimizing
	./configure --prefix="${D}"/usr  # use './configure' rather than 'econf', since it is not a standard 'configure'
}

src_install() {
	emake install
	rm -rf "${D}"/usr/etc
	rm -rf "${D}"/usr/doc
	rm -rf "${D}"/usr/include
	rm -rf "${D}"/usr/lib
}
