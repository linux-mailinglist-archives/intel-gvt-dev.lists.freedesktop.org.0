Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82308577FB
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Feb 2024 09:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1A010E40E;
	Fri, 16 Feb 2024 08:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMPcuylG";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDAF10E40E;
 Fri, 16 Feb 2024 08:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708073490; x=1739609490;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tldO0oAElb0EM3Jm2vnWyFrp/x3ZCudlzcDdQgwDE3c=;
 b=lMPcuylG7M7h6rmwqz7cY3EgLGoFHzm0jv9pbLhZmLIllnt/2yfW7Enb
 LKb4f6EBsQMYnrPVueU7HszffC4zgZPzGQ58BL/XBhIaqxoPBLYhSZT8O
 LW7fiJfTRrDAy0INeh8hFJakwjNPTVUcKSiC9ZFY83bHFmZ+vrTYpVzmH
 8R8WRxPunWjzoR1BavqAqm4a/Z7jyPUsiVq6bkZp9jX96wLBZLjAGiqPW
 96+8ZzcVDl434PmnYPI9EKUeBwdaphh85NuPktsJwCy6XAJvUmQWCKNja
 lVB5cz1eIQMW/xdrbFny96Gi8Z8yW3OTaIQwkLuALUv1X3DwXVT4gfCa8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="6025301"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="6025301"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 00:51:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="8428450"
Received: from pshishpo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.79])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 00:51:23 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Jiri Slaby (SUSE)"
 <jirislaby@kernel.org>, intel-gfx@lists.freedesktop.org, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 intel-gvt-dev@lists.freedesktop.org
Subject: Re: [PATCH 00/21] drm/i915: remove unused structure members
In-Reply-To: <20240216065326.6910-1-jirislaby@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240216065326.6910-1-jirislaby@kernel.org>
Date: Fri, 16 Feb 2024 10:51:20 +0200
Message-ID: <87plww4ws7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 16 Feb 2024, "Jiri Slaby (SUSE)" <jirislaby@kernel.org> wrote:
> this series removes unused i915 structure members as found by
> clang-struct (and manually checked by me).

Thanks Jiri, good stuff!

Acked-by: Jani Nikula <jani.nikula@intel.com>

However, you may have overlooked that drivers/gpu/drm/i915/gvt/ is
maintained separately.

Cc: Zhenyu, Zhi, how do you want the gvt patches in this series handled?


BR,
Jani.


>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>
> Jiri Slaby (SUSE) (21):
>   drm/i915: remove unused intel_dvo_dev_ops hooks
>   drm/i915: remove structs intel_vgpu_pipe_format and
>     intel_vgpu_fb_format
>   drm/i915: remove intel_dsi::{port_bits,hs}
>   drm/i915: remove
>     intel_gvt_gtt::{mm_alloc_page_table,mm_free_page_table}
>   drm/i915: remove intel_gvt_mmio_info::{device,addr_range}
>   drm/i915: remove intel_vgpu_workload::{ring_context,restore_inhibit}
>   drm/i915: remove intel_vbt_panel_data::edp::initialized
>   drm/i915: remove intel_guc::ads_engine_usage_size
>   drm/i915: remove i915_drm_client::id
>   drm/i915: remove i915_perf_stream::size_exponent
>   drm/i915: remove intel_vgpu_gtt::active_ppgtt_mm_bitmap
>   drm/i915: remove intel_vgpu_fence::base
>   drm/i915: remove intel_vgpu_opregion::mapped
>   drm/i915: remove intel_vgpu::intx_trigger
>   drm/i915: remove gvt_mmio_block::device
>   drm/i915: remove intel_gvt_irq_info::warned
>   drm/i915: remove intel_gvt_event_info::policy
>   drm/i915: remove intel_gvt_irq::pending_events
>   drm/i915: remove execute_cb::signal
>   drm/i915: remove i915_vma::obj_hash
>   drm/i915: remove intel_memory_region_ops::flags
>
>  .../drm/i915/display/intel_display_types.h    |  1 -
>  drivers/gpu/drm/i915/display/intel_dsi.h      |  4 ---
>  drivers/gpu/drm/i915/display/intel_dvo_dev.h  | 25 -------------------
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 --
>  drivers/gpu/drm/i915/gvt/fb_decoder.h         | 11 --------
>  drivers/gpu/drm/i915/gvt/gtt.h                |  3 ---
>  drivers/gpu/drm/i915/gvt/gvt.h                |  5 ----
>  drivers/gpu/drm/i915/gvt/interrupt.c          |  1 -
>  drivers/gpu/drm/i915/gvt/interrupt.h          |  2 --
>  drivers/gpu/drm/i915/gvt/mmio.h               |  2 --
>  drivers/gpu/drm/i915/gvt/scheduler.h          |  2 --
>  drivers/gpu/drm/i915/i915_drm_client.h        |  2 --
>  drivers/gpu/drm/i915/i915_perf_types.h        |  1 -
>  drivers/gpu/drm/i915/i915_request.c           |  1 -
>  drivers/gpu/drm/i915/i915_vma_types.h         |  1 -
>  drivers/gpu/drm/i915/intel_memory_region.h    |  2 --
>  16 files changed, 65 deletions(-)

-- 
Jani Nikula, Intel
