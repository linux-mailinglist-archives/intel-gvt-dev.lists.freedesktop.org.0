Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1288F2F1DB1
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 11 Jan 2021 19:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D92A89CF9;
	Mon, 11 Jan 2021 18:13:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EC38932D;
 Mon, 11 Jan 2021 18:13:58 +0000 (UTC)
IronPort-SDR: F2tJSpG9PymVeFTHAO4xmhm82ucUje5TYfebACKfAtdNGeCu6AUex4cvhUsIBFrrm+jaxBGNcW
 54inIe583xLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="164992131"
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="164992131"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 10:13:57 -0800
IronPort-SDR: YmZ9BSAntPttAi4CFkyAQKt+MsAuqXooKLZM6fKLLbgbGpbNta2yBI8XBtYVstPTWA4HWePb4r
 bWARzN0Ao1vQ==
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="381100864"
Received: from libresli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.207.39])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 10:13:54 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-fixes
In-Reply-To: <20210108045911.GF15982@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210108045911.GF15982@zhen-hp.sh.intel.com>
Date: Mon, 11 Jan 2021 20:13:50 +0200
Message-ID: <87sg77wdcx.fsf@intel.com>
MIME-Version: 1.0
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

On Fri, 08 Jan 2021, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> Hi,
>
> Here's one gvt fixes for VFIO edid on APL/BXT with virtual display
> hotplug fixed that feature is enabled again.

Thanks, merged to drm-intel-fixes.

BR,
Jani.

>
> Thanks.
> --
> The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:
>
>   Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)
>
> are available in the Git repository at:
>
>   https://github.com/intel/gvt-linux tags/gvt-fixes-2020-01-08
>
> for you to fetch changes up to 4ceb06e7c336f4a8d3f3b6ac9a4fea2e9c97dc07:
>
>   drm/i915/gvt: Fix vfio_edid issue for BXT/APL (2021-01-06 11:19:15 +0800)
>
> ----------------------------------------------------------------
> gvt-fixes-2020-01-08
>
> - Fix VFIO EDID on APL/BXT (Colin)
>
> ----------------------------------------------------------------
> Colin Xu (1):
>       drm/i915/gvt: Fix vfio_edid issue for BXT/APL
>
>  drivers/gpu/drm/i915/gvt/display.c | 81 +++++++++++++++++++++++++++-----------
>  drivers/gpu/drm/i915/gvt/vgpu.c    |  5 +--
>  2 files changed, 59 insertions(+), 27 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
