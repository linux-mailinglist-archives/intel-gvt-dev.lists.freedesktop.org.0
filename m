Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B811C87F
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 12 Dec 2019 09:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB626E165;
	Thu, 12 Dec 2019 08:51:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC426E165
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 12 Dec 2019 08:51:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 00:51:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,305,1571727600"; d="scan'208";a="216042712"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga006.jf.intel.com with ESMTP; 12 Dec 2019 00:51:12 -0800
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 12 Dec 2019 00:51:12 -0800
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 FMSMSX154.amr.corp.intel.com (10.18.116.70) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 12 Dec 2019 00:51:12 -0800
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.19]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.222]) with mapi id 14.03.0439.000;
 Thu, 12 Dec 2019 16:51:10 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: set guest display buffer as readonly
Thread-Topic: [PATCH] drm/i915/gvt: set guest display buffer as readonly
Thread-Index: AQHVsMQW3FWvgS/2Vk2x4SjRtQPhw6e2LwrA
Date: Thu, 12 Dec 2019 08:51:09 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC877DAF0C@SHSMSX101.ccr.corp.intel.com>
References: <20191212081452.317-1-zhenyuw@linux.intel.com>
In-Reply-To: <20191212081452.317-1-zhenyuw@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMWVlYmQ5MzMtMWQyYy00M2M5LWIzY2EtZDY4NTkwZWM2YmUwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWTBSM3NaMFRib1lMYWVvKzZieXRpUVIrcUxyWFhkbXFLdmFaOWI1cTBsN3M1ckZtdGhEbE1ET1VcL2dRWlphWGIifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Zhenyu Wang <zhenyuw@linux.intel.com>
> Sent: Thursday, December 12, 2019 4:15 PM
> To: intel-gvt-dev@lists.freedesktop.org
> Cc: Zhang, Tina <tina.zhang@intel.com>
> Subject: [PATCH] drm/i915/gvt: set guest display buffer as readonly
> 
> We shouldn't allow write for exporsed guest display buffer which doesn't
> make sense. So explicitly set read only flag for display dmabuf allocated
> object.
> 
> Fixes: e546e281d33d ("drm/i915/gvt: Dmabuf support for GVT-g")
> Cc: Tina Zhang <tina.zhang@intel.com>
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c
> b/drivers/gpu/drm/i915/gvt/dmabuf.c
> index e451298d11c3..ee0f3094e6d0 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -163,6 +163,7 @@ static struct drm_i915_gem_object
> *vgpu_create_gem(struct drm_device *dev,
>  	drm_gem_private_object_init(dev, &obj->base,
>  		roundup(info->size, PAGE_SIZE));
>  	i915_gem_object_init(obj, &intel_vgpu_gem_ops, &lock_class);
> +	i915_gem_object_set_readonly(obj);

Looks good to me. Thanks.

BR,
Tina
> 
>  	obj->read_domains = I915_GEM_DOMAIN_GTT;
>  	obj->write_domain = 0;
> --
> 2.24.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
