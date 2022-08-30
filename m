Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AE35A66F3
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 30 Aug 2022 17:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8912A10E116;
	Tue, 30 Aug 2022 15:10:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5614E10E117
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Aug 2022 15:10:12 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id w4so8671364qvs.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Aug 2022 08:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=CBamQzSNNxE6SjxTKzzEO+qM/bRDvj9E4TwCaLJXBMk=;
 b=fXNdwdpK40/W9ZV/jtDtFanBo50pdD9Zqq2j76SqDodQNMcH/S/9ZORqwpujvM/1o7
 Y6ijjlraOllJTnfE8hkllQZkWTkVYG+l9AgDUUsf4ThP+1u3Lezl0Ah/HcTMhGdPhepr
 6oaOHPhbuuQXVL7zA8adj2Q6F6wDptOrEHfHvWpbBkt1JOkwh5bMK0Ps71apRT8m0wKL
 AOMSw1qxFu5ZtF1ie2DWVMI+XNlOgLhGsqhKFseVmGJOBV0nuysZvPAUoIJ8ecRUEdf7
 8NQ34drZxPG72BJMShFI1bT2VX5a+waMVxy4LYhuSx5L0ejfGHWsTQ/GqJcHZt7AT8AA
 7NCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=CBamQzSNNxE6SjxTKzzEO+qM/bRDvj9E4TwCaLJXBMk=;
 b=E/7UjCleckPPzYBQUj2msDgoFfckS60CWyP3IXSAkfSTwe2iY/ADRDCImPx/rtDkc3
 X6aPe8f67K7pxKbXr2xnKI13zBTKEYOlArAuT3TqMptezlPzTMtC8XAMKqahYm5wEVDZ
 /gFNJKaEpWWupnAAZEUehRv5ht8XkIbl8Noe9TbxJxUlTjtcGeRKAzknxp+A1pezQ4Ba
 h/fDGLPr1ioV4cumDPRhCu7E2/alGg1lHYQaHMZ9hxEugz5Wf9/SZtBLergdb+0L8GxG
 Cq2zuUpEGnKCzxz0AU1mOVbaxnjFO53FfxoqLTH2z7tnr/Q/KiFxY6s3iIBvXV4iQpkz
 FejQ==
X-Gm-Message-State: ACgBeo38/umsPv/1WKI1RDivSCEj+N0oEUo46STfxj26FQPaJr+3ylSK
 PSKf+3DyEvc3XY70cKfhccp48Q==
X-Google-Smtp-Source: AA6agR6UUGFhrYHDf4KVE6IxiHBU+9Pg/pWLmRZ4Y2KqjrWUkINgLEKIUkRA9mAuIBzucBWjgrkfbQ==
X-Received: by 2002:a0c:f1c7:0:b0:474:725e:753e with SMTP id
 u7-20020a0cf1c7000000b00474725e753emr15301629qvl.49.1661872210775; 
 Tue, 30 Aug 2022 08:10:10 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 bl8-20020a05620a1a8800b006bbdcb3fff7sm7634727qkb.69.2022.08.30.08.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 08:10:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oT2sS-003kUN-QX;
 Tue, 30 Aug 2022 12:10:08 -0300
Date: Tue, 30 Aug 2022 12:10:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Anthony Krowiak <akrowiak@linux.ibm.com>
Subject: Re: [PATCH 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
Message-ID: <Yw4oUL33TbJK6inc@ziepe.ca>
References: <20220827171037.30297-1-kevin.tian@intel.com>
 <20220827171037.30297-2-kevin.tian@intel.com>
 <907c54c6-7f5b-77f3-c284-45604c60c12e@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <907c54c6-7f5b-77f3-c284-45604c60c12e@linux.ibm.com>
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Eric Farman <farman@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Aug 30, 2022 at 09:42:42AM -0400, Anthony Krowiak wrote:

> > +/*
> > + * Alloc and initialize vfio_device so it can be registered to vfio
> > + * core.
> > + *
> > + * Drivers should use the wrapper vfio_alloc_device() for allocation.
> > + * @size is the size of the structure to be allocated, including any
> > + * private data used by the driver.
> 
> 
> It seems the purpose of the wrapper is to ensure that the object being
> allocated has as its first field a struct vfio_device object and to return
> its container. Why not just make that a requirement for this function -
> which I would rename vfio_alloc_device - and document it in the prologue?
> The caller can then cast the return pointer or use container_of.

There are three fairly common patterns for this kind of thing

1) The caller open codes everything:

   driver_struct = kzalloc()
   core_init(&driver_struct->core)

2) Some 'get priv' / 'get data' is used instead of container_of():

   core_struct = core_alloc(sizeof(*driver_struct))
   driver_struct = core_get_priv(core_struct)

3) The allocations and initialization are consolidated in the core,
   but we continue to use container_of()

   driver_struct = core_alloc(typeof(*driver_struct))

#1 has a general drawback that people routinely mess up the lifecycle
model and get really confused about when to do kfree() vs put(),
creating bugs.

#2 has a general drawback of not using container_of() at all, and being
a bit confusing in some cases

#3 has the general drawback of being a bit magical, but solves 1 and
2's problems.

I would not fix the struct layout without the BUILD_BUG_ON because
someone will accidently change the order and that becomes a subtle
runtime error - so at a minimum the wrapper macro has to exist to
check that.

If you want to allow a dynamic struct layout and avoid the pitfall of
exposing the user to kalloc/kfree, then you still need the macro, and
it does some more complicated offset stuff.

Having the wrapper macro be entirely type safe is appealing and
reduces code in the drivers, IMHO. Tell it what type you are initing
and get back init'd memory for that type that you always, always free
with a put operation.

Jason
