Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A27A5F14ED
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 30 Sep 2022 23:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC5910EDB0;
	Fri, 30 Sep 2022 21:31:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B66210EDB0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 30 Sep 2022 21:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664573505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MZyE4q4pUK9exbRcIZDL/JbobrwIaDD99sfovICQ4I=;
 b=LKzzmLBErt7BkoGaHkW0gQomHA/me0p9gbqprzV9CrJnd14RwlEYJnptfy61b1eVTujv5U
 BVPMVoPqo4TVFdmpo8giCDurECLjZ0fTJ41EWKCuQ2zTHgy91bhVpPEbvmYy1bTSh4NTzG
 iXZA7BQuU99nwY+uVvNtc0pONgULhzg=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-601-0qHbA-asNHWJjwzdxLKAGA-1; Fri, 30 Sep 2022 17:31:44 -0400
X-MC-Unique: 0qHbA-asNHWJjwzdxLKAGA-1
Received: by mail-io1-f69.google.com with SMTP id
 e14-20020a6b500e000000b006a13488a320so3564843iob.12
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 30 Sep 2022 14:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=7MZyE4q4pUK9exbRcIZDL/JbobrwIaDD99sfovICQ4I=;
 b=topNLWayj0TeSu2+SKQOJWI5cO4ZQa48xdyCT1SRy3Wl5kmp0WeAhi5ztZVNWpRrAN
 mNBqz/Y4cn8ovxUjTIDSh4eMkwqg3gzsIALg8qd7RU+mya2B1KB+2W9UupnpLdpTxrCm
 DjgjowUV8VqATKr8mWRI9QK1xUSILuyqGDUkzKgoIfouVjMBvDMxm5OKI0ABMO9oxTT8
 viPHOOMhQ1SVi7I5HhO6CYxfFNnsW/2JyPu1KaNm5R2MtBEGP4TTt6rjyoqDzxbDPD5F
 +jg0MhalcOEZ+xUijr+3cY+FSxdgWH5UeN5oZdDDB5U6KPTXyjjZqYzbgJi7bNbXrK1a
 ZT3g==
X-Gm-Message-State: ACrzQf3ncbGwCDdfuRzLlfi7uzK1KOfOhHOz3IcPQuUND/wJxK0RUCC3
 AUFqeHwCVVK1WPHmLa588qMW+2ej9RYkNB8Kk4qFlBeagwdq1F1yyltaTjAwj2Cowl1a2tzziXP
 pkQaeuHTrbxcZoRtpaBGAQhIvCwycS/mKXg==
X-Received: by 2002:a05:6638:4416:b0:35a:3cca:4db3 with SMTP id
 bp22-20020a056638441600b0035a3cca4db3mr5665331jab.0.1664573503707; 
 Fri, 30 Sep 2022 14:31:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5cqLb3noeJWS0YhPhgS37XjFCTWP2XxFR9rFh11+Uu4oQtCWPM3VbBWg5g6mGXkpdAVP6H6g==
X-Received: by 2002:a05:6638:4416:b0:35a:3cca:4db3 with SMTP id
 bp22-20020a056638441600b0035a3cca4db3mr5665306jab.0.1664573503392; 
 Fri, 30 Sep 2022 14:31:43 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 l15-20020a02cd8f000000b0034c107ac9bbsm1343303jap.8.2022.09.30.14.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:31:42 -0700 (PDT)
Date: Fri, 30 Sep 2022 15:31:39 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH] drm/i915/gvt: Add missing vfio_unregister_group_dev() call
Message-ID: <20220930153139.0d60652b.alex.williamson@redhat.com>
In-Reply-To: <0-v1-013609965fe8+9d-vfio_gvt_unregister_jgg@nvidia.com>
References: <0-v1-013609965fe8+9d-vfio_gvt_unregister_jgg@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 stable@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 29 Sep 2022 14:48:35 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> When converting to directly create the vfio_device the mdev driver has to
> put a vfio_register_emulated_iommu_dev() in the probe() and a pairing
> vfio_unregister_group_dev() in the remove.
> 
> This was missed for gvt, add it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 978cf586ac35 ("drm/i915/gvt: convert to use vfio_register_emulated_iommu_dev")
> Reported-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> Should go through Alex's tree.

Applied to vfio next branch for v6.1.  Thanks for the quick fix!

Alex
 
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 41bba40feef8f4..9003145adb5a93 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1615,6 +1615,7 @@ static void intel_vgpu_remove(struct mdev_device *mdev)
>  	if (WARN_ON_ONCE(vgpu->attached))
>  		return;
>  
> +	vfio_unregister_group_dev(&vgpu->vfio_device);
>  	vfio_put_device(&vgpu->vfio_device);
>  }
>  
> 
> base-commit: c72e0034e6d4c36322d958b997d11d2627c6056c

