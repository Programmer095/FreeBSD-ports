# Created by: Grzegorz Blach <gblach@FreeBSD.org>
# $FreeBSD$

PORTNAME=	e-module-everything-websearch
PORTVERSION=	20140818
CATEGORIES=	x11-wm enlightenment
MASTER_SITES=	LOCAL/gblach/enlightenment/

MAINTAINER=	enlightenment@FreeBSD.org
COMMENT=	Enlightenment websearch plugin for the "everything" module

BUILD_DEPENDS=	enlightenment:x11-wm/enlightenment
RUN_DEPENDS=	enlightenment:x11-wm/enlightenment
LIB_DEPENDS=	libcurl.so:ftp/curl

DIST_SUBDIR=	enlightenment
GNU_CONFIGURE=	yes
USES=		gmake libtool pkgconfig tar:xz
INSTALL_TARGET=	install-strip

.include "../enlightenment/Makefile.plist"

OPTIONS_DEFINE=	NLS

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
CONFIGURE_ARGS+=--enable-nls
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.include <bsd.port.mk>
