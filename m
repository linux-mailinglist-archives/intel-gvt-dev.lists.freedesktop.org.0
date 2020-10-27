Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ACC29CA8F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 27 Oct 2020 21:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFF36E0E1;
	Tue, 27 Oct 2020 20:45:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD746E0E1;
 Tue, 27 Oct 2020 20:45:12 +0000 (UTC)
IronPort-SDR: +HyX+BMU1+YT/dE/sR4ZRBK+dVH30EOe4uUQr7HI5TZi4V1c8VfH5CkOHSl8qfKpUhVjUkJf4M
 a98CDnuUUlnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="232344468"
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="232344468"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 13:45:11 -0700
IronPort-SDR: abqokq2LiQoTEfObRgtfetkPxn0sDJeXXCKukszge/U+O6WiqT6d0ADSMnEQq0EIHSHjR+jxj9
 A1Lbw9dpdhcw==
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="355679204"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 13:45:11 -0700
Date: Tue, 27 Oct 2020 16:46:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <20201027204643.GE3771340@intel.com>
References: <20201027031740.GA27141@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027031740.GA27141@zhen-hp.sh.intel.com>
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
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 11:17:40AM +0800, Zhenyu Wang wrote:
> 
> Hi,
> 
> Here's first gvt fixes for 5.10 which includes more vGPU
> suspend/resume fix in HWSP reset handling, and also fix for host i915
> suspend regression when vGPU is created (not need to be active), and
> one workaround for APL guest hang issue.

pulled to drm-intel-fixes
thanks

> 
> Thanks
> --
> The following changes since commit 16cce04cdb200ba905d1241b425ac48da5a9ace5:
> 
>   drm/i915/selftests: Push the fake iommu device from the stack to data (2020-09-23 10:15:46 +0300)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-fixes-2020-10-27
> 
> for you to fetch changes up to 401ccfa87856656b874c737522ea92721394a348:
> 
>   drm/i915/gvt: Only pin/unpin intel_context along with workload (2020-10-19 16:54:28 +0800)
> 
> ----------------------------------------------------------------
> gvt-fixes-2020-10-27
> 
> - Fix HWSP reset handling during vGPU suspend/resume (Colin)
> - Apply flush workaround on APL now for possible guest hang (Colin)
> - Fix vGPU context pin/unpin also for host suspend regression with
>   vGPU created (Colin)
> 
> ----------------------------------------------------------------
> Colin Xu (3):
>       drm/i915/gvt: Allow zero out HWSP addr on hws_pga_write
>       drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to workaround GPU BB hang
>       drm/i915/gvt: Only pin/unpin intel_context along with workload
> 
>  drivers/gpu/drm/i915/gvt/handlers.c  | 35 +++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/i915/gvt/scheduler.c | 15 ++++++++-------
>  2 files changed, 41 insertions(+), 9 deletions(-)
> 
> 
> -- 
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827


_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
