Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6282ACF79
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 10 Nov 2020 07:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04ECB8982C;
	Tue, 10 Nov 2020 06:13:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDA98982C;
 Tue, 10 Nov 2020 06:13:21 +0000 (UTC)
IronPort-SDR: Jubr4nRJsrMMrlU44LTBRnlytKNPqXRGMAP3PwR+iHnfmxG/Us695UWlUEoTZqH3ejWx1av9Fv
 S8PmpDCnR7bg==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="169140505"
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
 d="asc'?scan'208";a="169140505"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 22:13:20 -0800
IronPort-SDR: 6k9+bK43tsUYGv2R989gGsLBl3d56AU4nUgf4BplZcrTRVLDOu1gdeRnui6oD6yXhDUIHWBdl8
 aTZ86qEPun8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
 d="asc'?scan'208";a="359973392"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga002.fm.intel.com with ESMTP; 09 Nov 2020 22:13:19 -0800
Date: Tue, 10 Nov 2020 13:59:06 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH v7 1/2] drm/i915/gvt: Save/restore HW status to support
 GVT suspend/resume
Message-ID: <20201110055906.GI1239@zhen-hp.sh.intel.com>
References: <20201027045308.158955-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201027045308.158955-1-colin.xu@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2056226074=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2056226074==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Content-Disposition: inline


--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.10.27 12:53:08 +0800, Colin Xu wrote:
> This patch save/restore necessary GVT info during i915 suspend/resume so
> that GVT enabled QEMU VM can continue running.
>=20
> Only GGTT and fence regs are saved/restored now. GVT will save GGTT
> entries on each host_entry update, restore the saved dirty entries
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
> V5:
> Fail intel_gvt_save_ggtt as -ENOMEM if fail to alloc memory to save
> ggtt. Free allocated ggtt_entries on failure.
>=20
> V6:
> Save host entry to per-vGPU gtt.ggtt_mm on each host_entry update.
>=20
> V7:
> Restore GGTT entry based on present bit.
> Split fence restore and mmio restore in different functions.
>=20
> Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/gtt.c      | 64 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/gtt.h      |  4 ++
>  drivers/gpu/drm/i915/gvt/gvt.c      |  9 ++++
>  drivers/gpu/drm/i915/gvt/gvt.h      |  3 ++
>  drivers/gpu/drm/i915/gvt/handlers.c | 44 ++++++++++++++++++--
>  drivers/gpu/drm/i915/gvt/mmio.h     |  4 ++
>  drivers/gpu/drm/i915/intel_gvt.c    | 15 +++++++
>  drivers/gpu/drm/i915/intel_gvt.h    |  5 +++
>  8 files changed, 145 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index a3a4305eda01..897c007ea96a 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -636,9 +636,18 @@ static void ggtt_set_host_entry(struct intel_vgpu_mm=
 *mm,
>  		struct intel_gvt_gtt_entry *entry, unsigned long index)
>  {
>  	struct intel_gvt_gtt_pte_ops *pte_ops =3D mm->vgpu->gvt->gtt.pte_ops;
> +	unsigned long offset =3D index;
> =20
>  	GEM_BUG_ON(mm->type !=3D INTEL_GVT_MM_GGTT);
> =20
> +	if (vgpu_gmadr_is_aperture(mm->vgpu, index << I915_GTT_PAGE_SHIFT)) {
> +		offset -=3D (vgpu_aperture_gmadr_base(mm->vgpu) >> PAGE_SHIFT);
> +		mm->ggtt_mm.host_ggtt_aperture[offset] =3D entry->val64;
> +	} else if (vgpu_gmadr_is_hidden(mm->vgpu, index << I915_GTT_PAGE_SHIFT)=
) {
> +		offset -=3D (vgpu_hidden_gmadr_base(mm->vgpu) >> PAGE_SHIFT);
> +		mm->ggtt_mm.host_ggtt_hidden[offset] =3D entry->val64;
> +	}
> +
>  	pte_ops->set_entry(NULL, entry, index, false, 0, mm->vgpu);
>  }
> =20
> @@ -1944,6 +1953,21 @@ static struct intel_vgpu_mm *intel_vgpu_create_ggt=
t_mm(struct intel_vgpu *vgpu)
>  		return ERR_PTR(-ENOMEM);
>  	}
> =20
> +	mm->ggtt_mm.host_ggtt_aperture =3D vzalloc((vgpu_aperture_sz(vgpu) >> P=
AGE_SHIFT) * sizeof(u64));
> +	if (!mm->ggtt_mm.host_ggtt_aperture) {
> +		vfree(mm->ggtt_mm.virtual_ggtt);
> +		vgpu_free_mm(mm);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	mm->ggtt_mm.host_ggtt_hidden =3D vzalloc((vgpu_hidden_sz(vgpu) >> PAGE_=
SHIFT) * sizeof(u64));
> +	if (!mm->ggtt_mm.host_ggtt_hidden) {
> +		vfree(mm->ggtt_mm.host_ggtt_aperture);
> +		vfree(mm->ggtt_mm.virtual_ggtt);
> +		vgpu_free_mm(mm);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
>  	return mm;
>  }
> =20
> @@ -1971,6 +1995,8 @@ void _intel_vgpu_mm_release(struct kref *mm_ref)
>  		invalidate_ppgtt_mm(mm);
>  	} else {
>  		vfree(mm->ggtt_mm.virtual_ggtt);
> +		vfree(mm->ggtt_mm.host_ggtt_aperture);
> +		vfree(mm->ggtt_mm.host_ggtt_hidden);
>  	}
> =20
>  	vgpu_free_mm(mm);
> @@ -2852,3 +2878,41 @@ void intel_vgpu_reset_gtt(struct intel_vgpu *vgpu)
>  	intel_vgpu_destroy_all_ppgtt_mm(vgpu);
>  	intel_vgpu_reset_ggtt(vgpu, true);
>  }
> +
> +/**
> + * intel_gvt_restore_ggtt - restore all vGPU's ggtt entries
> + * @gvt: intel gvt device
> + *
> + * This function is called at driver resume stage to restore
> + * GGTT entries of every vGPU.
> + *
> + */
> +void intel_gvt_restore_ggtt(struct intel_gvt *gvt)
> +{
> +	struct intel_vgpu *vgpu;
> +	struct intel_vgpu_mm *mm;
> +	int id;
> +	gen8_pte_t pte;
> +	u32 idx, num_low, num_hi, offset;
> +
> +	/* Restore dirty host ggtt for all vGPUs */
> +	idr_for_each_entry(&(gvt)->vgpu_idr, vgpu, id) {
> +		mm =3D vgpu->gtt.ggtt_mm;
> +
> +		num_low =3D vgpu_aperture_sz(vgpu) >> PAGE_SHIFT;
> +		offset =3D vgpu_aperture_gmadr_base(vgpu) >> PAGE_SHIFT;
> +		for (idx =3D 0; idx < num_low; idx++) {
> +			pte =3D mm->ggtt_mm.host_ggtt_aperture[idx];
> +			if (pte & _PAGE_PRESENT)
> +				write_pte64(vgpu->gvt->gt->ggtt, offset + idx, pte);
> +		}
> +
> +		num_hi =3D vgpu_hidden_sz(vgpu) >> PAGE_SHIFT;
> +		offset =3D vgpu_hidden_gmadr_base(vgpu) >> PAGE_SHIFT;
> +		for (idx =3D 0; idx < num_hi; idx++) {
> +			pte =3D mm->ggtt_mm.host_ggtt_hidden[idx];
> +			if (pte & _PAGE_PRESENT)
> +				write_pte64(vgpu->gvt->gt->ggtt, offset + idx, pte);
> +		}
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gt=
t.h
> index 52d0d88abd86..b0e173f2d990 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.h
> +++ b/drivers/gpu/drm/i915/gvt/gtt.h
> @@ -164,6 +164,9 @@ struct intel_vgpu_mm {
>  		} ppgtt_mm;
>  		struct {
>  			void *virtual_ggtt;
> +			/* Save/restore for PM */
> +			u64 *host_ggtt_aperture;
> +			u64 *host_ggtt_hidden;
>  			struct list_head partial_pte_list;
>  		} ggtt_mm;
>  	};
> @@ -280,5 +283,6 @@ int intel_vgpu_emulate_ggtt_mmio_write(struct intel_v=
gpu *vgpu,
>  	unsigned int off, void *p_data, unsigned int bytes);
> =20
>  void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu);
> +void intel_gvt_restore_ggtt(struct intel_gvt *gvt);
> =20
>  #endif /* _GVT_GTT_H_ */
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gv=
t.c
> index c7c561237883..495b6afd6571 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.c
> +++ b/drivers/gpu/drm/i915/gvt/gvt.c
> @@ -405,6 +405,15 @@ int intel_gvt_init_device(struct drm_i915_private *i=
915)
>  	return ret;
>  }
> =20
> +int
> +intel_gvt_pm_resume(struct intel_gvt *gvt)
> +{
> +	intel_gvt_restore_fence(gvt);
> +	intel_gvt_restore_mmio(gvt);
> +	intel_gvt_restore_ggtt(gvt);
> +	return 0;
> +}
> +
>  int
>  intel_gvt_register_hypervisor(struct intel_gvt_mpt *m)
>  {
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index a81cf0f01e78..b3d6355dd797 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -255,6 +255,8 @@ struct intel_gvt_mmio {
>  #define F_CMD_ACCESS	(1 << 3)
>  /* This reg has been accessed by a VM */
>  #define F_ACCESSED	(1 << 4)
> +/* This reg requires save & restore during host PM suspend/resume */
> +#define F_PM_SAVE	(1 << 5)
>  /* This reg could be accessed by unaligned address */
>  #define F_UNALIGN	(1 << 6)
>  /* This reg is in GVT's mmio save-restor list and in hardware
> @@ -685,6 +687,7 @@ void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu =
*vgpu);
>  void intel_gvt_debugfs_init(struct intel_gvt *gvt);
>  void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
> =20
> +int intel_gvt_pm_resume(struct intel_gvt *gvt);
> =20
>  #include "trace.h"
>  #include "mpt.h"
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 89353b97589a..c271a81cb835 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -3120,9 +3120,10 @@ static int init_skl_mmio_info(struct intel_gvt *gv=
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
> @@ -3661,3 +3662,40 @@ int intel_vgpu_mmio_reg_rw(struct intel_vgpu *vgpu=
, unsigned int offset,
>  		intel_vgpu_default_mmio_read(vgpu, offset, pdata, bytes) :
>  		intel_vgpu_default_mmio_write(vgpu, offset, pdata, bytes);
>  }
> +
> +void intel_gvt_restore_fence(struct intel_gvt *gvt)
> +{
> +	struct intel_vgpu *vgpu;
> +	int i, id;
> +
> +	idr_for_each_entry(&(gvt)->vgpu_idr, vgpu, id) {
> +		mmio_hw_access_pre(gvt->gt);
> +		for (i =3D 0; i < vgpu_fence_sz(vgpu); i++)
> +			intel_vgpu_write_fence(vgpu, i, vgpu_vreg64(vgpu, fence_num_to_offset=
(i)));
> +		mmio_hw_access_post(gvt->gt);
> +	}
> +}
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
> +void intel_gvt_restore_mmio(struct intel_gvt *gvt)
> +{
> +	struct intel_vgpu *vgpu;
> +	int id;
> +
> +	idr_for_each_entry(&(gvt)->vgpu_idr, vgpu, id) {
> +		mmio_hw_access_pre(gvt->gt);
> +		intel_gvt_for_each_tracked_mmio(gvt, mmio_pm_restore_handler, vgpu);
> +		mmio_hw_access_post(gvt->gt);
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/gvt/mmio.h b/drivers/gpu/drm/i915/gvt/m=
mio.h
> index cc4812648bf4..9e862dc73579 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio.h
> +++ b/drivers/gpu/drm/i915/gvt/mmio.h
> @@ -104,4 +104,8 @@ int intel_vgpu_mmio_reg_rw(struct intel_vgpu *vgpu, u=
nsigned int offset,
> =20
>  int intel_vgpu_mask_mmio_write(struct intel_vgpu *vgpu, unsigned int off=
set,
>  				  void *p_data, unsigned int bytes);
> +
> +void intel_gvt_restore_fence(struct intel_gvt *gvt);
> +void intel_gvt_restore_mmio(struct intel_gvt *gvt);
> +
>  #endif
> diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/inte=
l_gvt.c
> index 99fe8aef1c67..4e70c1a9ef2e 100644
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
> @@ -147,3 +148,17 @@ void intel_gvt_driver_remove(struct drm_i915_private=
 *dev_priv)
> =20
>  	intel_gvt_clean_device(dev_priv);
>  }
> +
> +/**
> + * intel_gvt_resume - GVT resume routine wapper
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
> index 502fad8a8652..d7d3fb6186fd 100644
> --- a/drivers/gpu/drm/i915/intel_gvt.h
> +++ b/drivers/gpu/drm/i915/intel_gvt.h
> @@ -33,6 +33,7 @@ int intel_gvt_init_device(struct drm_i915_private *dev_=
priv);
>  void intel_gvt_clean_device(struct drm_i915_private *dev_priv);
>  int intel_gvt_init_host(void);
>  void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv);
> +void intel_gvt_resume(struct drm_i915_private *dev_priv);
>  #else
>  static inline int intel_gvt_init(struct drm_i915_private *dev_priv)
>  {
> @@ -46,6 +47,10 @@ static inline void intel_gvt_driver_remove(struct drm_=
i915_private *dev_priv)
>  static inline void intel_gvt_sanitize_options(struct drm_i915_private *d=
ev_priv)
>  {
>  }
> +
> +static inline void intel_gvt_resume(struct drm_i915_private *dev_priv)
> +{
> +}
>  #endif
> =20
>  #endif /* _INTEL_GVT_H_ */
> --=20
> 2.29.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX6osKgAKCRCxBBozTXgY
J3fKAJ484cBhJy3Ma6D7+HzXmeJTEv06fACeJLFNTzVeyYyChqgy0FU/qhq3Vx4=
=jhwN
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--

--===============2056226074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============2056226074==--
