Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E741716BAC1
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 25 Feb 2020 08:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BB16E9EA;
	Tue, 25 Feb 2020 07:36:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BC06E9EA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 25 Feb 2020 07:36:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 23:36:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,483,1574150400"; d="scan'208";a="410153033"
Received: from zwan2-mobl3.ccr.corp.intel.com (HELO [10.249.169.198])
 ([10.249.169.198])
 by orsmga005.jf.intel.com with ESMTP; 24 Feb 2020 23:36:49 -0800
Subject: Re: [PATCH] drm/i915/gvt: Fix orphan vgpu dmabuf_objs' lifetime
To: Tina Zhang <tina.zhang@intel.com>
References: <20200225053527.8336-1-tina.zhang@intel.com>
 <20200225053527.8336-2-tina.zhang@intel.com>
From: Zhenyu Wang <zhenyuw@linux.intel.com>
Message-ID: <3156da24-69bd-4bcf-b7ab-0992ddbe944a@linux.intel.com>
Date: Tue, 25 Feb 2020 15:36:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225053527.8336-2-tina.zhang@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


On 2/25/2020 1:35 PM, Tina Zhang wrote:
> Deleting dmabuf item's list head after releasing its container can lead
> to KASAN-reported issue:
>
>    BUG: KASAN: use-after-free in __list_del_entry_valid+0x15/0xf0
>    Read of size 8 at addr ffff88818a4598a8 by task kworker/u8:3/13119
>
> So fix this issue by puting deleting dmabuf_objs ahead of releasing its
> container.
>
> Fixes: dfb6ae4e14bd6 ("drm/i915/gvt: Handle orphan dmabuf_objs")
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>   drivers/gpu/drm/i915/gvt/dmabuf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
> index b854bd243e11..526ae0a0b66e 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -151,12 +151,12 @@ static void dmabuf_gem_object_free(struct kref *kref)
>   			dmabuf_obj = container_of(pos,
>   					struct intel_vgpu_dmabuf_obj, list);
>   			if (dmabuf_obj == obj) {
> +				list_del(pos);
>   				intel_gvt_hypervisor_put_vfio_device(vgpu);
>   				idr_remove(&vgpu->object_idr,
>   					   dmabuf_obj->dmabuf_id);
>   				kfree(dmabuf_obj->info);
>   				kfree(dmabuf_obj);
> -				list_del(pos);
>   				break;
>   			}
>   		}

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

thanks


_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
