# Created by: ijliao
# $FreeBSD$

PORTNAME=	gruff
PORTVERSION=	0.6.0
PORTREVISION=	1
CATEGORIES=	graphics rubygems
MASTER_SITES=	RG

MAINTAINER=	ruby@FreeBSD.org
COMMENT=	Beautiful graphing library for Ruby using RMagick

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

RUN_DEPENDS=	rubygem-rmagick>=2.13.4:graphics/rubygem-rmagick

NO_ARCH=	yes
USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes
USES=		shebangfix
SHEBANG_FILES=	test/image_compare.rb
ruby_OLD_CMD=	ruby

.include <bsd.port.mk>
