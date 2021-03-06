# Created by: Alex Dupre <ale@FreeBSD.org>
# $FreeBSD$

PORTNAME=	pear
PORTVERSION=	1.10.1
CATEGORIES=	devel
MASTER_SITES=	http://mirror.miwibox.org/

MAINTAINER=	miwi@FreeBSD.org
COMMENT=	PEAR framework for PHP

LICENSE=	PHP301

USES=		cpe tar:bzip2
CPE_VENDOR=	php
NO_BUILD=	yes
NO_ARCH=	yes

WANT_PHP_CLI=	yes
USE_PHP=	pcre xml zlib
USE_PHP_BUILD=	yes

PEARDIR=	${PREFIX}/share/pear

post-patch:
	@${REINPLACE_CMD} -e "s|%%PREFIX%%|${PREFIX}|" \
		-e "s|%%BUNDLEDIR%%|${WRKSRC}/go-pear-bundle|" \
		-e "s|%%TMPDIR%%|/tmp/pear|" \
		${WRKSRC}/go-pear
	@cd ${WRKSRC}/go-pear-bundle && ${MKDIR} tmp && ${TAR} -C tmp -xf PEAR-${PORTVERSION}.tar
	@cd ${WRKSRC}/go-pear-bundle/tmp/PEAR-${PORTVERSION} && ${PATCH} -s -p0 < ${FILESDIR}/extra-patch-PEAR-Config.php
	@${RM} ${WRKSRC}/go-pear-bundle/tmp/PEAR-${PORTVERSION}/PEAR/Config.php.orig
	@${MD5} -q ${WRKSRC}/go-pear-bundle/tmp/PEAR-${PORTVERSION}/PEAR/Config.php > ${WRKSRC}/Config.php.md5
	@cd ${WRKSRC}/go-pear-bundle/tmp && ${TAR} -cf ../PEAR-${PORTVERSION}.tar PEAR-${PORTVERSION} package.xml

do-install:
	@cd ${WRKSRC} && ${SETENV} DESTDIR=${STAGEDIR} ${LOCALBASE}/bin/php -q ./go-pear
	@${SED} -i "" "s|<?php|<?php dl('pcre.so'); dl('xml.so');|" \
		${STAGEDIR}${PEARDIR}/peclcmd.php
# pear violates stage when staging as root, hide this
.if defined(PACKAGE_BUILDING)
	@${RM} -rf ${PEARDIR}
.endif
# Clean up orphans re-generated by pkg-install
	@${RM} -rf ${STAGEDIR}${PEARDIR}/.depdb ${STAGEDIR}${PEARDIR}/.depdblock ${STAGEDIR}${PEARDIR}/.filemap ${STAGEDIR}${PEARDIR}/.lock

.include <bsd.port.mk>
