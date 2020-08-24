# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Basic Local Alignment Search Tool"
HOMEPAGE="https://blast.ncbi.nlm.nih.gov/"
SRC_URI="ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/${PV}/${P}+-x64-linux.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/ncbi-blast-${PV}+"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin bin/*
	dodoc README
	dodoc LICENSE
	dodoc ChangeLog
}
