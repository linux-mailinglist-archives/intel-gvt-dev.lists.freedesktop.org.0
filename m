Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E2D36B838
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 26 Apr 2021 19:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE6F6E863;
	Mon, 26 Apr 2021 17:40:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D526E863
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 26 Apr 2021 17:40:19 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id i12so25776764qke.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 26 Apr 2021 10:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0GsytaInVxwSaKdx+LzCcs/6tj5N9E1PmsyMWFjeBmU=;
 b=NjA2s2kx+KfMknmLXAdVRg3f2eHe1FGavhKIQ4y/OOyeVtimfbvPJUKUcD40c2j7AI
 2bgOKNE2WEPleWk04Iy5wupkRE9yX+1ODY6jChc6O7HvFM4GUASH+8jKhp0OlYDlEBBE
 Qnl0GMvXugIiYw+O9tw5EdcQLB5Yl19YVzqR6DCjfRW15zjIsY0ViAHPlxVrQdosAzNn
 tRp05G69vL82JU6fk/L4eB8rbLWE6ubKPMb7aV0tiQygrovgBEKSqV01Elh9p+v81SLq
 pJEDEmWvEUbrOVTVNyTHFNFgZdcl1pMzKbiQh5d2j0QSayL1jndc9GYB6QgSVAnVr7FG
 t8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0GsytaInVxwSaKdx+LzCcs/6tj5N9E1PmsyMWFjeBmU=;
 b=q1kX4mvnpsigTAacqWh9Si5A4f49CYLCfiRne8w1TjMjT4WPgl2jm/uMxn7a9fqnMK
 rtpUU8WDuwBRkne+d9R7QG/nrEaMfzm8ExqRfOFSb65UDX8yTImxwnflHilT5mU5zI98
 4n/vsP5xdBiamql/7UJqRG6x8HMyGYSjrVCm1mj2OloW94zXZeImTstwDeZZs67EPMVM
 TNe7tk+PgKzUI2m0BGpRZrFC4a1UUrcRoRyRQY5WqDpzxjPUYj0QaDjfCF43Nqy1LXf7
 ug7e2xxd2pAEwlsCD1r+9PuZBGnlDOk3GCQVmoVdiRD2uXlzXxSbRHeXtJjxzaOAfJuB
 VW9A==
X-Gm-Message-State: AOAM530XB9C3pBaBEhQLlmWLRs1yxkRGLgfZFIDXQIhPgvNdF+Xw4r7J
 tax+WGnxK8HuSPNnRokdR6TD5g==
X-Google-Smtp-Source: ABdhPJwk0rc2MCDhNDPTT5mdVUWELsVP3NIeHtyj0SsIVMyWJNAxNePjGX2bZlvFldbQSYYK4pqtbA==
X-Received: by 2002:a05:620a:210c:: with SMTP id
 l12mr18719753qkl.421.1619458818678; 
 Mon, 26 Apr 2021 10:40:18 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id b8sm584445qka.117.2021.04.26.10.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 10:40:18 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lb5DV-00D7kN-KL; Mon, 26 Apr 2021 14:40:17 -0300
Date: Mon, 26 Apr 2021 14:40:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 2/2] Revert "vfio/gvt: Make DRM_I915_GVT depend on
 VFIO_MDEV"
Message-ID: <20210426174017.GL2047089@ziepe.ca>
References: <20210426094143.4031527-1-zhenyuw@linux.intel.com>
 <20210426094143.4031527-2-zhenyuw@linux.intel.com>
 <20210426105555.3cad2599@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210426105555.3cad2599@redhat.com>
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
 intel-gvt-dev@lists.freedesktop.org, Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Apr 26, 2021 at 10:55:55AM -0600, Alex Williamson wrote:
> On Mon, 26 Apr 2021 17:41:43 +0800
> Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> 
> > This reverts commit 07e543f4f9d116d6b4240644191dee6388ef4a85.
> 
> 07e543f4f9d1 ("vfio/gvt: Make DRM_I915_GVT depend on VFIO_MDEV")
> 
> > With all mdev handing moved to kvmgt module, only kvmgt should depend
> > on VFIO_MDEV. So revert this one.
> > 
> > Cc: Arnd Bergmann <arnd@kernel.org>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Alex Williamson <alex.williamson@redhat.com>
> > Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> >  drivers/gpu/drm/i915/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> > index 8f15bfb5faac..93f4d059fc89 100644
> > +++ b/drivers/gpu/drm/i915/Kconfig
> > @@ -102,7 +102,6 @@ config DRM_I915_GVT
> >  	bool "Enable Intel GVT-g graphics virtualization host support"
> >  	depends on DRM_I915
> >  	depends on 64BIT
> > -	depends on VFIO_MDEV
> >  	default n
> >  	help
> >  	  Choose this option if you want to enable Intel GVT-g graphics
> 
> I take it that this retracts your ack from
> https://lore.kernel.org/dri-devel/20210425032356.GH1551@zhen-hp.sh.intel.com/
> I'll drop it from consideration for pushing through my tree unless
> indicated otherwise.  Thanks,

In any event you'll need either Arnd's patch or this patch in your
tree to avoid randconfig problems.

At this point I would take Arnd's and leave this to go next merge
window.

Jason
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
