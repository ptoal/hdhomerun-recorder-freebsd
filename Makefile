# $FreeBSD$

PORTNAME=	recorder
PORTVERSION=	0.1a
CATEGORIES=	multimedia
MASTER_SITES=	http://download.silicondust.com/hdhomerun/
PKGNAMEPREFIX=  hdhomerun-
DISTNAME=	hdhomerun_record_freebsd
EXTRACT_SUFX=
EXTRACT_ONLY=

MAINTAINER=	info@silicondust.com
COMMENT=	HDHomeRun DVR Recording Engine

LICENSE=	SiliconDust
LICENSE_NAME=	SiliconDust EULA
LICENSE_TEXT=	SiliconDust EULA TO BE INCLUDED HERE
LICENSE_PERMS=

IA32_BINARY_PORT=	yes

# The recorder is a single binary at the moment.  Nothing to be built,
# and no file extraction.
NO_WRKSUBDIR=	yes
NO_BUILD=       yes

USE_RC_SUBR=	hdhomerun_record

USERS=	hdhomerun
GROUPS=	hdhomerun

post-extract:
	${CP} ${DISTDIR}/${DISTNAME} ${WRKSRC}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${DISTNAME} \
		${STAGEDIR}${PREFIX}/bin/${PKGNAMEPREFIX}${PORTNAME}
	${INSTALL_DATA} ${FILESDIR}/hdhomerun.conf ${STAGEDIR}${PREFIX}/etc/hdhomerun.conf.sample

.include <bsd.port.mk>
