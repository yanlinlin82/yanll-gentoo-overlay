# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The BLAST-Like Alignment Tool, a fast genomic sequence aligner"
HOMEPAGE="http://www.cse.ucsc.edu/~kent/
http://genome.ucsc.edu/cgi-bin/hgBlat
http://genome.ucsc.edu/goldenPath/help/blatSpec.html"
SRC_URI="https://genome-test.gi.ucsc.edu/~kent/src/${PN}Src${PV}.zip"
S="${WORKDIR}/blatSrc"

LICENSE="blat"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	export HOME=${S}
	export MACHTYPE=x86_64
	mkdir -p ${S}/bin/${MACHTYPE}
	default
}

src_install() {
	export MACHTYPE=x86_64
	dobin bin/${MACHTYPE}/*
}
