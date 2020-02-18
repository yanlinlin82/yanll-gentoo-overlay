# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="UCSC Genome Browser"
HOMEPAGE="https://genome.ucsc.edu/"
SRC_URI="https://github.com/ucscGenomeBrowser/kent/archive/v${PV}_base.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/kent-${PV}_base"

LICENSE="UCSC-Genome-Browser"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	find ./ -type f -name '*.[hc]' \
		| while read f; do
			if (grep -q -F 'mysql.h>' $f); then
				sed -i 's,<mysql.h>,<mysql/mysql.h>,' $f
				sed -i 's,<mysql/mysql.h>,<mariadb/mysql.h>,' $f
			fi
		done
	find ./ -type f -name '*.pl' \
		| while read f; do
			if (grep -q -F '/usr/local/bin/perl' $f); then
				sed -i 's,/usr/local/bin/perl,/usr/bin/perl,' $f
			fi
		done
	sed -i 's,^\tbdfToGem,\t${DESTDIR}${BINDIR}/bdfToGem,' src/utils/bdfToGem/makefile
}

src_compile() {
	export HOME="${S}"
	export MACHTYPE="x86_64"
	mkdir -p bin/${MACHTYPE} || die
	#emake -C src
	for d in src/jkOwnLib/ src/lib/ src/htslib/ src/hg/lib \
			$(ls -d src/utils/*/ | egrep -v 'bdfToGem|ccCpLock|chromColors|colorConv|geneStarts|plotDataMatrix') \
			src/gfServer/ src/gfClient/ \
			src/hg/liftOver; do
			#$(ls -d src/hg/*/ | egrep -v 'altGraph|cartDump|cartReset|cgiExample'); do
		if [ -e $d/Makefile -o -e $d/makefile ]; then
			emake -C $d
		fi
	done
}

src_install() {
	export MACHTYPE="x86_64"
	dobin bin/${MACHTYPE}/*
}
