# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $FreeBSD$

PORTNAME=	oauth2
PORTVERSION=	1.1.0
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Ruby wrapper for the OAuth 2.0 protocol

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE.md

RUN_DEPENDS=	rubygem-faraday>=0.8:www/rubygem-faraday \
		rubygem-jwt>=1:www/rubygem-jwt \
		rubygem-multi_json>=1.3:devel/rubygem-multi_json \
		rubygem-multi_xml>=0.5:textproc/rubygem-multi_xml \
		rubygem-rack16>=1.2:www/rubygem-rack16

NO_ARCH=	yes
USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

.include <bsd.port.mk>
