Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AA076A757
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Aug 2023 05:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2647F10E0CD;
	Tue,  1 Aug 2023 03:11:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A00410E0C3;
 Tue,  1 Aug 2023 03:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690859497; x=1722395497;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=NryKJShfM8SW3n7svt9Q1jFOZJgpKLahAZiBnH67rZY=;
 b=TGH+Ak6BtYG8lhfydC3MvxarNyZZUys2c6fynGEl3zKQBXwWPVEruH+g
 XVqp4r8spKPb09jDkHw1b3NvsHQG/EydZg3OAXwTu3QoMRikYMIZZCZh6
 L2mM1GarL5KoZUJeL/LYTNnQzB12lxQQPqzrZLMPDjIui9rMyqtxdVvQR
 h10J6vsHNwz6cd+Yk22+J5gladBisbr1ZfILu2hUyJtsqmiRjueOz08RM
 iPKwlGxX3uujupjgmXW7uv57KIDWuMTPDAZW4mE8iDs2pthaLiJSRTB/7
 zOfpQlOjdBCRvS3rQxVgpJdxDzfZDgEn6Ncf0eUsqjT7waZ7XuyfJwrOv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="372810270"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
 d="asc'?scan'208";a="372810270"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 20:11:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="842555037"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
 d="asc'?scan'208";a="842555037"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.160.45])
 by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2023 20:11:34 -0700
Date: Tue, 1 Aug 2023 11:12:05 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Fix bug in getting msg length in AUX CH
 registers handler
Message-ID: <ZMh4BW8a+82Ijzye@debian-scheme>
References: <20230731112033.7275-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="2KtKni1zqKU798lM"
Content-Disposition: inline
In-Reply-To: <20230731112033.7275-1-yan.y.zhao@intel.com>
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
Cc: kvm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--2KtKni1zqKU798lM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023.07.31 19:20:33 +0800, Yan Zhao wrote:
> Msg length should be obtained from value written to AUX_CH_CTL register
> rather than from enum type of the register.
>=20
> Commit 0cad796a2269  ("drm/i915: Use REG_BIT() & co. for AUX CH registers=
")
> incorrectly calculates the msg_length from reg type and yields below
> warning in intel_gvt_i2c_handle_aux_ch_write():
> "i915 0000:00:02.0: drm_WARN_ON(msg_length !=3D 4)".
>=20
> Fixes: 0cad796a2269 ("drm/i915: Use REG_BIT() & co. for AUX CH registers")
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---

Thanks for the fix!

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/edid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/edid.c b/drivers/gpu/drm/i915/gvt/e=
did.c
> index 2a0438f12a14..af9afdb53c7f 100644
> --- a/drivers/gpu/drm/i915/gvt/edid.c
> +++ b/drivers/gpu/drm/i915/gvt/edid.c
> @@ -491,7 +491,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_v=
gpu *vgpu,
>  		return;
>  	}
> =20
> -	msg_length =3D REG_FIELD_GET(DP_AUX_CH_CTL_MESSAGE_SIZE_MASK, reg);
> +	msg_length =3D REG_FIELD_GET(DP_AUX_CH_CTL_MESSAGE_SIZE_MASK, value);
> =20
>  	// check the msg in DATA register.
>  	msg =3D vgpu_vreg(vgpu, offset + 4);
> --=20
> 2.17.1
>=20

--2KtKni1zqKU798lM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCZMh4AQAKCRCxBBozTXgY
J44nAJ9iw6SM1ZBIOoZovFO1eue/1cWpWQCeK9uQsOBPVhKevT97+erR/pKpjwM=
=Wsd+
-----END PGP SIGNATURE-----

--2KtKni1zqKU798lM--
