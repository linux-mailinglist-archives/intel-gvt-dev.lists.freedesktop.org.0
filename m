Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B125F5ADF
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Oct 2022 22:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A5010E776;
	Wed,  5 Oct 2022 20:18:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74B710E770
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Oct 2022 20:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665001076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g2vLC0/2i+I0uLMhPpq2EA/KZTboH7Z2lCWoTbduUxI=;
 b=XflayfSe6uGdIa9s1TIIoXW0oZLvx8JVqBwo34VoSBe7XUGycQ3QakIIrQ6ZjPuM2xmhPh
 lu/yv6qpmKW/UxO9//t7uQnRgGDPgAAXGhgeD++BCY9zeUy5sDMXiOXCBalK0rRQ71ya3A
 VXeCoktCmuCErpTh7iKQfIRP48SUh58=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-65--DHCuByXPwivMJ2YM5D_xA-1; Wed, 05 Oct 2022 16:17:55 -0400
X-MC-Unique: -DHCuByXPwivMJ2YM5D_xA-1
Received: by mail-io1-f70.google.com with SMTP id
 r144-20020a6b8f96000000b006b498754be8so2949476iod.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 05 Oct 2022 13:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=g2vLC0/2i+I0uLMhPpq2EA/KZTboH7Z2lCWoTbduUxI=;
 b=hiCqNhz6WDXGa4OUoZD+BkJy91TSIpdeWlQuFP7iz4ufLAjexNmP9ljnXB8WAhaxHC
 7Cr3ZbeU71rlQw/fMrckj/TuOJpTTnJOV2BAyRYKnwvc5ZNftjm+jt9fQcGu0dcnboGy
 wpvPbz2t6DozCNDhDaZaTP/oWCBpm16dJaH6fHER3ZzoxcpOzEn88oS7PXBgBjxKespr
 T9hex5yVQu82AL1NlUJh2drvxYmXGQ5WVg2FUkqGzPDNH8OEdhYD3G0IC8/VlCavffSk
 29kkL2sud+jgc6mfBnWD3ADPtoHF08d0uB4jNLCbtFmJXjixsaQS06cUvF5QbirbaUa5
 kaeQ==
X-Gm-Message-State: ACrzQf2SvolhQ5yjcAkZArDFjDnZotge4x5zI/KBZrqemLdvCkQdcQOm
 RlTBFv9SGpgi4DabPUo6PB+AVvxOFr/m/v9v4GueB5h5moPmotlNVTleCMuLvdNfr6iy7U/0URM
 mbZ0b6GRmh8snmtVLbXK4b5gSAkRkgjCiBw==
X-Received: by 2002:a05:6e02:c67:b0:2f9:9117:a581 with SMTP id
 f7-20020a056e020c6700b002f99117a581mr669150ilj.107.1665001075224; 
 Wed, 05 Oct 2022 13:17:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7TZXdlHRglVXSKK9ZEsjo4JcrcXszFMsFm+6IUYbJ/RhiRJTAFh4/Dq8wK7FNTPN7X1kZaiQ==
X-Received: by 2002:a05:6e02:c67:b0:2f9:9117:a581 with SMTP id
 f7-20020a056e020c6700b002f99117a581mr669141ilj.107.1665001074983; 
 Wed, 05 Oct 2022 13:17:54 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 a14-20020a056602148e00b006a4ab3268f3sm1537915iow.42.2022.10.05.13.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 13:17:32 -0700 (PDT)
Date: Wed, 5 Oct 2022 14:17:17 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH] drm/i915/gvt: Add missing vfio_unregister_group_dev() call
Message-ID: <20221005141717.234c215e.alex.williamson@redhat.com>
In-Reply-To: <0-v1-013609965fe8+9d-vfio_gvt_unregister_jgg@nvidia.com>
References: <0-v1-013609965fe8+9d-vfio_gvt_unregister_jgg@nvidia.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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
> 
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

This is marked for stable, but I think the stable backport for
existing kernels is actually:

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index e3cd58946477..de89946c4817 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1595,6 +1595,9 @@ static void intel_vgpu_remove(struct mdev_device *mdev)
 
 	if (WARN_ON_ONCE(vgpu->attached))
 		return;
+
+	vfio_unregister_group_dev(&vgpu->vfio_device);
+	vfio_uninit_group_dev(&vgpu->vfio_device);
 	intel_gvt_destroy_vgpu(vgpu);
 }

