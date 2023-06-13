Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D155E72E921
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Jun 2023 19:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54AF10E05E;
	Tue, 13 Jun 2023 17:15:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AC510E05E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 17:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686676516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y47mFwi46fNR1k1wU+EJoRpRAnGyxBYqLYF/5mVYk4s=;
 b=QCo0lexcJqxlOOsm+Nwlpw6MCGHd4PFGcs58x9aYJfKgSzu4P1sKTj6EORDdMSqHMypX+9
 16dqkKDg82umswNGzy9dJR7GDADX/eKZfkuB80vXb/MAnvLOljNazwK+iHvLjPIy0c8zL3
 CYTh+k/Erh84/jgvbNokdYqfzcJxuw4=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-9pq3zw8INgeyhzq8DyisPw-1; Tue, 13 Jun 2023 13:15:14 -0400
X-MC-Unique: 9pq3zw8INgeyhzq8DyisPw-1
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-33d93feefb5so50603195ab.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 10:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686676513; x=1689268513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y47mFwi46fNR1k1wU+EJoRpRAnGyxBYqLYF/5mVYk4s=;
 b=Bqs8IBf1yeAd6gBXcKZkbGE30uDWfkIFLblTyhIwDr8UGJtwfAhx+cBddVlt7VbVnl
 NPYSbOjFflfbCRMh3qGR1aZDRp/OCPJEn4JxJy/j76d3LHaKUbz5z3YzsxG3uKje/9vr
 XcaoW5rWtG9G2BeXJe3OhBqjtUMeJ9/eFDCeA6eXPpS/dfG5P/HeabCQ/1IoqMr14PNV
 bGjAohI/3Jr+s4Ogc4F1WbS/2qoDfrIOKX2bPQwDOZUa77KKUPdUML6pCgzEhFVAtWAF
 KOMfdkmEkqB3wzVC6r8AMFQc3fKQBhVah6JVLMYBJILL4h4Lm3pXnAqT4RChqJ6sFepO
 GMLQ==
X-Gm-Message-State: AC+VfDyES5T2RAH9LAJ8PtyqOr7gXYYOWJafQMMFm3RZt6erVzmf2BGP
 SUzsIAjpjybjuRAYMWUxhpxZi26nd4Elf0Oe4SDXMmNZqsImKynidch6hhEkl/1pVt9NgPq3x16
 CQbynWRKnhOsXfRg7spXBq4WJKcehnkB5Gg==
X-Received: by 2002:a92:c691:0:b0:340:56e8:6d16 with SMTP id
 o17-20020a92c691000000b0034056e86d16mr3600702ilg.7.1686676513564; 
 Tue, 13 Jun 2023 10:15:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5bEeL9Pfn6uuRfKBly7+jYgvfEJjCvB+F2U1+DUXQRw9biJ91NqlzaudCp25Q0SB+DZixcFA==
X-Received: by 2002:a92:c691:0:b0:340:56e8:6d16 with SMTP id
 o17-20020a92c691000000b0034056e86d16mr3600687ilg.7.1686676513231; 
 Tue, 13 Jun 2023 10:15:13 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 l5-20020a02cd85000000b0041a84d0c828sm3455996jap.87.2023.06.13.10.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 10:15:12 -0700 (PDT)
Date: Tue, 13 Jun 2023 11:15:11 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v12 21/24] vfio: Determine noiommu device in
 __vfio_register_dev()
Message-ID: <20230613111511.425bdeae.alex.williamson@redhat.com>
In-Reply-To: <20230613091301.56986440.alex.williamson@redhat.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
 <20230602121653.80017-22-yi.l.liu@intel.com>
 <20230612164228.65b500e0.alex.williamson@redhat.com>
 <DS0PR11MB7529AE3701E154BF4C092E57C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230613081913.279dea9e.alex.williamson@redhat.com>
 <DS0PR11MB7529EB2903151B3399F636F5C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230613084828.7af51055.alex.williamson@redhat.com>
 <DS0PR11MB7529E84BCB100DE620FD2468C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230613091301.56986440.alex.williamson@redhat.com>
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
Cc: Yanting@freedesktop.org,
	"mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"peterx@redhat.com" <peterx@redhat.com>,
	"  <lulu@redhat.com>, "@freedesktop.org,
	suravee.suthikulpanit@amd.com,
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>, Zhenzhong@freedesktop.org,
	" <zhenzhong.duan@intel.com>,   "@freedesktop.org,
	clegoate@redhat.com, Yan@freedesktop.org,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"jgg@nvidia.com" <jgg@nvidia.com>,
	"     <intel-gvt-dev@lists.freedesktop.org>,  "@freedesktop.org,
	intel-gfx@lists.freedesktop.org, <linux-s390@vger.kernel.org>, ,
	"Tian,  Kevin" <kevin.tian@intel.com>, Xudong@freedesktop.org,
	"  <suravee.suthikulpanit@amd.com>, "@freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,,
	" <intel-gfx@lists.freedesktop.org>,   "@freedesktop.org,
	linux-s390@vger.kernel.org, Terrence@freedesktop.org,
	"yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, <clegoate@redhat.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"shameerali.kolothum.thodi@huawei.com\"          <shameerali.kolothum.thodi@huawei.com>, "@freedesktop.org,
	lulu@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

[Sorry for breaking threading, replying to my own message id with reply
 content from Yi since the Cc list got broken]

On Tue, 13 Jun 2023 15:28:06 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Tuesday, June 13, 2023 11:13 PM
> > 
> > On Tue, 13 Jun 2023 15:01:35 +0000
> > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >   
> > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > Sent: Tuesday, June 13, 2023 10:48 PM
> > > >
> > > > On Tue, 13 Jun 2023 14:33:01 +0000
> > > > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> > > >  
> > > > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > > > Sent: Tuesday, June 13, 2023 10:19 PM
> > > > > >
> > > > > > On Tue, 13 Jun 2023 05:53:42 +0000
> > > > > > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> > > > > >  
> > > > > > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > > > > > Sent: Tuesday, June 13, 2023 6:42 AM
> > > > > > > >
> > > > > > > > On Fri,  2 Jun 2023 05:16:50 -0700
> > > > > > > > Yi Liu <yi.l.liu@intel.com> wrote:
> > > > > > > >  
> > > > > > > > > This moves the noiommu device determination and noiommu taint out of
> > > > > > > > > vfio_group_find_or_alloc(). noiommu device is determined in
> > > > > > > > > __vfio_register_dev() and result is stored in flag vfio_device->noiommu,
> > > > > > > > > the noiommu taint is added in the end of __vfio_register_dev().
> > > > > > > > >
> > > > > > > > > This is also a preparation for compiling out vfio_group infrastructure
> > > > > > > > > as it makes the noiommu detection and taint common between the cdev  
> > path  
> > > > > > > > > and group path though cdev path does not support noiommu.  
> > > > > > > >
> > > > > > > > Does this really still make sense?  The motivation for the change is
> > > > > > > > really not clear without cdev support for noiommu.  Thanks,  
> > > > > > >
> > > > > > > I think it still makes sense. When CONFIG_VFIO_GROUP==n, the kernel
> > > > > > > only supports cdev interface. If there is noiommu device, vfio should
> > > > > > > fail the registration. So, the noiommu determination is still needed. But
> > > > > > > I'd admit the taint might still be in the group code.  
> > > > > >
> > > > > > How is there going to be a noiommu device when VFIO_GROUP is unset?  
> > > > >
> > > > > How about booting a kernel with iommu disabled, then all the devices
> > > > > are not protected by iommu. I suppose they are noiommu devices. If
> > > > > user wants to bound them to vfio, the kernel should have VFIO_GROUP.
> > > > > Otherwise, needs to fail.  
> > > >
> > > > "noiommu" is a vfio designation of a device, it must be created by
> > > > vfio.  
> > >
> > > Sure.
> > >  
> > > > There can certainly be devices which are not IOMMU backed, but
> > > > without vfio designating them as noiommu devices, which is only done
> > > > via the legacy and compat paths, there's no such thing as a noiommu
> > > > device.  
> > >
> > > Yes.
> > >  
> > > > Devices without an IOMMU are simply out of scope for cdev,
> > > > there should never be a vfio cdev entry created for them.  Thanks,  
> > >
> > > Actually, this is what I want to solve. I need to check if a device is
> > > IOMMU backed or not, and based on this info to prevent creating
> > > cdev entry for them in the coming cdev support or may need to
> > > fail registration if VFIO_GROUP is unset.
> > >
> > > If this patch is not good. I can use the vfio_device_is_noiommu()
> > > written like below when VFIO_GROUP is unset. What about your
> > > opinion?
> > >
> > > static inline bool vfio_device_is_noiommu(struct vfio_device *vdev)
> > > {
> > > 	struct iommu_group *iommu_group;
> > >
> > > 	iommu_group = iommu_group_get(vdev->dev);
> > > 	iommu_group_put(iommu_group); /* Accepts NULL */
> > > 	return !iommu_group;
> > > }  
> > 
> > 
> > No, please do not confuse the issue.  As we agreed above "noiommu"
> > means a specific thing, it's a device without IOMMU backing that vfio
> > has artificially included in the environment.  If we don't have
> > VFIO_NOIOMMU then there's no such thing as a "noiommu" device.
> > 
> > You can certainly use an iommu_group test to decide if a device should
> > be represented, but there absolutely should never be a vfio_device
> > created without IOMMU backing and without VFIO_NOIOMMU.  Thanks,  
> 
> Hmmm. So your suggestion is to fail the vfio_alloc_device() if the input
> device is not IOMMU backed. right? But at this point, we don't know if
> the caller is trying to allocate vfio_device for a physical device or an
> emulated device. For emulated devices, cdev entry can always be created.
> Is it? I think the iommu_group test should be done for only physical devices
> in the register time.
> 
> Can I have an iommu_backed flag to store the iommu_group test result
> and check it when trying to create/remove cdev entry?

Ok, let me rephrase, the probe function needs to fail for a physical
(VFIO_IOMMU) device when VFIO_NO_IOIMMU is not configured and
vfio_noiommu is not enabled, there should never be a vfio group or cdev
device file created and the vfio_device should never be fully registered.
I overreacted a bit that we should never have a vfio_device at all, we
clearly need one leading up to determining if we can proceed.

If we renamed your function above to vfio_device_has_iommu_group(),
couldn't we just wrap device_add like below instead to not have cdev
setup for a noiommu device, generate an error for a physical device w/o
IOMMU backing, and otherwise setup the cdev device?

static inline int vfio_device_add(struct vfio_device *device, enum vfio_group_type type)
{
#if IS_ENABLED(CONFIG_VFIO_GROUP)
	if (device->group->type == VFIO_NO_IOMMU)
		return device_add(&device->device);
#else
	if (type == VFIO_IOMMU && !vfio_device_has_iommu_group(device))
		return -EINVAL;
#endif
	vfio_init_device_cdev(device);
	return cdev_device_add(&device->cdev, &device->device);
}

static inline void vfio_device_del(struct vfio_device *device)
{
#if IS_ENABLED(CONFIG_VFIO_GROUP)
	if (device->group->type == VFIO_NO_IOMMU)
		return device_del(&device->device);
#endif
	cdev_device_del(&device->cdev, &device->device);
}

I think this is the only extent to which noiommu needs to be a factor
here, skip cdev setup for a noiommu device.  Thanks,

Alex

