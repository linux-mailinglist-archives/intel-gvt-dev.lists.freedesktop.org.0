Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620ED1CED74
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 12 May 2020 09:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB6A88FFB;
	Tue, 12 May 2020 07:01:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C34F88FFB;
 Tue, 12 May 2020 07:01:40 +0000 (UTC)
IronPort-SDR: iVNnIetuSGCLgckUPaIBsmLTdC+xOBCEf9yardzMilvcEh436MghAD/EW4GE6TWbDgf4Ybf/uV
 dIVhjT1NMKAA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2020 00:01:39 -0700
IronPort-SDR: wVkQXjXHgqx7THbq+pT6/wH3DpAOmPFHzLUgw4NM3pR+Zu6hqewwJLWGO2LwATFe2Swa+f0Lyk
 xeXLMGLNQVzQ==
X-IronPort-AV: E=Sophos;i="5.73,382,1583222400"; d="scan'208";a="262024805"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2020 00:01:39 -0700
Date: Tue, 12 May 2020 00:00:31 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <20200512070031.GI1219060@intel.com>
References: <20200512024803.GQ18545@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512024803.GQ18545@zhen-hp.sh.intel.com>
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

On Tue, May 12, 2020 at 10:48:03AM +0800, Zhenyu Wang wrote:
> 
> Hi,
> 
> Here's two more fixes for 5.7. One is for recent guest display probe failure,
> which is fixed by setting correct transcoder and DPLL clock against virtual
> display. Another is regression to fix kernel oops for older aliasing ppgtt guest.

Puled to drm-intel-fixes.
Thanks,
Rodrigo.

> 
> Thanks
> --
> 
> The following changes since commit ec7301d5146c9abe8aaf6e16e420ea3951018503:
> 
>   drm/i915/gvt: switch to user vfio_group_pin/upin_pages (2020-04-14 16:30:17 +0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-fixes-2020-05-12
> 
> for you to fetch changes up to 72a7a9925e2beea09b109dffb3384c9bf920d9da:
> 
>   drm/i915/gvt: Fix kernel oops for 3-level ppgtt guest (2020-05-11 17:07:25 +0800)
> 
> ----------------------------------------------------------------
> gvt-fixes-2020-05-12
> 
> - Correct transcoder and DPLL initial clock to fix recent guest
>   display probe failure. (Colin)
> - Fix kernel oops on older guest using aliasing ppgtt. (Zhenyu)
> 
> ----------------------------------------------------------------
> Colin Xu (1):
>       drm/i915/gvt: Init DPLL/DDI vreg for virtual display instead of inheritance.
> 
> Zhenyu Wang (1):
>       drm/i915/gvt: Fix kernel oops for 3-level ppgtt guest
> 
>  drivers/gpu/drm/i915/gvt/display.c   | 49 ++++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/i915/gvt/scheduler.c |  6 ++++-
>  2 files changed, 49 insertions(+), 6 deletions(-)
> 
> 
> -- 
> Open Source Technology Center, Intel ltd.
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827


_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
