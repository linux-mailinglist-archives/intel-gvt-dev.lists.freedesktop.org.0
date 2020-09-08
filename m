Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB32260EB7
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Sep 2020 11:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4626E7D0;
	Tue,  8 Sep 2020 09:33:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBD66E7D0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Sep 2020 09:33:28 +0000 (UTC)
IronPort-SDR: WlblSmWhGNQOWhrfbJY/uBU9L0Jqno5xI/JgFdVkff1jnjZBERt/Z00XRkkSZpfeolLk3dxAKQ
 Jsdb351yCb9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="145811320"
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
 d="asc'?scan'208";a="145811320"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 02:33:28 -0700
IronPort-SDR: uxcFJPnTrl6Lp8IW2PPv7vO3hMQVqPE+FKm86tbQe6PkRcMxxPqBDU2q1fPOZssQqtL0kKbKfH
 /9L2UEaJAZ/w==
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
 d="asc'?scan'208";a="479949530"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 02:33:01 -0700
Date: Tue, 8 Sep 2020 17:13:47 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Init vreg GUC_STATUS to GS_MIA_IN_RESET
Message-ID: <20200908091347.GD1426@zhen-hp.sh.intel.com>
References: <20200819010900.54598-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200819010900.54598-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0117276845=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0117276845==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Content-Disposition: inline


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.08.19 09:09:00 +0800, Colin Xu wrote:
> Although GVT doesnt' support guest GuC, MIA core is still expected
> to be GS_MIA_IN_RESET after uc HW reset.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/mmio.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/mmio.c b/drivers/gpu/drm/i915/gvt/m=
mio.c
> index 291993615af9..b6811f6a230d 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio.c
> @@ -251,6 +251,9 @@ void intel_vgpu_reset_mmio(struct intel_vgpu *vgpu, b=
ool dmlr)
>  		/* set the bit 0:2(Core C-State ) to C0 */
>  		vgpu_vreg_t(vgpu, GEN6_GT_CORE_STATUS) =3D 0;
> =20
> +		/* uc reset hw expect GS_MIA_IN_RESET */
> +		vgpu_vreg_t(vgpu, GUC_STATUS) |=3D GS_MIA_IN_RESET;
> +
>  		if (IS_BROXTON(vgpu->gvt->gt->i915)) {
>  			vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) &=3D
>  				    ~(BIT(0) | BIT(1));
> --=20
> 2.28.0
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX1dLSwAKCRCxBBozTXgY
JyH3AJ9vzXhoN1M+eAZjmRcH88BWeuTxUQCfdx5oOfXiLFHtXA4N0QrrADYS2dw=
=NoBl
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--

--===============0117276845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0117276845==--
