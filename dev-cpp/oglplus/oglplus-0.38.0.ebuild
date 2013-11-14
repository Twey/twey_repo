EAPI=4

DESCRIPTION="OGLplus is a C++11 API for OpenGL 3+"
HOMEPAGE="http://oglplus.org"
SRC_URI="mirror://sourceforge/oglplus/oglplus-0.38.x/${P}.tar.gz"
# http://downloads.sourceforge.net/project/oglplus/oglplus-0.38.x/oglplus-0.38.0.tar.gz?r=http%3A%2F%2Foglplus.org%2F&ts=1384427521&use_mirror=surfnet
LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64"

restrict="mirror"

IUSE="inkscape png"

RDEPEND="dev-libs/boost
         virtual/opengl
         inkscape? ( media-gfx/inkscape )
         png? ( media-libs/libpng )"
DEPEND="${RDEPEND}
        dev-util/cmake"

src_configure() {
    ./configure.sh --prefix="${D}/usr" || die "Configuration failed"
}

src_build() {
    cd _build
    make ${MAKEOPTS} || die "Could not build"
}
        
src_install() {
    cd _build
    make install || die "Could not install"
    cd ..
    dodoc -r doc/ CHANGELOG README.rst
}
