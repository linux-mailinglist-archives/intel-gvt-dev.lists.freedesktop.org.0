Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E36083ECCFB
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 16 Aug 2021 05:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8331589A75;
	Mon, 16 Aug 2021 03:08:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9B789A75;
 Mon, 16 Aug 2021 03:08:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="213936220"
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; 
 d="asc'?scan'208";a="213936220"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2021 20:08:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; 
 d="asc'?scan'208";a="487056715"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by fmsmga008.fm.intel.com with ESMTP; 15 Aug 2021 20:08:10 -0700
Date: Mon, 16 Aug 2021 10:45:34 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Subject: Re: i915 timeouts delaying boot under GVT
Message-ID: <20210816024534.GV13928@zhen-hp.sh.intel.com>
References: <YRYRwG5jscfl54pj@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="N1feavoG/SlNLCrA"
Content-Disposition: inline
In-Reply-To: <YRYRwG5jscfl54pj@infradead.org>
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--N1feavoG/SlNLCrA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.08.13 08:31:28 +0200, Christoph Hellwig wrote:
> Hi all,
>=20
> when botting a current 4.14-rc tree in a VM using GVT-g (with the host
> also running a current 4.14-rc tree), I see bunch of long timeouts
> followed by i915 errors:
>=20
> [    4.252066] i915 0000:00:03.0: [drm] VGT balloon successfully
> [    5.095190] i915 0000:00:03.0: [drm] *ERROR* Failed to disable SAGV (-=
110)
> [   15.334559] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:5=
1:pipe
> A] flip_done timed out
> [   15.346934] [drm] Initialized i915 1.6.0 20201103 for 0000:00:03.0 on =
minor
> 0
>=20
> I did a hackjob to track them down and just if out the offending code,
> which speeds up the boot by ~11 seconds but is probably dangerous as hell:

Hi, Christoph, what platform is this? And what's your guest i915 config?

I'll try to reproduce on our side. Thanks for reporting this.

>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 2d5d21740c25..ee82fd67f386 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -10696,7 +10696,7 @@ static void intel_atomic_commit_tail(struct intel=
_atomic_state *state)
>  	 * - switch over to the vblank wait helper in the core after that since
>  	 *   we don't need out special handling any more.
>  	 */
> -	drm_atomic_helper_wait_for_flip_done(dev, &state->base);
> +//	drm_atomic_helper_wait_for_flip_done(dev, &state->base);
> =20
>  	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
>  		if (new_crtc_state->uapi.async_flip)
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel=
_pm.c
> index 45fefa0ed160..f03ce729cc4b 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -3753,7 +3753,7 @@ intel_disable_sagv(struct drm_i915_private *dev_pri=
v)
>  	if (!intel_has_sagv(dev_priv))
>  		return 0;
> =20
> -	if (dev_priv->sagv_status =3D=3D I915_SAGV_DISABLED)
> +	if (1 || dev_priv->sagv_status =3D=3D I915_SAGV_DISABLED)
>  		return 0;
> =20
>  	drm_dbg_kms(&dev_priv->drm, "Disabling SAGV\n");

--N1feavoG/SlNLCrA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYRnRQwAKCRCxBBozTXgY
J7Q8AJsHTvAvpGJUskW0DHYOUnKA6cxcCQCZAaaJks+wH8DDmB43G8ppNAMDYPs=
=8+Rv
-----END PGP SIGNATURE-----

--N1feavoG/SlNLCrA--
