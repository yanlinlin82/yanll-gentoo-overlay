# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="UCSC Genome Browser"
HOMEPAGE="https://genome.ucsc.edu/"
SRC_URI="https://github.com/ucscGenomeBrowser/${PN}/archive/v${PV}_base.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${P}_base"

LICENSE="Kent-Informatics"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="sci-biology/blat"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${P}-gentoo.patch"
)

src_compile() {
	export HOME=${S}
	export MACHTYPE=x86_64
	export CGI_BIN=${S}/cgi-bin
	export DOCUMENTROOT=${S}/htdocs
	export USER=kent
	mkdir -pv ${S}/bin/${MACHTYPE}
	mkdir -pv ${S}/cgi-bin-${USER}
	mkdir -pv ${S}/htdocs
	emake -C src
	emake -C src/utils scripts
}

src_install() {
	export MACHTYPE="x86_64"
	export USER=kent
	mkdir -pv ${D}/opt/${P}
	cp -av bin cgi-bin-${USER} htdocs ${D}/opt/${P}/

	# create symbolic links to all output executable files
	mkdir -pv ${D}/usr/bin
	(cd ${D}/opt/${P}/bin && find */ -type f -executable) \
		| while read f; do
			dosym /opt/${P}/bin/$f /usr/bin/$(basename $f)
		done

	# remove files that have existed in 'sci-biology/blat'
	for f in blat \
			faToTwoBit faToNib nibFrag twoBitToFa twoBitInfo \
			gfClient gfServer pslPretty pslReps pslSort; do
		rm ${D}/usr/bin/$f
	done
}
