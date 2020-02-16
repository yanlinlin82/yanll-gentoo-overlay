# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="C library for high-throughput sequencing data formats"
HOMEPAGE="http://www.htslib.org/"
SRC_URI="https://github.com/samtools/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {

	emake install prefix="${D}"/usr

	dodir $(get_libdir) \
		&& mv "${D}"/usr/lib/*.so* "${D}"/$(get_libdir)

	if ! use static-libs; then
		rm "${D}"/usr/lib/libhts.a
	fi
}
