# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A fast and sensitive gapped read aligner"
HOMEPAGE="https://github.com/BenLangmead/bowtie2"
SRC_URI="https://github.com/BenLangmead/bowtie2/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/bowtie2-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-cpp/tbb"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake install prefix="${D}"/usr
}
