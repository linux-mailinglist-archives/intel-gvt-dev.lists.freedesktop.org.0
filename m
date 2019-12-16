Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E4211FD06
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 16 Dec 2019 03:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC85E6E423;
	Mon, 16 Dec 2019 02:57:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6F06E423
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 16 Dec 2019 02:57:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Dec 2019 18:57:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,320,1571727600"; 
 d="asc'?scan'208";a="266136120"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Dec 2019 18:57:00 -0800
Date: Mon, 16 Dec 2019 10:55:15 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Gao Fred <fred.gao@intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: Fix guest boot warning
Message-ID: <20191216025515.GI21662@zhen-hp.sh.intel.com>
References: <20191213164508.7090-1-fred.gao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191213164508.7090-1-fred.gao@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0541942816=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0541942816==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t4apE7yKrX2dGgJC"
Content-Disposition: inline


--t4apE7yKrX2dGgJC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.12.14 00:45:08 +0800, Gao Fred wrote:
>     Simulate MIA core in reset status once GUC engine is reset.
>=20
>     v2: 1. use vgpu_vreg_t() function,
>         2. clear MIA_IN_RESET after reading. (Zhenyu)
>=20
> Signed-off-by: Gao Fred <fred.gao@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index bb9fe6bf5275..8e84850197e0 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -341,6 +341,10 @@ static int gdrst_mmio_write(struct intel_vgpu *vgpu,=
 unsigned int offset,
>  			gvt_dbg_mmio("vgpu%d: request VCS2 Reset\n", vgpu->id);
>  			engine_mask |=3D BIT(VCS1);
>  		}
> +		if (data & GEN9_GRDOM_GUC) {
> +			gvt_dbg_mmio("vgpu%d: request GUC Reset\n", vgpu->id);
> +			vgpu_vreg_t(vgpu, GUC_STATUS) |=3D GS_MIA_IN_RESET;
> +		}
>  		engine_mask &=3D INTEL_INFO(vgpu->gvt->dev_priv)->engine_mask;
>  	}
> =20
> @@ -1636,6 +1640,14 @@ static int edp_psr_imr_iir_write(struct intel_vgpu=
 *vgpu,
>  	return 0;
>  }
> =20
> +static int guc_status_read(struct intel_vgpu *vgpu,
> +		unsigned int offset, void *p_data, unsigned int bytes)
> +{
> +	read_vreg(vgpu, offset, p_data, bytes);
> +	vgpu_vreg(vgpu, offset) &=3D ~GS_MIA_IN_RESET;

hmm, return data before clear reset bit? Seems that should be reversed.

> +	return 0;
> +}
> +
>  static int mmio_read_from_hw(struct intel_vgpu *vgpu,
>  		unsigned int offset, void *p_data, unsigned int bytes)
>  {
> @@ -2672,6 +2684,8 @@ static int init_generic_mmio_info(struct intel_gvt =
*gvt)
> =20
>  	MMIO_DH(EDP_PSR_IMR, D_BDW_PLUS, NULL, edp_psr_imr_iir_write);
>  	MMIO_DH(EDP_PSR_IIR, D_BDW_PLUS, NULL, edp_psr_imr_iir_write);
> +	MMIO_DH(GUC_STATUS, D_ALL, guc_status_read, NULL);
> +
>  	return 0;
>  }
> =20
> --=20
> 2.17.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--t4apE7yKrX2dGgJC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXfbyEwAKCRCxBBozTXgY
J3yGAKCIDSz5Kf9C9GaJh6GU2nrhF8CzmwCeJUiMKbaE1I2vgcezudII/rkx5DU=
=qq/2
-----END PGP SIGNATURE-----

--t4apE7yKrX2dGgJC--

--===============0541942816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0541942816==--
