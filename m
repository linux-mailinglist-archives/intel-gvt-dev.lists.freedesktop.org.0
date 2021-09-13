Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A68D24090AA
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 Sep 2021 15:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED156E0EC;
	Mon, 13 Sep 2021 13:55:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC26C6E0EC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 Sep 2021 13:55:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="244004336"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; 
 d="asc'?scan'208";a="244004336"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 06:55:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; 
 d="asc'?scan'208";a="507303105"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by fmsmga008.fm.intel.com with ESMTP; 13 Sep 2021 06:55:07 -0700
Date: Mon, 13 Sep 2021 21:31:25 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zhi A Wang <zhi.wang.linux2@gmail.com>
Cc: intel-gvt-dev@lists.freedesktop.org, Zhi A Wang <zhi.a.wang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: fix the usage of ww lock in gvt scheduler.
Message-ID: <20210913133125.GM14689@zhen-hp.sh.intel.com>
References: <20210826143834.25410-1-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
In-Reply-To: <20210826143834.25410-1-zhi.a.wang@intel.com>
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


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.08.26 14:38:34 +0000, Zhi A Wang wrote:
> As the APIs related to ww lock in i915 was changed recently, the usage of
> ww lock in GVT-g scheduler needs to be changed accrodingly. We noticed a
> deadlock when GVT-g scheduler submits the workload to i915. After some
> investigation, it seems the way of how to use ww lock APIs has been
> changed. Releasing a ww now requires a explict i915_gem_ww_ctx_fini().
>=20
> Fixes: 67f1120381df ("drm/i915/gvt: Introduce per object locking in GVT s=
cheduler.")
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Signed-off-by: Zhi A Wang <zhi.a.wang@intel.com>
> ---

Oops, looks I missed this one.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks for the fix!

>  drivers/gpu/drm/i915/gvt/scheduler.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index 9578e57db4c2..43fedfe9639a 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -576,7 +576,7 @@ static int prepare_shadow_batch_buffer(struct intel_v=
gpu_workload *workload)
> =20
>  			/* No one is going to touch shadow bb from now on. */
>  			i915_gem_object_flush_map(bb->obj);
> -			i915_gem_object_unlock(bb->obj);
> +			i915_gem_ww_ctx_fini(&ww);
>  		}
>  	}
>  	return 0;
> @@ -630,7 +630,7 @@ static int prepare_shadow_wa_ctx(struct intel_shadow_=
wa_ctx *wa_ctx)
>  		return ret;
>  	}
> =20
> -	i915_gem_object_unlock(wa_ctx->indirect_ctx.obj);
> +	i915_gem_ww_ctx_fini(&ww);
> =20
>  	/* FIXME: we are not tracking our pinned VMA leaving it
>  	 * up to the core to fix up the stray pin_count upon
> --=20
> 2.25.1
>=20

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYT9SqAAKCRCxBBozTXgY
J4hfAKCD6+9nbO43sNK00uHPPAW4tZcJTACfe6efIW5mi6gI5JP2eOpfrZQzI1U=
=Gyr6
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
