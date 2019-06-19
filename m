Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A16BF4B03E
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 Jun 2019 04:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32DD6E282;
	Wed, 19 Jun 2019 02:50:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45CE6E282
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 19 Jun 2019 02:50:30 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2019 19:50:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,391,1557212400"; 
 d="asc'?scan'208";a="186316159"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2019 19:50:29 -0700
Date: Wed, 19 Jun 2019 10:48:25 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: rename F_IN_CTX flag to F_IN_CTX_SR
Message-ID: <20190619024825.GH9684@zhen-hp.sh.intel.com>
References: <20190617081150.1367-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190617081150.1367-1-yan.y.zhao@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1882825010=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1882825010==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V66X/350vc37cwHu"
Content-Disposition: inline


--V66X/350vc37cwHu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.06.17 04:11:50 -0400, Yan Zhao wrote:
> F_IN_CTX is an inaccurate flag name, because people may falsly think all

falsly -> falsely

> mmios in context image are of this flag. But actually, this flag is only
> for mmios both in GVT's save-restore list and in hardare logical
> context's image.
>=20
> v2: rename F_IN_SRLIST_AND_CTX to F_IN_CTX_SR (zhenyu wang)
>=20
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>

Good to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c   |  2 +-
>  drivers/gpu/drm/i915/gvt/gvt.h          | 23 ++++++++++++++---------
>  drivers/gpu/drm/i915/gvt/mmio_context.c |  3 ++-
>  3 files changed, 17 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index 6ea88270c818..78b8c9b6b2bc 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -906,7 +906,7 @@ static int cmd_reg_handler(struct parser_exec_state *=
s,
>  	 * inhibit context will restore with correct values
>  	 */
>  	if (IS_GEN(gvt->dev_priv, 9) &&
> -			intel_gvt_mmio_is_in_ctx(gvt, offset) &&
> +			intel_gvt_mmio_is_in_ctx_sr(gvt, offset) &&
>  			!strncmp(cmd, "lri", 3)) {
>  		intel_gvt_hypervisor_read_gpa(s->vgpu,
>  			s->workload->ring_context_gpa + 12, &ctx_sr_ctl, 4);
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index b54f2bdc13a4..a4bec5086e35 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -271,8 +271,10 @@ struct intel_gvt_mmio {
>  #define F_CMD_ACCESSED	(1 << 5)
>  /* This reg could be accessed by unaligned address */
>  #define F_UNALIGN	(1 << 6)
> -/* This reg is saved/restored in context */
> -#define F_IN_CTX	(1 << 7)
> +/* This reg is in GVT's mmio save-restor list and in hardware
> + * logical context image
> + */
> +#define F_IN_CTX_SR	(1 << 7)
> =20
>  	struct gvt_mmio_block *mmio_block;
>  	unsigned int num_mmio_block;
> @@ -656,30 +658,33 @@ static inline bool intel_gvt_mmio_has_mode_mask(
>  }
> =20
>  /**
> - * intel_gvt_mmio_is_in_ctx - check if a MMIO has in-ctx mask
> + * intel_gvt_mmio_is_in_ctx_sr -
> + *		check if an MMIO has in-ctx-sr mask
>   * @gvt: a GVT device
>   * @offset: register offset
>   *
>   * Returns:
> - * True if a MMIO has a in-context mask, false if it isn't.
> + * True if an MMIO has a in-context-sr mask, false if it isn't.
>   *
>   */
> -static inline bool intel_gvt_mmio_is_in_ctx(
> +static inline bool intel_gvt_mmio_is_in_ctx_sr(
>  			struct intel_gvt *gvt, unsigned int offset)
>  {
> -	return gvt->mmio.mmio_attribute[offset >> 2] & F_IN_CTX;
> +	return gvt->mmio.mmio_attribute[offset >> 2] & F_IN_CTX_SR;
>  }
> =20
>  /**
> - * intel_gvt_mmio_set_in_ctx - mask a MMIO in logical context
> + * intel_gvt_mmio_set_in_ctx_sr -
> + *		mask an MMIO in GVT's mmio save-restore list and also
> + *		in hardware logical context image
>   * @gvt: a GVT device
>   * @offset: register offset
>   *
>   */
> -static inline void intel_gvt_mmio_set_in_ctx(
> +static inline void intel_gvt_mmio_set_in_ctx_sr(
>  			struct intel_gvt *gvt, unsigned int offset)
>  {
> -	gvt->mmio.mmio_attribute[offset >> 2] |=3D F_IN_CTX;
> +	gvt->mmio.mmio_attribute[offset >> 2] |=3D F_IN_CTX_SR;
>  }
> =20
>  int intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu);
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i9=
15/gvt/mmio_context.c
> index 2998999e8568..3958cce88c41 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> @@ -574,7 +574,8 @@ void intel_gvt_init_engine_mmio_context(struct intel_=
gvt *gvt)
>  	     i915_mmio_reg_valid(mmio->reg); mmio++) {
>  		if (mmio->in_context) {
>  			gvt->engine_mmio_list.ctx_mmio_count[mmio->ring_id]++;
> -			intel_gvt_mmio_set_in_ctx(gvt, mmio->reg.reg);
> +			intel_gvt_mmio_set_in_ctx_sr(gvt,
> +					mmio->reg.reg);
>  		}
>  	}
>  }
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

--V66X/350vc37cwHu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXQmieAAKCRCxBBozTXgY
J3qoAJ9dxQk/PY3sljrmAn5HMdT3w4J5hgCdHRZ/XrlMeMasSAOAhRO9RiMG9PE=
=/4t3
-----END PGP SIGNATURE-----

--V66X/350vc37cwHu--

--===============1882825010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1882825010==--
