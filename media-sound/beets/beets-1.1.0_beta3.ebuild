EAPI=5
PYTHON_COMPAT=( python2_5 python2_6 python2_7 )

inherit distutils-r1

MY_PV=${PV/_beta/-beta.}
MY_P=${PN}-${MY_PV}

DESCRIPTION="A media library management system for obsessive-compulsive music geeks"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"
HOMEPAGE="http://beets.radbox.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="bpd chroma convert doc echonest_tempo lastgenre replaygain web"

RDEPEND="
    dev-python/pyyaml
	dev-python/munkres
	>=dev-python/python-musicbrainz-ngs-0.3
	dev-python/unidecode
	media-libs/mutagen
	bpd? ( dev-python/bluelet )
	chroma? ( dev-python/pyacoustid )
	convert? ( media-video/ffmpeg[encode] )
	doc? ( dev-python/sphinx )
	echonest_tempo? ( dev-python/pyechonest )
	lastgenre? ( dev-python/pylast )
	replaygain? ( || ( media-sound/mp3gain media-sound/aacgain ) )
	web? ( dev-python/flask )
"

DEPEND="${RDEPEND}
	dev-python/setuptools"

S="${WORKDIR}/${MY_P}"

