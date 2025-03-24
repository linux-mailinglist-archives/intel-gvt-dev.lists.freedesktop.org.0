Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EDEA6D754
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 Mar 2025 10:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D26110E279;
	Mon, 24 Mar 2025 09:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="deL7kkxN";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E9F10E279;
 Mon, 24 Mar 2025 09:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742808596; x=1774344596;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BaMAAk8QpLCr2xEJ4h+pzE/PwJSGsYQQ7y2LcRkzuRQ=;
 b=deL7kkxNUUXWitUquXUzf10mWGE60ibNiU5KGc+mhJ1Odt+rGj+uL7XQ
 Bf6EfGHiKRQVYoNCOvVI9Cnzjpi2lqHJb+ijsa0smP0c3JcUo8DK+9/IQ
 9uAhjaozwOMVdeAqrVE84PVpLpHyZiISzJ7Clv+pq6FTHM33/A9yp9/D3
 qgYsua7j2kAA3EsjXdINx1ffdOkas/OFy9DwCiQXHRlKGTGIgdY3tPjEF
 DFyibL0ZVUHDEHpHRjHur9hNgADhqkYji32x4DXgTbVNvdVpzLhErPxxl
 7K4QrxHvi5Am01rd1HUeeL3i1tmrSW3mSYzKU6DXOhqidQx+nFAyG055n g==;
X-CSE-ConnectionGUID: 2hChF2GoQbapxkLvhlhk4Q==
X-CSE-MsgGUID: JYwkjgPyTM2XMgK/EWexQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="55381157"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="55381157"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:29:56 -0700
X-CSE-ConnectionGUID: GGDTB0KlRZCg9RWAhYsS3A==
X-CSE-MsgGUID: 1f9qAMuWTuKnv9dqIaldEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="128811328"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.30])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:29:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nicolas Chauvet <kwizart@gmail.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 3/3] [RFC] drm/i915/gvt: change OPREGION_SIGNATURE name
In-Reply-To: <20250324083755.12489-4-kwizart@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250324083755.12489-1-kwizart@gmail.com>
 <20250324083755.12489-4-kwizart@gmail.com>
Date: Mon, 24 Mar 2025 11:29:49 +0200
Message-ID: <87jz8ebwtu.fsf@intel.com>
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
> Change the OPREGION_SIGNATURE name so it fit into the
> opregion_header->signature size.
>
> Cc: stable@vger.kernel.org
> Fixes: 93615d59912 ("Revert drm/i915/gvt: Fix out-of-bounds buffer write into opregion->signature[]")
> Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>

Nope, can't do that. The signature is used for checking data in
memory. Which should be obvious if you'd looked at how it's being used
or if this was tested.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/gvt/opregion.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
> index 0f11cd6ba383..0bd02dfaceb1 100644
> --- a/drivers/gpu/drm/i915/gvt/opregion.c
> +++ b/drivers/gpu/drm/i915/gvt/opregion.c
> @@ -32,7 +32,7 @@
>  #define _INTEL_BIOS_PRIVATE
>  #include "display/intel_vbt_defs.h"
>  
> -#define OPREGION_SIGNATURE "IntelGraphicsMem"
> +#define OPREGION_SIGNATURE "IntelGFXMem"
>  #define MBOX_VBT      (1<<3)
>  
>  /* device handle */

-- 
Jani Nikula, Intel
