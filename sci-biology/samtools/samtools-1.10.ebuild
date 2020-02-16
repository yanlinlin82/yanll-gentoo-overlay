# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit autotools

DESCRIPTION="Tools for manipulating next-generation sequencing data"
HOMEPAGE="http://htslib.org/"
SRC_URI="https://github.com/samtools/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

LIBS="tinfo"

DEPEND="sci-libs/htslib"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}
