Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B4E6D26FC
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 31 Mar 2023 19:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E6510E30C;
	Fri, 31 Mar 2023 17:49:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3309110E318
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 31 Mar 2023 17:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680284995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2hw7lrP24KFanzOvV8I/Ad+4zEqFeH3Txo9b1cjHps=;
 b=bFWjOIR1njXWS+tbW+TFkNjI5sG+w6J+ceZdnqlsidZ+BL1weugLiBkwKxzgn4mVpmKr53
 ln47q0tNxTSq+xhaH2IsS1Ej7f+JEu4IIgjUS4Rl8YXXxvctmDZiwEn9zI7YjpX3gPgrEl
 xOZvtvH9H9uGiiGMJzK5wZblAENgxpc=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-DoG6P9r8O1aX1s_oZ-HFlw-1; Fri, 31 Mar 2023 13:49:54 -0400
X-MC-Unique: DoG6P9r8O1aX1s_oZ-HFlw-1
Received: by mail-io1-f70.google.com with SMTP id
 l7-20020a0566022dc700b0074cc9aba965so13774314iow.11
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 31 Mar 2023 10:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680284993;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m2hw7lrP24KFanzOvV8I/Ad+4zEqFeH3Txo9b1cjHps=;
 b=e2GYnP7SPbTfgjV5TzHfptATHABWsTki1a3cwYfXSqhWb7RhB9iNKSEKoibAnYYvPQ
 IvDHpDzxZinnzrpgEoRLAGStWe9nwV1JMoiZ0reLGJ0C8pZLySi5Cs3rddz1hHspYkR4
 OeWv6u6R0+u4miP27qLT2AWv7T1bZlFDCAoDJfnSqYuf677LnyrG96V3xHPER+bOb0PW
 1r84ycjrn1y6+N26OYFzY2RaBnnR4T3u3Mk1XcZPWRuVcJNoT4KobHGx90uMilDGimnU
 +M4DaXXOVoa0eyHOqCHoT7yQV4lpUBOGSyqyQkSBv5KZfXZT8j5SHCOJIVK7MhPo6a8l
 L1qg==
X-Gm-Message-State: AO0yUKVwcJnuslvXNH1gmoNwjR1kOBbnVEDGm38pqesLSq+IMnjUSjIV
 CamcxQrCfSpnRtyEYU/xOtVE6PG5UmiCpvTFE4S3t4hXsgDpwaVgHp5AkNfWjvkABegJVfi/mD3
 waI1/RzKaDXkpJUC/AyTSSafv32+H6FQ3kw==
X-Received: by 2002:a6b:d911:0:b0:759:706d:a0b2 with SMTP id
 r17-20020a6bd911000000b00759706da0b2mr18805421ioc.13.1680284992835; 
 Fri, 31 Mar 2023 10:49:52 -0700 (PDT)
X-Google-Smtp-Source: AK7set+DPRg+uCCuz/U6HNYYJj0QRQjzjZLhse/nHV02SSaPBWJ2hWNldvvYAEt97qV6PiOkx5PxfQ==
X-Received: by 2002:a6b:d911:0:b0:759:706d:a0b2 with SMTP id
 r17-20020a6bd911000000b00759706da0b2mr18805391ioc.13.1680284992497; 
 Fri, 31 Mar 2023 10:49:52 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 c11-20020a5ea80b000000b0075ba6593512sm681396ioa.53.2023.03.31.10.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 10:49:51 -0700 (PDT)
Date: Fri, 31 Mar 2023 11:49:49 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Xu, Terrence" <terrence.xu@intel.com>
Subject: Re: [PATCH v2 00/10] Introduce new methods for verifying ownership
 in vfio PCI hot reset
Message-ID: <20230331114949.3dfec232.alex.williamson@redhat.com>
In-Reply-To: <BL3PR11MB64830DC9AC0517B56667532DF08F9@BL3PR11MB6483.namprd11.prod.outlook.com>
References: <20230327093458.44939-1-yi.l.liu@intel.com>
 <BL3PR11MB64830DC9AC0517B56667532DF08F9@BL3PR11MB6483.namprd11.prod.outlook.com>
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "Zhao, 
 Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 31 Mar 2023 17:27:27 +0000
"Xu, Terrence" <terrence.xu@intel.com> wrote:

> > -----Original Message-----
> > From: Liu, Yi L <yi.l.liu@intel.com>
> > Sent: Monday, March 27, 2023 5:35 PM
> > 
> > VFIO_DEVICE_PCI_HOT_RESET requires user to pass an array of group fds to
> > prove that it owns all devices affected by resetting the calling device. This
> > series introduces several extensions to allow the ownership check better
> > aligned with iommufd and coming vfio device cdev support.
> > 
> > First, resetting an unopened device is always safe given nobody is using it. So
> > relax the check to allow such devices not covered by group fd array. [1]
> > 
> > When iommufd is used we can simply verify that all affected devices are
> > bound to a same iommufd then no need for the user to provide extra fd
> > information. This is enabled by the user passing a zero-length fd array and
> > moving forward this should be the preferred way for hot reset. [2]
> > 
> > However the iommufd method has difficulty working with noiommu devices
> > since those devices don't have a valid iommufd, unless the noiommu device
> > is in a singleton dev_set hence no ownership check is required. [3]
> > 
> > For noiommu backward compatibility a 3rd method is introduced by allowing
> > the user to pass an array of device fds to prove ownership. [4]
> > 
> > As suggested by Jason [5], we have this series to introduce the above stuffs
> > to the vfio PCI hot reset. Per the dicussion in [6], this series also adds a new
> > _INFO ioctl to get hot reset scope for given device.
> > 
> > [1] https://lore.kernel.org/kvm/Y%2FdobS6gdSkxnPH7@nvidia.com/
> > [2] https://lore.kernel.org/kvm/Y%2FZOOClu8nXy2toX@nvidia.com/#t
> > [3] https://lore.kernel.org/kvm/ZACX+Np%2FIY7ygqL5@nvidia.com/
> > [4]
> > https://lore.kernel.org/kvm/DS0PR11MB7529BE88460582BD599DC1F7C3B19
> > @DS0PR11MB7529.namprd11.prod.outlook.com/#t
> > [5] https://lore.kernel.org/kvm/ZAcvzvhkt9QhCmdi@nvidia.com/
> > [6] https://lore.kernel.org/kvm/ZBoYgNq60eDpV9Un@nvidia.com/
> > 
> > Change log:
> > 
> > v2:
> >  - Split the patch 03 of v1 to be 03, 04 and 05 of v2 (Jaon)
> >  - Add r-b from Kevin and Jason
> >  - Add patch 10 to introduce a new _INFO ioctl for the usage of device
> >    fd passing usage in cdev path (Jason, Alex)
> > 
> > v1: https://lore.kernel.org/kvm/20230316124156.12064-1-yi.l.liu@intel.com/
> > 
> > Regards,
> > 	Yi Liu
> > 
> > Yi Liu (10):
> >   vfio/pci: Update comment around group_fd get in
> >     vfio_pci_ioctl_pci_hot_reset()
> >   vfio/pci: Only check ownership of opened devices in hot reset
> >   vfio/pci: Move the existing hot reset logic to be a helper
> >   vfio-iommufd: Add helper to retrieve iommufd_ctx and devid for
> >     vfio_device
> >   vfio/pci: Allow passing zero-length fd array in
> >     VFIO_DEVICE_PCI_HOT_RESET
> >   vfio: Refine vfio file kAPIs for vfio PCI hot reset
> >   vfio: Accpet device file from vfio PCI hot reset path
> >   vfio/pci: Renaming for accepting device fd in hot reset path
> >   vfio/pci: Accept device fd in VFIO_DEVICE_PCI_HOT_RESET ioctl
> >   vfio/pci: Add VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO
> > 
> >  drivers/iommu/iommufd/device.c   |  12 ++
> >  drivers/vfio/group.c             |  32 ++--
> >  drivers/vfio/iommufd.c           |  16 ++
> >  drivers/vfio/pci/vfio_pci_core.c | 244 ++++++++++++++++++++++++-------
> >  drivers/vfio/vfio.h              |   2 +
> >  drivers/vfio/vfio_main.c         |  44 ++++++
> >  include/linux/iommufd.h          |   3 +
> >  include/linux/vfio.h             |  14 ++
> >  include/uapi/linux/vfio.h        |  65 +++++++-
> >  9 files changed, 364 insertions(+), 68 deletions(-)
> > 
> > --
> > 2.34.1  
> 
> Verified this series by "Intel GVT-g GPU device mediated passthrough".
> Passed VFIO legacy mode / compat mode / cdev mode basic functionality and GPU force reset test.
> 
> Tested-by: Terrence Xu <terrence.xu@intel.com>

Seems like only this "GPU force reset test" is relevant to the new
functionality of this series, GVT-g does not and has no reason to
support the HOT_RESET ioctls used here.  Can you provide more details
of the force-reset test?  What userspace driver is being used?  Thanks,

Alex

