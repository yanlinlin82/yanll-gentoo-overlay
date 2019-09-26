# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="a SEQuencing data analysis PIPEline framework"
HOMEPAGE="https://github.com/yanlinlin82/seqpipe"
SRC_URI="https://github.com/yanlinlin82/seqpipe/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	into /usr/share/${PN}
	dobin seqpipe
	dobin seqpipe.history
	dobin uxcat

	insinto /usr/share/${PN}/bin
	doins default.pipe
	doins bioseq.pipe

	insinto /usr/share/${PN}
	doins -r examples/
	dosym /usr/share/${PN}/bin/seqpipe /usr/bin/seqpipe
	dosym /usr/share/${PN}/bin/seqpipe.history /usr/bin/seqpipe.history
	dosym /usr/share/${PN}/bin/uxcat /usr/bin/uxcat

	dodoc -r doc/
}
