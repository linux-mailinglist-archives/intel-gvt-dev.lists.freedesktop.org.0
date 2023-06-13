Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 541F072E694
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Jun 2023 17:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E3710E393;
	Tue, 13 Jun 2023 15:04:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B427810E3A4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 15:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686668656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YydBu9r/6A39lhq1fyNCaOJcqqvwoNcoQa6tVejSDeQ=;
 b=Ua76dcgAJrD5ouwjLTsZNoT1m9a82QICOURBnQeUUlVJyv9g245rPEhMGG0wL6xHkWAI0/
 aEjfiaRv0GS9vBC4GYKyLhJfA/jOQ0YDeMJ+CJlJLrYkXVcOo8CLvVWE10jh0umnoLjr+4
 usn6nn3dp8Uten7C3YK9OeMU2poTzfw=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-6nAfxfJpME63aB68TytQ5A-1; Tue, 13 Jun 2023 11:04:07 -0400
X-MC-Unique: 6nAfxfJpME63aB68TytQ5A-1
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-33d93feefb5so49465125ab.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 08:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686668646; x=1689260646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YydBu9r/6A39lhq1fyNCaOJcqqvwoNcoQa6tVejSDeQ=;
 b=MOsH2j5u+3FseMgDnxFJFUHCPfSOcB5dpc0GfJD+D8KX4KnEDCN8hz0n9q/E4vt99m
 zA5Flih7JmJXyxaQU1MZHftt8OyRvh9LrJ+bAmeTwLdmqz1vVEjxLlDA1hVvYgK+Rjox
 8fSNa7vvot5YlN8v7z31v0xSEjohxAMiwbtjhiUfsu+kDjlRqVCjVi2WvbZvcu2Ey5AH
 4/Bg30miqqr7A/g5T2NFGy8NUk8BRPiH1dKxRxOC68dVqSzNtiWw4qHkblVBinoADrPe
 DZ+Ak/vzKJLWgxDA2PDy3E9LmBFp5rRQ9FLzDevirl1qz/Vj242rY0VeH+1u5pbErhc2
 dm8Q==
X-Gm-Message-State: AC+VfDwEPW8UTsRtlthXjAuc4gkQqviSiWHDBESGu6eNX1760KeR2Uh9
 rw5OoPfv920IRBX9BASRHBQpZlr9YqJu0YOifwElzhiPpHmuqZ6bw1B0aiNFulwuH5v/lvKyJwe
 LQo2Zi1TmWpIqMPAqoumjtE+M4VsfcqRGiQ==
X-Received: by 2002:a92:4a10:0:b0:33d:6988:c00f with SMTP id
 m16-20020a924a10000000b0033d6988c00fmr10759830ilf.23.1686668645667; 
 Tue, 13 Jun 2023 08:04:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6hRUczWeT/vsf09o44UFWMaqisCqWHnjTGKmeIzpiXZMGJpdYNOuBusIkgotULHLq+g9dlEQ==
X-Received: by 2002:a92:4a10:0:b0:33d:6988:c00f with SMTP id
 m16-20020a924a10000000b0033d6988c00fmr10759765ilf.23.1686668645012; 
 Tue, 13 Jun 2023 08:04:05 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 m10-20020a924b0a000000b0033355fa5440sm3963186ilg.37.2023.06.13.08.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 08:04:04 -0700 (PDT)
Date: Tue, 13 Jun 2023 09:04:03 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v12 24/24] docs: vfio: Add vfio device cdev description
Message-ID: <20230613090403.1eecd1a3.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB75297AC071F2EF4F49D85999C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
 <20230602121653.80017-25-yi.l.liu@intel.com>
 <20230612170628.661ab2a6.alex.williamson@redhat.com>
 <DS0PR11MB7529B0A71849EA06DA953BBCC355A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230613082427.453748f5.alex.williamson@redhat.com>
 <DS0PR11MB75297AC071F2EF4F49D85999C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Tue, 13 Jun 2023 14:48:02 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Tuesday, June 13, 2023 10:24 PM
> > 
> > On Tue, 13 Jun 2023 12:01:51 +0000
> > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >   
> > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > Sent: Tuesday, June 13, 2023 7:06 AM
> > > >
> > > > On Fri,  2 Jun 2023 05:16:53 -0700
> > > > Yi Liu <yi.l.liu@intel.com> wrote:
> > > >  
> > > > > This gives notes for userspace applications on device cdev usage.
> > > > >
> > > > > Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> > > > > Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> > > > > ---
> > > > >  Documentation/driver-api/vfio.rst | 132 ++++++++++++++++++++++++++++++
> > > > >  1 file changed, 132 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/driver-api/vfio.rst b/Documentation/driver-api/vfio.rst
> > > > > index 363e12c90b87..f00c9b86bda0 100644
> > > > > --- a/Documentation/driver-api/vfio.rst
> > > > > +++ b/Documentation/driver-api/vfio.rst
> > > > > @@ -239,6 +239,130 @@ group and can access them as follows::
> > > > >  	/* Gratuitous device reset and go... */
> > > > >  	ioctl(device, VFIO_DEVICE_RESET);
> > > > >
> > > > > +IOMMUFD and vfio_iommu_type1
> > > > > +----------------------------
> > > > > +
> > > > > +IOMMUFD is the new user API to manage I/O page tables from userspace.
> > > > > +It intends to be the portal of delivering advanced userspace DMA
> > > > > +features (nested translation [5]_, PASID [6]_, etc.) while also providing
> > > > > +a backwards compatibility interface for existing VFIO_TYPE1v2_IOMMU use
> > > > > +cases.  Eventually the vfio_iommu_type1 driver, as well as the legacy
> > > > > +vfio container and group model is intended to be deprecated.
> > > > > +
> > > > > +The IOMMUFD backwards compatibility interface can be enabled two ways.
> > > > > +In the first method, the kernel can be configured with
> > > > > +CONFIG_IOMMUFD_VFIO_CONTAINER, in which case the IOMMUFD subsystem
> > > > > +transparently provides the entire infrastructure for the VFIO
> > > > > +container and IOMMU backend interfaces.  The compatibility mode can
> > > > > +also be accessed if the VFIO container interface, ie. /dev/vfio/vfio is
> > > > > +simply symlink'd to /dev/iommu.  Note that at the time of writing, the
> > > > > +compatibility mode is not entirely feature complete relative to
> > > > > +VFIO_TYPE1v2_IOMMU (ex. DMA mapping MMIO) and does not attempt to
> > > > > +provide compatibility to the VFIO_SPAPR_TCE_IOMMU interface.  Therefore
> > > > > +it is not generally advisable at this time to switch from native VFIO
> > > > > +implementations to the IOMMUFD compatibility interfaces.
> > > > > +
> > > > > +Long term, VFIO users should migrate to device access through the cdev
> > > > > +interface described below, and native access through the IOMMUFD
> > > > > +provided interfaces.
> > > > > +
> > > > > +VFIO Device cdev
> > > > > +----------------
> > > > > +
> > > > > +Traditionally user acquires a device fd via VFIO_GROUP_GET_DEVICE_FD
> > > > > +in a VFIO group.
> > > > > +
> > > > > +With CONFIG_VFIO_DEVICE_CDEV=y the user can now acquire a device fd
> > > > > +by directly opening a character device /dev/vfio/devices/vfioX where
> > > > > +"X" is the number allocated uniquely by VFIO for registered devices.
> > > > > +cdev interface does not support noiommu, so user should use the legacy
> > > > > +group interface if noiommu is needed.
> > > > > +
> > > > > +The cdev only works with IOMMUFD.  Both VFIO drivers and applications
> > > > > +must adapt to the new cdev security model which requires using
> > > > > +VFIO_DEVICE_BIND_IOMMUFD to claim DMA ownership before starting to
> > > > > +actually use the device.  Once BIND succeeds then a VFIO device can
> > > > > +be fully accessed by the user.
> > > > > +
> > > > > +VFIO device cdev doesn't rely on VFIO group/container/iommu drivers.
> > > > > +Hence those modules can be fully compiled out in an environment
> > > > > +where no legacy VFIO application exists.
> > > > > +
> > > > > +So far SPAPR does not support IOMMUFD yet.  So it cannot support device
> > > > > +cdev neither.  
> > > >
> > > > s/neither/either/  
> > >
> > > Got it.
> > >  
> > > >
> > > > Unless I missed it, we've not described that vfio device cdev access is
> > > > still bound by IOMMU group semantics, ie. there can be one DMA owner
> > > > for the group.  That's a pretty common failure point for multi-function
> > > > consumer device use cases, so the why, where, and how it fails should
> > > > be well covered.  
> > >
> > > Yes. this needs to be documented. How about below words:
> > >
> > > vfio device cdev access is still bound by IOMMU group semantics, ie. there
> > > can be only one DMA owner for the group.  Devices belonging to the same
> > > group can not be bound to multiple iommufd_ctx.  
> > 
> > ... or shared between native kernel and vfio drivers.  
> 
> I suppose you mean the devices in one group are bound to different
> drivers. right?

Essentially, but we need to be careful that we're developing multiple
vfio drivers for a given bus now, which is why I try to distinguish
between the two sets of drivers.  Thanks,

Alex
 
> > >  The users that try to bind
> > > such device to different iommufd shall be failed in VFIO_DEVICE_BIND_IOMMUFD
> > > which is the start point to get full access for the device.  
> > 
> > "A violation of this ownership requirement will fail at the
> > VFIO_DEVICE_BIND_IOMMUFD ioctl, which gates full device access."  
> 
> Got it.
> 
> Regards,
> Yi Liu
> 

