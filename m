Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1766637AB2D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 May 2021 17:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63F76E56A;
	Tue, 11 May 2021 15:54:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C566EA71
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 May 2021 15:54:48 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id q10so15038511qkc.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 May 2021 08:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=waB6Av30LOi6CLVr2Ec7ZUevWICQJQ2MvGNuKwLCCcI=;
 b=ZI2BocFNKxGVsbGLRPU/P6GV08XsZqNqqTc6BB2oD6qxxmh09aU4E9uoQ/k2jGIAnw
 31bBM7E0XgMwZZYcBH4ORyrl/8Sku/0BP+rM3KheRfRN6Yw9tBDajowA90O5Vr/0cziY
 NK/P6r39g1h1KFB8gdMSA0BNEmvvUjAFzNH9h81ThDAAtoLv/f92FPdA15zZ+fojz8wV
 u7Qp2E7+Uwm0Vu0nyiQiwGdednVflNZhI4KTl4hHOhQHWiBy3t1vyxMKJbl3ewXFRBFi
 3UXf2MGuV56rFi1i1/xTGY/89ErzBoTYhRpBjOvF/HQ+l6a0o65gkrC0+h/OwEZelAZr
 dp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=waB6Av30LOi6CLVr2Ec7ZUevWICQJQ2MvGNuKwLCCcI=;
 b=Zvaa1o5Po/aGL3RODQ2jaALzjRwcsz96SAcxlmBxA/mRy34vod4+ur6GIt8Dt7H5B2
 uZ2/XIoWM6ISc+ZrhnaqhJHIS8OzzAWfqgBto65ZUBvkaelMnPc3cmvTXPWSmH9RTEz+
 ewYbIdQSSqyaTjQD/4+odBp2pv2HSQ75BG/K5p2Lzj6X8PpdgTSS1B2zcPX8g4e0U2om
 Obgt1caPgCN9SPSDcXZ3q8w6fEfH51xg43rNRwvx+khJnwx/ErHbV4DnwMb8U+txnZKi
 QJUIdryt0257Q+ybRL8HgQ9nnN0iI/Q0TCS9CpIc9kWpCVL+caHq9Xadd0R5OpR6o68t
 R2yw==
X-Gm-Message-State: AOAM530/haycOKY0Qf8Ltt7intKGzfKqrjek9Cj+Pq7+nD81tYW3wbJK
 HaU62qXB4kuQRRkr0yKbiGFWug==
X-Google-Smtp-Source: ABdhPJxs5gXaKH2FC5+lAKFOP3tSqoy6P151tSsFP7rM46lRmKDbKEFBpN90UmGAforaJ1UJK7YT2w==
X-Received: by 2002:a37:9305:: with SMTP id v5mr28164006qkd.223.1620748487992; 
 Tue, 11 May 2021 08:54:47 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id 2sm14780345qtr.64.2021.05.11.08.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 08:54:47 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lgUic-005KbT-HO; Tue, 11 May 2021 12:54:46 -0300
Date: Tue, 11 May 2021 12:54:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/i915/gvt: Move mdev attribute groups into kvmgt
 module
Message-ID: <20210511155446.GB1096940@ziepe.ca>
References: <20210511083332.1740601-1-zhenyuw@linux.intel.com>
 <20210511083332.1740601-2-zhenyuw@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210511083332.1740601-2-zhenyuw@linux.intel.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 04:33:30PM +0800, Zhenyu Wang wrote:
> As kvmgt module contains all handling for VFIO/mdev, leaving mdev attribute
> groups in gvt module caused dependency issue. Although it was there for possible
> other hypervisor usage, that turns out never to be true. So this moves all mdev
> handling into kvmgt module completely to resolve dependency issue.
> 
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.c       | 124 +------------------------
>  drivers/gpu/drm/i915/gvt/gvt.h       |   3 -
>  drivers/gpu/drm/i915/gvt/hypercall.h |   2 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 129 +++++++++++++++++++++++++--
>  drivers/gpu/drm/i915/gvt/mpt.h       |   4 +-
>  5 files changed, 126 insertions(+), 136 deletions(-)

There is no reason to make this into three patches, just make the one
line change to kconfig here.

> +static struct intel_vgpu_type *
> +intel_gvt_find_vgpu_type(struct intel_gvt *gvt, unsigned int type_group_id)
> +{
> +	if (WARN_ON(type_group_id >= gvt->num_types))
> +		return NULL;
> +	return &gvt->types[type_group_id];
> +}

The WARN_ON can't happen, all this error handling is code should be
deleted, just use the simple

struct intel_gvt *gvt = kdev_to_i915(mtype_get_parent_dev(mtype))->gvt;
struct intel_vgpu_type *type = &gvt->types[mtype_get_type_group_id(mtype)]

sequence like the other mdev drivers

> +static ssize_t available_instances_show(struct mdev_type *mtype,
> +					struct mdev_type_attribute *attr,
> +					char *buf)
> +{
> +	struct intel_vgpu_type *type;
> +	unsigned int num = 0;
> +	void *gvt = kdev_to_i915(mtype_get_parent_dev(mtype))->gvt;

Use proper types not 'void *'
> +
> +static int intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt)
> +{
> +	int i, j;
> +	struct intel_vgpu_type *type;
> +	struct attribute_group *group;
> +
> +	for (i = 0; i < gvt->num_types; i++) {
> +		type = &gvt->types[i];
> +
> +		group = kzalloc(sizeof(struct attribute_group), GFP_KERNEL);
> +		if (WARN_ON(!group))
> +			goto unwind;

WARN_ON at allocation failure is not good

This need to go into the vfio tree in some way, either directly
through it, via rc or otherwise

Jason
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
