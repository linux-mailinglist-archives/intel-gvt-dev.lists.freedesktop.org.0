Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01561772526
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Aug 2023 15:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16D910E0AA;
	Mon,  7 Aug 2023 13:12:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAF189B57;
 Mon,  7 Aug 2023 13:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691413931; x=1722949931;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=T+6DKTwSiotcxA4tZewvrKqD/TNgOnCf2vZfL8ifZgA=;
 b=GJS1rFYMmLWapvNED5LsekJYYp6/diXDYYeY7T45eyPdeOkbIgP1HhOf
 qQDZU/y4F+BXgcj6Tw8vBtzC2/yGYcQ2EprmbN34TAsfORxQzTWjCUkde
 pRyCQi3MJda4CVc5cLVYsjVUruXoiHolba4YJOolaSZFKl7cP/zFHKC1t
 GMBgtSw/DwXInpPrLmCJQmurzPVE98RPut9PWCMBVDfI63TFH8/RNsZ8I
 0dAPaISYcIP7jZ07Sir49qk+IL+mB/gWjgUHTNURiYXICEsIdZp+7FysL
 HjOCLdB964JkkJt7h/SuQyufVAk3Q4wg4WM5Zd/0TcxSEeXuPnCcBDDZh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373291769"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="373291769"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 06:12:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="845030384"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="845030384"
Received: from acangian-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.232])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 06:12:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Replace dead 01.org link
In-Reply-To: <20230804040544.1972958-1-zhenyuw@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230804040544.1972958-1-zhenyuw@linux.intel.com>
Date: Mon, 07 Aug 2023 16:12:07 +0300
Message-ID: <87tttbt2s8.fsf@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 04 Aug 2023, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> 01.org is dead so replace old gvt link with current wiki page.
>
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  MAINTAINERS                      | 2 +-
>  drivers/gpu/drm/i915/Kconfig     | 2 +-
>  drivers/gpu/drm/i915/intel_gvt.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d516295978a4..805d33a107aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10436,7 +10436,7 @@ M:	Zhi Wang <zhi.a.wang@intel.com>
>  L:	intel-gvt-dev@lists.freedesktop.org
>  L:	intel-gfx@lists.freedesktop.org
>  S:	Supported
> -W:	https://01.org/igvt-g
> +W:	https://github.com/intel/gvt-linux/wiki
>  T:	git https://github.com/intel/gvt-linux.git
>  F:	drivers/gpu/drm/i915/gvt/
>  
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 01b5a8272a27..854255966d3d 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -140,7 +140,7 @@ config DRM_I915_GVT_KVMGT
>  
>  	  Note that this driver only supports newer device from Broadwell on.
>  	  For further information and setup guide, you can visit:
> -	  http://01.org/igvt-g.
> +	  https://github.com/intel/gvt-linux/wiki.
>  
>  	  If in doubt, say "N".
>  
> diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
> index e98b6d69a91a..9b6d87c8b583 100644
> --- a/drivers/gpu/drm/i915/intel_gvt.c
> +++ b/drivers/gpu/drm/i915/intel_gvt.c
> @@ -41,7 +41,7 @@
>   * To virtualize GPU resources GVT-g driver depends on hypervisor technology
>   * e.g KVM/VFIO/mdev, Xen, etc. to provide resource access trapping capability
>   * and be virtualized within GVT-g device module. More architectural design
> - * doc is available on https://01.org/group/2230/documentation-list.
> + * doc is available on https://github.com/intel/gvt-linux/wiki.
>   */
>  
>  static LIST_HEAD(intel_gvt_devices);

-- 
Jani Nikula, Intel Open Source Graphics Center
