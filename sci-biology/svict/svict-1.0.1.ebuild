# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Structural Variant detection in Circulating Tumor DNA"
HOMEPAGE="https://github.com/vpc-ccg/svict"
SRC_URI="https://github.com/vpc-ccg/svict/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Clear-BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin svict
}
