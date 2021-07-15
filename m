Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6890D3CA026
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 15 Jul 2021 15:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178F96E85E;
	Thu, 15 Jul 2021 13:56:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665886E85E;
 Thu, 15 Jul 2021 13:56:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="207527188"
X-IronPort-AV: E=Sophos;i="5.84,242,1620716400"; d="scan'208";a="207527188"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 06:56:21 -0700
X-IronPort-AV: E=Sophos;i="5.84,242,1620716400"; d="scan'208";a="494591429"
Received: from gzhao-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.212.69.157])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 06:56:20 -0700
Date: Thu, 15 Jul 2021 09:56:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-fixes
Message-ID: <YPA+glVCKYzoYq6Y@intel.com>
References: <20210715022237.GX12150@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210715022237.GX12150@zhen-hp.sh.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 10:22:37AM +0800, Zhenyu Wang wrote:
> 
> Hi,
> 
> Here's one fix of shadow ppgtt invalidation with proper vGPU D3 state tracking.
> 
> Thanks

I only noticed this after sending this week's pull request.
I'm sorry about that.

It is now pulled and queued for next week.

Sorry and Thanks,
Rodrigo.

> --
> The following changes since commit 62fb9874f5da54fdb243003b386128037319b219:
> 
>   Linux 5.13 (2021-06-27 15:21:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-fixes-2021-07-15
> 
> for you to fetch changes up to c90b4503ccf42d9d367e843c223df44aa550e82a:
> 
>   drm/i915/gvt: Clear d3_entered on elsp cmd submission. (2021-07-08 16:42:34 +0800)
> 
> ----------------------------------------------------------------
> gvt-fixes-2021-07-15
> 
> - Fix shadow ppgtt invalidation with proper D3 state tracking (Colin)
> 
> ----------------------------------------------------------------
> Colin Xu (1):
>       drm/i915/gvt: Clear d3_entered on elsp cmd submission.
> 
>  drivers/gpu/drm/i915/gvt/handlers.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)



> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
