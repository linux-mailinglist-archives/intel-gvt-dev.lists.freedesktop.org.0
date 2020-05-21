Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EFF1DC60B
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 May 2020 06:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4666E0BA;
	Thu, 21 May 2020 04:07:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAA66E0BA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 May 2020 04:06:58 +0000 (UTC)
IronPort-SDR: SiQm6zcNS4pA+jFNnYCJSWkPoU+/z/Pzm91XQ01cfY4BqT0ZToEfIdmmtleLG7jq6GP2hrZkzp
 lp3Nd6J9dUlw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 21:06:58 -0700
IronPort-SDR: RhK+bJXF6ECgz/WbCUHl62fIJKL9hzU0ksuytllwY/yTPjykNuDH/GqhE5DhqmUMsOFtSgz0f3
 ijwcIcSQysdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,416,1583222400"; 
 d="asc'?scan'208";a="253863587"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga007.fm.intel.com with ESMTP; 20 May 2020 21:06:57 -0700
Date: Thu, 21 May 2020 11:51:53 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <Colin.Xu@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Add GVT suspend/resume routine to i915.
Message-ID: <20200521035153.GQ12464@zhen-hp.sh.intel.com>
References: <20200518062852.158709-1-colin.xu@intel.com>
 <20200518062852.158709-3-colin.xu@intel.com>
 <20200518104513.GY18545@zhen-hp.sh.intel.com>
 <2302b038-e847-cb63-b4bc-450ca461b4c8@intel.com>
 <2fbb2843-8c7e-c19b-3e46-2cb268fe1c9f@intel.com>
MIME-Version: 1.0
In-Reply-To: <2fbb2843-8c7e-c19b-3e46-2cb268fe1c9f@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1140105814=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1140105814==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+Hr//EUsa8//ouuB"
Content-Disposition: inline


--+Hr//EUsa8//ouuB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.05.21 08:50:32 +0800, Colin Xu wrote:
>=20
> On 2020-05-21 08:37, Colin Xu wrote:
> >=20
> > On 2020-05-18 18:45, Zhenyu Wang wrote:
> > > On 2020.05.18 14:28:52 +0800, Colin Xu wrote:
> > > > Add GVT suspend/resume routine to i915.
> > > > GVT relies on i915 so suspend ahead of other i915 routine, and resu=
me
> > > > at last vice versa.
> > > >=20
> > > > Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> > > > Signed-off-by: Colin Xu <colin.xu@intel.com>
> > > > ---
> > > > ?? drivers/gpu/drm/i915/i915_drv.c | 15 +++++++++++++++
> > > > ?? 1 file changed, 15 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/i915/i915_drv.c
> > > > b/drivers/gpu/drm/i915/i915_drv.c
> > > > index 34ee12f3f02d..c5d7d58df67e 100644
> > > > --- a/drivers/gpu/drm/i915/i915_drv.c
> > > > +++ b/drivers/gpu/drm/i915/i915_drv.c
> > > > @@ -87,6 +87,10 @@
> > > > ?? #include "intel_pm.h"
> > > > ?? #include "vlv_suspend.h"
> > > > ?? +#if IS_ENABLED(CONFIG_DRM_I915_GVT)
> > > > +#include "gvt.h"
> > > > +#endif
> > > > +
> > > > ?? static struct drm_driver driver;
> > > > ?? ?? static int i915_get_bridge_dev(struct drm_i915_private *dev_p=
riv)
> > > > @@ -1177,6 +1181,11 @@ static int i915_drm_suspend(struct
> > > > drm_device *dev)
> > > > ?? ?????????? drm_kms_helper_poll_disable(dev);
> > > > ?? +#if IS_ENABLED(CONFIG_DRM_I915_GVT)
> > > > +?????? if (dev_priv->gvt)
> > > > +?????????????? intel_gvt_pm_suspend(dev_priv->gvt);
> > > > +#endif
> > > > +
> > > > ?????????? pci_save_state(pdev);
> > > > ?? ?????????? intel_display_suspend(dev);
> > > > @@ -1354,6 +1363,12 @@ static int i915_drm_resume(struct
> > > > drm_device *dev)
> > > > ?? ?????????? intel_power_domains_enable(dev_priv);
> > > > ?? +#if IS_ENABLED(CONFIG_DRM_I915_GVT)
> > > > +?????? if (dev_priv->gvt) {
> > > intel_gvt_active()
> > Almost forgot we have this function can use. Thanks.
> > > > +?????????????? return intel_gvt_pm_resume(dev_priv->gvt);
> > > > +?????? }
> > > > +#endif
> > > > +
> > > > enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> > > >=20
> > > Just wrap this in intel_gvt.c/.h which is i915 gvt host side caller,
> > > then
> > > i915 code just call intel_gvt_pm_suspend/resume().
> >=20
> > It makes the integration more clean.
> >=20
> > I'll move the code and update in V2 and include intel-gfx. Thanks.
>=20
> BTW. Is it necessary to implement pm suspend/resume?? body in gvt.c inste=
ad
> of intel_gvt?
>=20
> i915_drv.c -> intel_gvt.c -> gvt.c
>=20
> or
>=20
> i915_drv.c ->intel_gvt.c
>=20
> Which is better?
>=20
> Current intel_gvt.c looks only a wrapper code while all implementation
> actually in gvt.c.
>=20

Yeah, we want to keep GVT device model in gvt directory as much as possible,
and intel_gvt.c provides interface required to be used by i915. So first op=
tion
is better, e.g you have gvt_pm_suspend/resume() function in gvt/gvt.c and
intel_gvt.c will provide a wrapper to call them by i915 pm.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--+Hr//EUsa8//ouuB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iFwEARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXsX62QAKCRCxBBozTXgY
JxVNAJwLYlyjMEHxqjHwQ7UGC3pNWaTURwCY69SgvTmDIh6m5P0Oz/j3YDB7Zg==
=SpJR
-----END PGP SIGNATURE-----

--+Hr//EUsa8//ouuB--

--===============1140105814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1140105814==--
