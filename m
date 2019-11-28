Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F212110C276
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 28 Nov 2019 03:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9759B6E5EA;
	Thu, 28 Nov 2019 02:40:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB876E5EA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 28 Nov 2019 02:40:50 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 18:40:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,251,1571727600"; 
 d="asc'?scan'208";a="261176125"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Nov 2019 18:40:49 -0800
Date: Thu, 28 Nov 2019 10:39:43 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Gao, Fred" <fred.gao@intel.com>
Subject: Re: [PATCH v1] drm/i915/gvt: Fix guest boot warning
Message-ID: <20191128023943.GT4196@zhen-hp.sh.intel.com>
References: <20191126161904.25281-1-fred.gao@intel.com>
 <20191127045329.GM4196@zhen-hp.sh.intel.com>
 <12E1D2244F454645A164A13EDCBDDB3B42A5247E@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <12E1D2244F454645A164A13EDCBDDB3B42A5247E@SHSMSX104.ccr.corp.intel.com>
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
Content-Type: multipart/mixed; boundary="===============2058019584=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2058019584==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mixpuywmQk4RxeDV"
Content-Disposition: inline


--mixpuywmQk4RxeDV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.11.27 08:51:49 +0000, Gao, Fred wrote:
> Thanks, comments in line.
>=20
> -----Original Message-----
> From: Zhenyu Wang <zhenyuw@linux.intel.com>=20
> Sent: 2019=E5=B9=B411=E6=9C=8827=E6=97=A5 12:53
> To: Gao, Fred <fred.gao@intel.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Subject: Re: [PATCH v1] drm/i915/gvt: Fix guest boot warning
>=20
> On 2019.11.27 00:19:04 +0800, Gao, Fred wrote:
> > Simulate MIA core in reset status once GUC engine is reset.
> >=20
> > Signed-off-by: Gao Fred <fred.gao@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/handlers.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c=20
> > b/drivers/gpu/drm/i915/gvt/handlers.c
> > index 3de664deb2f8..78f4d41b9005 100644
> > --- a/drivers/gpu/drm/i915/gvt/handlers.c
> > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> > @@ -341,6 +341,11 @@ static int gdrst_mmio_write(struct intel_vgpu *vgp=
u, unsigned int offset,
> >  			gvt_dbg_mmio("vgpu%d: request VCS2 Reset\n", vgpu->id);
> >  			engine_mask |=3D BIT(VCS1);
> >  		}
> > +		if (data & GEN9_GRDOM_GUC) {
> > +			gvt_dbg_mmio("vgpu%d: request GUC Reset\n", vgpu->id);
> > +			vgpu_vreg(vgpu, i915_mmio_reg_offset(GUC_STATUS))
> > +				|=3D GS_MIA_IN_RESET;
> > +		}
>=20
> Can write as vgpu_vreg_t(vgpu, GUC_STATUS) =3D ...
> [fred] ok
> Looks we can do this better in GUC_STATUS handler that we can clear IN_RE=
SET value after reading.
> [Fred] since the value is always 1 after guc_reset in native i915, so I d=
o not do the change as well.
> (0x0000c000): 0x00000001
>

As we don't really handle GuC reset now, we just emulate reset status,
if always leaving in_reset bit, guest might think reset is not done yet,
so by clear it after once reading should tell guest reset is not in progress
any more.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--mixpuywmQk4RxeDV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXd8zbwAKCRCxBBozTXgY
JzWCAKCV7olUa5lZNf8thvT4qHPExe8h7gCeLWJQMyECSzNNEG+4d2AB4sczjBM=
=nNA9
-----END PGP SIGNATURE-----

--mixpuywmQk4RxeDV--

--===============2058019584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============2058019584==--
