# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit versionator
# FIXME: for versions with last part < 10 pad with zeroes
# e.g 4 => 4000, 5.1 => 5100, 5.2.7 => 5207.
MY_PV=$(delete_all_version_separators)

DESCRIPTION="Speech analysis and synthesis"
SRC_URI="http://www.fon.hum.uva.nl/praat/${PN}${MY_PV}_sources.tar.gz"
HOMEPAGE="http://www.fon.hum.uva.nl/praat/"

KEYWORDS="~amd64 ~x86"
IUSE="alsa"
LICENSE="GPL-2"
SLOT="0"

DEPEND="
	|| (
		(
			x11-libs/libXmu
			x11-libs/libXt
			x11-libs/libX11
			x11-libs/libICE
			x11-libs/libXext
			x11-libs/libSM
			x11-libs/libXp
		)
		virtual/x11
	)
	x11-libs/openmotif"
RDEPEND="${DEPEND}"

S="${WORKDIR}/sources_${MY_PV}"

src_prepare() {
	if use alsa
	then
		cp "${S}/makefiles/makefile.defs.linux.alsa" "${S}/makefile.defs"
	else
		cp "${S}/makefiles/makefile.defs.linux.silent" "${S}/makefile.defs"
	fi
}

src_install() {
	dobin praat
	dodir /usr/share/${PN}
	insinto /usr/share/${PN}
	doins test/*
}
