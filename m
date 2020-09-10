Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E862646AB
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Sep 2020 15:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB6A6E922;
	Thu, 10 Sep 2020 13:16:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E6E6E91B;
 Thu, 10 Sep 2020 13:16:10 +0000 (UTC)
IronPort-SDR: kd68ac4eiUJcejxKIM4rI5rQX8yM5Y/X2oMtev9CO7n4jrhi4afKIxKyZek/Hg+fNZxxSv/VCq
 6KaI6nVExi1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="222726430"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="222726430"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 06:16:10 -0700
IronPort-SDR: SL6l7UjGAnHiVTMz3IbNAX7TZFs/uwa1cHGIElo3ph6BoRDTD0ZeLeDGjewsWrfZLxMZOOhGBD
 67KncOTTbcMw==
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="505833014"
Received: from nfhickey-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.81.64])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 06:16:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v1 02/12] drm/i915: vgpu shared memory setup
 for pv support
In-Reply-To: <1599236505-9086-3-git-send-email-xiaolin.zhang@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1599236505-9086-1-git-send-email-xiaolin.zhang@intel.com>
 <1599236505-9086-3-git-send-email-xiaolin.zhang@intel.com>
Date: Thu, 10 Sep 2020 16:16:09 +0300
Message-ID: <87o8md22na.fsf@intel.com>
MIME-Version: 1.0
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
Cc: zhiyuan.lv@intel.com, chris@chris-wilson.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Sat, 05 Sep 2020, Xiaolin Zhang <xiaolin.zhang@intel.com> wrote:
> To support vgpu pv features, a common shared memory is setup used for
> communication and data exchange between guest and host GVTg to reduce
> data access overhead and trap cost.
>
> guest i915 will allocate this common memory (1 page size) and then pass
> it's physical address to host GVTg through PVINFO register so that host
> GVTg can access this shared guest page meory without trap cost with
> hyperviser's facility.
>
> guest i915 will send VGT_G2V_SHARED_PAGE_SETUP notification to host GVTg
> once shared memory setup succcessfully finished.
>
> the layout of the shared_page also defined as well, the first part is the
> PV vervsion information used for compabilty support.
>
> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_drv.c    |  2 +
>  drivers/gpu/drm/i915/i915_drv.h    |  4 +-
>  drivers/gpu/drm/i915/i915_pvinfo.h |  5 +-
>  drivers/gpu/drm/i915/i915_vgpu.c   | 94 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_vgpu.h   | 14 ++++++
>  5 files changed, 117 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> index 00292a8..5fbb4ab 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -1071,6 +1071,8 @@ static void i915_driver_release(struct drm_device *dev)
>  
>  	disable_rpm_wakeref_asserts(rpm);
>  
> +	intel_vgpu_destroy(dev_priv);
> +
>  	i915_gem_driver_release(dev_priv);
>  
>  	intel_memory_regions_driver_release(dev_priv);
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 16d1b51..3cde2c5f 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -809,7 +809,9 @@ struct i915_virtual_gpu {
>  	bool active;
>  	u32 caps;
>  	u32 pv_caps;
> -};
> +
> +	struct i915_virtual_gpu_pv *pv;
> +} __packed;

I'm unsure why this struct should be packed.

>  
>  struct intel_cdclk_config {
>  	unsigned int cdclk, vco, ref, bypass;
> diff --git a/drivers/gpu/drm/i915/i915_pvinfo.h b/drivers/gpu/drm/i915/i915_pvinfo.h
> index 8b0dc25..1d44876 100644
> --- a/drivers/gpu/drm/i915/i915_pvinfo.h
> +++ b/drivers/gpu/drm/i915/i915_pvinfo.h
> @@ -48,6 +48,7 @@ enum vgt_g2v_type {
>  	VGT_G2V_PPGTT_L4_PAGE_TABLE_DESTROY,
>  	VGT_G2V_EXECLIST_CONTEXT_CREATE,
>  	VGT_G2V_EXECLIST_CONTEXT_DESTROY,
> +	VGT_G2V_SHARED_PAGE_REGISTER,
>  	VGT_G2V_MAX,
>  };
>  
> @@ -112,7 +113,9 @@ struct vgt_if {
>  
>  	u32 pv_caps;
>  
> -	u32  rsv7[0x200 - 25];    /* pad to one page */
> +	u64 shared_page_gpa;
> +
> +	u32  rsv7[0x200 - 27];    /* pad to one page */
>  } __packed;
>  
>  #define vgtif_offset(x) (offsetof(struct vgt_if, x))
> diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
> index 10960125..8b2b451 100644
> --- a/drivers/gpu/drm/i915/i915_vgpu.c
> +++ b/drivers/gpu/drm/i915/i915_vgpu.c
> @@ -110,6 +110,17 @@ void intel_vgpu_detect(struct drm_i915_private *dev_priv)
>  	pci_iounmap(pdev, shared_area);
>  }
>  
> +void intel_vgpu_destroy(struct drm_i915_private *i915)
> +{
> +	struct i915_virtual_gpu_pv *pv = i915->vgpu.pv;
> +
> +	if (!intel_vgpu_active(i915) || !pv)
> +		return;
> +
> +	__free_page(virt_to_page(pv->shared_page));
> +	kfree(pv);
> +}
> +
>  void intel_vgpu_register(struct drm_i915_private *i915)
>  {
>  	/*
> @@ -360,6 +371,83 @@ int intel_vgt_balloon(struct i915_ggtt *ggtt)
>   */
>  
>  /*
> + * shared_page setup for VGPU PV features
> + */
> +static int intel_vgpu_setup_shared_page(struct drm_i915_private *i915,
> +		void __iomem *shared_area)
> +{
> +	void __iomem *addr;
> +	struct i915_virtual_gpu_pv *pv;
> +	struct gvt_shared_page *base;
> +	u64 gpa;
> +	u16 ver_maj, ver_min;
> +	int ret = 0;
> +
> +	/* We allocate 1 page shared between guest and GVT for data exchange.
> +	 *       _______________________________
> +	 *      |version                        |
> +	 *      |_______________________________PAGE/8
> +	 *      |                               |
> +	 *      |_______________________________PAGE/4
> +	 *      |                               |
> +	 *      |                               |
> +	 *      |                               |
> +	 *      |_______________________________PAGE/2
> +	 *      |                               |
> +	 *      |                               |
> +	 *      |                               |
> +	 *      |                               |
> +	 *      |                               |
> +	 *      |                               |
> +	 *      |                               |
> +	 *      |_______________________________|
> +	 *
> +	 * 0 offset: PV version area
> +	 */
> +
> +	base =  (struct gvt_shared_page *)get_zeroed_page(GFP_KERNEL);
> +	if (!base) {
> +		dev_info(i915->drm.dev, "out of memory for shared memory\n");
> +		return -ENOMEM;
> +	}
> +
> +	/* pass guest memory pa address to GVT and then read back to verify */
> +	gpa = __pa(base);
> +	addr = shared_area + vgtif_offset(shared_page_gpa);
> +	writeq(gpa, addr);
> +	if (gpa != readq(addr)) {
> +		dev_info(i915->drm.dev, "passed shared_page_gpa failed\n");
> +		ret = -EIO;
> +		goto err;
> +	}
> +
> +	addr = shared_area + vgtif_offset(g2v_notify);
> +	writel(VGT_G2V_SHARED_PAGE_REGISTER, addr);
> +
> +	ver_maj = base->ver_major;
> +	ver_min = base->ver_minor;
> +	if (ver_maj != PV_MAJOR || ver_min != PV_MINOR) {
> +		dev_info(i915->drm.dev, "VGPU PV version incompatible\n");
> +		ret = -EIO;
> +		goto err;
> +	}
> +
> +	pv = kzalloc(sizeof(struct i915_virtual_gpu_pv), GFP_KERNEL);
> +	if (!pv) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	DRM_INFO("vgpu PV ver major %d and minor %d\n", ver_maj, ver_min);

Please use drm_info(), and please polish the message for info
level. This looks like debug to me.

> +	i915->vgpu.pv = pv;
> +	pv->shared_page = base;
> +	return ret;
> +err:
> +	__free_page(virt_to_page(base));
> +	return ret;
> +}
> +
> +/*
>   * Config vgpu PV ops for different PV capabilities
>   */
>  void intel_vgpu_config_pv_caps(struct drm_i915_private *i915,
> @@ -395,5 +483,11 @@ bool intel_vgpu_detect_pv_caps(struct drm_i915_private *i915,
>  	if (!pvcaps)
>  		return false;
>  
> +	if (intel_vgpu_setup_shared_page(i915, shared_area)) {
> +		i915->vgpu.pv_caps = 0;
> +		writel(0, shared_area + vgtif_offset(pv_caps));
> +		return false;
> +	}
> +
>  	return true;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_vgpu.h b/drivers/gpu/drm/i915/i915_vgpu.h
> index 1b10175..aeef20f 100644
> --- a/drivers/gpu/drm/i915/i915_vgpu.h
> +++ b/drivers/gpu/drm/i915/i915_vgpu.h
> @@ -29,12 +29,26 @@
>  struct drm_i915_private;
>  struct i915_ggtt;
>  
> +#define PV_MAJOR        0
> +#define PV_MINOR        1
> +
>  /* define different PV capabilities */
>  enum pv_caps {
>  	PV_NONE = 0,
>  };
>  
> +/* A common shared page(4KB) between GVTg and vgpu allocated by guest */
> +struct gvt_shared_page {

Prefix with intel_?

> +	u16 ver_major;
> +	u16 ver_minor;
> +};
> +
> +struct i915_virtual_gpu_pv {

Why i915_virtual_gpu instead of intel_vgpu like everywhere else?

> +	struct gvt_shared_page *shared_page;
> +};
> +
>  void intel_vgpu_detect(struct drm_i915_private *i915);
> +void intel_vgpu_destroy(struct drm_i915_private *i915);
>  bool intel_vgpu_active(struct drm_i915_private *i915);
>  void intel_vgpu_register(struct drm_i915_private *i915);
>  bool intel_vgpu_has_full_ppgtt(struct drm_i915_private *i915);

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
