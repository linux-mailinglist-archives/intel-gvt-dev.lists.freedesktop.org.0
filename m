Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A392C024C
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 23 Nov 2020 10:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3AF89D3E;
	Mon, 23 Nov 2020 09:32:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D4189D3E;
 Mon, 23 Nov 2020 09:32:46 +0000 (UTC)
IronPort-SDR: +6QaPRAOht35QjDgi7iRWRJYjWAna8DNfIzw2j4U6vt90+hBDO9lHF1X3s8hTT/7wK+Xbp8uTz
 yiN+FnmJr5VA==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="171827621"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="171827621"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 01:32:45 -0800
IronPort-SDR: +9n+qp9jD/+JHBLVv+W7mVZVg0ISm/vzI5DEaaPmr21i+eRrM+uPBaSAlUCRKEP6LkPwnUKQkd
 AKxiRlVfIhLA==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="536037699"
Received: from dmiles-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.6.162])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 01:32:41 -0800
MIME-Version: 1.0
In-Reply-To: <20201123090517.GC16939@zhen-hp.sh.intel.com>
References: <20201123090517.GC16939@zhen-hp.sh.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-next
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <160612395828.4926.14269845290017694082@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Mon, 23 Nov 2020 11:32:38 +0200
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

Quoting Zhenyu Wang (2020-11-23 11:05:17)
> 
> Hi,
> 
> Here's gvt next pull for v5.11. Mostly it's for host suspend/resume
> fix with vGPU active and with some other enhancement as details below.
> Note that this includes some minor i915 driver change to add gvt hook
> in suspend/resume function which has been sent and reviewed on
> intel-gfx list.
> 
> I just generated against drm-intel-next-queued-2020-11-03 which this
> tree bases on now. Let me know if there's any issue in merge.

Sometimes GVT changes are paired with changes related the i915 side
to adjust the running virtual clients. The changes are more often
related to GT side, but there's also been display related changes.

Going forward, would we want to continue to apply gvt-next to
drm-intel-next (-queued is planned to be deprecated) or
should we use drm-intel-gt-next?

Or should we always strictly apply the GVT changes to drm-intel-next,
and then any related i915 changes to drm-intel-next or drm-intel-gt-next
depending on which one they are related to?

Regards, Joonas

> Thanks
> --
> The following changes since commit 139caf7ca2866cd0a45814ff938cb0c33920a266:
> 
>   drm/i915: Update DRIVER_DATE to 20201103 (2020-11-03 14:21:25 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-next-2020-11-23
> 
> for you to fetch changes up to 9a3a238b3de97b4210c6de66aa88b2d7021ac086:
> 
>   drm/i915/gvt: treat intel_gvt_mpt as const in gvt code (2020-11-23 17:14:20 +0800)
> 
> ----------------------------------------------------------------
> gvt-next-2020-11-23
> 
> - Fix host suspend/resume with vGPU (Colin)
> - optimize idr init (Varma)
> - Change intel_gvt_mpt as const (Julian)
> - One comment error fix (Yan)
> 
> ----------------------------------------------------------------
> Colin Xu (3):
>       drm/i915/gvt: Save/restore HW status to support GVT suspend/resume
>       drm/i915: Add GVT resume routine to i915
>       drm/i915/gvt: Fix virtual display setup for BXT/APL
> 
> Deepak R Varma (1):
>       drm/i915/gvt: replace idr_init() by idr_init_base()
> 
> Julian Stecklina (1):
>       drm/i915/gvt: treat intel_gvt_mpt as const in gvt code
> 
> Yan Zhao (1):
>       drm/i915/gvt: correct a false comment of flag F_UNALIGN
> 
>  drivers/gpu/drm/i915/gvt/display.c  | 179 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/gtt.c      |  64 +++++++++++++
>  drivers/gpu/drm/i915/gvt/gtt.h      |   4 +
>  drivers/gpu/drm/i915/gvt/gvt.c      |  13 ++-
>  drivers/gpu/drm/i915/gvt/gvt.h      |   7 +-
>  drivers/gpu/drm/i915/gvt/handlers.c |  44 ++++++++-
>  drivers/gpu/drm/i915/gvt/kvmgt.c    |   2 +-
>  drivers/gpu/drm/i915/gvt/mmio.c     |   5 +
>  drivers/gpu/drm/i915/gvt/mmio.h     |   4 +
>  drivers/gpu/drm/i915/gvt/mpt.h      |   2 +-
>  drivers/gpu/drm/i915/gvt/vgpu.c     |   2 +-
>  drivers/gpu/drm/i915/i915_drv.c     |   2 +
>  drivers/gpu/drm/i915/intel_gvt.c    |  15 +++
>  drivers/gpu/drm/i915/intel_gvt.h    |   5 +
>  14 files changed, 338 insertions(+), 10 deletions(-)
> 
> -- 
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
