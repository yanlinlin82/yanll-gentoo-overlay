# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="GitHub CLI"
HOMEPAGE="https://cli.github.com/"
SRC_URI="https://github.com/cli/cli/releases/download/v${PV}/gh_${PV}_linux_amd64.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/gh_${PV}_linux_amd64"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin bin/gh
	dodoc README.md
	dodoc LICENSE
	dodoc CHANGELOG.md
}
