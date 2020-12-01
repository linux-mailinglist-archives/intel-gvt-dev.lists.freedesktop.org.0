Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A26B2C9775
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Dec 2020 07:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4044895C8;
	Tue,  1 Dec 2020 06:14:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03634895C8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  1 Dec 2020 06:14:53 +0000 (UTC)
IronPort-SDR: G9dtCNVopFUpX6bS3m4hMUs9awzsO4od4eNyIROi8peN1iNsGsRKGj48m4C3gBMqiQqu/Lt/gC
 fHy0IS2vt7ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="152026216"
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
 d="asc'?scan'208";a="152026216"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 22:14:53 -0800
IronPort-SDR: Un9TfKMMgCyZW6SC88ehfEDU5LKDOJ1D1rjiAFhkuYpIzwZSfp/Wv3higQVvTg+5nvYZl6BX6J
 O3rv4gNjB36w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
 d="asc'?scan'208";a="367404351"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga002.fm.intel.com with ESMTP; 30 Nov 2020 22:14:52 -0800
Date: Tue, 1 Dec 2020 13:59:51 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 07/10] drm/i915/gvt: introduce a new flag F_CMD_WRITE_PATCH
Message-ID: <20201201055951.GR16939@zhen-hp.sh.intel.com>
References: <20201125003626.17806-1-yan.y.zhao@intel.com>
 <20201125004100.18231-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201125004100.18231-1-yan.y.zhao@intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1638946148=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1638946148==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibvzjYYg+QDzMCy1"
Content-Disposition: inline


--ibvzjYYg+QDzMCy1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.11.25 08:41:00 +0800, Yan Zhao wrote:
> F_CMD_WRITE_PATCH means command write to this register needs to be patched
>=20
> Cc: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index c470e185bc00..27878a18e6b4 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -255,6 +255,8 @@ struct intel_gvt_mmio {
>  #define F_CMD_ACCESS	(1 << 3)
>  /* This reg has been accessed by a VM */
>  #define F_ACCESSED	(1 << 4)
> +/* Value of command write of this reg needs to be patched */
> +#define F_CMD_WRITE_PATCH	(1 << 5)
>  /* This reg could be accessed by unaligned address */
>  #define F_UNALIGN	(1 << 6)
>  /* This reg is in GVT's mmio save-restor list and in hardware
> @@ -685,11 +687,39 @@ static inline void intel_gvt_mmio_set_sr_in_ctx(
>  }
> =20
>  void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu);
> +/**
> + * intel_gvt_mmio_set_cmd_fix_write -
> + *				mark an MMIO if its cmd write needs to be
> + *				patched
> + * @gvt: a GVT device
> + * @offset: register offset
> + *
> + */
> +static inline void intel_gvt_mmio_set_cmd_fix_write(
> +			struct intel_gvt *gvt, unsigned int offset)
> +{
> +	gvt->mmio.mmio_attribute[offset >> 2] |=3D F_CMD_WRITE_PATCH;

It's a bit mismatch for flag and function name, better to align..

> +}
> +
> +/**
> + * intel_gvt_mmio_is_cmd_fix_write - check if an mmio's cmd access needs=
 to
> + * be patched
> + * @gvt: a GVT device
> + * @offset: register offset
> + *
> + * Returns:
> + * True if GPU commmand write to an MMIO should be patched
> + */
> +static inline bool intel_gvt_mmio_is_cmd_fix_write(
> +			struct intel_gvt *gvt, unsigned int offset)
> +{
> +	return gvt->mmio.mmio_attribute[offset >> 2] & F_CMD_WRITE_PATCH;
> +}
> +
>  void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu);
>  void intel_gvt_debugfs_init(struct intel_gvt *gvt);
>  void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
> =20
> -
>  #include "trace.h"
>  #include "mpt.h"
> =20
> --=20
> 2.17.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--ibvzjYYg+QDzMCy1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX8Xb0QAKCRCxBBozTXgY
J0uAAKCeIlQ61n4jsLDi9uvIzokumsd0GACfYyH5RWjhEn5AFzkdKYP23XMxRGA=
=5t7+
-----END PGP SIGNATURE-----

--ibvzjYYg+QDzMCy1--

--===============1638946148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1638946148==--
