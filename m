Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AD91D7580
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 May 2020 12:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0754989956;
	Mon, 18 May 2020 10:47:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E13389CDB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 May 2020 10:47:10 +0000 (UTC)
IronPort-SDR: K6dWhTUn5FD/ecsRN6wDsubQsUJhmrMsc2WCAyFDVsdEWuqB5+ct1BcSc0LFd61mzCwPDKCKVo
 1PIaXGEFqqOw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 03:47:09 -0700
IronPort-SDR: MPOsKGO+94shtyEMQhSldstu4jkdEom+ZPsBQUvjuMXlrZNIGY21SrNXd1YD6juF685Ov8KiIO
 QHjewrQ0qBQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
 d="asc'?scan'208";a="281931431"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga002.jf.intel.com with ESMTP; 18 May 2020 03:47:08 -0700
Date: Mon, 18 May 2020 18:32:11 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Enable GVT vGPU enabled guest S3 and resume
Message-ID: <20200518103211.GW18545@zhen-hp.sh.intel.com>
References: <20200518061910.147299-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200518061910.147299-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1123649923=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1123649923==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xjCTGciBHXp1jY+V"
Content-Disposition: inline


--xjCTGciBHXp1jY+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.05.18 14:19:10 +0800, Colin Xu wrote:
> This patch enables GVT vGPU enabled guest enter and resume from S3.
> During S3, QEMU process is still active so all ppgtt still in memory
> thus no need to invalidate them. However current ppgtt invalidation and
> destroy logic happens in dmlr, this operation happens during both boot
> and resuming. Thus we need differ these different power states for
> proper handling.
> vCPU PCI cfg space is a modified copy from host. If PM cap is supported
> on host, vGPU cfg space will also report the capability and handle read
> or write request on PMCSR register. On receiving PCI_D3hot when enter S3,
> vGPU will track current PM status. During dmlr, gvt will check if current
> dmrl is during normal boot or S3 resume. If S3 resume, skip the ppgtt mm
> invalidation and destroy so that they can be re-used, then clear the PM
> status flag. PCI_D0 is set prior to dmlr so can't depend on it to skip
> the ppgtt invalidation and destroy operation.
>=20
> To test this feature, make sure S3 is enabled in QEMU parameters:
> i440fx: PIIX4_PM.disable_s3=3D0
> q35: ICH9-LPC.disable_s3=3D0
> Also need enable sleep option in guest OS if it's disabled.
>=20
> With all required options enabled and proper GFX driver installed, user
> can enter S3 from guest OS, and resume from QEMU monitor using
> system_wakeup.
>=20
> Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/cfg_space.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/gtt.c       |  2 +-
>  drivers/gpu/drm/i915/gvt/gtt.h       |  2 ++
>  drivers/gpu/drm/i915/gvt/gvt.h       |  3 +++
>  drivers/gpu/drm/i915/gvt/vgpu.c      | 21 ++++++++++++++++++---
>  5 files changed, 48 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/=
gvt/cfg_space.c
> index 072725a448db..ad86c5eb5bba 100644
> --- a/drivers/gpu/drm/i915/gvt/cfg_space.c
> +++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
> @@ -70,6 +70,7 @@ static void vgpu_pci_cfg_mem_write(struct intel_vgpu *v=
gpu, unsigned int off,
>  {
>  	u8 *cfg_base =3D vgpu_cfg_space(vgpu);
>  	u8 mask, new, old;
> +	pci_power_t pwr;
>  	int i =3D 0;
> =20
>  	for (; i < bytes && (off + i < sizeof(pci_cfg_space_rw_bmp)); i++) {
> @@ -91,6 +92,15 @@ static void vgpu_pci_cfg_mem_write(struct intel_vgpu *=
vgpu, unsigned int off,
>  	/* For other configuration space directly copy as it is. */
>  	if (i < bytes)
>  		memcpy(cfg_base + off + i, src + i, bytes - i);
> +
> +	if (off =3D=3D vgpu->cfg_space.pmcsr_off && vgpu->cfg_space.pmcsr_off) {
> +		pwr =3D (pci_power_t __force)(*(u16*)(&vgpu_cfg_space(vgpu)[off])
> +			& PCI_PM_CTRL_STATE_MASK);
> +		if (pwr =3D=3D PCI_D3hot)
> +			vgpu->d3_entered =3D true;
> +		gvt_dbg_core("vgpu-%d power status changed to %d\n",
> +			     vgpu->id, pwr);
> +	}

Good for tracking PM state, that's exactly what I expected. But how about
other Dx state? e.g if guest wants to do suspend-to-idle, would it hit same
penalty for ppgtt invalidate?

>  }
> =20
>  /**
> @@ -366,6 +376,7 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu *vgp=
u,
>  	struct intel_gvt *gvt =3D vgpu->gvt;
>  	const struct intel_gvt_device_info *info =3D &gvt->device_info;
>  	u16 *gmch_ctl;
> +	u8 next;
> =20
>  	memcpy(vgpu_cfg_space(vgpu), gvt->firmware.cfg_space,
>  	       info->cfg_space_size);
> @@ -401,6 +412,19 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu *vg=
pu,
>  		pci_resource_len(gvt->gt->i915->drm.pdev, 2);
> =20
>  	memset(vgpu_cfg_space(vgpu) + PCI_ROM_ADDRESS, 0, 4);
> +
> +	/* PM Support */
> +	vgpu->cfg_space.pmcsr_off =3D 0;
> +	if (vgpu_cfg_space(vgpu)[PCI_STATUS] & PCI_STATUS_CAP_LIST) {
> +		next =3D vgpu_cfg_space(vgpu)[PCI_CAPABILITY_LIST];
> +		do {
> +			if (vgpu_cfg_space(vgpu)[next + PCI_CAP_LIST_ID] =3D=3D PCI_CAP_ID_PM=
) {
> +				vgpu->cfg_space.pmcsr_off =3D next + PCI_PM_CTRL;
> +				break;
> +			}
> +			next =3D vgpu_cfg_space(vgpu)[next + PCI_CAP_LIST_NEXT];
> +		} while (next);
> +	}
>  }
> =20
>  /**
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index 210016192ce7..a3a4305eda01 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -2501,7 +2501,7 @@ int intel_vgpu_init_gtt(struct intel_vgpu *vgpu)
>  	return create_scratch_page_tree(vgpu);
>  }
> =20
> -static void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu)
> +void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu)
>  {
>  	struct list_head *pos, *n;
>  	struct intel_vgpu_mm *mm;
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gt=
t.h
> index 320b8d6ad92f..52d0d88abd86 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.h
> +++ b/drivers/gpu/drm/i915/gvt/gtt.h
> @@ -279,4 +279,6 @@ int intel_vgpu_emulate_ggtt_mmio_read(struct intel_vg=
pu *vgpu,
>  int intel_vgpu_emulate_ggtt_mmio_write(struct intel_vgpu *vgpu,
>  	unsigned int off, void *p_data, unsigned int bytes);
> =20
> +void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu);
> +
>  #endif /* _GVT_GTT_H_ */
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index a4a6db6b7f90..ff7f2515a6fe 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -106,6 +106,7 @@ struct intel_vgpu_pci_bar {
>  struct intel_vgpu_cfg_space {
>  	unsigned char virtual_cfg_space[PCI_CFG_SPACE_EXP_SIZE];
>  	struct intel_vgpu_pci_bar bar[INTEL_GVT_MAX_BAR_NUM];
> +	u32 pmcsr_off;
>  };
> =20
>  #define vgpu_cfg_space(vgpu) ((vgpu)->cfg_space.virtual_cfg_space)
> @@ -198,6 +199,8 @@ struct intel_vgpu {
>  	struct intel_vgpu_submission submission;
>  	struct radix_tree_root page_track_tree;
>  	u32 hws_pga[I915_NUM_ENGINES];
> +	/* Set on PCI_D3, reset on DMLR, not reflecting the actual PM state */
> +	bool d3_entered;
> =20
>  	struct dentry *debugfs;
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/v=
gpu.c
> index 1d5ff88078bd..3779f9f28061 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -257,7 +257,9 @@ void intel_gvt_release_vgpu(struct intel_vgpu *vgpu)
>  	intel_gvt_deactivate_vgpu(vgpu);
> =20
>  	mutex_lock(&vgpu->vgpu_lock);
> +	vgpu->d3_entered =3D false;
>  	intel_vgpu_clean_workloads(vgpu, ALL_ENGINES);
> +	intel_vgpu_destroy_all_ppgtt_mm(vgpu);

I think this is good to do when release vGPU, but should be in a split patc=
h.

>  	intel_vgpu_dmabuf_cleanup(vgpu);
>  	mutex_unlock(&vgpu->vgpu_lock);
>  }
> @@ -393,6 +395,7 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(str=
uct intel_gvt *gvt,
>  	INIT_RADIX_TREE(&vgpu->page_track_tree, GFP_KERNEL);
>  	idr_init(&vgpu->object_idr);
>  	intel_vgpu_init_cfg_space(vgpu, param->primary);
> +	vgpu->d3_entered =3D false;
> =20
>  	ret =3D intel_vgpu_init_mmio(vgpu);
>  	if (ret)
> @@ -557,10 +560,15 @@ void intel_gvt_reset_vgpu_locked(struct intel_vgpu =
*vgpu, bool dmlr,
>  	/* full GPU reset or device model level reset */
>  	if (engine_mask =3D=3D ALL_ENGINES || dmlr) {
>  		intel_vgpu_select_submission_ops(vgpu, ALL_ENGINES, 0);
> -		intel_vgpu_invalidate_ppgtt(vgpu);
> +		if (engine_mask =3D=3D ALL_ENGINES)
> +			intel_vgpu_invalidate_ppgtt(vgpu);
>  		/*fence will not be reset during virtual reset */
>  		if (dmlr) {
> -			intel_vgpu_reset_gtt(vgpu);
> +			if(!vgpu->d3_entered) {
> +				intel_vgpu_invalidate_ppgtt(vgpu);
> +				intel_vgpu_destroy_all_ppgtt_mm(vgpu);
> +			}
> +			intel_vgpu_reset_ggtt(vgpu, true);
>  			intel_vgpu_reset_resource(vgpu);
>  		}
> =20
> @@ -572,7 +580,14 @@ void intel_gvt_reset_vgpu_locked(struct intel_vgpu *=
vgpu, bool dmlr,
>  			intel_vgpu_reset_cfg_space(vgpu);
>  			/* only reset the failsafe mode when dmlr reset */
>  			vgpu->failsafe =3D false;
> -			vgpu->pv_notified =3D false;
> +			/*
> +			 * PCI_D0 is set before dmlr, so reset d3_entered here
> +			 * after done using.
> +			 */
> +			if(vgpu->d3_entered)
> +				vgpu->d3_entered =3D false;
> +			else
> +				vgpu->pv_notified =3D false;
>  		}
>  	}
> =20
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

--xjCTGciBHXp1jY+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXsJkKgAKCRCxBBozTXgY
J+GUAJsE7S42hH2KLAlXjQsAkIybdWz4igCfX8b4pr6AHJ+xbOZQpwEreiTtQLI=
=ImMr
-----END PGP SIGNATURE-----

--xjCTGciBHXp1jY+V--

--===============1123649923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1123649923==--
