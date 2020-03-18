# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="large scale distributed computations on clusters"
HOMEPAGE="http://ccl.cse.nd.edu/"
SRC_URI="https://github.com/cooperative-computing-lab/${PN}/archive/release/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-release-${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="-doc static-libs"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	CFLAGS="${CFLAGS} -O0"           # disable gcc optimizing
	./configure --prefix="${D}"/usr  # use './configure' rather than 'econf', since it is not a standard 'configure'
}

src_install() {
	emake install
	rmdir "${D}"/usr/man
	dodir $(get_libdir)
	mv "${D}"/usr/lib/{lib,lib64,*.so*} "${D}"/$(get_libdir)
	mv "${D}"/usr/share/{${PN},${P}}
	mv "${D}"/usr/etc "${D}"/usr/share/${P}/etc
	if use doc; then
		mv "${D}"/usr/doc "${D}"/usr/share/${P}/doc
	else
		rm -r "${D}"/usr/doc
	fi
	gunzip "${D}"/usr/share/man/man1/*.gz
	if ! use static-libs; then
		rm "${D}"/usr/lib/lib*.a
	fi
}
