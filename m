Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5EA51584C
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 30 Apr 2022 00:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1884310E32F;
	Fri, 29 Apr 2022 22:22:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE8410E937
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 29 Apr 2022 22:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651270934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATKyFNAAAkRRTMtWxAFMAqDXlfz2eEkoQ0lWbdsfdDE=;
 b=DwQYV3FePSX6Qla3J0/FYZ0+WO4dSHSXBBgbvv3/W1yHxG0vZIy/YkqtffXonsZPk/C9fa
 pMuSk47iMnFODYdCvFj73U35C+Ub6BIS4xwPHeuOz6ay6hEMisrpNi4ndRq1xR1gMwpOID
 L329yMBQR2hpQEgZRjlJJ0FCD4KVO2A=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-KVyL_NxQMDSTK8Z-Rg4twA-1; Fri, 29 Apr 2022 18:22:13 -0400
X-MC-Unique: KVyL_NxQMDSTK8Z-Rg4twA-1
Received: by mail-io1-f70.google.com with SMTP id
 g16-20020a05660226d000b00638d8e1828bso7378627ioo.13
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 29 Apr 2022 15:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ATKyFNAAAkRRTMtWxAFMAqDXlfz2eEkoQ0lWbdsfdDE=;
 b=uNNR4z44oDGGAw+qZYsj2DaHZFoGYzej4oD4z3YKvJAjhpnvvmbRrWmhbSLV+7FrxH
 oPYWcULzCszoKCyjGrTVE9Mx0o+XLu52NRl+5Ym0K3oNLbG5iTHeNIcKVct7EPcrn5jv
 px9P2mMOumgXJShaECGcyTmJ83xniwvHZJ8Y8Nd2pgo4eybTiM9I9fxyfXfcivODPh7v
 TkVRM8nqWU9JqesZmthNs85t+LN8eCL1HMsNti5Wn7LsGQahPs2LZWZ83foK2aYVC2gk
 a/dpUf4Tp9tiTuALmXCkCMtIcS1qeXVn7OFqoGSSVKQm5W22DYH0GOBgkwzwjaoFco2q
 bjww==
X-Gm-Message-State: AOAM530MmpVkRNlFH1iM9qR/SBIfWPCAt/cFarV2l/SCRhmWc7pGImHT
 UC9NF1MxMSHUgLVSvm4lfv61SGBOWOQzFQ8Be25n0BDm0yPzOgG1G2I34ZF/QIzK/5RYkZaTyP8
 g4OZHIc9N6g1QzITDCppx30jWVdxE25tIYQ==
X-Received: by 2002:a05:6638:4604:b0:32b:4eab:7394 with SMTP id
 bw4-20020a056638460400b0032b4eab7394mr636126jab.18.1651270932498; 
 Fri, 29 Apr 2022 15:22:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPQNrRSGnW48FBq1t2/hjh8q51j2JzUcOvWsug9aMrqr32bPZVspTaleHuRHvQdSR9CF/bGw==
X-Received: by 2002:a05:6638:4604:b0:32b:4eab:7394 with SMTP id
 bw4-20020a056638460400b0032b4eab7394mr636115jab.18.1651270932123; 
 Fri, 29 Apr 2022 15:22:12 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 e71-20020a02864d000000b0032b3a78176bsm897885jai.47.2022.04.29.15.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 15:22:11 -0700 (PDT)
Date: Fri, 29 Apr 2022 16:22:09 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 0/7] Make the rest of the VFIO driver interface use
 vfio_device
Message-ID: <20220429162209.2ec03e4f.alex.williamson@redhat.com>
In-Reply-To: <20220429173149.GA167483@nvidia.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <20220429173149.GA167483@nvidia.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Eric Farman <farman@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, "Liu, Yi
 L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, "Tian, 
 Kevin" <kevin.tian@intel.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 29 Apr 2022 14:31:49 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Thu, Apr 21, 2022 at 01:28:31PM -0300, Jason Gunthorpe wrote:
> > Prior series have transformed other parts of VFIO from working on struct
> > device or struct vfio_group into working directly on struct
> > vfio_device. Based on that work we now have vfio_device's readily
> > available in all the drivers.
> > 
> > Update the rest of the driver facing API to use vfio_device as an input.
> > 
> > The following are switched from struct device to struct vfio_device:
> >   vfio_register_notifier()
> >   vfio_unregister_notifier()
> >   vfio_pin_pages()
> >   vfio_unpin_pages()
> >   vfio_dma_rw()
> > 
> > The following group APIs are obsoleted and removed by just using struct
> > vfio_device with the above:
> >   vfio_group_pin_pages()
> >   vfio_group_unpin_pages()
> >   vfio_group_iommu_domain()
> >   vfio_group_get_external_user_from_dev()
> > 
> > To retain the performance of the new device APIs relative to their group
> > versions optimize how vfio_group_add_container_user() is used to avoid
> > calling it when the driver must already guarantee the device is open and
> > the container_users incrd.
> > 
> > The remaining exported VFIO group interfaces are only used by kvm, and are
> > addressed by a parallel series.
> > 
> > This series is based on Christoph's gvt rework here:
> > 
> >  https://lore.kernel.org/all/5a8b9f48-2c32-8177-1c18-e3bd7bfde558@intel.com/
> > 
> > and so will need the PR merged first.  
> 
> Hi Alex,
> 
> Since all the shared branch PRs are ready, do you have any remarks on
> this series and the others before I rebase and repost them?

Only the nit in the commit log:
https://lore.kernel.org/all/20220429142820.6afe7bbe.alex.williamson@redhat.com/ 

> This one has a few changes to the commit messages outstanding, but v2
> didn't have any code changes.
> 
> Also, what order would like the different series in - they conflict
> with each other a little bit. I suggest this:
> 
> - mdev group removal (this one)
> - Remove vfio_device_get_from_dev()
>   https://lore.kernel.org/r/0-v1-7f2292e6b2ba+44839-vfio_get_from_dev_jgg@nvidia.com
> - Remove group from kvm
>   https://lore.kernel.org/r/0-v1-33906a626da1+16b0-vfio_kvm_no_group_jgg@nvidia.com

I think you mean (v2):

https://lore.kernel.org/all/0-v2-6a528653a750+1578a-vfio_kvm_no_group_jgg@nvidia.com/

Otherwise, thanks for sorting these out for me.

> All of them seem to have got enough reviews now.
>
> I have one more series on this group topic and a few little patches still
> 
> It would be great if you could merge the gvt and iommu series together
> into your tree toward linux-next so I can post patches against a
> stable commit ID so the build-bots can test them.

Please check my vfio next branch and see if this matches what you're
looking for:

https://github.com/awilliam/linux-vfio/commits/next

I'll look for any fallout from Stephen and build bots on Monday's
linux-next compilation.  Thanks,

Alex

