Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3827E219F51
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 Jul 2020 13:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26166EA4B;
	Thu,  9 Jul 2020 11:51:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2E06EA4B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Jul 2020 11:51:55 +0000 (UTC)
IronPort-SDR: 8hYNMSBWHZLDCOmIL0GORcIFTXJ2/Eul+ekp27mO0jgi4vkCnVOQj2nhUu3RaMXolmfZo5q6wa
 ss/8hRh+yYmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="127563394"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="127563394"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 04:51:44 -0700
IronPort-SDR: Jkg0HjbJP86AehoR91d+smiAi9nHmodmNkxFlSdCJG3slyu//ngydww0/Md9eUC0bi5TK+K1B5
 Dh0rnqtMQvBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="284124057"
Received: from unknown (HELO [10.239.160.21]) ([10.239.160.21])
 by orsmga006.jf.intel.com with ESMTP; 09 Jul 2020 04:51:43 -0700
Subject: Re: [PATCH v2 0/3] Fix ppgtt_mm destroy and pv_notified reset logic
 during vGPU D3->D0
To: intel-gvt-dev@lists.freedesktop.org
References: <20200709071002.247960-1-colin.xu@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <ceb9b36e-8e07-0349-afed-971f07838f16@intel.com>
Date: Thu, 9 Jul 2020 19:51:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200709071002.247960-1-colin.xu@intel.com>
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
Cc: kevin.tian@intel.com, zhenyuw@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Due to:

intel_vgpu_destroy_all_ppgtt_mm()

<--- intel_vgpu_clean_gtt()

<---intel_gvt_destroy_vgpu().

intel_vgpu_destroy_all_ppgtt_mm() from intel_gvt_release_vgpu() isn't 
required so I remove it in v2.

On 2020-07-09 15:09, Colin Xu wrote:
> The patch set fix issues when vGPU transit D3->D0:
> Do not invalidate & destroy ppgtt_mm in dmlr when D3->D0.
> Do not reset pv_notified in dmlr when D3->D0.
>
> v2:
> - Revise commit message to more accurate description. (Kevin)
> - Split patch by logic. (Zhenyu)
>
> Colin Xu (3):
>    drm/i915/gvt: Do not destroy ppgtt_mm during vGPU D3->D0.
>    drm/i915/gvt: Do not reset pv_notified when vGPU transit from D3->D0
>    drm/i915/gvt: Remove intel_vgpu_reset_gtt() since no one use it.
>
>   drivers/gpu/drm/i915/gvt/cfg_space.c | 24 ++++++++++++++++++++++++
>   drivers/gpu/drm/i915/gvt/gtt.c       | 20 +-------------------
>   drivers/gpu/drm/i915/gvt/gtt.h       |  3 ++-
>   drivers/gpu/drm/i915/gvt/gvt.h       |  3 +++
>   drivers/gpu/drm/i915/gvt/vgpu.c      | 20 +++++++++++++++++---
>   5 files changed, 47 insertions(+), 23 deletions(-)
>
-- 
Best Regards,
Colin Xu

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
