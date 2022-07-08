Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A2356B4EF
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  8 Jul 2022 10:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27F5112D79;
	Fri,  8 Jul 2022 08:56:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07715112D76;
 Fri,  8 Jul 2022 08:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657270565; x=1688806565;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xoIRMoc7m/H4mzgfZ4Ama9uI5xZ/IoArvNaKA9ERL5Y=;
 b=RxBi56ChqMppE+vZq3wW9vjzXuZJmnQ/MbN6tANHOA5Ru7vrSh4i6kAd
 8SsnIywMi5rG0ZhB/pL4T+z7v96uW3EJO5xERPilJ7uW96y9uw/MreEy2
 wdWterzzU/W1OLJVyEd81s2KR6tNjVpCuw4JUW3/pp/7cUZFo6wC3P4f3
 PTdoF6CUMysm9JXS2g3gQyRFz87VMULIoNZFA7N1wJ4Q0sOOmpa0mTlsY
 rXD3Hku6Vs94biZtEDzhWQ9eW5ayh1cX/T0xQYd2FtDZUbZ9apuoPKHig
 ADdDZ7ypBhVpd7Db6Kx6ZnKsNw9cfUPwRZlGkPbk5S9ZlW8vmsEYpDk9R w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="285362784"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="285362784"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 01:56:04 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="568870123"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.16.201])
 ([10.213.16.201])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 01:55:57 -0700
Message-ID: <01c7440e-8198-878c-cfb6-b54468b1dca5@intel.com>
Date: Fri, 8 Jul 2022 10:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gvt: IS_ERR() vs NULL bug in
 intel_gvt_update_reg_whitelist()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
References: <Ysftoia2BPUyqVcD@kili>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Ysftoia2BPUyqVcD@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 08.07.2022 10:41, Dan Carpenter wrote:
> The shmem_pin_map() function returns NULL, it doesn't return error
> pointers.
> 
> Fixes: 97ea656521c8 ("drm/i915/gvt: Parse default state to update reg whitelist")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/gvt/cmd_parser.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> index b9eb75a2b400..1c35a41620ae 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -3117,9 +3117,9 @@ void intel_gvt_update_reg_whitelist(struct intel_vgpu *vgpu)
>   			continue;
>   
>   		vaddr = shmem_pin_map(engine->default_state);
> -		if (IS_ERR(vaddr)) {
> -			gvt_err("failed to map %s->default state, err:%zd\n",
> -				engine->name, PTR_ERR(vaddr));
> +		if (!vaddr) {
> +			gvt_err("failed to map %s->default state\n",
> +				engine->name);
>   			return;
>   		}
>   

