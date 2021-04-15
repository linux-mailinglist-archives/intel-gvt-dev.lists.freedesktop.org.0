Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D9935FF8B
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 15 Apr 2021 03:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53556E0C6;
	Thu, 15 Apr 2021 01:29:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A048A6E0C6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 15 Apr 2021 01:29:23 +0000 (UTC)
IronPort-SDR: yvtAd7cQ/4d52bJGP9JI5EtAsapFBV9ANtAIqMS/NEhlOexaRMnngUkIx0GblNazRHEblZ7zhF
 JlZ0T7EvDnGA==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="280086023"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="280086023"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 18:29:23 -0700
IronPort-SDR: tKdc+guPGosIVOrVM3m/dFWoCRkqmFTIE6GtZUXUmC7jkujPQr0T/Xh3Ah7cbt42rJZh5lVQjk
 KfhdRkINRTHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="399394464"
Received: from unknown (HELO coxu-arch-shz) ([10.239.160.30])
 by orsmga002.jf.intel.com with ESMTP; 14 Apr 2021 18:29:21 -0700
Date: Thu, 15 Apr 2021 09:29:20 +0800 (CST)
From: Colin Xu <colin.xu@intel.com>
X-X-Sender: coxu_arch@coxu-arch-shz
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Remove duplicated register accessible
 check
In-Reply-To: <20210414084813.3763353-2-zhenyuw@linux.intel.com>
Message-ID: <alpine.LNX.2.22.419.2104150929020.5599@coxu-arch-shz>
References: <20210414084813.3763353-1-zhenyuw@linux.intel.com>
 <20210414084813.3763353-2-zhenyuw@linux.intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, intel-gvt-dev@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 14 Apr 2021, Zhenyu Wang wrote:

> Looks this duplication was missed in code rebase. Remove extra check.
>
> Cc: Yan Zhao <yan.y.zhao@intel.com>
> Fixes: 02dd2b12a685 ("drm/i915/gvt: unify lri cmd handler and mmio handlers")
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
> drivers/gpu/drm/i915/gvt/cmd_parser.c | 5 -----
> 1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> index 01c1d1b36acd..ca9c9e27a43d 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -948,11 +948,6 @@ static int cmd_reg_handler(struct parser_exec_state *s,
>
> 	/* below are all lri handlers */
> 	vreg = &vgpu_vreg(s->vgpu, offset);
> -	if (!intel_gvt_mmio_is_cmd_accessible(gvt, offset)) {
> -		gvt_vgpu_err("%s access to non-render register (%x)\n",
> -				cmd, offset);
> -		return -EBADRQC;
> -	}
>
> 	if (is_cmd_update_pdps(offset, s) &&
> 	    cmd_pdp_mmio_update_handler(s, offset, index))
> -- 
> 2.31.0
>
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
>

Reviewed-by: Colin Xu <colin.xu@intel.com>

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
