Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0C42AB214
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  9 Nov 2020 09:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668408935A;
	Mon,  9 Nov 2020 08:02:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6258935A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  9 Nov 2020 08:02:23 +0000 (UTC)
IronPort-SDR: 1R95mqA3qrW+OINtLOvXxieX7QIcEHDVJ0YFJKXmza5Kmn18oy1O9ywUNs9Upo0oOfnALcThRy
 d+e9u0lc3hYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="169917513"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="169917513"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 00:02:23 -0800
IronPort-SDR: a8newL6dkLe8a6j/Cm/FJ4kQN9MtzspDVARZFsrczEpN6c3YbIpjm+bZPipRHcl2BTM8P2MFpa
 xqD6OW6iWrVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="540738386"
Received: from unknown (HELO [10.239.160.26]) ([10.239.160.26])
 by orsmga005.jf.intel.com with ESMTP; 09 Nov 2020 00:02:22 -0800
Subject: Re: [PATCH 0/2] Refactor to per-vGPU accurate vblank emulator
To: intel-gvt-dev@lists.freedesktop.org
References: <20201109080003.812490-1-colin.xu@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <03c8d0e6-f6e3-4838-cf37-649a5b67cb86@intel.com>
Date: Mon, 9 Nov 2020 16:02:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201109080003.812490-1-colin.xu@intel.com>
Content-Language: en-US
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
Reply-To: Colin.Xu@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Re-send for comments.

The vgpu_update_refresh_rate() part need further amendment since the PLL 
part of BXL/APL is different compared with other GEN9.

On 2020-11-09 16:00, Colin Xu wrote:
> The patch set includes two patches:
> Patch 1/2: Get accurate vGPU virtual display refresh rate from vreg
> Patch 2/2: Use per-vGPU vblank emulator at dynamic & accurate refresh rate.
>
> The patch set resovles below issues:
> - 16ms matches the refresh rate at 62.5Hz (instead of 60Hz) which isn't
>    belong to standard timing. This leads to some frame drop or glitch issue
>    during video playback. Since SW expect at least 16.667ms peroid for 60Hz
>    or may need higher resolution, however vblank emulator only works at 16.
> - Doesn't respect the fact that with current virtual EDID timing set,
>    not all resolutions are enabled at 60Hz. For example, current virtual
>    EDID actually supports refresh rate like 56Hz, 59.97Hz, 60Hz, 75Hz, etc.
> - Current vblank emulator use single hrtimer for all vGPUs. Regardsless
>    how guest changing the resolution, all vsync interupts are injected at
>    16ms interval.
>
> With the patch set, the actual refresh rate from guest can now always
> match guest OS resolution settings.
> To run quick test, launch a web browser and goto URL: www.displayhz.com
>
> Colin Xu (2):
>    drm/i915/gvt: Get accurate vGPU virtual display refresh rate from vreg
>    drm/i915/gvt: Refactor GVT vblank emulator for vGPU virtual display
>
>   drivers/gpu/drm/i915/gvt/display.c   | 113 ++++++++++++++++-----------
>   drivers/gpu/drm/i915/gvt/display.h   |  13 ++-
>   drivers/gpu/drm/i915/gvt/gvt.c       |  21 ++++-
>   drivers/gpu/drm/i915/gvt/gvt.h       |  13 ++-
>   drivers/gpu/drm/i915/gvt/handlers.c  | 113 +++++++++++++++++++++++++--
>   drivers/gpu/drm/i915/gvt/interrupt.c |  31 ++------
>   drivers/gpu/drm/i915/gvt/interrupt.h |   6 --
>   drivers/gpu/drm/i915/gvt/vgpu.c      |   2 -
>   8 files changed, 217 insertions(+), 95 deletions(-)
>
-- 
Best Regards,
Colin Xu

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
