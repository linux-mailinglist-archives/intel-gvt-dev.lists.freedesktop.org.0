Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C8635FF5B
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 15 Apr 2021 03:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBF36E9E2;
	Thu, 15 Apr 2021 01:24:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E886E9D8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 15 Apr 2021 01:24:46 +0000 (UTC)
IronPort-SDR: QR77KqUkkEfMBtMKpQX2aSAC8QUL7elk53AQm2cIWZ2KtElLro3yUH+RF1OFX2K+0Bhbph1Jbd
 Cf0Mk5gaK+ag==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="174268203"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="174268203"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 18:24:45 -0700
IronPort-SDR: TxnicHQOd+kPI+s4yQ1CNdFrc+jrklN7YEqFIsXwGXdPYrWK0qKXAHGJU5fkCeD1GbZIsb0vt4
 n7mWZRiNuXOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="389581652"
Received: from unknown (HELO coxu-arch-shz) ([10.239.160.30])
 by fmsmga007.fm.intel.com with ESMTP; 14 Apr 2021 18:24:43 -0700
Date: Thu, 15 Apr 2021 09:24:43 +0800 (CST)
From: Colin Xu <colin.xu@intel.com>
X-X-Sender: coxu_arch@coxu-arch-shz
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gvt: Fix BDW command parser regression
In-Reply-To: <20210414084813.3763353-1-zhenyuw@linux.intel.com>
Message-ID: <alpine.LNX.2.22.419.2104150922140.5599@coxu-arch-shz>
References: <20210414084813.3763353-1-zhenyuw@linux.intel.com>
User-Agent: Alpine 2.22 (LNX 419 2020-04-12)
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
Cc: Yan Zhao <yan.y.zhao@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 14 Apr 2021, Zhenyu Wang wrote:

> On BDW new Windows driver has brought extra registers to handle for
> LRM/LRR command in WA ctx. Add allowed registers in cmd parser for BDW.
>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Yan Zhao <yan.y.zhao@intel.com>
> Cc: stable@vger.kernel.org
> Fixes: 73a37a43d1b0 ("drm/i915/gvt: filter cmds "lrr-src" and "lrr-dst" in cmd_handler")
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
> drivers/gpu/drm/i915/gvt/cmd_parser.c | 19 +++++++++++++------
> 1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> index fef1e857cefc..01c1d1b36acd 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -916,19 +916,26 @@ static int cmd_reg_handler(struct parser_exec_state *s,
>
> 	if (!strncmp(cmd, "srm", 3) ||
> 			!strncmp(cmd, "lrm", 3)) {
> -		if (offset != i915_mmio_reg_offset(GEN8_L3SQCREG4) &&
> -				offset != 0x21f0) {
> +		if (offset == i915_mmio_reg_offset(GEN8_L3SQCREG4) ||
> +		    offset == 0x21f0 ||
> +		    (IS_BROADWELL(gvt->gt->i915) &&
> +		     offset == i915_mmio_reg_offset(INSTPM)))
> +			return 0;
> +		else {
> 			gvt_vgpu_err("%s access to register (%x)\n",
> 					cmd, offset);
> 			return -EPERM;
> -		} else
> -			return 0;
> +		}
> 	}
>
> 	if (!strncmp(cmd, "lrr-src", 7) ||
> 			!strncmp(cmd, "lrr-dst", 7)) {
> -		gvt_vgpu_err("not allowed cmd %s\n", cmd);
> -		return -EPERM;
> +		if (IS_BROADWELL(gvt->gt->i915) && offset == 0x215c)
> +			return 0;
> +		else {
> +			gvt_vgpu_err("not allowed cmd %s reg (%x)\n", cmd, offset);
> +			return -EPERM;
> +		}
> 	}
>
> 	if (!strncmp(cmd, "pipe_ctrl", 9)) {
> -- 
> 2.31.0
>
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
>

Reviewed-by: Colin Xu <colin.xu@intel.com>

Thanks for the timely fix for BDW!
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
