Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B9A1EF0BB
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  5 Jun 2020 06:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB806E833;
	Fri,  5 Jun 2020 04:55:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FCD6E833
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  5 Jun 2020 04:55:29 +0000 (UTC)
IronPort-SDR: hvApgas63tYvxcCQLhxXT5YvNuHXCOMdRNNvzOFWK02GuHl1C2yqByU1a0josev/e8ufDKqbjt
 IQWC9EiwvhbA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 21:55:29 -0700
IronPort-SDR: dM47rBEANvXZL4ZfOyrt6ivcO33oAj8ltNvyjQTyti86Agard1yK3kvkzbzr8KEenZJF+X0Z5u
 L8ig66oJbbTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,475,1583222400"; 
 d="asc'?scan'208";a="259085982"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga008.fm.intel.com with ESMTP; 04 Jun 2020 21:55:28 -0700
Date: Fri, 5 Jun 2020 12:39:51 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH V2] drm/i915/gvt: Fix incorrect check of enabled bits in
 mask registers
Message-ID: <20200605043951.GP5687@zhen-hp.sh.intel.com>
References: <20200601030721.17129-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200601030721.17129-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1317249812=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1317249812==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ll0BBk1HBk/f94B0"
Content-Disposition: inline


--Ll0BBk1HBk/f94B0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.06.01 11:07:21 +0800, Colin Xu wrote:
> Using _MASKED_BIT_ENABLE macro to set mask register bits is straight
> forward and not likely to go wrong. However when checking which bit(s)
> is(are) enabled, simply bitwise AND value and _MASKED_BIT_ENABLE() won't
> output expected result. Suppose the register write is disabling bit 1
> by setting 0xFFFF0000, however "& _MASKED_BIT_ENABLE(1)" outputs
> 0x00010000, and the non-zero check will pass which cause the old code
> consider the new value set as an enabling operation.
>=20
> We found guest set 0x80008000 on boot, and set 0xffff8000 during resume.
> Both are legal settings but old code will block latter and force vgpu
> enter fail-safe mode.
>=20
> Introduce two new macro and make proper masked bit check in mmio handler:
> IS_MASKED_BITS_ENABLED()
> IS_MASKED_BITS_DISABLED()
>=20
> V2: Rebase.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c     | 19 ++++++++++---------
>  drivers/gpu/drm/i915/gvt/mmio_context.h |  6 +++---
>  drivers/gpu/drm/i915/gvt/reg.h          |  5 +++++
>  3 files changed, 18 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index f39a6b20bbaf..fadd2adb8030 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -1726,13 +1726,13 @@ static int ring_mode_mmio_write(struct intel_vgpu=
 *vgpu, unsigned int offset,
>  		(*(u32 *)p_data) &=3D ~_MASKED_BIT_ENABLE(2);
>  	write_vreg(vgpu, offset, p_data, bytes);
> =20
> -	if (data & _MASKED_BIT_ENABLE(1)) {
> +	if (IS_MASKED_BITS_ENABLED(data, 1)) {
>  		enter_failsafe_mode(vgpu, GVT_FAILSAFE_UNSUPPORTED_GUEST);
>  		return 0;
>  	}
> =20
>  	if (IS_COFFEELAKE(vgpu->gvt->gt->i915) &&
> -	    data & _MASKED_BIT_ENABLE(2)) {
> +	    IS_MASKED_BITS_ENABLED(data, 2)) {
>  		enter_failsafe_mode(vgpu, GVT_FAILSAFE_UNSUPPORTED_GUEST);
>  		return 0;
>  	}
> @@ -1741,14 +1741,14 @@ static int ring_mode_mmio_write(struct intel_vgpu=
 *vgpu, unsigned int offset,
>  	 * pvinfo, if not, we will treat this guest as non-gvtg-aware
>  	 * guest, and stop emulating its cfg space, mmio, gtt, etc.
>  	 */
> -	if (((data & _MASKED_BIT_ENABLE(GFX_PPGTT_ENABLE)) ||
> -			(data & _MASKED_BIT_ENABLE(GFX_RUN_LIST_ENABLE)))
> -			&& !vgpu->pv_notified) {
> +	if ((IS_MASKED_BITS_ENABLED(data, GFX_PPGTT_ENABLE) ||
> +	    IS_MASKED_BITS_ENABLED(data, GFX_RUN_LIST_ENABLE)) &&
> +	    !vgpu->pv_notified) {
>  		enter_failsafe_mode(vgpu, GVT_FAILSAFE_UNSUPPORTED_GUEST);
>  		return 0;
>  	}
> -	if ((data & _MASKED_BIT_ENABLE(GFX_RUN_LIST_ENABLE))
> -			|| (data & _MASKED_BIT_DISABLE(GFX_RUN_LIST_ENABLE))) {
> +	if (IS_MASKED_BITS_ENABLED(data, GFX_RUN_LIST_ENABLE) ||
> +	    IS_MASKED_BITS_DISABLED(data, GFX_RUN_LIST_ENABLE)) {
>  		enable_execlist =3D !!(data & GFX_RUN_LIST_ENABLE);
> =20
>  		gvt_dbg_core("EXECLIST %s on ring %s\n",
> @@ -1809,7 +1809,7 @@ static int ring_reset_ctl_write(struct intel_vgpu *=
vgpu,
>  	write_vreg(vgpu, offset, p_data, bytes);
>  	data =3D vgpu_vreg(vgpu, offset);
> =20
> -	if (data & _MASKED_BIT_ENABLE(RESET_CTL_REQUEST_RESET))
> +	if (IS_MASKED_BITS_ENABLED(data, RESET_CTL_REQUEST_RESET))
>  		data |=3D RESET_CTL_READY_TO_RESET;
>  	else if (data & _MASKED_BIT_DISABLE(RESET_CTL_REQUEST_RESET))
>  		data &=3D ~RESET_CTL_READY_TO_RESET;
> @@ -1827,7 +1827,8 @@ static int csfe_chicken1_mmio_write(struct intel_vg=
pu *vgpu,
>  	(*(u32 *)p_data) &=3D ~_MASKED_BIT_ENABLE(0x18);
>  	write_vreg(vgpu, offset, p_data, bytes);
> =20
> -	if (data & _MASKED_BIT_ENABLE(0x10) || data & _MASKED_BIT_ENABLE(0x8))
> +	if (IS_MASKED_BITS_ENABLED(data, 0x10) ||
> +	    IS_MASKED_BITS_ENABLED(data, 0x8))
>  		enter_failsafe_mode(vgpu, GVT_FAILSAFE_UNSUPPORTED_GUEST);
> =20
>  	return 0;
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.h b/drivers/gpu/drm/i9=
15/gvt/mmio_context.h
> index 970704b18f23..3b25e7fe32f6 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.h
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.h
> @@ -54,8 +54,8 @@ bool is_inhibit_context(struct intel_context *ce);
> =20
>  int intel_vgpu_restore_inhibit_context(struct intel_vgpu *vgpu,
>  				       struct i915_request *req);
> -#define IS_RESTORE_INHIBIT(a)	\
> -	(_MASKED_BIT_ENABLE(CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT) =3D=3D \
> -	((a) & _MASKED_BIT_ENABLE(CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT)))
> +
> +#define IS_RESTORE_INHIBIT(a) \
> +	IS_MASKED_BITS_ENABLED(a, CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT)
> =20
>  #endif
> diff --git a/drivers/gpu/drm/i915/gvt/reg.h b/drivers/gpu/drm/i915/gvt/re=
g.h
> index 5b66e14c5b7b..b88e033cbed4 100644
> --- a/drivers/gpu/drm/i915/gvt/reg.h
> +++ b/drivers/gpu/drm/i915/gvt/reg.h
> @@ -94,6 +94,11 @@
>  #define GFX_MODE_BIT_SET_IN_MASK(val, bit) \
>  		((((bit) & 0xffff0000) =3D=3D 0) && !!((val) & (((bit) << 16))))
> =20
> +#define IS_MASKED_BITS_ENABLED(_val, _b) \
> +		(((_val) & _MASKED_BIT_ENABLE(_b)) =3D=3D _MASKED_BIT_ENABLE(_b))
> +#define IS_MASKED_BITS_DISABLED(_val, _b) \
> +		((_val) & _MASKED_BIT_DISABLE(_b))
> +

Looks good to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks for the fix!

>  #define FORCEWAKE_RENDER_GEN9_REG 0xa278
>  #define FORCEWAKE_ACK_RENDER_GEN9_REG 0x0D84
>  #define FORCEWAKE_BLITTER_GEN9_REG 0xa188
> --=20
> 2.26.2
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--Ll0BBk1HBk/f94B0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXtnMlwAKCRCxBBozTXgY
J7McAJ9eZkIDPVcQPZVzxn5Hge5V9MGJaACfdl7/KA6UoOQen/UZQwcou3ngngA=
=+1KA
-----END PGP SIGNATURE-----

--Ll0BBk1HBk/f94B0--

--===============1317249812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1317249812==--
