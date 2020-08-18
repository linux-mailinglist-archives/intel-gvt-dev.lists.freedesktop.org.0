Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1380248093
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Aug 2020 10:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8242889F01;
	Tue, 18 Aug 2020 08:28:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D533589F01
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Aug 2020 08:28:27 +0000 (UTC)
IronPort-SDR: bPpp05hGuH/4Vo0BZujSGZ/6D/nuHrThQpltUPNo7Cr88wb3Rn9xKLnp4V8NR1gkJBIyXtVLRk
 nwyOoAU+fd/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="172912042"
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
 d="asc'?scan'208";a="172912042"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 01:28:27 -0700
IronPort-SDR: G27qsQAGDRkSuIULLWOj/d/QhI1kB6Gl6htCwcAuQbO4mOAg5PqldyziSHg2intoUgIOjFU6I9
 Vf3/G/8kS7OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
 d="asc'?scan'208";a="441147754"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga004.jf.intel.com with ESMTP; 18 Aug 2020 01:28:26 -0700
Date: Tue, 18 Aug 2020 16:10:01 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 0/4] some cleanup of cmdparser flags
Message-ID: <20200818081001.GC32450@zhen-hp.sh.intel.com>
References: <20200811055140.29123-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200811055140.29123-1-yan.y.zhao@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0378805822=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0378805822==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VMt1DrMGOVs3KQwf"
Content-Disposition: inline


--VMt1DrMGOVs3KQwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.08.11 13:51:40 +0800, Yan Zhao wrote:
> some cleanup patches for flags used in cmdparser.
>=20
> Yan Zhao (4):
>   drm/i915/gvt: rename F_IN_CTX flag to F_SR_IN_CTX
>   drm/i915/gvt: remove flag F_CMD_ACCESSED
>   drm/i915/gvt: add/modify interfaces for flag F_CMD_ACCESS
>   drm/i915/gvt: remove F_CMD_ACCESS flag for some registers
>=20
>  drivers/gpu/drm/i915/gvt/cmd_parser.c   |  6 ++--
>  drivers/gpu/drm/i915/gvt/gvt.h          | 44 ++++++++++++++-----------
>  drivers/gpu/drm/i915/gvt/handlers.c     | 28 +++++++++-------
>  drivers/gpu/drm/i915/gvt/mmio_context.c |  2 +-
>  4 files changed, 44 insertions(+), 36 deletions(-)
>=20

Besides some typo or description issue in commit message I'd fix when
apply, others look ok to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--VMt1DrMGOVs3KQwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXzuM2QAKCRCxBBozTXgY
J3MCAJ0eZ6CsY0kQTSLfvEiSeUm9oqIhhACfc7aX3ajmb5nfaakJndyiuiYMFY0=
=8yVU
-----END PGP SIGNATURE-----

--VMt1DrMGOVs3KQwf--

--===============0378805822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0378805822==--
