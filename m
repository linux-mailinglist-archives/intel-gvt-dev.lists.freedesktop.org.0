Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC134875E1
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jan 2022 11:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90D2113E0E;
	Fri,  7 Jan 2022 10:48:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A767C113E16;
 Fri,  7 Jan 2022 10:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641552521; x=1673088521;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=76GsFPmqfOl9k7wHvyHfpoVSPICgKVf3V5/cHlTOAio=;
 b=HfxzPr8v1X1+AWRx4gg+WsDKHp8TaQUy2s9dRF1rL3tqmMD7xtY7QSAZ
 CnvUfNlVB32RNX2yaNQNdTW8khJ58oFDYeYfCJsHXaDrmAPrWLif+qBX2
 05CgLSKAvLaNmsdQlMJIX86t5tqN/LOoGgwIJWqXwLHmbXmzqc68jRA8s
 8+1DzRJr73du6jvcddjKiUf5iYF+ryyJHPrI96+r7Y+JqrQoMD86keMlm
 fu1uQiFrU9A3Sa53cdIeCu2cxN/K9RfQtBvI4Yhiw6+45OXrJ7YuNwaeP
 J793LdutmbBNPH0gzR2AoYWivGVk4eHud13j+0fjrOeJ9vSJDBiIbKuPx g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="223542786"
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="223542786"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 02:48:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="557231645"
Received: from dgreerx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.24.206])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 02:48:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Mullati Siva <siva.mullati@intel.com>, intel-gfx@lists.freedesktop.org,
 siva.mullati@intel.com
Subject: Re: [PATCH] drm/i915/gvt: Make DRM_I915_GVT depend on X86
In-Reply-To: <20220107095235.243448-1-siva.mullati@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220107095235.243448-1-siva.mullati@intel.com>
Date: Fri, 07 Jan 2022 12:48:33 +0200
Message-ID: <871r1jn7ni.fsf@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 07 Jan 2022, Mullati Siva <siva.mullati@intel.com> wrote:
> From: Siva Mullati <siva.mullati@intel.com>
>
> GVT is not supported on non-x86 platforms, So add
> dependency of X86 on config parameter DRM_I915_GVT.

Please add GVT list and maintainers for GVT changes.

BR,
Jani.

>
> Signed-off-by: Siva Mullati <siva.mullati@intel.com>
> ---
>  drivers/gpu/drm/i915/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index a4c94dc2e216..cfd932514da2 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -101,6 +101,7 @@ config DRM_I915_USERPTR
>  config DRM_I915_GVT
>  	bool "Enable Intel GVT-g graphics virtualization host support"
>  	depends on DRM_I915
> +	depends on X86
>  	depends on 64BIT
>  	default n
>  	help

-- 
Jani Nikula, Intel Open Source Graphics Center
