Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A929828FE1A
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Oct 2020 08:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6143E6E9B1;
	Fri, 16 Oct 2020 06:15:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2816E9B1;
 Fri, 16 Oct 2020 06:15:10 +0000 (UTC)
IronPort-SDR: t0EBUHlz9EVaDGPjBfS7bPLK3ep1oJIlEpB0I23aXm4y14+3aYJgyh0OZE6yho9wscgcLiSRmM
 eLVrj+g/4OPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="184097985"
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; 
 d="asc'?scan'208";a="184097985"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 23:15:06 -0700
IronPort-SDR: e63VJOYn33lzIYFI7v3XRS9Xv7p5RCDIIp+gW4LVpqFFj1y1vq7zDQGi69lxRb3hV1euDmuurT
 ZVu9v65lUxqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; 
 d="asc'?scan'208";a="347101819"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga008.jf.intel.com with ESMTP; 15 Oct 2020 23:15:04 -0700
Date: Fri, 16 Oct 2020 13:54:26 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH v4 1/2] drm/i915/gvt: Save/restore HW status for GVT
 during suspend/resume
Message-ID: <20201016055426.GH27141@zhen-hp.sh.intel.com>
References: <20201016055959.295529-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201016055959.295529-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1156699578=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1156699578==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6d1KVhp94hk3Jrm"
Content-Disposition: inline


--d6d1KVhp94hk3Jrm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.10.16 13:59:59 +0800, Colin Xu wrote:
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
> V3: (zhenyu)
> - Incorrect copy length. Should be num entries * entry size.
> - Use memcpy_toio()/memcpy_fromio() instead of memcpy for iomem.
> - Add F_PM_SAVE flags to indicate which MMIOs to save/restore for PM.
>=20
> V4:
> Rebase.
>=20
> Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c      | 75 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/gtt.h      |  2 +
>  drivers/gpu/drm/i915/gvt/gvt.c      | 15 ++++++
>  drivers/gpu/drm/i915/gvt/gvt.h      |  8 +++
>  drivers/gpu/drm/i915/gvt/handlers.c | 39 +++++++++++++--
>  drivers/gpu/drm/i915/gvt/mmio.h     |  3 ++
>  drivers/gpu/drm/i915/gvt/vgpu.c     |  1 +
>  drivers/gpu/drm/i915/intel_gvt.c    | 29 +++++++++++
>  drivers/gpu/drm/i915/intel_gvt.h    | 10 ++++
>  9 files changed, 179 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index a3a4305eda01..534bb2e08538 100644
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
> @@ -2852,3 +2857,73 @@ void intel_vgpu_reset_gtt(struct intel_vgpu *vgpu)
>  	intel_vgpu_destroy_all_ppgtt_mm(vgpu);
>  	intel_vgpu_reset_ggtt(vgpu, true);
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

I think doing allocation in suspend is not good, that should prealloc
at vgpu create time and free at destroy.

> +
> +		index =3D vgpu_aperture_gmadr_base(vgpu) >> PAGE_SHIFT;
> +		addr =3D (gen8_pte_t __iomem *)gvt->gt->i915->ggtt.gsm + index;
> +		memcpy_fromio(vgpu->ggtt_entries, addr, num_low * sizeof(u64));
> +
> +		index =3D vgpu_hidden_gmadr_base(vgpu) >> PAGE_SHIFT;
> +		addr =3D (gen8_pte_t __iomem *)gvt->gt->i915->ggtt.gsm + index;
> +		memcpy_fromio(vgpu->ggtt_entries + num_low,
> +			      addr, num_hi * sizeof(u64));
> +	}
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
> +		memcpy_toio(addr, vgpu->ggtt_entries, num_low * sizeof(u64));
> +		index =3D vgpu_hidden_gmadr_base(vgpu) >> PAGE_SHIFT;
> +		addr =3D (gen8_pte_t __iomem *)gvt->gt->i915->ggtt.gsm + index;
> +		memcpy_toio(addr, vgpu->ggtt_entries + num_low,
> +			    num_hi * sizeof(u64));
> +
> +		vfree(vgpu->ggtt_entries);
> +		vgpu->ggtt_entries =3D NULL;
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gt=
t.h
> index 52d0d88abd86..141e0a41cd50 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.h
> +++ b/drivers/gpu/drm/i915/gvt/gtt.h
> @@ -280,5 +280,7 @@ int intel_vgpu_emulate_ggtt_mmio_write(struct intel_v=
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
> index a81cf0f01e78..3459a0ea1d4d 100644
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
> @@ -255,6 +259,8 @@ struct intel_gvt_mmio {
>  #define F_CMD_ACCESS	(1 << 3)
>  /* This reg has been accessed by a VM */
>  #define F_ACCESSED	(1 << 4)
> +/* This reg requires save & restore during host PM suspend/resume */
> +#define F_PM_SAVE	(1 << 5)
>  /* This reg could be accessed by unaligned address */
>  #define F_UNALIGN	(1 << 6)
>  /* This reg is in GVT's mmio save-restor list and in hardware
> @@ -685,6 +691,8 @@ void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu =
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
> index 0031e7c43ea8..ea1d040916d9 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -3092,9 +3092,10 @@ static int init_skl_mmio_info(struct intel_gvt *gv=
t)
>  	MMIO_DFH(TRVATTL3PTRDW(2), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>  	MMIO_DFH(TRVATTL3PTRDW(3), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>  	MMIO_DFH(TRVADR, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> -	MMIO_DFH(TRTTE, D_SKL_PLUS, F_CMD_ACCESS,
> -		NULL, gen9_trtte_write);
> -	MMIO_DH(_MMIO(0x4dfc), D_SKL_PLUS, NULL, gen9_trtt_chicken_write);
> +	MMIO_DFH(TRTTE, D_SKL_PLUS, F_CMD_ACCESS | F_PM_SAVE,
> +		 NULL, gen9_trtte_write);
> +	MMIO_DFH(_MMIO(0x4dfc), D_SKL_PLUS, F_PM_SAVE,
> +		 NULL, gen9_trtt_chicken_write);
> =20
>  	MMIO_D(_MMIO(0x46430), D_SKL_PLUS);
> =20
> @@ -3631,3 +3632,35 @@ int intel_vgpu_mmio_reg_rw(struct intel_vgpu *vgpu=
, unsigned int offset,
>  		intel_vgpu_default_mmio_read(vgpu, offset, pdata, bytes) :
>  		intel_vgpu_default_mmio_write(vgpu, offset, pdata, bytes);
>  }
> +
> +static inline int mmio_pm_restore_handler(struct intel_gvt *gvt,
> +					  u32 offset, void *data)
> +{
> +	struct intel_vgpu *vgpu =3D data;
> +	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
> +
> +	if (gvt->mmio.mmio_attribute[offset >> 2] & F_PM_SAVE)
> +		I915_WRITE(_MMIO(offset), vgpu_vreg(vgpu, offset));
> +
> +	return 0;
> +}
> +
> +void intel_gvt_restore_regs(struct intel_gvt *gvt)
> +{
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
> +		intel_gvt_for_each_tracked_mmio(gvt,
> +						mmio_pm_restore_handler, vgpu);
> +
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
> index f6d7e33c7099..bfe2fb5fcc30 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -396,6 +396,7 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(str=
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

--d6d1KVhp94hk3Jrm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX4k1kgAKCRCxBBozTXgY
J/DRAJ9SnjXY3cbn6/raPnjRcvhCkzoNWQCeJnD1awGh3ZP7h8uCBMB1iswDmMM=
=0GlG
-----END PGP SIGNATURE-----

--d6d1KVhp94hk3Jrm--

--===============1156699578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1156699578==--
