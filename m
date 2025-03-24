Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C2CA6D746
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 Mar 2025 10:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF41610E269;
	Mon, 24 Mar 2025 09:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gict3SbQ";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC3E10E268;
 Mon, 24 Mar 2025 09:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742808464; x=1774344464;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=RYD5t3NuRz8HBAxtXy8IkWEd7q9CzyXNsr7khC85y9o=;
 b=gict3SbQkLVaKGYFgSW4zZ4wloFUtrQ7WwTR3ViHgihTytqh2yQu5bSU
 6zsbTGjM6KpnnETgsoDoZry0o5UJtS0Wh90V+trvLPohr+NL2Vb1fFfMN
 fQJ1hGQEKmKOOPN0BCTi9qQjfgVJDpGAcB1+FlZo9m3l1MgqeEibwxNRH
 C3r1jsa79oQMDAGuBAjJC/VRYX1O3USPAFw/UjAsBMz5ljoOBVPJ7m7RM
 iY6BzOatrcHr9PQfmVJFvCfulAWszepGDuuivo0L38HiiQp6fMEtNOLXS
 yP5l6x7ebpoPGwzm6HrN0+AChMXEddu5a4JYsMVGMYfMuT1cxPgTK712O A==;
X-CSE-ConnectionGUID: EXXkzDOiTs6vkQO+JTzATg==
X-CSE-MsgGUID: hBXwgX0FRvmS/jbWIdgFWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="54638188"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="54638188"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:27:44 -0700
X-CSE-ConnectionGUID: VXgVYMFjT8SSvlnfPkfTEw==
X-CSE-MsgGUID: tiy7gqRYSaGi52m2zgp9XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="154899700"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.30])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:27:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nicolas Chauvet <kwizart@gmail.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 2/3] [RFC] drm/i915/gvt: Fix opregion_header->signature
 size
In-Reply-To: <20250324083755.12489-3-kwizart@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250324083755.12489-1-kwizart@gmail.com>
 <20250324083755.12489-3-kwizart@gmail.com>
Date: Mon, 24 Mar 2025 11:27:37 +0200
Message-ID: <87pli6bwxi.fsf@intel.com>
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

On Mon, 24 Mar 2025, Nicolas Chauvet <kwizart@gmail.com> wrote:
> Enlarge the signature field to accept the string termination.
>
> Cc: stable@vger.kernel.org
> Fixes: 93615d59912 ("Revert drm/i915/gvt: Fix out-of-bounds buffer write into opregion->signature[]")
> Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>

Nope, can't do that. The packed struct is used for parsing data in
memory.

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/gvt/opregion.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
> index 9a8ead6039e2..0f11cd6ba383 100644
> --- a/drivers/gpu/drm/i915/gvt/opregion.c
> +++ b/drivers/gpu/drm/i915/gvt/opregion.c
> @@ -43,7 +43,7 @@
>  #define DEVICE_TYPE_EFP4   0x10
>  
>  struct opregion_header {
> -	u8 signature[16];
> +	u8 signature[32];
>  	u32 size;
>  	u32 opregion_ver;
>  	u8 bios_ver[32];

-- 
Jani Nikula, Intel
