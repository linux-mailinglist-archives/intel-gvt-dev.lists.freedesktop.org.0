Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FACA72E5C5
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Jun 2023 16:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B4010E26A;
	Tue, 13 Jun 2023 14:32:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F201210E26A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 14:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686666753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pOBe3u1s+eJFktwias29L+WsMYtJMq4jH6Tw+Vkgi2s=;
 b=T/A0SH6621156VD1CXX8VMClKlql+jNiW3fdID772xw5190wakzmpGbQ8e50rGtnIMgmaA
 oSkVa6c5jXkrXrbNQ29dO90sqNCvengqonP5fPGovCe24ityU5ZjYmEgp1pr4DxFcaCEBg
 oNrsECwkJcfQSfqX9B5pxoPFJtWPQ1Q=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-gB4V-JDbNp6Xg2FCJZA1LQ-1; Tue, 13 Jun 2023 10:32:31 -0400
X-MC-Unique: gB4V-JDbNp6Xg2FCJZA1LQ-1
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-777acdd242eso761456439f.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 07:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686666751; x=1689258751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pOBe3u1s+eJFktwias29L+WsMYtJMq4jH6Tw+Vkgi2s=;
 b=SqCnMvND1KFuM6M9ZrcxNQ6/YNBxFafNJ/c4C7SYBEXHmiKgZPEEk/PiluvYEUP8rQ
 fZmbiKxDKzivcTu3MpKSvR+QIXl+kS1EzovKxvrNc7fPT5RojTN3PqIMDaq1t1854JM/
 PKGJPgYV4WaJs9iPFG2jldihKLHDD1f2n9T/pHuOfe+hKQsdkwQMS1AV2nDb/D8hE6YE
 nIFiA7NfIEFAHmt8mZRRUKBIZPjpU/PhN59RfnVUiC9ZIWi54fijd6DsUWLMCyLivWxs
 ypLC48G/QMplS6to1OiFYnjwfIjURZnNMDjazQ2/mUuOV5y2w9hG9B/oLqE1pdA6El5N
 jiig==
X-Gm-Message-State: AC+VfDxvlHeXSYi1VOluRuin+X4L47j8rCr/H0NosBXm86ISrjXjRON1
 g6PeCK0Tt56UFaL32mQw3GlUMjIPXcdPvswbyaBgXX7Hjafk8hd39ntfDRREMI7WXNMpJK5elbW
 5Yp9ZCzQxZ1JVRcwbLEsOFrL+H34EfMYhJA==
X-Received: by 2002:a5e:9509:0:b0:77a:1307:1e4e with SMTP id
 r9-20020a5e9509000000b0077a13071e4emr12425289ioj.18.1686666750953; 
 Tue, 13 Jun 2023 07:32:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4252UgzyjwK/6JESBkuqoz4Fs2H4UTz+cTpv5sInamQj+vl124qFJiPwRZfg1A0weA4qrYTA==
X-Received: by 2002:a5e:9509:0:b0:77a:1307:1e4e with SMTP id
 r9-20020a5e9509000000b0077a13071e4emr12425253ioj.18.1686666750721; 
 Tue, 13 Jun 2023 07:32:30 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 c7-20020a6bfd07000000b00760f256037dsm3847559ioi.44.2023.06.13.07.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 07:32:30 -0700 (PDT)
Date: Tue, 13 Jun 2023 08:32:29 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v7 8/9] vfio/pci: Extend
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO for vfio device cdev
Message-ID: <20230613083229.44a3f3ec.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529CFADCF0D6D6451E4F92AC355A@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230602121515.79374-1-yi.l.liu@intel.com>
 <20230602121515.79374-9-yi.l.liu@intel.com>
 <ZIhXMmYjCyUdlGxe@nvidia.com>
 <DS0PR11MB7529CFADCF0D6D6451E4F92AC355A@DS0PR11MB7529.namprd11.prod.outlook.com>
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
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 13 Jun 2023 12:50:43 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Tuesday, June 13, 2023 7:47 PM
> > 
> > On Fri, Jun 02, 2023 at 05:15:14AM -0700, Yi Liu wrote:  
> > > +/*
> > > + * Return devid for a device which is affected by hot-reset.
> > > + * - valid devid > 0 for the device that is bound to the input
> > > + *   iommufd_ctx.
> > > + * - devid == VFIO_PCI_DEVID_OWNED for the device that has not
> > > + *   been bound to any iommufd_ctx but other device within its
> > > + *   group has been bound to the input iommufd_ctx.
> > > + * - devid == VFIO_PCI_DEVID_NOT_OWNED for others. e.g. device
> > > + *   is bound to other iommufd_ctx etc.
> > > + */
> > > +int vfio_iommufd_device_hot_reset_devid(struct vfio_device *vdev,
> > > +					struct iommufd_ctx *ictx)
> > > +{
> > > +	struct iommu_group *group;
> > > +	int devid;
> > > +
> > > +	if (vfio_iommufd_device_ictx(vdev) == ictx)
> > > +		return vfio_iommufd_device_id(vdev);
> > > +
> > > +	group = iommu_group_get(vdev->dev);
> > > +	if (!group)
> > > +		return VFIO_PCI_DEVID_NOT_OWNED;
> > > +
> > > +	if (iommufd_ctx_has_group(ictx, group))
> > > +		devid = VFIO_PCI_DEVID_OWNED;
> > > +	else
> > > +		devid = VFIO_PCI_DEVID_NOT_OWNED;
> > > +
> > > +	iommu_group_put(group);
> > > +
> > > +	return devid;
> > > +}
> > > +EXPORT_SYMBOL_GPL(vfio_iommufd_device_hot_reset_devid);  
> > 
> > This function really should not be in the core iommufd.c file - it is
> > a purely vfio-pci function - why did you have to place it here?  
> 
> Put it here can avoid calling iommufd_ctx_has_group() in vfio-pci,
> which requires to import IOMMUFD_NS. If this reason is not so
> strong I can move it back to vfio-pci code.

The PCI-isms here are the name of the function and the return value,
otherwise this is simply a "give me the devid for this device in this
context".  The function name is trivial to change and we can define the
internal errno usage such that the vfio-pci-core code can interpret the
correct uAPI value.  For example, -EXDEV ("Cross-device link") could
maybe be interpreted as owned and any other errno is not-owned, -ENODEV
maybe being the default.

Errno values are often contentious, are there other suggestions?
Thanks,

Alex

