Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F101D75BD
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 May 2020 13:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E166E14C;
	Mon, 18 May 2020 11:00:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC286E14C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 May 2020 11:00:11 +0000 (UTC)
IronPort-SDR: YLLf1xPbs9C/gTbO8GWIeCGhQbX6/umjzVQb7SrZVeQl4tLmP39LErnGPa7jyizRNocWumJjxD
 TlX5AePOvqVw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 04:00:11 -0700
IronPort-SDR: FVnv5l0bsOHbKt5fL0+58YmJ3p7cn6IcZ695CJcqFBMF0IPJxkGLd6jwSN0vCQkk8/jA5B2vx9
 4efb1Zeg+DBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
 d="asc'?scan'208";a="373349217"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga001.fm.intel.com with ESMTP; 18 May 2020 04:00:10 -0700
Date: Mon, 18 May 2020 18:45:13 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Add GVT suspend/resume routine to i915.
Message-ID: <20200518104513.GY18545@zhen-hp.sh.intel.com>
References: <20200518062852.158709-1-colin.xu@intel.com>
 <20200518062852.158709-3-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200518062852.158709-3-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1154042330=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1154042330==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gkX8xUXxsSKKwLN+"
Content-Disposition: inline


--gkX8xUXxsSKKwLN+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.05.18 14:28:52 +0800, Colin Xu wrote:
> Add GVT suspend/resume routine to i915.
> GVT relies on i915 so suspend ahead of other i915 routine, and resume
> at last vice versa.
>=20
> Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_drv.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_=
drv.c
> index 34ee12f3f02d..c5d7d58df67e 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -87,6 +87,10 @@
>  #include "intel_pm.h"
>  #include "vlv_suspend.h"
> =20
> +#if IS_ENABLED(CONFIG_DRM_I915_GVT)
> +#include "gvt.h"
> +#endif
> +
>  static struct drm_driver driver;
> =20
>  static int i915_get_bridge_dev(struct drm_i915_private *dev_priv)
> @@ -1177,6 +1181,11 @@ static int i915_drm_suspend(struct drm_device *dev)
> =20
>  	drm_kms_helper_poll_disable(dev);
> =20
> +#if IS_ENABLED(CONFIG_DRM_I915_GVT)
> +	if (dev_priv->gvt)
> +		intel_gvt_pm_suspend(dev_priv->gvt);
> +#endif
> +
>  	pci_save_state(pdev);
> =20
>  	intel_display_suspend(dev);
> @@ -1354,6 +1363,12 @@ static int i915_drm_resume(struct drm_device *dev)
> =20
>  	intel_power_domains_enable(dev_priv);
> =20
> +#if IS_ENABLED(CONFIG_DRM_I915_GVT)
> +	if (dev_priv->gvt) {

intel_gvt_active()

> +		return intel_gvt_pm_resume(dev_priv->gvt);
> +	}
> +#endif
> +
>  	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>

Just wrap this in intel_gvt.c/.h which is i915 gvt host side caller, then
i915 code just call intel_gvt_pm_suspend/resume().

>  	return 0;
> --=20
> 2.26.2
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--gkX8xUXxsSKKwLN+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXsJnOQAKCRCxBBozTXgY
JwppAJ9rEOt2ChGIu/72VHxhTJf2aBI0xwCfdbBtOoPYueER0THgjisiuzaOH8I=
=orFS
-----END PGP SIGNATURE-----

--gkX8xUXxsSKKwLN+--

--===============1154042330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1154042330==--
