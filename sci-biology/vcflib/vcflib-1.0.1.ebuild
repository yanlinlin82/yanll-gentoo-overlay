# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="C++ library and cmdline tools for parsing and manipulating VCF files"
HOMEPAGE="https://github.com/vcflib/vcflib#vcflib"
SRC_URI="https://github.com/vcflib/${PN}/releases/download/v${PV}/${P}-src.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${P}-src"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin bin/*
}
