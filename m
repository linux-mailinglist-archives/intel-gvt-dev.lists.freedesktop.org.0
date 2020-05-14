Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6672B1D35F1
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 14 May 2020 18:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AAA6EB7E;
	Thu, 14 May 2020 16:04:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647566EB7E;
 Thu, 14 May 2020 16:04:27 +0000 (UTC)
IronPort-SDR: 00P7KiVljuSh30F/dzey1f9Hph41MfxlM8dtc4FSN234NF+Ywwok1uTgA/RilRMX2r4lvyZHGd
 H3BNaI9i64uA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2020 09:04:26 -0700
IronPort-SDR: qzuxUD3IV0gJee5oEgTouglm77B4SHGarcN4AL149SkYQGJJ7fM0Xuu45oDyIVsGKyyhpMii9W
 mTNQ7MJkpHyw==
X-IronPort-AV: E=Sophos;i="5.73,391,1583222400"; d="scan'208";a="464390004"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.251.82.70])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2020 09:04:21 -0700
MIME-Version: 1.0
In-Reply-To: <20200512094017.GX18545@zhen-hp.sh.intel.com>
References: <20200512094017.GX18545@zhen-hp.sh.intel.com>
Subject: Re: [PULL] gvt-next
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 14 May 2020 19:04:19 +0300
Message-ID: <158947225919.15520.8550751429056510209@jlahtine-desk.ger.corp.intel.com>
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

Quoting Zhenyu Wang (2020-05-12 12:40:17)
> 
> Hi,
> 
> This includes support for ppgtt update by LRI command which gvt
> replaces by shadow ppgtt, another small optimization for shadow
> ctx and one workload destroy cleanup.

This is now pulled. Thanks for the PR.

Regards, Joonas

> 
> Thanks
> --
> 
> The following changes since commit fb55c735522352704c35d899d0b253453cf0e799:
> 
>   drm/i915/gvt: skip populate shadow context if guest context not changed (2020-04-17 17:31:22 +0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-next-2020-05-12
> 
> for you to fetch changes up to 47e51832ae93534d872511ba557115722582d94c:
> 
>   drm/i915/gvt: use context lrc_reg_state for shadow ppgtt override (2020-05-08 12:37:14 +0800)
> 
> ----------------------------------------------------------------
> gvt-next-2020-05-12
> 
> - Support PPGTT update via LRI cmd (Zhenyu)
> - Remove extra kmap for shadow ctx update (Zhenyu)
> - Move workload cleanup out of execlist handling code (Zhenyu)
> 
> ----------------------------------------------------------------
> Zhenyu Wang (3):
>       drm/i915/gvt: move workload destroy out of execlist complete
>       drm/i915/gvt: Support PPGTT table load command
>       drm/i915/gvt: use context lrc_reg_state for shadow ppgtt override
> 
>  drivers/gpu/drm/i915/gvt/cmd_parser.c |  45 +++++++++++++
>  drivers/gpu/drm/i915/gvt/execlist.c   |   2 -
>  drivers/gpu/drm/i915/gvt/gtt.c        |   1 +
>  drivers/gpu/drm/i915/gvt/gtt.h        |   1 +
>  drivers/gpu/drm/i915/gvt/handlers.c   |   2 +-
>  drivers/gpu/drm/i915/gvt/scheduler.c  | 115 +++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/i915/gvt/scheduler.h  |   1 +
>  7 files changed, 155 insertions(+), 12 deletions(-)
> 
> -- 
> Open Source Technology Center, Intel ltd.
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
