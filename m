Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9114758F606
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 11 Aug 2022 04:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5296930B6;
	Thu, 11 Aug 2022 02:54:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D19795D5E;
 Thu, 11 Aug 2022 02:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660186463; x=1691722463;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=ZsDMA5q5pAMYRTD9hhg3Cm+LjvS+zik+GXMkY3O0QLo=;
 b=bHVVBphgTFuM1JjWz/Rx/VkqYMgGxUlmSuvHDkGdyN6vGXOREMOQtCW8
 vLSkVbeg4QExb30g/U++5SxiCYd17D5y24h8oxHalk1b4CQqyDbIoWQAt
 E9STVsDZLzZ9T618UF9TkFbMiOYZDNH3Mj7AxtvHRrZcenAkzeAZ8z82i
 hdj6QrQZYBMpZ4pNRuhqAmKgcx421EJiQ567JHlupNa1rFoXZzfdBg5wW
 22teKmAlkVpPeVk0vQa2ZPFyHRJJYpcZIRuxl4ZN0TNSEmVEUn6LnJhC0
 bhTi5bPwzjoRxaDy8qmsz6WosTBcJ2aJUKqfs1UaZg2xFr8UWfR4r7lhi g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="274299176"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
 d="asc'?scan'208";a="274299176"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 19:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
 d="asc'?scan'208";a="673523936"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga004.fm.intel.com with ESMTP; 10 Aug 2022 19:54:19 -0700
Date: Thu, 11 Aug 2022 10:29:44 +0800
From: Zhenyu Wang <zhenyu.z.wang@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] i915/gvt: Fix Comet Lake
Message-ID: <20220811022944.GB1089@zhen-hp.sh.intel.com>
References: <166016852965.780835.10366587502693016900.stgit@omen>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="VYvi4N5CyHZx5xNE"
Content-Disposition: inline
In-Reply-To: <166016852965.780835.10366587502693016900.stgit@omen>
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
Reply-To: Zhenyu Wang <zhenyu.z.wang@intel.com>
Cc: tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 joonas.lahtinen@linux.intel.com, linux-kernel@vger.kernel.org,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--VYvi4N5CyHZx5xNE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.08.10 15:55:48 -0600, Alex Williamson wrote:
> Prior to the commit below the GAMT_CHKN_BIT_REG address was setup for
> devices matching (D_KBL | D_CFL), where intel_gvt_get_device_type()
> returns D_CFL for either Coffee Lake or Comet Lake.  Include the missed
> platform.`
>=20
> Link: https://lore.kernel.org/all/20220808142711.02d16782.alex.williamson=
@redhat.com
> Fixes: e0f74ed4634d ("i915/gvt: Separate the MMIO tracking table from GVT=
-g")
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/dr=
m/i915/intel_gvt_mmio_table.c
> index 157e166672d7..5595639d0033 100644
> --- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> +++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> @@ -1076,7 +1076,8 @@ static int iterate_skl_plus_mmio(struct intel_gvt_m=
mio_table_iter *iter)
>  	MMIO_D(GEN8_HDC_CHICKEN1);
>  	MMIO_D(GEN9_WM_CHICKEN3);
> =20
> -	if (IS_KABYLAKE(dev_priv) || IS_COFFEELAKE(dev_priv))
> +	if (IS_KABYLAKE(dev_priv) ||
> +	    IS_COFFEELAKE(dev_priv) || IS_COMETLAKE(dev_priv))
>  		MMIO_D(GAMT_CHKN_BIT_REG);
>  	if (!IS_BROXTON(dev_priv))
>  		MMIO_D(GEN9_CTX_PREEMPT_REG);
>=20

Thanks for catching this!

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>


--VYvi4N5CyHZx5xNE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYvRpkwAKCRCxBBozTXgY
J2gcAJ9dPJreOMASPcIJVCkUov/utI/JmQCcCEF2AsdY8g2aRrUk9EbIcdAnagk=
=DhCn
-----END PGP SIGNATURE-----

--VYvi4N5CyHZx5xNE--
