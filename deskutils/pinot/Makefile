# Created by: Thierry Thomas <thierry@pompo.net>
# $FreeBSD$

PORTNAME=	pinot
PORTVERSION=	1.06
PORTREVISION=	11
CATEGORIES=	deskutils
MASTER_SITES=	GOOGLE_CODE
#MASTER_SITES=	http://colinf.chez.com/pinot/
#		http://amra.dyndns.org/

MAINTAINER=	thierry@FreeBSD.org
COMMENT=	Personal search and metasearch for the Free Desktop

LICENSE=	GPLv2

BUILD_DEPENDS=	desktop-file-install:devel/desktop-file-utils \
		update-mime-database:misc/shared-mime-info
LIB_DEPENDS=	libxapian.so:databases/xapian-core		\
		libgtkmm-2.4.so:x11-toolkits/gtkmm24	\
		libexttextcat-2.0.so:textproc/libexttextcat	\
		libdbus-glib-1.so:devel/dbus-glib		\
		libxml++-2.6.so:textproc/libxml++26	\
		libboost_thread.so:devel/boost-libs		\
		libexecinfo.so:devel/libexecinfo		\
		libexif.so:graphics/libexif			\
		libexiv2.so:graphics/exiv2			\
		libgmime-2.4.so:mail/gmime24		\
		libtag.so:audio/taglib			\
		libcurl.so:ftp/curl
RUN_DEPENDS=	update-mime-database:misc/shared-mime-info	\
		antiword:textproc/antiword			\
		xdg-open:devel/xdg-utils			\
		${LOCALBASE}/libexec/xpdf/pdftotext:graphics/xpdf	\
		catppt:textproc/catdoc			\
		unzip:archivers/unzip			\
		unrtf:textproc/unrtf			\
		catdvi:print/catdvi				\
		bash:shells/bash

PROJECTHOST=	${PORTNAME}-search

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-http=curl --with-ssl=${OPENSSLBASE} --enable-libarchive	\
		--enable-mempool=no
CONFIGURE_ENV=	MKDIR_P="${MKDIR}"
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib -lboost_system

USES=		gettext libarchive libtool pkgconfig python shebangfix
USE_OPENSSL=	yes
USE_SQLITE=	3
USE_XORG=	pixman
USE_LDCONFIG=	${PREFIX}/lib/pinot/backends ${PREFIX}/lib/pinot/filters
SHEBANG_FILES=	scripts/bash/*.sh

OPTIONS_DEFINE=	DEBUG CHMLIB DOCS
OPTIONS_SUB=	yes

DEBUG_CONFIGURE_ON=	--enable-debug=yes

CHMLIB_CONFIGURE_ON=	--enable-chmlib=yes
CHMLIB_CONFIGURE_OFF=	--disable-chmlib
CHMLIB_LIB_DEPENDS=	libchm.so:misc/chmlib

INSTALLS_ICONS=	yes

DOCS=		AUTHORS ChangeLog ChangeLog-dijon INSTALL NEWS README TODO

LM2FIX=		textcat_conf.txt textcat3_conf.txt textcat31_conf.txt textcat32_conf.txt
SHR2FIX=	Core/pinot-search.1 README
UL2FIX=		Utils/xdgmime/xdgmime.c

post-extract:
# remove pre-generated messages catalogs
	${FIND} ${WRKSRC}/po -name "*.gmo" -delete

post-patch:
	${REINPLACE_CMD} -e \
		'/<command>/s|pdftotext|${LOCALBASE}/libexec/xpdf/pdftotext|' \
		${WRKSRC}/Tokenize/filters/external-filters.xml

pre-configure:
	${REINPLACE_CMD} -e 's|/usr/share|${LOCALBASE}/share|'	\
		${LM2FIX:S|^|${WRKSRC}/|}
	${REINPLACE_CMD} -e 's|libtextcat/|libtextcat/LM/|'	\
		${WRKSRC}/textcat_conf.txt
	${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|'	\
		${UL2FIX:S|^|${WRKSRC}/|}
	${REINPLACE_CMD} -e 's|/usr/share|${PREFIX}/share|'	\
		${SHR2FIX:S|^|${WRKSRC}/|}
	${REINPLACE_CMD} -e 's|Icon=pinot.png|Icon=pinot|g' \
		${WRKSRC}/*.desktop

post-install:
	${TOUCH} ${STAGEDIR}${DATADIR}/stopwords/.empty_file

post-install-DOCS-on:
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${DOCS:S|^|${WRKSRC}/|} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
