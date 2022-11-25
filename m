Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4A06383F9
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 25 Nov 2022 07:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF5110E6FF;
	Fri, 25 Nov 2022 06:22:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9D910E6FF;
 Fri, 25 Nov 2022 06:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669357366; x=1700893366;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=3zbPZdfWL5MZZQT9oYk6fSqU6L8kRa1eQ+IO13BEki0=;
 b=bXq0388EIUQBft4nC330peezEtBCxQ7HXSf39VPUzVF0pm+3rJ0dN5Jq
 6cXc+7aU3csxwUQPnq093m8q3DTXeR9Xky/Ygky4wDwVbRwnMCtcnOH5S
 oYvc5uRFRg3bnbWvX5DFrWcS7M+JPuSaNEuFUj1/x9ATsPc1/lPjzmzLn
 jeIqy+QXZH3VatNxfNHCPrlFBH3VA9ZZsE8Jdb7bSqndh6KVq7VsNFkjS
 /tqfCrcQe1i/BFBtp8TIawT5BLqBZHmL7aqVvNGKstqxY49gIKAelnryD
 0STqqN/WHSjeCC6tPsX/WttsL87fWk7P8YDZFPbH0FlV+1k8OVW80YaML g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="301992035"
X-IronPort-AV: E=Sophos;i="5.96,192,1665471600"; 
 d="asc'?scan'208";a="301992035"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2022 22:22:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="705969604"
X-IronPort-AV: E=Sophos;i="5.96,192,1665471600"; 
 d="asc'?scan'208";a="705969604"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga008.fm.intel.com with ESMTP; 24 Nov 2022 22:22:34 -0800
Date: Fri, 25 Nov 2022 14:21:31 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm/i915: unpin on error in intel_vgpu_shadow_mm_pin()
Message-ID: <20221125062131.GX30028@zhen-hp.sh.intel.com>
References: <Y3OQ5tgZIVxyQ/WV@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="PY8tzLeNxmyMVNR3"
Content-Disposition: inline
In-Reply-To: <Y3OQ5tgZIVxyQ/WV@kili>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Colin Xu <colin.xu@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--PY8tzLeNxmyMVNR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.11.15 16:15:18 +0300, Dan Carpenter wrote:
> Call intel_vgpu_unpin_mm() on this error path.
>=20
> Fixes: 418741480809 ("drm/i915/gvt: Adding ppgtt to GVT GEM context after=
 shadow pdps settled.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/i915/gvt/scheduler.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index d6fe94cd0fdb..8342d95f56cb 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -696,6 +696,7 @@ intel_vgpu_shadow_mm_pin(struct intel_vgpu_workload *=
workload)
> =20
>  	if (workload->shadow_mm->type !=3D INTEL_GVT_MM_PPGTT ||
>  	    !workload->shadow_mm->ppgtt_mm.shadowed) {
> +		intel_vgpu_unpin_mm(workload->shadow_mm);
>  		gvt_vgpu_err("workload shadow ppgtt isn't ready\n");
>  		return -EINVAL;
>  	}
> --=20

Thanks, Dan. Looks fine to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--PY8tzLeNxmyMVNR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY4Be5gAKCRCxBBozTXgY
J+KDAJ9OgoK2gPxiD4iC1tHtw062lS/dPQCfW+n2gbnAT/A+7NGPcUEQZQBssB0=
=bFGR
-----END PGP SIGNATURE-----

--PY8tzLeNxmyMVNR3--
