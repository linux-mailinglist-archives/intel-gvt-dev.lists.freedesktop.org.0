Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288E0264695
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Sep 2020 15:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFCC6E08A;
	Thu, 10 Sep 2020 13:10:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BCE6E08A;
 Thu, 10 Sep 2020 13:10:17 +0000 (UTC)
IronPort-SDR: hanW1CtQatQdUNj4RRJX/cbswzEBjCsAKll5TS3Hu2NGQDRR4ArN43Ai3v4OSkCbYmUS5y34ly
 yVuDgCtPAxig==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="176586661"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="176586661"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 06:10:17 -0700
IronPort-SDR: 1vBZa6ylDFaP11hWAHZNXbNq1R/D6YrZRh3pu4MLauJugws4R8YPl2be5gXBMRhQr4qb3v631W
 /kFZ4ktUIDmA==
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="505831779"
Received: from nfhickey-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.81.64])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 06:10:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v1 01/12] drm/i915: introduced vgpu pv
 capability
In-Reply-To: <1599236505-9086-2-git-send-email-xiaolin.zhang@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1599236505-9086-1-git-send-email-xiaolin.zhang@intel.com>
 <1599236505-9086-2-git-send-email-xiaolin.zhang@intel.com>
Date: Thu, 10 Sep 2020 16:10:15 +0300
Message-ID: <87tuw522x4.fsf@intel.com>
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
> to enable vgpu pv feature, pv capability is introduced for guest by
> new pv_caps member in struct i915_virtual_gpu and for host GVT by
> new pv_caps register in struct vgt_if.
>
> both of them are used to control different pv feature support in each
> domain and the final pv caps runtime negotiated between guest and host.
>
> it also adds VGT_CAPS_PV capability BIT useb by guest to query host GVTg
> whether support any PV feature or not.
>
> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_debugfs.c |  3 ++
>  drivers/gpu/drm/i915/i915_drv.h     |  1 +
>  drivers/gpu/drm/i915/i915_pvinfo.h  |  5 ++-
>  drivers/gpu/drm/i915/i915_vgpu.c    | 63 ++++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/i915/i915_vgpu.h    | 10 ++++++
>  5 files changed, 80 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index 7842199..fd1e0fc 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -48,6 +48,7 @@
>  #include "i915_trace.h"
>  #include "intel_pm.h"
>  #include "intel_sideband.h"
> +#include "i915_vgpu.h"
>  
>  static inline struct drm_i915_private *node_to_i915(struct drm_info_node *node)
>  {
> @@ -60,6 +61,8 @@ static int i915_capabilities(struct seq_file *m, void *data)
>  	struct drm_printer p = drm_seq_file_printer(m);
>  
>  	seq_printf(m, "pch: %d\n", INTEL_PCH_TYPE(i915));
> +	if (intel_vgpu_active(i915))
> +		seq_printf(m, "vgpu pv_caps: 0x%x\n", i915->vgpu.pv_caps);

I think the placement here over-emphasizes the importance of the
caps. Maybe you also want to print something if vgpu isn't active?

>  
>  	intel_device_info_print_static(INTEL_INFO(i915), &p);
>  	intel_device_info_print_runtime(RUNTIME_INFO(i915), &p);
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index a455752..16d1b51 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -808,6 +808,7 @@ struct i915_virtual_gpu {
>  	struct mutex lock; /* serialises sending of g2v_notify command pkts */
>  	bool active;
>  	u32 caps;
> +	u32 pv_caps;
>  };
>  
>  struct intel_cdclk_config {
> diff --git a/drivers/gpu/drm/i915/i915_pvinfo.h b/drivers/gpu/drm/i915/i915_pvinfo.h
> index 683e97a..8b0dc25 100644
> --- a/drivers/gpu/drm/i915/i915_pvinfo.h
> +++ b/drivers/gpu/drm/i915/i915_pvinfo.h
> @@ -57,6 +57,7 @@ enum vgt_g2v_type {
>  #define VGT_CAPS_FULL_PPGTT		BIT(2)
>  #define VGT_CAPS_HWSP_EMULATION		BIT(3)
>  #define VGT_CAPS_HUGE_GTT		BIT(4)
> +#define VGT_CAPS_PV			BIT(5)
>  
>  struct vgt_if {
>  	u64 magic;		/* VGT_MAGIC */
> @@ -109,7 +110,9 @@ struct vgt_if {
>  	u32 execlist_context_descriptor_lo;
>  	u32 execlist_context_descriptor_hi;
>  
> -	u32  rsv7[0x200 - 24];    /* pad to one page */
> +	u32 pv_caps;
> +
> +	u32  rsv7[0x200 - 25];    /* pad to one page */
>  } __packed;
>  
>  #define vgtif_offset(x) (offsetof(struct vgt_if, x))
> diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
> index 70fca72..10960125 100644
> --- a/drivers/gpu/drm/i915/i915_vgpu.c
> +++ b/drivers/gpu/drm/i915/i915_vgpu.c
> @@ -98,7 +98,13 @@ void intel_vgpu_detect(struct drm_i915_private *dev_priv)
>  
>  	dev_priv->vgpu.active = true;
>  	mutex_init(&dev_priv->vgpu.lock);
> -	drm_info(&dev_priv->drm, "Virtual GPU for Intel GVT-g detected.\n");
> +
> +	if (!intel_vgpu_detect_pv_caps(dev_priv, shared_area)) {
> +		DRM_INFO("Virtual GPU for Intel GVT-g detected.\n");
> +		goto out;

Seems clearer without the goto. It's not like one is an error path,
right?

> +	}
> +
> +	DRM_INFO("Virtual GPU for Intel GVT-g detected with PV Optimized.\n");

Please retain use of drm_info().

>  
>  out:
>  	pci_iounmap(pdev, shared_area);
> @@ -134,6 +140,18 @@ bool intel_vgpu_has_huge_gtt(struct drm_i915_private *dev_priv)
>  	return dev_priv->vgpu.caps & VGT_CAPS_HUGE_GTT;
>  }
>  
> +static bool intel_vgpu_check_pv_cap(struct drm_i915_private *dev_priv,
> +		enum pv_caps cap)

The indentation is off here, and all over the place, as reported by
checkpatch. Please address them everywhere.

> +{
> +	return (dev_priv->vgpu.active && (dev_priv->vgpu.caps & VGT_CAPS_PV)
> +			&& (dev_priv->vgpu.pv_caps & cap));
> +}
> +
> +static bool intel_vgpu_has_pv_caps(struct drm_i915_private *dev_priv)
> +{
> +	return dev_priv->vgpu.caps & VGT_CAPS_PV;
> +}
> +
>  struct _balloon_info_ {
>  	/*
>  	 * There are up to 2 regions per mappable/unmappable graphic
> @@ -336,3 +354,46 @@ int intel_vgt_balloon(struct i915_ggtt *ggtt)
>  	drm_err(&dev_priv->drm, "VGT balloon fail\n");
>  	return ret;
>  }
> +
> +/*
> + * i915 vgpu PV support for Linux
> + */
> +
> +/*
> + * Config vgpu PV ops for different PV capabilities
> + */
> +void intel_vgpu_config_pv_caps(struct drm_i915_private *i915,
> +		enum pv_caps cap, void *data)
> +{
> +
> +	if (!intel_vgpu_check_pv_cap(i915, cap))
> +		return;
> +}
> +
> +/**
> + * intel_vgpu_detect_pv_caps - detect virtual GPU PV capabilities
> + * @dev_priv: i915 device private

If you use kernel-doc, please write proper kernel-doc comments. Again,
please see the report sent to you by our CI.

> + *
> + * This function is called at the initialization stage, to detect VGPU
> + * PV capabilities
> + */
> +bool intel_vgpu_detect_pv_caps(struct drm_i915_private *i915,
> +		void __iomem *shared_area)
> +{
> +	u32 gvt_pvcaps;
> +	u32 pvcaps = 0;
> +
> +	if (!intel_vgpu_has_pv_caps(i915))
> +		return false;
> +
> +	/* PV capability negotiation between PV guest and GVT */
> +	gvt_pvcaps = readl(shared_area + vgtif_offset(pv_caps));
> +	pvcaps = i915->vgpu.pv_caps & gvt_pvcaps;
> +	i915->vgpu.pv_caps = pvcaps;
> +	writel(pvcaps, shared_area + vgtif_offset(pv_caps));
> +
> +	if (!pvcaps)
> +		return false;
> +
> +	return true;
> +}
> diff --git a/drivers/gpu/drm/i915/i915_vgpu.h b/drivers/gpu/drm/i915/i915_vgpu.h
> index ffbb77d..1b10175 100644
> --- a/drivers/gpu/drm/i915/i915_vgpu.h
> +++ b/drivers/gpu/drm/i915/i915_vgpu.h
> @@ -29,6 +29,11 @@
>  struct drm_i915_private;
>  struct i915_ggtt;
>  
> +/* define different PV capabilities */

The comment adds nothing.

> +enum pv_caps {

Please prefix the type name and the enumerations with intel_ or
something.

> +	PV_NONE = 0,
> +};
> +
>  void intel_vgpu_detect(struct drm_i915_private *i915);
>  bool intel_vgpu_active(struct drm_i915_private *i915);
>  void intel_vgpu_register(struct drm_i915_private *i915);
> @@ -39,4 +44,9 @@ bool intel_vgpu_has_huge_gtt(struct drm_i915_private *i915);
>  int intel_vgt_balloon(struct i915_ggtt *ggtt);
>  void intel_vgt_deballoon(struct i915_ggtt *ggtt);
>  
> +/* i915 vgpu pv related functions */
> +bool intel_vgpu_detect_pv_caps(struct drm_i915_private *i915,
> +		void __iomem *shared_area);
> +void intel_vgpu_config_pv_caps(struct drm_i915_private *i915,
> +		enum pv_caps cap, void *data);
>  #endif /* _I915_VGPU_H_ */

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
