Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6301A141CEC
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 19 Jan 2020 09:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC98B6E220;
	Sun, 19 Jan 2020 08:05:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340716E220
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 19 Jan 2020 08:05:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jan 2020 00:05:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,337,1574150400"; d="scan'208";a="274764725"
Received: from henry-optiplex-7050.bj.intel.com (HELO [10.238.157.69])
 ([10.238.157.69])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Jan 2020 00:05:06 -0800
Subject: Re: [PATCH 3/3] drm/i915/gvt: Enable vfio edid for all GVT supported
 platform
To: Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gvt-dev@lists.freedesktop.org
References: <20191202070109.73924-1-zhenyuw@linux.intel.com>
 <20191202070109.73924-3-zhenyuw@linux.intel.com>
From: Hang Yuan <hang.yuan@linux.intel.com>
Message-ID: <303cdb22-b76e-ef14-572d-e3fbf468697b@linux.intel.com>
Date: Sun, 19 Jan 2020 15:51:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191202070109.73924-3-zhenyuw@linux.intel.com>
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
Cc: Fred Gao <fred.gao@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Thanks for the patch. It's just verified on CFL.

Reviewed-by: Hang Yuan <hang.yuan@linux.intel.com>

On 12/2/19 3:01 PM, Zhenyu Wang wrote:
> All GVT supported platform has virtual display which should be
> able to handle VFIO edid region. Enable this for all supported platform.
> 
> Cc: Hang Yuan <hang.yuan@linux.intel.com>
> Cc: Fred Gao <fred.gao@intel.com>
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gvt/vgpu.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
> index 85bd9bf4f6ee..1e0865905136 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -426,9 +426,7 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
>   	if (ret)
>   		goto out_clean_sched_policy;
>   
> -	/*TODO: add more platforms support */
> -	if (IS_SKYLAKE(gvt->dev_priv) || IS_KABYLAKE(gvt->dev_priv))
> -		ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
> +	ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
>   	if (ret)
>   		goto out_clean_sched_policy;
>   
> 

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
