Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 950B8227E0E
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 Jul 2020 13:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCD76E05F;
	Tue, 21 Jul 2020 11:04:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC016E05F;
 Tue, 21 Jul 2020 11:04:49 +0000 (UTC)
IronPort-SDR: tXuJoEyP9+cksitVF80fDxaGC9GKrbkLb4IjMNNRXbqRcHBSUB2NOb9QBavJgU/zuF9QzxPfrn
 LOCeljLFzz9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="147604295"
X-IronPort-AV: E=Sophos;i="5.75,378,1589266800"; d="scan'208";a="147604295"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 04:04:48 -0700
IronPort-SDR: U8Wbx03wrCMAtImLsaJHGMfqY/nhqPsNdeCOxCYISESRRUAhoqdFieS7wTnPrfseztajokjwil
 RutQAjSFp2bQ==
X-IronPort-AV: E=Sophos;i="5.75,378,1589266800"; d="scan'208";a="462035715"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.8.26])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 04:04:45 -0700
MIME-Version: 1.0
In-Reply-To: <20200720080541.GT27035@zhen-hp.sh.intel.com>
References: <20200720080541.GT27035@zhen-hp.sh.intel.com>
Subject: Re: [PULL] gvt-next
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 21 Jul 2020 14:04:41 +0300
Message-ID: <159532948169.9008.15612685518487144837@jlahtine-desk.ger.corp.intel.com>
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

Quoting Zhenyu Wang (2020-07-20 11:05:41)
> 
> Hi,
> 
> Sorry that this might be a bit late as last week our QA people were
> busy on something else..So this is gvt changes queued for 5.9 which is
> to improve guest suspend/resume with proper PCI PM state tracking for
> resource handling, e.g ppgtt. Hopefully this could still be in queue
> for 5.9.

Is this a regression fix to a problem introduced by previous
gvt-next PR targeting 5.9?

Or is it an incremental improvement over 5.8?

Regards, Joonas

> 
> Thanks
> --
> The following changes since commit d524b87f77364db096855d7eb714ffacec974ddf:
> 
>   drm/i915: Update DRIVER_DATE to 20200702 (2020-07-02 21:25:28 +0300)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-next-2020-07-20
> 
> for you to fetch changes up to 02b5fc1527c0bb26a1012c6a806dc033f3b125a6:
> 
>   drm/i915/gvt: Remove intel_vgpu_reset_gtt() since no one use it. (2020-07-14 16:42:14 +0800)
> 
> ----------------------------------------------------------------
> gvt-next-2020-07-20
> 
> - Improve guest suspend/resume handling (Colin)
> 
> ----------------------------------------------------------------
> Colin Xu (3):
>       drm/i915/gvt: Do not destroy ppgtt_mm during vGPU D3->D0.
>       drm/i915/gvt: Do not reset pv_notified when vGPU transit from D3->D0
>       drm/i915/gvt: Remove intel_vgpu_reset_gtt() since no one use it.
> 
>  drivers/gpu/drm/i915/gvt/cfg_space.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/gtt.c       | 20 +-------------------
>  drivers/gpu/drm/i915/gvt/gtt.h       |  3 ++-
>  drivers/gpu/drm/i915/gvt/gvt.h       |  3 +++
>  drivers/gpu/drm/i915/gvt/vgpu.c      | 20 +++++++++++++++++---
>  5 files changed, 47 insertions(+), 23 deletions(-)
> --
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
