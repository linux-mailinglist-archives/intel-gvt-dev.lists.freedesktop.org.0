Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281CC1FF241
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Jun 2020 14:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFDE6E235;
	Thu, 18 Jun 2020 12:48:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48776E179;
 Thu, 18 Jun 2020 12:48:24 +0000 (UTC)
IronPort-SDR: PObmwXk5XiVjTuK8khNBXbcQ7Rwfpbq1358mzibDVpPHyKf6q/4GRZ/0jy8BGsHuAFdjZjnSd3
 53bNOEN0JGbg==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="122778980"
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; d="scan'208";a="122778980"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 05:48:06 -0700
IronPort-SDR: uFYRRDg2RJVJ0Lfmg53T9WvEJ427RaEsx88OOFXJ7GsNXp4x3OrX2HRRzLfFWvf7FZW4TUA6Zq
 ZUVC9wHuQj8Q==
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; d="scan'208";a="421487050"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.14.253])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 05:48:03 -0700
MIME-Version: 1.0
In-Reply-To: <20200617043418.GQ5687@zhen-hp.sh.intel.com>
References: <20200617043418.GQ5687@zhen-hp.sh.intel.com>
Subject: Re: [PULL] gvt-fixes
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 18 Jun 2020 15:48:01 +0300
Message-ID: <159248448107.8757.1901135788098329902@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.8.1
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
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Quoting Zhenyu Wang (2020-06-17 07:34:18)
> 
> Hi,
> 
> This contains misc fixes for gvt. Two MMIO handler fixes on SKL/CFL,
> one mask register bit checking fix exposed in suspend/resume path and
> one lockdep error fix for debugfs entry access.

Could not pull this one due to the extra hassle with CI this week.

Jani, can you please pull this next week.

Regards, Joonas

> Thanks.
> --
> The following changes since commit 8e68c6340d5833077b3753eabedab40755571383:
> 
>   drm/i915/display: Fix the encoder type check (2020-06-16 11:34:24 +0300)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-fixes-2020-06-17
> 
> for you to fetch changes up to a291e4fba259a56a6a274c1989997acb6f0bb03a:
> 
>   drm/i915/gvt: Use GFP_ATOMIC instead of GFP_KERNEL in atomic context (2020-06-17 12:36:19 +0800)
> 
> ----------------------------------------------------------------
> gvt-fixes-2020-06-17
> 
> - Two missed MMIO handler fixes for SKL/CFL (Colin)
> - Fix mask register bits check (Colin)
> - Fix one lockdep error for debugfs entry access (Colin)
> 
> ----------------------------------------------------------------
> Colin Xu (4):
>       drm/i915/gvt: Add one missing MMIO handler for D_SKL_PLUS
>       drm/i915/gvt: Fix two CFL MMIO handling caused by regression.
>       drm/i915/gvt: Fix incorrect check of enabled bits in mask registers
>       drm/i915/gvt: Use GFP_ATOMIC instead of GFP_KERNEL in atomic context
> 
>  drivers/gpu/drm/i915/gvt/debugfs.c      |  2 +-
>  drivers/gpu/drm/i915/gvt/handlers.c     | 24 +++++++++++++-----------
>  drivers/gpu/drm/i915/gvt/mmio_context.h |  6 +++---
>  drivers/gpu/drm/i915/gvt/reg.h          |  5 +++++
>  4 files changed, 22 insertions(+), 15 deletions(-)
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
