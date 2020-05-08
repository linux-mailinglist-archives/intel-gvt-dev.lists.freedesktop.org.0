Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F0B1CAA3B
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  8 May 2020 14:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843776EB15;
	Fri,  8 May 2020 12:04:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8FC6EB15
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 May 2020 12:04:54 +0000 (UTC)
IronPort-SDR: qZLCKjDqc/aMCzZ/2DZ5Fndlfu0PjE7TA6/gvcweP/fqik9ZnrOw2wlkiAoCdwHiAXn0+rmI/s
 K9G2GKAaIcJA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2020 05:04:54 -0700
IronPort-SDR: hmpSwM4TIKfBkesxG4dlQ0JciRj0yT/yVsKuOyLBi1KuSgpAJ85gI6ITv8Hv7p3s6vW2T2RJ4r
 nxGEHAO35zqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,367,1583222400"; 
 d="asc'?scan'208";a="285372163"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 08 May 2020 05:04:53 -0700
Date: Fri, 8 May 2020 19:50:18 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Fix kernel oops for 3-level ppgtt guest
Message-ID: <20200508115018.GE18545@zhen-hp.sh.intel.com>
References: <20200506095918.124913-1-zhenyuw@linux.intel.com>
 <8082FF9BCB2B054996454E47167FF4EC2798C4AE@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <8082FF9BCB2B054996454E47167FF4EC2798C4AE@SHSMSX104.ccr.corp.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0078398569=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0078398569==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kM/PxlMMHsUUNZZW"
Content-Disposition: inline


--kM/PxlMMHsUUNZZW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.05.08 11:13:38 +0000, Zhang, Xiong Y wrote:
> > -----Original Message-----
> > From: intel-gvt-dev <intel-gvt-dev-bounces@lists.freedesktop.org> On Be=
half
> > Of Zhenyu Wang
> > Sent: Wednesday, May 6, 2020 5:59 PM
> > To: intel-gvt-dev@lists.freedesktop.org
> > Subject: [PATCH] drm/i915/gvt: Fix kernel oops for 3-level ppgtt guest
> >=20
> > As i915 won't allocate extra PDP for current default PML4 table, so for=
 3-level
> > ppgtt guest, we would hit kernel pointer access failure on extra PDP po=
inters.
> > So this trys to bypass that now.
> > It won't impact real shadow PPGTT setup, so guest context still works.
> >=20
> > This is verified on 4.15 guest kernel with i915.enable_ppgtt=3D1 to for=
ce on old
> > aliasing ppgtt behavior.
> >=20
> > Fixes: 4f15665ccbba ("drm/i915: Add ppgtt to GVT GEM context")
> > Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/scheduler.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c
> > b/drivers/gpu/drm/i915/gvt/scheduler.c
> > index 9c3558489d17..6ab1d95c1fae 100644
> > --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> > +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> > @@ -420,7 +420,11 @@ static void set_context_ppgtt_from_shadow(struct
> > intel_vgpu_workload *workload,
> >  		for (i =3D 0; i < GVT_RING_CTX_NR_PDPS; i++) {
> >  			struct i915_page_directory * const pd =3D
> >  				i915_pd_entry(ppgtt->pd, i);
> > -
> > +			/* skip now as current i915 ppgtt alloc won't allocate
> > +			   top level pdp for non 4-level table, won't impact
> > +			   shadow ppgtt. */
> > +			if (!pd)
> > +				break;
> [Zhang, Xiong Y]  does it  exist in older kernel only ?  current staging =
code allocate 4 pdp for non 4-level table.

But in all current case we'll only allocate for pml4 as it checks hw info.

> I915_context_ppgtt_root_restore()  have the same issue, it should be modi=
fied also.

yeah, missed that although not shown in my test..

> >  			px_dma(pd) =3D mm->ppgtt_mm.shadow_pdps[i];
> >  		}
> >  	}
> > --
> > 2.26.2
> >=20
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--kM/PxlMMHsUUNZZW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXrVHegAKCRCxBBozTXgY
J371AJsETgZ++EWrEqZqqtrXUtpZtK68ggCdEmU2fpB+sHsbiLY225QT5fu/ei8=
=ZFmI
-----END PGP SIGNATURE-----

--kM/PxlMMHsUUNZZW--

--===============0078398569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0078398569==--
