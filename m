Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E192A187E30
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 17 Mar 2020 11:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9540889FD3;
	Tue, 17 Mar 2020 10:22:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2694A89FD3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 17 Mar 2020 10:22:22 +0000 (UTC)
IronPort-SDR: btmzsPed87SpMp2SewugZIERcUHSVCXDdVuwo3gypNoPpAWt+gF6ck7hpfsEgC/ADiGdRqNDZC
 wPLRq/9p2vRA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 03:22:21 -0700
IronPort-SDR: /y8SYcxepV1isXA1gCsKrtnO/2VzQXEURtTzflaSa7svniyG6CSqQAr/UjV6AqTRC25GHKvxww
 KwYzndjMGC3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; 
 d="asc'?scan'208";a="445447604"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga006.fm.intel.com with ESMTP; 17 Mar 2020 03:22:20 -0700
Date: Tue, 17 Mar 2020 18:09:40 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Add some regs to force-to-nonpriv whitelist
Message-ID: <20200317100940.GO8880@zhen-hp.sh.intel.com>
References: <20200302083130.17831-1-tina.zhang@intel.com>
 <BN6PR11MB1666D99D7E822DDFFDF826D789F90@BN6PR11MB1666.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR11MB1666D99D7E822DDFFDF826D789F90@BN6PR11MB1666.namprd11.prod.outlook.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0466654993=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0466654993==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3CAnR4CLEnEWqRMR"
Content-Disposition: inline


--3CAnR4CLEnEWqRMR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On 2020.03.16 00:17:48 +0000, Zhang, Tina wrote:
> Hi,
>=20
> We need this patch to solve the complains like this:
>=20
> [70811.201818] gvt: vgpu(1) Invalid FORCE_NONPRIV write 2341 at offset 24=
d8
> [70811.201825] gvt: vgpu(1) Invalid FORCE_NONPRIV write 2351 at offset 24=
dc
> [70811.201831] gvt: vgpu(1) Invalid FORCE_NONPRIV write 10000d82 at offse=
t 24e0
> [70811.201837] gvt: vgpu(1) Invalid FORCE_NONPRIV write 10064844 at offse=
t 24e4
>=20
> BR,
> Tina
>=20
> > -----Original Message-----
> > From: Zhang, Tina <tina.zhang@intel.com>
> > Sent: Monday, March 2, 2020 4:32 PM
> > Cc: Zhang, Tina <tina.zhang@intel.com>; intel-gvt-dev@lists.freedesktop=
=2Eorg;
> > zhenyuw@linux.intel.com
> > Subject: [PATCH] drm/i915/gvt: Add some regs to force-to-nonpriv whitel=
ist
> >=20
> > Those regs are added in order to slove the following complains:
> >=20
> >  [70811.201818] gvt: vgpu(1) Invalid FORCE_NONPRIV write 2341 at offset
> > 24d8  [70811.201825] gvt: vgpu(1) Invalid FORCE_NONPRIV write 2351 at
> > offset 24dc  [70811.201831] gvt: vgpu(1) Invalid FORCE_NONPRIV write
> > 10000d82 at offset 24e0  [70811.201837] gvt: vgpu(1) Invalid
> > FORCE_NONPRIV write 10064844 at offset 24e4
> >=20
> > So solve them by adding the required regs to the whitelist.
> >

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

> > Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/handlers.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c
> > b/drivers/gpu/drm/i915/gvt/handlers.c
> > index 1793f6991fa8..0946d5618d29 100644
> > --- a/drivers/gpu/drm/i915/gvt/handlers.c
> > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> > @@ -460,11 +460,14 @@ static int pipeconf_mmio_write(struct intel_vgpu
> > *vgpu, unsigned int offset,
> >  	return 0;
> >  }
> >=20
> > -/* ascendingly sorted */
> > +/* sorted in ascending order */
> >  static i915_reg_t force_nonpriv_white_list[] =3D {
> > +	_MMIO(0xd80),
> >  	GEN9_CS_DEBUG_MODE1, //_MMIO(0x20ec)
> >  	GEN9_CTX_PREEMPT_REG,//_MMIO(0x2248)
> > -	PS_INVOCATION_COUNT,//_MMIO(0x2348)
> > +	CL_PRIMITIVES_COUNT, //_MMIO(0x2340)
> > +	PS_INVOCATION_COUNT, //_MMIO(0x2348)
> > +	PS_DEPTH_COUNT, //_MMIO(0x2350)
> >  	GEN8_CS_CHICKEN1,//_MMIO(0x2580)
> >  	_MMIO(0x2690),
> >  	_MMIO(0x2694),
> > @@ -489,6 +492,7 @@ static i915_reg_t force_nonpriv_white_list[] =3D {
> >  	_MMIO(0xe18c),
> >  	_MMIO(0xe48c),
> >  	_MMIO(0xe5f4),
> > +	_MMIO(0x64844),
> >  };
> >=20
> >  /* a simple bsearch */
> > --
> > 2.17.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--3CAnR4CLEnEWqRMR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXnCh5AAKCRCxBBozTXgY
J0elAKCGsA/Er7CO/KfbIeBWpXmLqCEg2QCgkHNAwVPyGTxYn9iePnzIhTdcgF4=
=/XTu
-----END PGP SIGNATURE-----

--3CAnR4CLEnEWqRMR--

--===============0466654993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0466654993==--
