Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E755F5C5B
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  6 Oct 2022 00:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D296210E79B;
	Wed,  5 Oct 2022 22:04:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4C910E79B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Oct 2022 22:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665007441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J9nH6SAe2p+4G72Hb/60qeaydYa0VcigbbhPU+GvRYc=;
 b=bvTMxNjk3nKRN4OQ88kKOMLZ5Fqyv5y1QuwSAYWz9sZfchYu1s/It0zr0HYcE3C+ZWdORv
 1L5+lONufG3EZ8SsjS5++PQSQmvYzWjJPbH3Vwj72pCnLCxlrhxJ476vfAzFXGhTJrP82g
 wHZRfCd8yygURCE2To/sjtcAGZ5u95k=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-_eaEHAhZNRSgUMlnRxrC0Q-1; Wed, 05 Oct 2022 18:04:00 -0400
X-MC-Unique: _eaEHAhZNRSgUMlnRxrC0Q-1
Received: by mail-io1-f71.google.com with SMTP id
 h2-20020a056602154200b006bb5f8574afso126720iow.13
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 05 Oct 2022 15:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=J9nH6SAe2p+4G72Hb/60qeaydYa0VcigbbhPU+GvRYc=;
 b=dBdvhatkz5nR1weAGgPB+yfCJMvacG4/vUYcgUCrYe3YnR2VRwLx79zXTv2m9QOLwp
 dJcsDUxroD5vWsS+hmrSXwCqiJF6Zx+szqtLoAkeHooEUvMEtjLPuBS/uJ1pIVt8fjb5
 5V5qlRj8q47v4jlFPbvy5fL4MH5oCk3CR8LRVYe53IURip9I95LorHR3OEWLyIrQ6eKF
 ZyEk7huXJ8l6Vo28SgmBY8KRXWqSZgngwkoCpQgOZdlUaotCi0uGs2VAVBo9tguG4DkJ
 akvrA4zK/Irh13/6H6jIw51cYHFDB3aWqsh3PMXf59eyarU5iZ1o+W48nOOQ0izq2/MB
 2jRQ==
X-Gm-Message-State: ACrzQf3ss7i+b/z3Yrho/PHe6zE+DYvOuE3GQylxBp8xT1t6fJweMzIz
 SB6A+wR3RlAmvOQOOVcSLCNv8H6suQLHee1KQ9g6RJEnYmE1lKGVtKEzWLTj5zzZ63G/fR5Xtyz
 Zy61B8mOMuke5d7nZAmFuQ/5uO0jm2XtmQQ==
X-Received: by 2002:a05:6e02:1785:b0:2fa:2428:a37b with SMTP id
 y5-20020a056e02178500b002fa2428a37bmr800235ilu.312.1665007440096; 
 Wed, 05 Oct 2022 15:04:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM54tO6NXBc78ZQZvuhnh2uwZGv6Nq26Wj8onM9ymY8rQSrnmcaGBAN7T7WDiA6bSu4ubQQJEA==
X-Received: by 2002:a05:6e02:1785:b0:2fa:2428:a37b with SMTP id
 y5-20020a056e02178500b002fa2428a37bmr800221ilu.312.1665007439878; 
 Wed, 05 Oct 2022 15:03:59 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 n10-20020a02a90a000000b0035b6b21c21fsm4474450jam.17.2022.10.05.15.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 15:03:58 -0700 (PDT)
Date: Wed, 5 Oct 2022 16:03:56 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH] drm/i915/gvt: Add missing vfio_unregister_group_dev() call
Message-ID: <20221005160356.52d6428c.alex.williamson@redhat.com>
In-Reply-To: <20221005141717.234c215e.alex.williamson@redhat.com>
References: <0-v1-013609965fe8+9d-vfio_gvt_unregister_jgg@nvidia.com>
 <20221005141717.234c215e.alex.williamson@redhat.com>
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

On Wed, 5 Oct 2022 14:17:17 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Thu, 29 Sep 2022 14:48:35 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > When converting to directly create the vfio_device the mdev driver has to
> > put a vfio_register_emulated_iommu_dev() in the probe() and a pairing
> > vfio_unregister_group_dev() in the remove.
> > 
> > This was missed for gvt, add it.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 978cf586ac35 ("drm/i915/gvt: convert to use vfio_register_emulated_iommu_dev")
> > Reported-by: Alex Williamson <alex.williamson@redhat.com>
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/kvmgt.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > Should go through Alex's tree.
> > 
> > diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > index 41bba40feef8f4..9003145adb5a93 100644
> > --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > @@ -1615,6 +1615,7 @@ static void intel_vgpu_remove(struct mdev_device *mdev)
> >  	if (WARN_ON_ONCE(vgpu->attached))
> >  		return;

Actually, what's the purpose of this ^^^^ ?

We can't have a .remove callback that does nothing, this breaks
removing the device while it's in use.  Once we have the
vfio_unregister_group_dev() fix below, we'll block until the device is
unused, at which point vgpu->attached becomes false.  Unless I'm
missing something, I think we should also follow-up with a patch to
remove that bogus warn-on branch, right?  Thanks,

Alex

> >  
> > +	vfio_unregister_group_dev(&vgpu->vfio_device);
> >  	vfio_put_device(&vgpu->vfio_device);
> >  }
> >  
> > 
> > base-commit: c72e0034e6d4c36322d958b997d11d2627c6056c  
> 
> This is marked for stable, but I think the stable backport for
> existing kernels is actually:
> 
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index e3cd58946477..de89946c4817 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1595,6 +1595,9 @@ static void intel_vgpu_remove(struct mdev_device *mdev)
>  
>  	if (WARN_ON_ONCE(vgpu->attached))
>  		return;
> +
> +	vfio_unregister_group_dev(&vgpu->vfio_device);
> +	vfio_uninit_group_dev(&vgpu->vfio_device);
>  	intel_gvt_destroy_vgpu(vgpu);
>  }

