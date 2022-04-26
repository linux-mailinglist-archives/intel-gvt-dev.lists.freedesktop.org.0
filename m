Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E50B50F14B
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 Apr 2022 08:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F39112105;
	Tue, 26 Apr 2022 06:42:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96E6112105;
 Tue, 26 Apr 2022 06:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650955375; x=1682491375;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eCojb1eXoEAnhypcXJ5k8paDr/0MD+LO+tabm1JTCAQ=;
 b=FIeuY9z0KdzluN1KNgtv9VgO3pY3cfWLbWiKke4J4jSpAQ5v90+PbYK2
 fBz2TlgwunmDDcLDQEr0P4TZJOau/pItPaErxKCdqUFcRuJUIuuZC19N4
 AtKaQNek1KiJES8DwAIspJmcKziX4IINauw3H32L7IH+wK6lEqz7ynMpE
 gN4LJRD3LKrCa6slLMF5wd6NCLFfjSiD3BHq8W1hedBs2NQweGiBfpYkh
 CXmml9KukWr4EGtrN8R1/HAV92CYK4++WQdVMvWhqVLGgliPrEFTceHNc
 BDlCxcAz3BFiUkKcgx2E3jztVaTkh4+CBR6br8w1tasZvsnLWeomjLNhZ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="246035778"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="246035778"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 23:42:55 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="579715697"
Received: from vhlushch-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.132.136])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 23:42:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/gvt: Add missing symbol export.
In-Reply-To: <20220425220331.24865-1-zhi.a.wang@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220425220331.24865-1-zhi.a.wang@intel.com>
Date: Tue, 26 Apr 2022 09:42:50 +0300
Message-ID: <87czh4uyz9.fsf@intel.com>
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
Cc: Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, 25 Apr 2022, Zhi Wang <zhi.wang.linux@gmail.com> wrote:
> When CONFIG_DRM_I915_DEBUG_RUNTIME and CONFIG_DRM_I915_DEBUG_PM
> are enabled, two more extra symols in i915 are required to be
> exported.
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/intel_gvt.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
> index 7c03d975069e..24bc693439e8 100644
> --- a/drivers/gpu/drm/i915/intel_gvt.c
> +++ b/drivers/gpu/drm/i915/intel_gvt.c
> @@ -309,6 +309,7 @@ EXPORT_SYMBOL_NS_GPL(__intel_context_do_pin, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(__intel_context_do_unpin, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(intel_ring_begin, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_get, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put_unchecked, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_for_reg, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_get, I915_GVT);
> @@ -316,3 +317,4 @@ EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_put, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(shmem_pin_map, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(shmem_unpin_map, I915_GVT);
>  EXPORT_SYMBOL_NS_GPL(__px_dma, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_fence_ops, I915_GVT);

-- 
Jani Nikula, Intel Open Source Graphics Center
