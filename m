Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A289908617
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 14 Jun 2024 10:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55C210EC96;
	Fri, 14 Jun 2024 08:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P62MluB7";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594E110EC96;
 Fri, 14 Jun 2024 08:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718353258; x=1749889258;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qUqJQRFwx/8kVb9eB4GIupSf6YxgDcd/I+aheS+IVC8=;
 b=P62MluB7aPRqTUpTq0o/grbN8TKmvrtR8ynD2SJ3QskQ4IcrgXd84+l2
 9HbAsiDVJoot3zOoBgQoftx73zPawXzRne+hMViQrQ18Vk+zc4xn2gFjc
 4WeUJ5lB/pmKDY/5EoxOVl6Sm8E8RocZoVUN6oThnnGwPUhwDd0yxqeoC
 YATg+jncVAYhv+8/Lu/+hs7EOIE6mibtmeNjgjj7/n1kT4IEbllAB1FuE
 C2ETF7LBRRSrgRqZTu37WV5vNV+agxmTeowC2cFr/an0Cr+mBYpNZmImU
 anIt2mmprvaE1klO8PpMAdnE0iDTH/eIxuGmEt5fGZ434U2nl2AliImbQ A==;
X-CSE-ConnectionGUID: MRhDmOvRTV+88gHesnYA3w==
X-CSE-MsgGUID: ITZLSKdoSXikjCfUYuVjnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15388854"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="15388854"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 01:20:57 -0700
X-CSE-ConnectionGUID: DTxoOH9YRcK3qcYUNtbQkw==
X-CSE-MsgGUID: ygx/0ybWQa2Jb/jZqAIbSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="40396559"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.221])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 01:20:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com
Subject: Re: [PATCH v2 0/6] drm/i915: gvt register macro cleanups, unused
 macro removals
In-Reply-To: <cover.1717773890.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1717773890.git.jani.nikula@intel.com>
Date: Fri, 14 Jun 2024 11:20:53 +0300
Message-ID: <87cyokhr4q.fsf@intel.com>
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

On Fri, 07 Jun 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> v2 of https://lore.kernel.org/r/cover.1717757337.git.jani.nikula@intel.com

Thanks for the reviews, pushed to din.

BR,
Jani.

>
> Jani Nikula (6):
>   drm/i915/gvt: remove the unused end parameter from calc_index()
>   drm/i915/gvt: use proper i915_reg_t for calc_index() parameters
>   drm/i915/gvt: rename range variable to stride
>   drm/i915/gvt: do not use implict dev_priv in DSPSURF_TO_PIPE()
>   drm/i915: relocate some DSPCNTR reg bit definitions
>   drm/i915: remove unused pipe/plane B register macros
>
>  .../gpu/drm/i915/display/i9xx_plane_regs.h    |  2 ++
>  drivers/gpu/drm/i915/gvt/handlers.c           | 29 ++++++++++---------
>  drivers/gpu/drm/i915/i915_reg.h               | 23 ---------------
>  3 files changed, 17 insertions(+), 37 deletions(-)

-- 
Jani Nikula, Intel
