Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0281A719FC6
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  1 Jun 2023 16:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730D510E551;
	Thu,  1 Jun 2023 14:24:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AB510E143
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  1 Jun 2023 14:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685629459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1/krOFL7mbU4xxN3nyrKnczfe+skJNyHI4Z3YRHlsPI=;
 b=T/50TVYFenchm8io+wG2QYPwBvgvpqJtkQlzhEPU3X/pnRiEoPBlCVd4i0oFp7ZVcy1qfc
 ZnHvd77gBLA3V61HhgQGwyXZ8BBGmMR+XB7nUsDmKNgCOIahKyrQFhgk8DE7FzMDunqSR5
 /3u2yDlMAABJ/3QssWvfyyDdT5iKMT0=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-lt0xCKIJMaORpecxqO0aPQ-1; Thu, 01 Jun 2023 10:24:17 -0400
X-MC-Unique: lt0xCKIJMaORpecxqO0aPQ-1
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-769036b47a7so89978839f.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 01 Jun 2023 07:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685629456; x=1688221456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1/krOFL7mbU4xxN3nyrKnczfe+skJNyHI4Z3YRHlsPI=;
 b=OgAxEyPpAC9Xxvu/cb50H2kHZXoBsxFZDS9a6aMIdRhDufuZVZKbAlWqjpWXMDmGya
 yO8P8Z76c+kfOdi7G//ehAgPsf8BUey4MWdXH/sL55nYhMpfI5rgPVPuf8uh5Tf4nedl
 0hhvYvgGKt+HDyw+G6BbOHwyA2MPbiw6o4NSw0fj2ZefUFTXRrXne5sb9yqnznk48Mc+
 FIEc88shjvXSBmDOEp+eBLSqm7s32jkvQMBSjbd8Q2bfdNFGIC1QrVd2CTPRmxPiStoZ
 OfyHjW8LnseAs8MVPKW7uWonHYhLd36iJNOSWUxtA8E29ex9uQ9r1wtemgFYIuPkJYWD
 DkpA==
X-Gm-Message-State: AC+VfDyvH2Qdxz/ov9NBubnKRWJZvmCKjCe07uoOsZf8OIKMd+lHLDyf
 h4HK1Q9Mq/hnUXFCs5tKJ5hBwucn7tC+heIWuZ5O4Xf+lE2WYkwdLW6S9VcTw/rUb9/WWnOJBU8
 dIn9B6HzAz5IvZLeq6StzSB5feneOIedXLA==
X-Received: by 2002:a92:dc48:0:b0:33b:4518:855b with SMTP id
 x8-20020a92dc48000000b0033b4518855bmr4310380ilq.31.1685629456511; 
 Thu, 01 Jun 2023 07:24:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ49mx0D8pp1sKwN9GDBagNPW0M6MLwlKghfGbFuCVF3pvvmUFEMkFKSw6/5GH2X52ssF8T1Qw==
X-Received: by 2002:a92:dc48:0:b0:33b:4518:855b with SMTP id
 x8-20020a92dc48000000b0033b4518855bmr4310346ilq.31.1685629456193; 
 Thu, 01 Jun 2023 07:24:16 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 cp12-20020a056638480c00b0040fd44d4011sm2289927jab.125.2023.06.01.07.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 07:24:15 -0700 (PDT)
Date: Thu, 1 Jun 2023 08:24:13 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 09/10] vfio/pci: Extend
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO for vfio device cdev
Message-ID: <20230601082413.22a55ac4.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529B223BD86210A21D142B2C3499@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230522115751.326947-1-yi.l.liu@intel.com>
 <20230522115751.326947-10-yi.l.liu@intel.com>
 <20230524135603.33ee3d91.alex.williamson@redhat.com>
 <DS0PR11MB752935203F87D69D4468B890C3469@DS0PR11MB7529.namprd11.prod.outlook.com>
 <355a9f1e-64e6-d785-5a22-027b708b4935@linux.intel.com>
 <ZHeZPPo/MWXV1L9Q@nvidia.com>
 <DS0PR11MB7529B223BD86210A21D142B2C3499@DS0PR11MB7529.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "Zhao, 
 Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "clegoate@redhat.com" <clegoate@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 Baolu Lu <baolu.lu@linux.intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 1 Jun 2023 06:06:17 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Thursday, June 1, 2023 3:00 AM
> > 
> > On Fri, May 26, 2023 at 10:04:27AM +0800, Baolu Lu wrote:  
> > > On 5/25/23 9:02 PM, Liu, Yi L wrote:  
> > > > >   It's possible that requirement
> > > > > might be relaxed in the new DMA ownership model, but as it is right
> > > > > now, the code enforces that requirement and any new discussion about
> > > > > what makes hot-reset available should note both the ownership and
> > > > > dev_set requirement.  Thanks,  
> > > > I think your point is that if an iommufd_ctx has acquired DMA ownerhisp
> > > > of an iommu_group, it means the device is owned. And it should not
> > > > matter whether all the devices in the iommu_group is present in the
> > > > dev_set. It is allowed that some devices are bound to pci-stub or
> > > > pcieport driver. Is it?
> > > >
> > > > Actually I have a doubt on it. IIUC, the above requirement on dev_set
> > > > is to ensure the reset to the devices are protected by the dev_set->lock.
> > > > So that either the reset issued by driver itself or a hot reset request
> > > > from user, there is no race. But if a device is not in the dev_set, then
> > > > hot reset request from user might race with the bound driver. DMA ownership
> > > > only guarantees the drivers won't handle DMA via DMA API which would have
> > > > conflict with DMA mappings from user. I'm not sure if it is able to
> > > > guarantee reset is exclusive as well. I see pci-stub and pcieport driver
> > > > are the only two drivers that set the driver_managed_dma flag besides the
> > > > vfio drivers. pci-stub may be fine. not sure about pcieport driver.  
> > >
> > > commit c7d469849747 ("PCI: portdrv: Set driver_managed_dma") described
> > > the criteria of adding driver_managed_dma to the pcieport driver.
> > >
> > > "
> > > We achieve this by setting ".driver_managed_dma = true" in pci_driver
> > > structure. It is safe because the portdrv driver meets below criteria:
> > >
> > > - This driver doesn't use DMA, as you can't find any related calls like
> > >   pci_set_master() or any kernel DMA API (dma_map_*() and etc.).
> > > - It doesn't use MMIO as you can't find ioremap() or similar calls. It's
> > >   tolerant to userspace possibly also touching the same MMIO registers
> > >   via P2P DMA access.
> > > "
> > >
> > > pci_rest_device() definitely shouldn't be done by the kernel drivers
> > > that have driver_managed_dma set.  
> > 
> > Right
> > 
> > The only time it is safe to reset is if you know there is no attached
> > driver or you know VFIO is the attached driver and the caller owns the
> > VFIO too.
> > 
> > We haven't done a no attached driver test due to races.  
> 
> Ok. @Alex, should we relax the above dev_set requirement now or should
> be in a separate series?


Sounds like no, you should be rejecting enhancements that increase
scope at this point and I don't see consensus here.  My concern was
that we're not correctly describing the dev_set restriction which is
already in place but needs to be more explicitly described in an
implied ownership model vs proof of ownership model.  Thanks,

Alex

