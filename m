Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4975E28C72D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Oct 2020 04:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083556E047;
	Tue, 13 Oct 2020 02:35:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052926E047
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Oct 2020 02:35:27 +0000 (UTC)
IronPort-SDR: LNtLGIvepgQXbxBKbYwN1NnHeMY/CL4FeZ1Fsh6LUy4UaJP8j0w77bPHX6nItaWFhuA6/XqDsR
 4sFvs2uElMzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="165895643"
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; 
 d="asc'?scan'208";a="165895643"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 19:35:27 -0700
IronPort-SDR: WNbgiPkcUIoYZ+jChtgVootHMB0UmSnAaGtD6NeEpvNIpcFCKgRUiV0SQmOsHzvvL1V9OzMsLo
 5g87oHUSvEDg==
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; 
 d="asc'?scan'208";a="463315287"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 19:35:26 -0700
Date: Tue, 13 Oct 2020 10:14:53 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Fix mmio handler break on BXT/APL.
Message-ID: <20201013021453.GO27141@zhen-hp.sh.intel.com>
References: <20201012045140.225466-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201012045140.225466-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0777465196=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0777465196==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jTMWTj4UTAEmbWeb"
Content-Disposition: inline


--jTMWTj4UTAEmbWeb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.10.12 12:51:40 +0800, Colin Xu wrote:
> - Remove dup mmio handler for BXT/APL.
> - Add more with F_CMD_ACCESS.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 809429a35ec2..9891501da064 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -3140,7 +3140,7 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
>  		 NULL, NULL);
> =20
>  	MMIO_DFH(GAMT_CHKN_BIT_REG, D_KBL | D_CFL, F_CMD_ACCESS, NULL, NULL);
> -	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS);
> +	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS & ~D_BXT);
> =20
>  	return 0;
>  }
> @@ -3314,6 +3314,12 @@ static int init_bxt_mmio_info(struct intel_gvt *gv=
t)
>  	MMIO_D(GEN8_PUSHBUS_SHIFT, D_BXT);
>  	MMIO_D(GEN6_GFXPAUSE, D_BXT);
>  	MMIO_DFH(GEN8_L3SQCREG1, D_BXT, F_CMD_ACCESS, NULL, NULL);
> +	MMIO_DFH(GEN8_L3CNTLREG, D_BXT, F_CMD_ACCESS, NULL, NULL);
> +	MMIO_DFH(_MMIO(0x20D8), D_BXT, F_CMD_ACCESS, NULL, NULL);
> +	MMIO_F(_MMIO(0x2658), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
> +	MMIO_F(_MMIO(0x12658), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
> +	MMIO_F(_MMIO(0x22658), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
> +	MMIO_F(_MMIO(0x2a658), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
>

Those should be GPR register with define in i915_reg.h, so pls use name for=
 them.

And I'm not sure what's specific break this fixes? better elaborate or prov=
ide Fixes: tag.

>  	MMIO_DFH(GEN9_CTX_PREEMPT_REG, D_BXT, F_CMD_ACCESS, NULL, NULL);
> =20
> --=20
> 2.28.0
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--jTMWTj4UTAEmbWeb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX4UNnQAKCRCxBBozTXgY
J12/AJ4z91iORZ9Pn6dBUUmVwfUiqYHB6ACglWSnvgpiQ8YoJWWDKar3jsZF/D8=
=N8QX
-----END PGP SIGNATURE-----

--jTMWTj4UTAEmbWeb--

--===============0777465196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0777465196==--
