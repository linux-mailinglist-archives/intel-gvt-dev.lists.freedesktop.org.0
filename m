Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E5F2CB2E4
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  2 Dec 2020 03:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217406E834;
	Wed,  2 Dec 2020 02:44:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3E76E834;
 Wed,  2 Dec 2020 02:44:25 +0000 (UTC)
IronPort-SDR: Olw6T92FtGkyHpH1kkDVGMP3Lyu5r9orZUBRBUe0vMLoeT1kxTmXnCIMpOaOSawRS2wRwm5taK
 UWbE2LZAzBaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="191155021"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
 d="asc'?scan'208";a="191155021"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 18:44:19 -0800
IronPort-SDR: TQH7dVt/1vRmdWseIWv+JOn2h4iyHFRFiCwcKDd/IsR0j+867lr1I/trgzp5MhBHFqPos0jp6O
 0PyFJvmYMDgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
 d="asc'?scan'208";a="365087639"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 01 Dec 2020 18:44:16 -0800
Date: Wed, 2 Dec 2020 10:29:13 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 09/10] drm/i915/gvt: replace I915_WRITE with
 intel_uncore_write
Message-ID: <20201202022913.GU16939@zhen-hp.sh.intel.com>
References: <20201130111601.2817-1-jani.nikula@intel.com>
 <20201130111601.2817-9-jani.nikula@intel.com>
 <87o8jdcxi4.fsf@intel.com>
MIME-Version: 1.0
In-Reply-To: <87o8jdcxi4.fsf@intel.com>
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
Cc: Hang Yuan <hang.yuan@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, chris@chris-wilson.co.uk,
 Colin Xu <colin.xu@intel.com>, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1449095824=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1449095824==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nj4mAaUCx+wbOcQD"
Content-Disposition: inline


--Nj4mAaUCx+wbOcQD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.12.01 18:16:35 +0200, Jani Nikula wrote:
> On Mon, 30 Nov 2020, Jani Nikula <jani.nikula@intel.com> wrote:
> > Let's avoid adding new I915_WRITE uses while we try to get rid of them.
> >
> > Fixes: 5f60b12edcd0 ("drm/i915/gvt: Save/restore HW status to support G=
VT suspend/resume")
> > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> > Cc: Hang Yuan <hang.yuan@linux.intel.com>
> > Cc: Colin Xu <colin.xu@intel.com>
> > Cc: Zhi Wang <zhi.a.wang@intel.com>
> > Cc: intel-gvt-dev@lists.freedesktop.org
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>=20
> Pushed up to, but *excluding* this patch to dinq. Thanks for the
> reviews.
>=20
> Zhenyu, Zhi, may I have your review/ack for merging this one directly
> via dinq to not add a dependency on the gvt tree?
>

Yep, that's fine to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>=20
> BR,
> Jani.
>=20
>=20
> > ---
> >  drivers/gpu/drm/i915/gvt/handlers.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915=
/gvt/handlers.c
> > index 6f0706e885cb..eba626ba640f 100644
> > --- a/drivers/gpu/drm/i915/gvt/handlers.c
> > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> > @@ -3693,7 +3693,7 @@ static inline int mmio_pm_restore_handler(struct =
intel_gvt *gvt,
> >  	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
> > =20
> >  	if (gvt->mmio.mmio_attribute[offset >> 2] & F_PM_SAVE)
> > -		I915_WRITE(_MMIO(offset), vgpu_vreg(vgpu, offset));
> > +		intel_uncore_write(&dev_priv->uncore, _MMIO(offset), vgpu_vreg(vgpu,=
 offset));
> > =20
> >  	return 0;
> >  }
>=20
> --=20
> Jani Nikula, Intel Open Source Graphics Center

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--Nj4mAaUCx+wbOcQD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX8b79QAKCRCxBBozTXgY
J33VAJ0UNARmS+XjaH5Z4xhUnboer80hMgCeKrw1YadKM2Rm98t2FD/rNwfUFi8=
=eyxA
-----END PGP SIGNATURE-----

--Nj4mAaUCx+wbOcQD--

--===============1449095824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1449095824==--
