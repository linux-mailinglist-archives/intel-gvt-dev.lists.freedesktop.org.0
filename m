Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3327B7FDF
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Oct 2023 14:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106C610E109;
	Wed,  4 Oct 2023 12:54:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3FF10E109;
 Wed,  4 Oct 2023 12:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696424056; x=1727960056;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DFqxbhEtmGONcx98EHntjXGDpaCNhrhrEhCQbKeVG/8=;
 b=KvBam2aYNuzuXrXtZZ+HoIeKk/2bpBf6GCOWliTefivZdqeyjX4AaugB
 NMj4nN1C0PGaa+4y7bYMpDZBNSFat75yNzEpgQ18IiARvC7gYeBa+mXfD
 O3vaM5TRXUnYY7DyLXbo3POkklrbEEtEB/ll0cwRIntDi9ryxOvo/hxhN
 NI5BC9C5UJNlCP7lsfzRRf+NXkti7omucVtAwE/OHl9g3rT+N/I9HPq/8
 p4klAL8nwj73OldDeZBN4+roZ1IzEBEWGEFMxlSWBXVHdhTn9EJHiTwdU
 xaFSq57VprYmrRJNSBxQ13JYeJahLMs8FJ3RCYA54its2ceU2Swj+6dIK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="414076142"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="414076142"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:54:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="744964096"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="744964096"
Received: from msterni-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.48])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:54:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: Re: [PATCH 1/4] drm/i915/gvt: remove unused to_gvt() and reduce
 includes
In-Reply-To: <20230926121904.499888-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230926121904.499888-1-jani.nikula@intel.com>
Date: Wed, 04 Oct 2023 15:54:11 +0300
Message-ID: <871qeafszw.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 26 Sep 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> gvt.h has no need to include i915_drv.h once the unused to_gvt() has
> been removed.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Zhenyu, Zhi, ping?

BR,
Jani.



> ---
>  drivers/gpu/drm/i915/gvt/gvt.h | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
> index 53a0a42a50db..3a0624fe63bf 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -39,7 +39,7 @@
>  
>  #include <asm/kvm_page_track.h>
>  
> -#include "i915_drv.h"
> +#include "gt/intel_gt.h"
>  #include "intel_gvt.h"
>  
>  #include "debug.h"
> @@ -368,11 +368,6 @@ struct intel_gvt {
>  	struct dentry *debugfs_root;
>  };
>  
> -static inline struct intel_gvt *to_gvt(struct drm_i915_private *i915)
> -{
> -	return i915->gvt;
> -}
> -
>  enum {
>  	/* Scheduling trigger by timer */
>  	INTEL_GVT_REQUEST_SCHED = 0,

-- 
Jani Nikula, Intel
