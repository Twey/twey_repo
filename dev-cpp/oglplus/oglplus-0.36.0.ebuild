EAPI=4

DESCRIPTION="OGLplus is a C++11 API for OpenGL 3+"
HOMEPAGE="http://oglplus.org"
SRC_URI="mirror://sourceforge/oglplus/${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="inkscape png"

RDEPEND="virtual/opengl
         inkscape? ( media-gfx/inkscape )
         png? ( media-libs/libpng )"
DEPEND="${RDEPEND}
        dev-util/cmake"

src_configure() {
    ./configure.sh --prefix="${D}"
}

src_install() {
    cd _build
    ./configure.sh --build-and-install || die "Could not install"

    dodoc doc/ CHANGELOG README.rst || die "Could not install docs"
}
