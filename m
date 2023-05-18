Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA8470889B
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 May 2023 21:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4353510E54D;
	Thu, 18 May 2023 19:50:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CEE10E54B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 May 2023 19:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684439434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jh5OmsoiniNzfPxTh2q8i8zD0yrfR3xzpW1VvlO4Lwg=;
 b=HrTxNmgHVIWW4hqCvm1IlTjND79sa4xFdnzTVyMo5leW9UxqV1nYvSjg2ur0SWz4LFQ4zm
 n6GNBHwMOfZJBQDNiFypk6aVDHfNKJYkDjyiZmKONOuVxNs819jm7N7UbcT9gQjo8Fowxh
 Vf6WQSDk/duKTtazmU2YDijIMv6nhOc=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-Ezt7dnWoOW27SkDPllXyZQ-1; Thu, 18 May 2023 15:50:32 -0400
X-MC-Unique: Ezt7dnWoOW27SkDPllXyZQ-1
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-338615fc4efso484315ab.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 May 2023 12:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684439432; x=1687031432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jh5OmsoiniNzfPxTh2q8i8zD0yrfR3xzpW1VvlO4Lwg=;
 b=iikJmV4CGNjF5XD8mIgyPJGtEaUHFZIlrZxPYBhV+A0TfBpO3W9xqQMjBdRi0qcFjr
 JNvaCeuKzZOpCglPf/sgiptYCpwqVwVpvfc0Fcmt20fzLl3f4WOQroV8zm5/4VjBL49f
 xdSr5d+3xjMTD8egCbYpFWFpZ89Yia6bGH3Lnsei0s/g7zL5eyVtcIzNZ13VKIm6K1QS
 QUMouBJ41CEGkr4c6NcZJFKa+MpyLTWfKpt0zWIAwkbfn6fSa63NmU11Lv505XCn4SNV
 RmSKChNFjsD8+bu1TTuN/REdetwG4JxkBvIa3C1YclyE8Ei5ySkJArzcaLnHiKWWe9q+
 Wwwg==
X-Gm-Message-State: AC+VfDxNxtPXUsgVWu6blTBmuxr/9gh8W9KpRQ5LHMs8v2c6RMVtWLD/
 SQtJauL9lV+E3X/elhh0NwMrucTToU+NiVxiuqOheQu0UKnud/0QFOmZUTmu/hZRYy/Y/d2c+zy
 biTA/nMq+OHYCNmeJDH9AK40RMPL3LqR7fA==
X-Received: by 2002:a05:6e02:1aa3:b0:333:49f9:a5f3 with SMTP id
 l3-20020a056e021aa300b0033349f9a5f3mr4588872ilv.2.1684439431992; 
 Thu, 18 May 2023 12:50:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5FxhxTBMgm7TCu3seuae29eNjQqi+QvYLiW+iwyYL0QmMjButMon7ajVdlh0YbG0jeo2m46g==
X-Received: by 2002:a05:6e02:1aa3:b0:333:49f9:a5f3 with SMTP id
 l3-20020a056e021aa300b0033349f9a5f3mr4588864ilv.2.1684439431737; 
 Thu, 18 May 2023 12:50:31 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f16-20020a02cad0000000b0041643b78cbesm664248jap.120.2023.05.18.12.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 12:50:31 -0700 (PDT)
Date: Thu, 18 May 2023 13:50:29 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v5 06/10] vfio-iommufd: Add helper to retrieve
 iommufd_ctx and devid for vfio_device
Message-ID: <20230518135029.26abe519.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB752963E14A652AEE1A1C2699C37F9@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230513132136.15021-1-yi.l.liu@intel.com>
 <20230513132136.15021-7-yi.l.liu@intel.com>
 <20230517121517.4b7ceb52.alex.williamson@redhat.com>
 <DS0PR11MB752963E14A652AEE1A1C2699C37F9@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Thu, 18 May 2023 13:25:59 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Thursday, May 18, 2023 2:15 AM
> > 
> > On Sat, 13 May 2023 06:21:32 -0700
> > Yi Liu <yi.l.liu@intel.com> wrote:
> >   
> > > This is needed by the vfio-pci driver to report affected devices in the
> > > hot reset for a given device.
> > >
> > > Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> > > ---
> > >  drivers/iommu/iommufd/device.c | 24 ++++++++++++++++++++++++
> > >  drivers/vfio/iommufd.c         | 20 ++++++++++++++++++++
> > >  include/linux/iommufd.h        |  6 ++++++
> > >  include/linux/vfio.h           | 14 ++++++++++++++
> > >  4 files changed, 64 insertions(+)
> > >
> > > diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
> > > index 4f9b2142274c..81466b97023f 100644
> > > --- a/drivers/iommu/iommufd/device.c
> > > +++ b/drivers/iommu/iommufd/device.c
> > > @@ -116,6 +116,18 @@ void iommufd_device_unbind(struct iommufd_device *idev)
> > >  }
> > >  EXPORT_SYMBOL_NS_GPL(iommufd_device_unbind, IOMMUFD);
> > >
> > > +struct iommufd_ctx *iommufd_device_to_ictx(struct iommufd_device *idev)
> > > +{
> > > +	return idev->ictx;
> > > +}
> > > +EXPORT_SYMBOL_NS_GPL(iommufd_device_to_ictx, IOMMUFD);
> > > +
> > > +u32 iommufd_device_to_id(struct iommufd_device *idev)
> > > +{
> > > +	return idev->obj.id;
> > > +}
> > > +EXPORT_SYMBOL_NS_GPL(iommufd_device_to_id, IOMMUFD);
> > > +
> > >  static int iommufd_device_setup_msi(struct iommufd_device *idev,
> > >  				    struct iommufd_hw_pagetable *hwpt,
> > >  				    phys_addr_t sw_msi_start)
> > > @@ -463,6 +475,18 @@ void iommufd_access_destroy(struct iommufd_access  
> > *access)  
> > >  }
> > >  EXPORT_SYMBOL_NS_GPL(iommufd_access_destroy, IOMMUFD);
> > >
> > > +struct iommufd_ctx *iommufd_access_to_ictx(struct iommufd_access *access)
> > > +{
> > > +	return access->ictx;
> > > +}
> > > +EXPORT_SYMBOL_NS_GPL(iommufd_access_to_ictx, IOMMUFD);
> > > +
> > > +u32 iommufd_access_to_id(struct iommufd_access *access)
> > > +{
> > > +	return access->obj.id;
> > > +}
> > > +EXPORT_SYMBOL_NS_GPL(iommufd_access_to_id, IOMMUFD);
> > > +
> > >  int iommufd_access_attach(struct iommufd_access *access, u32 ioas_id)
> > >  {
> > >  	struct iommufd_ioas *new_ioas;
> > > diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
> > > index c1379e826052..a18e920be164 100644
> > > --- a/drivers/vfio/iommufd.c
> > > +++ b/drivers/vfio/iommufd.c
> > > @@ -105,6 +105,26 @@ void vfio_iommufd_unbind(struct vfio_device *vdev)
> > >  		vdev->ops->unbind_iommufd(vdev);
> > >  }
> > >
> > > +struct iommufd_ctx *vfio_iommufd_physical_ictx(struct vfio_device *vdev)
> > > +{
> > > +	if (vdev->iommufd_device)
> > > +		return iommufd_device_to_ictx(vdev->iommufd_device);
> > > +	if (vdev->noiommu_access)
> > > +		return iommufd_access_to_ictx(vdev->noiommu_access);
> > > +	return NULL;
> > > +}
> > > +EXPORT_SYMBOL_GPL(vfio_iommufd_physical_ictx);
> > > +
> > > +int vfio_iommufd_physical_devid(struct vfio_device *vdev)
> > > +{
> > > +	if (vdev->iommufd_device)
> > > +		return iommufd_device_to_id(vdev->iommufd_device);
> > > +	if (vdev->noiommu_access)
> > > +		return iommufd_access_to_id(vdev->noiommu_access);
> > > +	return -EINVAL;
> > > +}
> > > +EXPORT_SYMBOL_GPL(vfio_iommufd_physical_devid);  
> > 
> > I think these exemplify that it would be better if both emulated and
> > noiommu use the same iommufd_access pointer.  Thanks,  
> 
> Sure. Then I shall rename this helper. vfio_iommufd_device_devid()
> What about your opinion?

Yes, it really didn't even occur to me that "physical" in the name was
meant to suggest this shouldn't be used for emulated mdev devices.  It
should work for all devices and using a shared iommufd access pointer
between noiommu and emulated should simplify that somewhat.  Thanks,

Alex

