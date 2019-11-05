Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB28EF41A
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  5 Nov 2019 04:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBEE6E14A;
	Tue,  5 Nov 2019 03:35:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946C46E14A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  5 Nov 2019 03:35:32 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 19:35:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,269,1569308400"; 
 d="asc'?scan'208";a="226962636"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga004.fm.intel.com with ESMTP; 04 Nov 2019 19:35:30 -0800
Date: Tue, 5 Nov 2019 11:35:17 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Stop initializing pvinfo through reading
 mmio
Message-ID: <20191105033517.GD1769@zhen-hp.sh.intel.com>
References: <20191104053148.7161-1-tina.zhang@intel.com>
 <20191105025407.GC1769@zhen-hp.sh.intel.com>
 <237F54289DF84E4997F34151298ABEBC87799F55@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <237F54289DF84E4997F34151298ABEBC87799F55@SHSMSX101.ccr.corp.intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1538582434=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1538582434==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4vu0d+lqoSa2/ZEk"
Content-Disposition: inline


--4vu0d+lqoSa2/ZEk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.11.05 03:16:16 +0000, Zhang, Tina wrote:
> > -----Original Message-----
> > From: Zhenyu Wang <zhenyuw@linux.intel.com>
> > Sent: Tuesday, November 5, 2019 10:54 AM
> > To: Zhang, Tina <tina.zhang@intel.com>
> > Cc: intel-gvt-dev@lists.freedesktop.org
> > Subject: Re: [PATCH] drm/i915/gvt: Stop initializing pvinfo through rea=
ding
> > mmio
> >=20
> > On 2019.11.04 13:31:48 +0800, Tina Zhang wrote:
> > > The region of pvinfo is reserved for communication between a VMM and
> > > the GPU driver executing on a virtual machine. HW doesn't have any
> > > backing mmio store support for the pvinfo region, thus accessing to
> > > this range through MMIO read/write from host side is forbidden which
> > > is regarded as unclaimed register access.
> > >
> > > This patch leaves pvinfo range be initialized with zero.
> > >
> > > Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gvt/handlers.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c
> > > b/drivers/gpu/drm/i915/gvt/handlers.c
> > > index afd7f66bdc2d..bd12af349123 100644
> > > --- a/drivers/gpu/drm/i915/gvt/handlers.c
> > > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> > > @@ -3420,6 +3420,10 @@ int intel_gvt_for_each_tracked_mmio(struct
> > intel_gvt *gvt,
> > >  	}
> > >
> > >  	for (i =3D 0; i < gvt->mmio.num_mmio_block; i++, block++) {
> > > +		/* pvinfo data doesn't come from hw mmio */
> > > +		if (i915_mmio_reg_offset(block->offset) =3D=3D
> > VGT_PVINFO_PAGE)
> > > +			continue;
> >=20
> > Equal to remove PVINFO in mmio_block list? Could we just remove it there
> > instead of this special case?
> Commit 65f9f6feb wanted it to be kept in in mmio_block for performance co=
nsideration. Thanks.
>=20

oh, my bad, we need to handle PVINFO access anyway, not just for initial st=
ate.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

> > > +
> > >  		for (j =3D 0; j < block->size; j +=3D 4) {
> > >  			ret =3D handler(gvt,
> > >  				      i915_mmio_reg_offset(block->offset) + j,
> > > --
> > > 2.17.1
> > >
> >=20
> > --
> > Open Source Technology Center, Intel ltd.
> >=20
> > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--4vu0d+lqoSa2/ZEk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXcDt9QAKCRCxBBozTXgY
J4FgAJ49W4Sk7wetcmd/JQagtMja/dxsMgCgn5Tinx5torrpZdycT+YS2H3X01Y=
=8tGC
-----END PGP SIGNATURE-----

--4vu0d+lqoSa2/ZEk--

--===============1538582434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1538582434==--
