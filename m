Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FF27088B9
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 May 2023 21:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6370B10E547;
	Thu, 18 May 2023 19:53:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5E010E547
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 May 2023 19:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684439635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SOnz7FLeWFp9Eq20E/7cfvpQ/psIaNzbdtCx4JAp4z8=;
 b=i15FN0oyRe57cD2gbrapH8h5RyrRBlTW5Qy+RdF7Ds1pBTI1Rdb+bMJVC94tkZBVWyxUpZ
 Cfdl9LKJDFO0KG2zBrNQspjn7yH4cUE8ScHfbn3/viMo54ADUrdptUXnWloVWuca2gNnT5
 AcYJZO8BbSM/AgnClTIX6dgDrtL/h/I=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-aOAEBPV4P2ale9ObYrzX0Q-1; Thu, 18 May 2023 15:53:53 -0400
X-MC-Unique: aOAEBPV4P2ale9ObYrzX0Q-1
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-76371bc5167so385975839f.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 May 2023 12:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684439632; x=1687031632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SOnz7FLeWFp9Eq20E/7cfvpQ/psIaNzbdtCx4JAp4z8=;
 b=iPVOCWkGvx+mH6ikb4aQB8VWbaVMftTowjeeBh56F0s+CrZIKUbMFqgUwS5UfJj7jf
 vVtuGadwvBJJVvdws1DUtDGv+jEZTPv8JovgWrOoX1NuwiCR3P0EHeuUrEcmOtu+8R85
 LHZJCNakyYqO3c12xxZfesTDm+PCcyYUPHqtqRNPH9XdPcrOxhXxCNXfqozM632P1OS0
 3q5MnKt/yzaVdlCtbg7/UijNlmMhg71Hz3EsqovRTvQz0BdVFDqFcSq/Y26czlYjg89g
 qETai6WfQ5d5rks1FEwxI/VUVS7U+QoWwcvDd4SVIx295qI91B8HolcrDknf06ciU7S7
 rysQ==
X-Gm-Message-State: AC+VfDxjpC+ZqwaMIdbsSfuuD5Qbn/iCv35hdv6TOSOxDy7zONo72tu9
 eLqKZNVppRvLQn4A5BD2DZ31V3JqgsuT/uQGUybamgW3jDUw1TrYzIgjG0bL63S2mN9zcqyDCzd
 R7bUDZJ6qJXdB/+EnI4517Xd8Gnl4PIqE9183LBoGpQ==
X-Received: by 2002:a92:c952:0:b0:337:83fc:43c8 with SMTP id
 i18-20020a92c952000000b0033783fc43c8mr5511174ilq.10.1684439631917; 
 Thu, 18 May 2023 12:53:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Mt3onZ7ykj03VNoF8B/a0LVLffzU72IX2ayiTe6tSR9N5/g8PndWcoR1I1HxYqhwrE8Wk5Q==
X-Received: by 2002:a92:c952:0:b0:337:83fc:43c8 with SMTP id
 i18-20020a92c952000000b0033783fc43c8mr5511169ilq.10.1684439631723; 
 Thu, 18 May 2023 12:53:51 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 cp12-20020a056638480c00b004165f64968csm676038jab.103.2023.05.18.12.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 12:53:51 -0700 (PDT)
Date: Thu, 18 May 2023 13:53:49 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v5 09/10] vfio/pci: Extend
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO for vfio device cdev
Message-ID: <20230518135349.5dcf63c1.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB752951FE3826428345A6CF6DC37F9@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230513132136.15021-1-yi.l.liu@intel.com>
 <20230513132136.15021-10-yi.l.liu@intel.com>
 <20230517160131.254be76b.alex.williamson@redhat.com>
 <DS0PR11MB75291457BBD647819B855DA0C37F9@DS0PR11MB7529.namprd11.prod.outlook.com>
 <DS0PR11MB752951FE3826428345A6CF6DC37F9@DS0PR11MB7529.namprd11.prod.outlook.com>
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
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
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
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 18 May 2023 13:31:47 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Liu, Yi L <yi.l.liu@intel.com>
> > Sent: Thursday, May 18, 2023 9:22 PM
> >   
> > > From: Alex Williamson <alex.williamson@redhat.com>
> > > Sent: Thursday, May 18, 2023 6:02 AM
> > >
> > > On Sat, 13 May 2023 06:21:35 -0700
> > > Yi Liu <yi.l.liu@intel.com> wrote:  
> 
> > >
> > > static int vfio_hot_reset_devid(struct vfio_device *vdev,
> > >                                 struct iommufd_ctx *iommufd_ctx)
> > > {
> > >         struct iommu_group *group;
> > >         int devid;
> > >
> > >         if (!vdev)
> > >                 return VFIO_PCI_DEVID_NOT_OWNED;
> > >
> > >         if (vfio_iommufd_physical_ictx(vdev) == iommufd_ctx)
> > >                 return vfio_iommufd_physical_devid(vdev);  
> 
> Do we need to check the return of this helper? It returns -EINVAL
> when iommufd_access and iommufd_device are both null. Though
> not possible in this path. Is a WARN_ON needed or not?

I also came to the conclusion that it wasn't possible while reviewing
the code.  I wouldn't got to extreme measures to introduce paranoia
checks for impossible conditions.  Thanks,

Alex

> > >
> > >         group = iommu_group_get(vdev->dev);
> > >         if (!group)
> > >                 return VFIO_PCI_DEVID_NOT_OWNED;
> > >
> > >         if (iommufd_ctx_has_group(iommufd_ctx, group))
> > >                 devid = VFIO_PCI_DEVID_OWNED;
> > >
> > >         iommu_group_put(group);
> > >
> > >         return devid;
> > > }  

