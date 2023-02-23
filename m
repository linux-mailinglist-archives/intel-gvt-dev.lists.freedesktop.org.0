Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5186A0851
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 Feb 2023 13:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CD610E0AD;
	Thu, 23 Feb 2023 12:13:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C482F10E0AD;
 Thu, 23 Feb 2023 12:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677154386; x=1708690386;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KOHWnfjOpFtCcCE4RMyXmFdAz56CpeWbvgC72YXJAC0=;
 b=jBnw//SGr4RDIavV9G9eLTynTAv0XBWVxI5VmZLcu5Ukrr3XXT2mco3Q
 PX3Gc1L2ftSxDFjnw6LkjxoPzLW/9Jk6Fru8f0KSVhkATf35+nAt2+mzJ
 JI/FEhiPSRm+FeJAe8RFfxBA2LEmQBPr+Veo85r+kliCCy5N7F6zugF3H
 BdewqatoXiXfkNPoi1khlD5p/4rKJrNn8P26m1by8kYaO54PaehKLB1EH
 S4OFetV9E3c5WBntuOMhPX/g0y7kdsFmyrojhJ96YqJ9hIRKU5r4Vrm8+
 XNMuvyiBKbQrMlLasm+XhWoORV1pLtbiO/HjfUQJm6V+3PeXe6D6yimzk g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="321343507"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="321343507"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 04:11:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="665737902"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="665737902"
Received: from pvallee-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.43.94])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 04:11:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-next-fixes
In-Reply-To: <Y/co4cy10KM1/2uX@debian-scheme>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <Y/co4cy10KM1/2uX@debian-scheme>
Date: Thu, 23 Feb 2023 14:11:28 +0200
Message-ID: <87v8js37kf.fsf@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv, 
 Zhiyuan" <zhiyuan.lv@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 23 Feb 2023, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> Hi,
>
> This is what are on gvt tree now for next kernel, including fixes for
> gvt debugfs, one kconfig symbol fix for menu presentation and misc
> typo fixes. Please check details below. This is generated against current
> drm-intel-next-fixes.

Thanks, pulled to drm-intel-next-fixes, and pushed out.

BR,
Jani.


>
> Thanks!
> --
> The following changes since commit 8038510b1fe443ffbc0e356db5f47cbb8678a594:
>
>   drm/i915: Fix system suspend without fbdev being initialized (2023-02-15 17:33:07 +0200)
>
> are available in the Git repository at:
>
>   https://github.com/intel/gvt-linux.git tags/gvt-next-fixes-2023-02-23
>
> for you to fetch changes up to 0b93efca3659f6d55ed31cff6722dca5f6e4d6e2:
>
>   drm/i915: move a Kconfig symbol to unbreak the menu presentation (2023-02-23 13:46:39 +0800)
>
> ----------------------------------------------------------------
> gvt-next-fixes-2023-02-23
>
> - use debugfs attribute for gvt debugfs entries (Deepak R Varma)
> - fix memory leak in vgpu destroy for debugfs_lookup() then remove (Greg KH)
> - fix DRM_I915_GVT kconfig symbol to unbreak menu presentation (Randy Dunlap)
> - fix typos (Deepak R Varma, Colin Ian King)
>
> ----------------------------------------------------------------
> Colin Ian King (1):
>       i915/gvt: Fix spelling mistake "vender" -> "vendor"
>
> Deepak R Varma (2):
>       drm/i915/gvt: Avoid full proxy f_ops for debugfs attributes
>       drm/i915/gvt: Remove extra semicolon
>
> Greg Kroah-Hartman (1):
>       i915: fix memory leak with using debugfs_lookup()
>
> Randy Dunlap (1):
>       drm/i915: move a Kconfig symbol to unbreak the menu presentation
>
>  drivers/gpu/drm/i915/Kconfig        |  6 +++---
>  drivers/gpu/drm/i915/gvt/debugfs.c  | 16 ++++++++--------
>  drivers/gpu/drm/i915/gvt/firmware.c |  2 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c    |  2 +-
>  drivers/gpu/drm/i915/gvt/vgpu.c     |  2 +-
>  5 files changed, 14 insertions(+), 14 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
