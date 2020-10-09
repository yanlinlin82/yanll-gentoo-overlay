# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="Disk Usage/Free Utility (Linux, BSD, macOS & Windows)"
HOMEPAGE="https://github.com/muesli/duf"

EGO_SUM=(
	"github.com/jedib0t/go-pretty/v6 v6.0.4"
	"github.com/jedib0t/go-pretty/v6 v6.0.4/go.mod"
	"github.com/muesli/termenv v0.7.2"
	"github.com/muesli/termenv v0.7.2/go.mod"
	"golang.org/x/crypto v0.0.0-20200820211705-5c72a883971a"
	"golang.org/x/crypto v0.0.0-20200820211705-5c72a883971a/go.mod"
	"golang.org/x/sys v0.0.0-20200918174421-af09f7315aff"
	"golang.org/x/sys v0.0.0-20200918174421-af09f7315aff/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/mattn/go-runewidth v0.0.9"
	"github.com/mattn/go-runewidth v0.0.9/go.mod"
	"github.com/pkg/profile v1.2.1"
	"github.com/pkg/profile v1.2.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/stretchr/testify v1.2.2"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"golang.org/x/sys v0.0.0-20180816055513-1c9583448a9c"
	"golang.org/x/sys v0.0.0-20180816055513-1c9583448a9c/go.mod"
	"github.com/lucasb-eyer/go-colorful v1.0.3"
	"github.com/lucasb-eyer/go-colorful v1.0.3/go.mod"
	"github.com/mattn/go-isatty v0.0.12"
	"github.com/mattn/go-isatty v0.0.12/go.mod"
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42"
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"
	"github.com/google/goterm v0.0.0-20190703233501-fc88cf888a3f"
	"github.com/google/goterm v0.0.0-20190703233501-fc88cf888a3f/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/text v0.3.0"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	)
go-module_set_globals
SRC_URI="https://github.com/muesli/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	go build -ldflags '-extldflags=-fno-PIC' . || die
}

src_install() {
	dobin duf
	dodoc README.md
}
