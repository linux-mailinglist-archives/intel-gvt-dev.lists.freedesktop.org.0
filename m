Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2958252A04
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 26 Aug 2020 11:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C350D6E348;
	Wed, 26 Aug 2020 09:30:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F384C6E0F4;
 Wed, 26 Aug 2020 09:30:01 +0000 (UTC)
IronPort-SDR: BZfZ9AVFEQYX1saWikj/9q53xRzYlgR+yiCrikUsmDrnArpwDv40ZB+m8Cp0ASv9Do7JLouL5g
 wQ5wOsds90ZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="220521315"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
 d="asc'?scan'208";a="220521315"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 02:30:00 -0700
IronPort-SDR: CKDsT9dxHfQ5GVGx/W7s7JRyNKCYB6IohyWoXO6TW8U6guhQ45z+B7NhpuoZ3/rE5Wy+SaghI/
 ITMhPZBqBuqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
 d="asc'?scan'208";a="323121686"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 26 Aug 2020 02:29:59 -0700
Date: Wed, 26 Aug 2020 17:10:56 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915/gvt: Save/restore HW status for GVT
 during suspend/resume
Message-ID: <20200826091056.GT32450@zhen-hp.sh.intel.com>
References: <20200826063505.680733-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200826063505.680733-1-colin.xu@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 zhenyuw@linux.intel.com
Content-Type: multipart/mixed; boundary="===============1317589975=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1317589975==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oXNgvKVxGWJ0RPMJ"
Content-Disposition: inline


--oXNgvKVxGWJ0RPMJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.08.26 14:35:05 +0800, Colin Xu wrote:
> This patch save/restore necessary GVT info during i915 suspend/resume so
> that GVT enabled QEMU VM can continue running.
>=20
> Only GGTT and fence regs are saved/restored now. GVT will save GGTT
> entries into GVT in suspend routine, and restore the saved entries
> and re-init fence regs in resume routine.
>=20
> V2:
> - Change kzalloc/kfree to vzalloc/vfree since the space allocated
> from kmalloc may not enough for all saved GGTT entries.
> - Keep gvt suspend/resume wrapper in intel_gvt.h/intel_gvt.c and
> move the actual implementation to gvt.h/gvt.c. (zhenyu)
> - Check gvt config on and active with intel_gvt_active(). (zhenyu)
>=20
> Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c      | 73 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/gtt.h      |  2 +
>  drivers/gpu/drm/i915/gvt/gvt.c      | 15 ++++++
>  drivers/gpu/drm/i915/gvt/gvt.h      |  6 +++
>  drivers/gpu/drm/i915/gvt/handlers.c | 20 ++++++++
>  drivers/gpu/drm/i915/gvt/mmio.h     |  3 ++
>  drivers/gpu/drm/i915/gvt/vgpu.c     |  1 +
>  drivers/gpu/drm/i915/intel_gvt.c    | 29 ++++++++++++
>  drivers/gpu/drm/i915/intel_gvt.h    | 10 ++++
>  9 files changed, 159 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index 04bf018ecc34..7907a535d49f 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -2533,6 +2533,11 @@ static void intel_vgpu_destroy_ggtt_mm(struct inte=
l_vgpu *vgpu)
>  	}
>  	intel_vgpu_destroy_mm(vgpu->gtt.ggtt_mm);
>  	vgpu->gtt.ggtt_mm =3D NULL;
> +
> +	if (vgpu->ggtt_entries) {
> +		vfree(vgpu->ggtt_entries);
> +		vgpu->ggtt_entries =3D NULL;
> +	}
>  }
> =20
>  /**
> @@ -2834,3 +2839,71 @@ void intel_vgpu_reset_ggtt(struct intel_vgpu *vgpu=
, bool invalidate_old)
> =20
>  	ggtt_invalidate(gvt->gt);
>  }
> +
> +/**
> + * intel_gvt_save_ggtt - save all vGPU's ggtt entries
> + * @gvt: intel gvt device
> + *
> + * This function is called at driver suspend stage to save
> + * GGTT entries of every active vGPU.
> + *
> + */
> +void intel_gvt_save_ggtt(struct intel_gvt *gvt)
> +{
> +	struct intel_vgpu *vgpu;
> +	int id;
> +	u32 index, num_low, num_hi;
> +	void __iomem *addr;
> +
> +	for_each_active_vgpu(gvt, vgpu, id) {
> +		num_low =3D vgpu_aperture_sz(vgpu) >> PAGE_SHIFT;
> +		num_hi =3D vgpu_hidden_sz(vgpu) >> PAGE_SHIFT;
> +		vgpu->ggtt_entries =3D vzalloc((num_low + num_hi) * sizeof(u64));
> +		if (!vgpu->ggtt_entries)
> +			continue;
> +
> +		index =3D vgpu_aperture_gmadr_base(vgpu) >> PAGE_SHIFT;
> +		addr =3D (gen8_pte_t __iomem *)gvt->gt->i915->ggtt.gsm + index;
> +		memcpy(vgpu->ggtt_entries, addr, num_low);

Should use memcpy_fromio() and is the size right? It's the number of entries
instead of bytes count?

> +
> +		index =3D vgpu_hidden_gmadr_base(vgpu) >> PAGE_SHIFT;
> +		addr =3D (gen8_pte_t __iomem *)gvt->gt->i915->ggtt.gsm + index;
> +		memcpy((u64 *)vgpu->ggtt_entries + num_low, addr, num_hi);
> +	}

ditto

> +}
> +
> +/**
> + * intel_gvt_restore_ggtt - restore all vGPU's ggtt entries
> + * @gvt: intel gvt device
> + *
> + * This function is called at driver resume stage to restore
> + * GGTT entries of every active vGPU.
> + *
> + */
> +void intel_gvt_restore_ggtt(struct intel_gvt *gvt)
> +{
> +	struct intel_vgpu *vgpu;
> +	int id;
> +	u32 index, num_low, num_hi;
> +	void __iomem *addr;
> +
> +	for_each_active_vgpu(gvt, vgpu, id) {
> +		if (!vgpu->ggtt_entries) {
> +			gvt_vgpu_err("fail to get saved ggtt\n");
> +			continue;
> +		}
> +
> +		num_low =3D vgpu_aperture_sz(vgpu) >> PAGE_SHIFT;
> +		num_hi =3D vgpu_hidden_sz(vgpu) >> PAGE_SHIFT;
> +
> +		index =3D vgpu_aperture_gmadr_base(vgpu) >> PAGE_SHIFT;
> +		addr =3D (gen8_pte_t __iomem *)gvt->gt->i915->ggtt.gsm + index;
> +		memcpy(addr, vgpu->ggtt_entries, num_low);

memcpy_toio()

> +		index =3D vgpu_hidden_gmadr_base(vgpu) >> PAGE_SHIFT;
> +		addr =3D (gen8_pte_t __iomem *)gvt->gt->i915->ggtt.gsm + index;
> +		memcpy(addr, (u64 *)vgpu->ggtt_entries + num_low, num_hi);
> +
> +		vfree(vgpu->ggtt_entries);
> +		vgpu->ggtt_entries =3D NULL;
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gt=
t.h
> index b76a262dd9bc..0d2fb2714852 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.h
> +++ b/drivers/gpu/drm/i915/gvt/gtt.h
> @@ -279,5 +279,7 @@ int intel_vgpu_emulate_ggtt_mmio_write(struct intel_v=
gpu *vgpu,
>  	unsigned int off, void *p_data, unsigned int bytes);
> =20
>  void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu);
> +void intel_gvt_save_ggtt(struct intel_gvt *gvt);
> +void intel_gvt_restore_ggtt(struct intel_gvt *gvt);
> =20
>  #endif /* _GVT_GTT_H_ */
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gv=
t.c
> index c7c561237883..3de740fa0911 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.c
> +++ b/drivers/gpu/drm/i915/gvt/gvt.c
> @@ -405,6 +405,21 @@ int intel_gvt_init_device(struct drm_i915_private *i=
915)
>  	return ret;
>  }
> =20
> +int
> +intel_gvt_pm_suspend(struct intel_gvt *gvt)
> +{
> +	intel_gvt_save_ggtt(gvt);
> +	return 0;
> +}
> +
> +int
> +intel_gvt_pm_resume(struct intel_gvt *gvt)
> +{
> +	intel_gvt_restore_regs(gvt);
> +	intel_gvt_restore_ggtt(gvt);
> +	return 0;
> +}
> +
>  int
>  intel_gvt_register_hypervisor(struct intel_gvt_mpt *m)
>  {
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index 9831361f181e..6d99bb970214 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -199,9 +199,13 @@ struct intel_vgpu {
>  	struct intel_vgpu_submission submission;
>  	struct radix_tree_root page_track_tree;
>  	u32 hws_pga[I915_NUM_ENGINES];
> +
>  	/* Set on PCI_D3, reset on DMLR, not reflecting the actual PM state */
>  	bool d3_entered;
> =20
> +	/* Saved GGTT entries during host suspend state */
> +	u64 *ggtt_entries;
> +
>  	struct dentry *debugfs;
> =20
>  	/* Hypervisor-specific device state. */
> @@ -685,6 +689,8 @@ void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu =
*vgpu);
>  void intel_gvt_debugfs_init(struct intel_gvt *gvt);
>  void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
> =20
> +int intel_gvt_pm_suspend(struct intel_gvt *gvt);
> +int intel_gvt_pm_resume(struct intel_gvt *gvt);
> =20
>  #include "trace.h"
>  #include "mpt.h"
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 72860aaf1656..24e9dde656a4 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -3642,3 +3642,23 @@ int intel_vgpu_mmio_reg_rw(struct intel_vgpu *vgpu=
, unsigned int offset,
>  		intel_vgpu_default_mmio_read(vgpu, offset, pdata, bytes) :
>  		intel_vgpu_default_mmio_write(vgpu, offset, pdata, bytes);
>  }
> +
> +void intel_gvt_restore_regs(struct intel_gvt *gvt)
> +{
> +	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
> +	struct intel_vgpu *vgpu;
> +	int i, id;
> +	u64 val;
> +
> +	for_each_active_vgpu(gvt, vgpu, id) {
> +		mmio_hw_access_pre(gvt->gt);
> +		for (i =3D 0; i < vgpu_fence_sz(vgpu); i++) {
> +			val =3D vgpu_vreg64(vgpu, fence_num_to_offset(i));
> +			intel_vgpu_write_fence(vgpu, i, val);
> +		}
> +
> +		I915_WRITE(_MMIO(TRTTE.reg), vgpu_vreg(vgpu, TRTTE.reg));

I915_WRITE(TRTTE, vgpu_vreg_t(vgpu, TRTTE));

> +		I915_WRITE(_MMIO(0x4dfc), vgpu_vreg(vgpu, 0x4dfc));

Could we have an extra bit flag to tell which regs are required for suspend
restore?

> +		mmio_hw_access_post(gvt->gt);
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/gvt/mmio.h b/drivers/gpu/drm/i915/gvt/m=
mio.h
> index cc4812648bf4..999d9dda0614 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio.h
> +++ b/drivers/gpu/drm/i915/gvt/mmio.h
> @@ -104,4 +104,7 @@ int intel_vgpu_mmio_reg_rw(struct intel_vgpu *vgpu, u=
nsigned int offset,
> =20
>  int intel_vgpu_mask_mmio_write(struct intel_vgpu *vgpu, unsigned int off=
set,
>  				  void *p_data, unsigned int bytes);
> +
> +void intel_gvt_restore_regs(struct intel_gvt *gvt);
> +
>  #endif
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/v=
gpu.c
> index e0e073045d83..a0c1c47a842b 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -395,6 +395,7 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(str=
uct intel_gvt *gvt,
>  	idr_init(&vgpu->object_idr);
>  	intel_vgpu_init_cfg_space(vgpu, param->primary);
>  	vgpu->d3_entered =3D false;
> +	vgpu->ggtt_entries =3D NULL;
> =20
>  	ret =3D intel_vgpu_init_mmio(vgpu);
>  	if (ret)
> diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/inte=
l_gvt.c
> index 99fe8aef1c67..33650daef567 100644
> --- a/drivers/gpu/drm/i915/intel_gvt.c
> +++ b/drivers/gpu/drm/i915/intel_gvt.c
> @@ -24,6 +24,7 @@
>  #include "i915_drv.h"
>  #include "i915_vgpu.h"
>  #include "intel_gvt.h"
> +#include "gvt/gvt.h"
> =20
>  /**
>   * DOC: Intel GVT-g host support
> @@ -147,3 +148,31 @@ void intel_gvt_driver_remove(struct drm_i915_private=
 *dev_priv)
> =20
>  	intel_gvt_clean_device(dev_priv);
>  }
> +
> +/**
> + * intel_gvt_suspend - GVT suspend routine wapper
> + *
> + * @dev_priv: drm i915 private *
> + *
> + * This function is called at the i915 driver suspend stage to save nece=
ssary
> + * HW status for GVT so that vGPU can continue running after resume.
> + */
> +void intel_gvt_suspend(struct drm_i915_private *dev_priv)
> +{
> +	if (intel_gvt_active(dev_priv))
> +		intel_gvt_pm_suspend(dev_priv->gvt);
> +}
> +
> +/**
> + * intel_gvt_suspend - GVT resume routine wapper
> + *
> + * @dev_priv: drm i915 private *
> + *
> + * This function is called at the i915 driver resume stage to restore re=
quired
> + * HW status for GVT so that vGPU can continue running after resumed.
> + */
> +void intel_gvt_resume(struct drm_i915_private *dev_priv)
> +{
> +	if (intel_gvt_active(dev_priv))
> +		intel_gvt_pm_resume(dev_priv->gvt);
> +}
> diff --git a/drivers/gpu/drm/i915/intel_gvt.h b/drivers/gpu/drm/i915/inte=
l_gvt.h
> index 502fad8a8652..5732c7b10ab2 100644
> --- a/drivers/gpu/drm/i915/intel_gvt.h
> +++ b/drivers/gpu/drm/i915/intel_gvt.h
> @@ -33,6 +33,8 @@ int intel_gvt_init_device(struct drm_i915_private *dev_=
priv);
>  void intel_gvt_clean_device(struct drm_i915_private *dev_priv);
>  int intel_gvt_init_host(void);
>  void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv);
> +void intel_gvt_suspend(struct drm_i915_private *dev_priv);
> +void intel_gvt_resume(struct drm_i915_private *dev_priv);
>  #else
>  static inline int intel_gvt_init(struct drm_i915_private *dev_priv)
>  {
> @@ -46,6 +48,14 @@ static inline void intel_gvt_driver_remove(struct drm_=
i915_private *dev_priv)
>  static inline void intel_gvt_sanitize_options(struct drm_i915_private *d=
ev_priv)
>  {
>  }
> +
> +static inline void intel_gvt_suspend(struct drm_i915_private *dev_priv)
> +{
> +}
> +
> +static inline void intel_gvt_resume(struct drm_i915_private *dev_priv)
> +{
> +}
>  #endif
> =20
>  #endif /* _INTEL_GVT_H_ */
> --=20
> 2.28.0
>=20

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--oXNgvKVxGWJ0RPMJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX0YnIAAKCRCxBBozTXgY
J+U1AJ9fBkomFaIcfwMnLdtyye/3dLcPmwCffxssQAaBpXBwTfK9zfgkRDKajuk=
=yBXS
-----END PGP SIGNATURE-----

--oXNgvKVxGWJ0RPMJ--

--===============1317589975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1317589975==--
