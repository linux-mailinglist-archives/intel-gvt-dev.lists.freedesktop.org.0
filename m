Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D18122266
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 17 Dec 2019 04:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E626E930;
	Tue, 17 Dec 2019 03:12:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022006E930
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 17 Dec 2019 03:12:46 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 19:12:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,324,1571727600"; 
 d="asc'?scan'208";a="240257731"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga004.fm.intel.com with ESMTP; 16 Dec 2019 19:12:45 -0800
Date: Tue, 17 Dec 2019 11:10:58 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Gao Fred <fred.gao@intel.com>
Subject: Re: [PATCH v3] drm/i915/gvt: Fix guest boot warning
Message-ID: <20191217031058.GP21662@zhen-hp.sh.intel.com>
References: <20191216160255.29499-1-fred.gao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191216160255.29499-1-fred.gao@intel.com>
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
Content-Type: multipart/mixed; boundary="===============2023489603=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2023489603==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3rMDlCEgcaHQQFB+"
Content-Disposition: inline


--3rMDlCEgcaHQQFB+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.12.17 00:02:55 +0800, Gao Fred wrote:
>     Simulate MIA core in reset status once GUC engine is reset.
>=20
>     v2: 1. use vgpu_vreg_t() function,
>         2. clear MIA_IN_RESET after reading. (Zhenyu)
>     v3: add comments. (Zhenyu)
>=20
> Signed-off-by: Gao Fred <fred.gao@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index bb9fe6bf5275..c5e870a83d68 100644
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
> @@ -1636,6 +1640,15 @@ static int edp_psr_imr_iir_write(struct intel_vgpu=
 *vgpu,
>  	return 0;
>  }
> =20
> +static int guc_status_read(struct intel_vgpu *vgpu,
> +		unsigned int offset, void *p_data, unsigned int bytes)
> +{
> +	/* keep MIA_IN_RESET before clearing */
> +	read_vreg(vgpu, offset, p_data, bytes);
> +	vgpu_vreg(vgpu, offset) &=3D ~GS_MIA_IN_RESET;
> +	return 0;
> +}

yeah, sorry for misreading this previously, as driver does expect
reset bit set actually. So,

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks!

> +
>  static int mmio_read_from_hw(struct intel_vgpu *vgpu,
>  		unsigned int offset, void *p_data, unsigned int bytes)
>  {
> @@ -2672,6 +2685,8 @@ static int init_generic_mmio_info(struct intel_gvt =
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

--3rMDlCEgcaHQQFB+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXfhHQgAKCRCxBBozTXgY
JxVqAKCfhXumuQPgKUUwS+KrVGUCppZmNQCfRTdi5pfqz3Vhi39ga32LFmvolWU=
=OTp5
-----END PGP SIGNATURE-----

--3rMDlCEgcaHQQFB+--

--===============2023489603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============2023489603==--
