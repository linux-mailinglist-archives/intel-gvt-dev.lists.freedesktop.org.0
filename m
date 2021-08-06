Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 732BD3E2310
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  6 Aug 2021 07:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D9A6EA58;
	Fri,  6 Aug 2021 05:50:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E6B6EA50;
 Fri,  6 Aug 2021 05:50:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="278061765"
X-IronPort-AV: E=Sophos;i="5.84,299,1620716400"; d="scan'208";a="278061765"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 22:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,299,1620716400"; d="scan'208";a="481278257"
Received: from unknown (HELO coxu-arch-shz) ([10.239.160.21])
 by fmsmga008.fm.intel.com with ESMTP; 05 Aug 2021 22:50:22 -0700
Date: Fri, 6 Aug 2021 13:50:20 +0800 (CST)
From: Colin Xu <colin.xu@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 stable@vger.kernel.org, "Xu, Terrence" <terrence.xu@intel.com>, 
 "Bloomfield, Jon" <jon.bloomfield@intel.com>, 
 "Ekstrand, Jason" <jason.ekstrand@intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: Fix cached atomics setting for Windows VM
In-Reply-To: <20210806044056.648016-1-zhenyuw@linux.intel.com>
Message-ID: <facea19-1a97-9cd8-c4a5-cb5dc557ed4d@outlook.office365.com>
References: <20210721062607.512307-1-zhenyuw@linux.intel.com>
 <20210806044056.648016-1-zhenyuw@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 6 Aug 2021, Zhenyu Wang wrote:

Thanks for the fix! Otherwise Windows VM is unusable with recent kernel.

Reviewed-by: Colin Xu <colin.xu@intel.com>

> We've seen recent regression with host and windows VM running
> simultaneously that cause gpu hang or even crash. Finally bisect to
> commit 58586680ffad ("drm/i915: Disable atomics in L3 for gen9"),
> which seems cached atomics behavior difference caused regression
> issue.
>
> This tries to add new scratch register handler and add those in mmio
> save/restore list for context switch. No gpu hang produced with this one.
>
> Cc: stable@vger.kernel.org # 5.12+
> Cc: "Xu, Terrence" <terrence.xu@intel.com>
> Cc: "Bloomfield, Jon" <jon.bloomfield@intel.com>
> Cc: "Ekstrand, Jason" <jason.ekstrand@intel.com>
> Fixes: 58586680ffad ("drm/i915: Disable atomics in L3 for gen9")
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
> drivers/gpu/drm/i915/gvt/handlers.c     | 1 +
> drivers/gpu/drm/i915/gvt/mmio_context.c | 2 ++
> 2 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
> index 06024d321a1a..cde0a477fb49 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -3149,6 +3149,7 @@ static int init_bdw_mmio_info(struct intel_gvt *gvt)
> 	MMIO_DFH(_MMIO(0xb100), D_BDW, F_CMD_ACCESS, NULL, NULL);
> 	MMIO_DFH(_MMIO(0xb10c), D_BDW, F_CMD_ACCESS, NULL, NULL);
> 	MMIO_D(_MMIO(0xb110), D_BDW);
> +	MMIO_D(GEN9_SCRATCH_LNCF1, D_BDW_PLUS);
>
> 	MMIO_F(_MMIO(0x24d0), 48, F_CMD_ACCESS | F_CMD_WRITE_PATCH, 0, 0,
> 		D_BDW_PLUS, NULL, force_nonpriv_write);
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
> index b8ac80765461..f776c470914d 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> @@ -105,6 +105,8 @@ static struct engine_mmio gen9_engine_mmio_list[] __cacheline_aligned = {
> 	{RCS0, COMMON_SLICE_CHICKEN2, 0xffff, true}, /* 0x7014 */
> 	{RCS0, GEN9_CS_DEBUG_MODE1, 0xffff, false}, /* 0x20ec */
> 	{RCS0, GEN8_L3SQCREG4, 0, false}, /* 0xb118 */
> +	{RCS0, GEN9_SCRATCH1, 0, false}, /* 0xb11c */
> +	{RCS0, GEN9_SCRATCH_LNCF1, 0, false}, /* 0xb008 */
> 	{RCS0, GEN7_HALF_SLICE_CHICKEN1, 0xffff, true}, /* 0xe100 */
> 	{RCS0, HALF_SLICE_CHICKEN2, 0xffff, true}, /* 0xe180 */
> 	{RCS0, HALF_SLICE_CHICKEN3, 0xffff, true}, /* 0xe184 */
> -- 
> 2.32.0.rc2
>
>

--
Best Regards,
Colin Xu
