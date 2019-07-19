Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589BA6E129
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Jul 2019 08:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31E56E491;
	Fri, 19 Jul 2019 06:48:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A866E491
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 Jul 2019 06:48:59 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 23:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,281,1559545200"; 
 d="asc'?scan'208";a="252071370"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga001.jf.intel.com with ESMTP; 18 Jul 2019 23:48:57 -0700
Date: Fri, 19 Jul 2019 14:45:45 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: factor out tlb and mocs register offset
 table
Message-ID: <20190719064545.GF28809@zhen-hp.sh.intel.com>
References: <20190718111449.16217-1-aleksei.gimbitskii@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190718111449.16217-1-aleksei.gimbitskii@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1004182200=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1004182200==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ni93GHxFvA+th69W"
Content-Disposition: inline


--ni93GHxFvA+th69W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.07.18 14:14:49 +0300, Aleksei Gimbitskii wrote:
> From: Zhi Wang <zhi.a.wang@intel.com>
>=20
> Factor out tlb and mocs register offset table to fix the issues reported
> by klocwork, #512 and #550. Mostly, the reason why the klocwork reports
> these problems is because there can be possbilities for platforms, which
> have more rings than the ring offset table, to take the dirty data from
> the stack as the register offset. It results to a random HW register
> offset writting in this scenairo when doing context switch between vGPUs.
>=20
> After the factoring, the ring offset table of TLB and MOCS should be per
> platform.
>=20
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h          |  4 ++
>  drivers/gpu/drm/i915/gvt/mmio_context.c | 55 +++++++++++++++++--------
>  2 files changed, 41 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index 3ff59dcf6977..b47c6acaf9c0 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -334,6 +334,10 @@ struct intel_gvt {
>  	struct {
>  		struct engine_mmio *mmio;
>  		int ctx_mmio_count[I915_NUM_ENGINES];
> +		u32 *tlb_mmio_offset_list;
> +		u32 tlb_mmio_offset_list_cnt;
> +		u32 *mocs_mmio_offset_list;
> +		u32 mocs_mmio_offset_list_cnt;
>  	} engine_mmio_list;
> =20
>  	struct dentry *debugfs_root;
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i9=
15/gvt/mmio_context.c
> index 2998999e8568..e7b5720697cc 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> @@ -148,19 +148,27 @@ static struct {
>  	u32 l3cc_table[GEN9_MOCS_SIZE / 2];
>  } gen9_render_mocs;
> =20
> +static u32 gen9_mocs_mmio_offset_list[] =3D {
> +	[RCS0]  =3D 0xc800,
> +	[VCS0]  =3D 0xc900,
> +	[VCS1]  =3D 0xca00,
> +	[BCS0]  =3D 0xcc00,
> +	[VECS0] =3D 0xcb00,
> +};
> +
>  static void load_render_mocs(struct drm_i915_private *dev_priv)
>  {
> +	struct intel_gvt *gvt =3D dev_priv->gvt;
>  	i915_reg_t offset;
> -	u32 regs[] =3D {
> -		[RCS0]  =3D 0xc800,
> -		[VCS0]  =3D 0xc900,
> -		[VCS1]  =3D 0xca00,
> -		[BCS0]  =3D 0xcc00,
> -		[VECS0] =3D 0xcb00,
> -	};
> +	u32 cnt =3D gvt->engine_mmio_list.mocs_mmio_offset_list_cnt;
> +	u32 *regs =3D gvt->engine_mmio_list.mocs_mmio_offset_list;
>  	int ring_id, i;
> =20
> -	for (ring_id =3D 0; ring_id < ARRAY_SIZE(regs); ring_id++) {
> +	/* Platform doesn't have mocs mmios. */
> +	if (!regs)
> +		return;
> +
> +	for (ring_id =3D 0; ring_id < cnt; ring_id++) {
>  		if (!HAS_ENGINE(dev_priv, ring_id))
>  			continue;
>  		offset.reg =3D regs[ring_id];
> @@ -327,22 +335,28 @@ int intel_vgpu_restore_inhibit_context(struct intel=
_vgpu *vgpu,
>  	return ret;
>  }
> =20
> +static u32 gen9_tlb_mmio_offset_list[] =3D {
> +	[RCS0]  =3D 0x4260,
> +	[VCS0]  =3D 0x4264,
> +	[VCS1]  =3D 0x4268,
> +	[BCS0]  =3D 0x426c,
> +	[VECS0] =3D 0x4270,
> +};
> +
>  static void handle_tlb_pending_event(struct intel_vgpu *vgpu, int ring_i=
d)
>  {
>  	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
>  	struct intel_uncore *uncore =3D &dev_priv->uncore;
>  	struct intel_vgpu_submission *s =3D &vgpu->submission;
> +	u32 *regs =3D vgpu->gvt->engine_mmio_list.tlb_mmio_offset_list;
> +	u32 cnt =3D vgpu->gvt->engine_mmio_list.tlb_mmio_offset_list_cnt;
>  	enum forcewake_domains fw;
>  	i915_reg_t reg;
> -	u32 regs[] =3D {
> -		[RCS0]  =3D 0x4260,
> -		[VCS0]  =3D 0x4264,
> -		[VCS1]  =3D 0x4268,
> -		[BCS0]  =3D 0x426c,
> -		[VECS0] =3D 0x4270,
> -	};
> =20
> -	if (WARN_ON(ring_id >=3D ARRAY_SIZE(regs)))
> +	if (!regs)
> +		return;
> +
> +	if (WARN_ON(ring_id >=3D cnt))
>  		return;
> =20
>  	if (!test_and_clear_bit(ring_id, (void *)s->tlb_handle_pending))
> @@ -565,10 +579,15 @@ void intel_gvt_init_engine_mmio_context(struct inte=
l_gvt *gvt)
>  {
>  	struct engine_mmio *mmio;
> =20
> -	if (INTEL_GEN(gvt->dev_priv) >=3D 9)
> +	if (INTEL_GEN(gvt->dev_priv) >=3D 9) {
>  		gvt->engine_mmio_list.mmio =3D gen9_engine_mmio_list;
> -	else
> +		gvt->engine_mmio_list.tlb_mmio_offset_list =3D gen9_tlb_mmio_offset_li=
st;
> +		gvt->engine_mmio_list.tlb_mmio_offset_list_cnt =3D ARRAY_SIZE(gen9_tlb=
_mmio_offset_list);
> +		gvt->engine_mmio_list.mocs_mmio_offset_list =3D gen9_mocs_mmio_offset_=
list;
> +		gvt->engine_mmio_list.mocs_mmio_offset_list_cnt =3D ARRAY_SIZE(gen9_mo=
cs_mmio_offset_list);

mocs is for >=3D gen9, but tlb mmio also applied to gen8.

> +	} else {
>  		gvt->engine_mmio_list.mmio =3D gen8_engine_mmio_list;
> +	}
> =20
>  	for (mmio =3D gvt->engine_mmio_list.mmio;
>  	     i915_mmio_reg_valid(mmio->reg); mmio++) {
> --=20
> 2.17.1
>=20
> ---------------------------------------------------------------------
> Intel Finland Oy
> Registered Address: PL 281, 00181 Helsinki=20
> Business Identity Code: 0357606 - 4=20
> Domiciled in Helsinki=20
>=20
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--ni93GHxFvA+th69W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iFwEARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXTFnGQAKCRCxBBozTXgY
J/7JAJ9VotsUUy+Vk9u1wg0V5DeJlZFIiACXcFBIwe0xBQhCgvnwK4bLIxjcBg==
=dT2I
-----END PGP SIGNATURE-----

--ni93GHxFvA+th69W--

--===============1004182200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1004182200==--
