Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FF36D30E6
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  1 Apr 2023 15:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CD310E224;
	Sat,  1 Apr 2023 13:08:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633E910E224
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  1 Apr 2023 13:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680354501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xAtcDHSKiWdAx9PqjQNeHNJuKNmAWOryR8DMCSmC1Uo=;
 b=cWjdfwLz7BEBvTuK6f3z5uIuWGg2Er/VrKUnFxNeCMiAL5P2dJ8fG28bCPT6k9bY2guIZd
 R1L6syXiNU2lS0J+NzRSlZCbYsFvhy/FZwC+YSfs4w/NRxeUqn+aMsD4/9RRZkvLBHxkD9
 r3flW1KAGGL8EvEtqqR3DyOc8FVf2q8=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-d1O8G8REOZKf4-D2oHSMzw-1; Sat, 01 Apr 2023 09:08:19 -0400
X-MC-Unique: d1O8G8REOZKf4-D2oHSMzw-1
Received: by mail-il1-f197.google.com with SMTP id
 n9-20020a056e02100900b00325c9240af7so16142101ilj.10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 01 Apr 2023 06:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680354497;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xAtcDHSKiWdAx9PqjQNeHNJuKNmAWOryR8DMCSmC1Uo=;
 b=tQavrlQgiUioHjtt8f2lcNkcuGUZAX/G5dCsporFBEMfMxCzJjdKnACPmAOfAoXL8w
 Wxz9ugflq7v9ZVnIYmCmR5uJ+FDVZPsecLULCyR0eyde8e0f7PTubkCwF4yZlIL/66mi
 nlHwL/TymrRbSvYOhVSEOu9hEOTlLHLgAYKlP3PKFTb20Wt5HPZEqv/6lLBAE14/hulq
 /L0hhYEOitQusflAtU2ApUK6AmI3yArBCsWY0+gC9Hly5yCx/5sIZTtx2va3FlEHwi2e
 Z0BkbkyBAne1w7ql3RtsSOd14K8EuMsyEXVtpIidjOaXJX6H9Cjb64QKdRPAEBqnvbCJ
 E5Mg==
X-Gm-Message-State: AAQBX9frDNEbZ21QrPznO3B24RFe+LC2IUTv5u8/WAcNPA3FmXZUy85S
 TjMGp8VPItM7mcbyPLo9WID8dIjQdMLHAsWlDOe8gVmycqmsXYl5l+NqpnFZGRwdTQZgQLkSFWK
 b1/3D2mTpgWWikrmlA5xtlKiJFGCDc5FA+A==
X-Received: by 2002:a05:6e02:6c7:b0:326:54d0:38b3 with SMTP id
 p7-20020a056e0206c700b0032654d038b3mr1960641ils.16.1680354497565; 
 Sat, 01 Apr 2023 06:08:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350bib45jN3ZCoSQ2U92ONYc9J9FcDH+U+wLlt29UWGu36CEbjAPNILfzCOxYnRkWH1eatsKxWg==
X-Received: by 2002:a05:6e02:6c7:b0:326:54d0:38b3 with SMTP id
 p7-20020a056e0206c700b0032654d038b3mr1960606ils.16.1680354497231; 
 Sat, 01 Apr 2023 06:08:17 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 x93-20020a0294e6000000b004091ca4c445sm1330992jah.120.2023.04.01.06.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 06:08:16 -0700 (PDT)
Date: Sat, 1 Apr 2023 07:08:14 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Xu, Terrence" <terrence.xu@intel.com>
Subject: Re: [PATCH v2 00/10] Introduce new methods for verifying ownership
 in vfio PCI hot reset
Message-ID: <20230401070814.2757c2a2.alex.williamson@redhat.com>
In-Reply-To: <BL3PR11MB64830DBAD5C83E48809293B4F08C9@BL3PR11MB6483.namprd11.prod.outlook.com>
References: <20230327093458.44939-1-yi.l.liu@intel.com>
 <BL3PR11MB64830DC9AC0517B56667532DF08F9@BL3PR11MB6483.namprd11.prod.outlook.com>
 <20230331114949.3dfec232.alex.williamson@redhat.com>
 <BL3PR11MB64830DBAD5C83E48809293B4F08C9@BL3PR11MB6483.namprd11.prod.outlook.com>
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
Cc: "          <shameerali.kolothum.thodi@huawei.com>, "@freedesktop.org,
	suravee.suthikulpanit@amd.com,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"Hao,  Xudong" <xudong.hao@intel.com>,
	"peterx@redhat.com" <peterx@redhat.com>,
	" <cohuck@redhat.com>, " shameerali.kolothum.thodi@huawei."com," "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"Liu,  Yi L" <yi.l.liu@intel.com>,
	"mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"lulu@redhat.com" <lulu@redhat.com>,
	"Jiang,  Yanting" <yanting.jiang@intel.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"  <suravee.suthikulpanit@amd.com>, "@freedesktop.org,
	robin.murphy@arm.com,
	"  <yi.y.sun@linux.intel.com>, "@freedesktop.org, cohuck@redhat.com,
	"Tian,  Kevin" <kevin.tian@intel.com>,
	"Zhao, Yan Y" <yan.y.zhao@intel.com>,
	"jgg@nvidia.com" <jgg@nvidia.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	<robin.murphy@arm.com>,
	"intel-gvt-dev@lists.freedesktop.org\"          <intel-gvt-dev@lists.freedesktop.org>, "@freedesktop.org,
	yi.y.sun@linux.intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Sat, 1 Apr 2023 09:15:33 +0000
"Xu, Terrence" <terrence.xu@intel.com> wrote:

> > -----Original Message-----
> > From: intel-gvt-dev <intel-gvt-dev-bounces@lists.freedesktop.org> On
> > Behalf Of Alex Williamson
> > Sent: Saturday, April 1, 2023 1:50 AM
> > 
> > On Fri, 31 Mar 2023 17:27:27 +0000
> > "Xu, Terrence" <terrence.xu@intel.com> wrote:
> >   
> > > > -----Original Message-----
> > > > From: Liu, Yi L <yi.l.liu@intel.com>
> > > > Sent: Monday, March 27, 2023 5:35 PM
> > > >
> > > > VFIO_DEVICE_PCI_HOT_RESET requires user to pass an array of group
> > > > fds to prove that it owns all devices affected by resetting the
> > > > calling device. This series introduces several extensions to allow
> > > > the ownership check better aligned with iommufd and coming vfio device  
> > cdev support.  
> > > >
> > > > First, resetting an unopened device is always safe given nobody is
> > > > using it. So relax the check to allow such devices not covered by
> > > > group fd array. [1]
> > > >
> > > > When iommufd is used we can simply verify that all affected devices
> > > > are bound to a same iommufd then no need for the user to provide
> > > > extra fd information. This is enabled by the user passing a
> > > > zero-length fd array and moving forward this should be the preferred
> > > > way for hot reset. [2]
> > > >
> > > > However the iommufd method has difficulty working with noiommu
> > > > devices since those devices don't have a valid iommufd, unless the
> > > > noiommu device is in a singleton dev_set hence no ownership check is
> > > > required. [3]
> > > >
> > > > For noiommu backward compatibility a 3rd method is introduced by
> > > > allowing the user to pass an array of device fds to prove ownership.
> > > > [4]
> > > >
> > > > As suggested by Jason [5], we have this series to introduce the
> > > > above stuffs to the vfio PCI hot reset. Per the dicussion in [6],
> > > > this series also adds a new _INFO ioctl to get hot reset scope for given  
> > device.  
> > > >
> > > > [1] https://lore.kernel.org/kvm/Y%2FdobS6gdSkxnPH7@nvidia.com/
> > > > [2] https://lore.kernel.org/kvm/Y%2FZOOClu8nXy2toX@nvidia.com/#t
> > > > [3] https://lore.kernel.org/kvm/ZACX+Np%2FIY7ygqL5@nvidia.com/
> > > > [4]
> > > >  
> > https://lore.kernel.org/kvm/DS0PR11MB7529BE88460582BD599DC1F7C3B19  
> > > > @DS0PR11MB7529.namprd11.prod.outlook.com/#t
> > > > [5] https://lore.kernel.org/kvm/ZAcvzvhkt9QhCmdi@nvidia.com/
> > > > [6] https://lore.kernel.org/kvm/ZBoYgNq60eDpV9Un@nvidia.com/
> > > >
> > > > Change log:
> > > >
> > > > v2:
> > > >  - Split the patch 03 of v1 to be 03, 04 and 05 of v2 (Jaon)
> > > >  - Add r-b from Kevin and Jason
> > > >  - Add patch 10 to introduce a new _INFO ioctl for the usage of device
> > > >    fd passing usage in cdev path (Jason, Alex)
> > > >
> > > > v1:
> > > > https://lore.kernel.org/kvm/20230316124156.12064-1-yi.l.liu@intel.co
> > > > m/
> > > >
> > > > Regards,
> > > > 	Yi Liu
> > > >
> > > > Yi Liu (10):
> > > >   vfio/pci: Update comment around group_fd get in
> > > >     vfio_pci_ioctl_pci_hot_reset()
> > > >   vfio/pci: Only check ownership of opened devices in hot reset
> > > >   vfio/pci: Move the existing hot reset logic to be a helper
> > > >   vfio-iommufd: Add helper to retrieve iommufd_ctx and devid for
> > > >     vfio_device
> > > >   vfio/pci: Allow passing zero-length fd array in
> > > >     VFIO_DEVICE_PCI_HOT_RESET
> > > >   vfio: Refine vfio file kAPIs for vfio PCI hot reset
> > > >   vfio: Accpet device file from vfio PCI hot reset path
> > > >   vfio/pci: Renaming for accepting device fd in hot reset path
> > > >   vfio/pci: Accept device fd in VFIO_DEVICE_PCI_HOT_RESET ioctl
> > > >   vfio/pci: Add VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO
> > > >
> > > >  drivers/iommu/iommufd/device.c   |  12 ++
> > > >  drivers/vfio/group.c             |  32 ++--
> > > >  drivers/vfio/iommufd.c           |  16 ++
> > > >  drivers/vfio/pci/vfio_pci_core.c | 244 ++++++++++++++++++++++++----  
> > ---  
> > > >  drivers/vfio/vfio.h              |   2 +
> > > >  drivers/vfio/vfio_main.c         |  44 ++++++
> > > >  include/linux/iommufd.h          |   3 +
> > > >  include/linux/vfio.h             |  14 ++
> > > >  include/uapi/linux/vfio.h        |  65 +++++++-
> > > >  9 files changed, 364 insertions(+), 68 deletions(-)
> > > >
> > > > --
> > > > 2.34.1  
> > >
> > > Verified this series by "Intel GVT-g GPU device mediated passthrough".
> > > Passed VFIO legacy mode / compat mode / cdev mode basic functionality  
> > and GPU force reset test.  
> > >
> > > Tested-by: Terrence Xu <terrence.xu@intel.com>  
> > 
> > Seems like only this "GPU force reset test" is relevant to the new
> > functionality of this series, GVT-g does not and has no reason to support the
> > HOT_RESET ioctls used here.  Can you provide more details of the force-reset
> > test?  What userspace driver is being used?  Thanks,
> > 
> > Alex  
> Hi Alex, about the "GPU force reset test", I used the "i915_hangman"
> test from intel-gpu-tools, it is for GPU force hang / reset. It is an
> important regression test scenario for this patch series. To test the
> HOT_RESET ioctls itself, need to wait the corresponding Qemu changes
> from Yi.

But i915 exists on the host root bus, we fundamentally cannot perform a
bus reset of the root bus.  So how exactly is testing with GVT-g, which
doesn't use the vfio-pci-core hot-reset ioctl, or GVT-d, which can't do
a bus reset because it exists on the root bus, relevant to this series?
Is this some novel use of a dGPU i915 with out-of-tree drivers?

Obviously any regression testing is fine and appreciated, but if this
is intended to express some validation of the new interface, I'm
failing to see how.  Thanks,

Alex

