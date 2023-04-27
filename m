Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4206F0CEC
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Apr 2023 22:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF19B10EBE4;
	Thu, 27 Apr 2023 20:15:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BBA10EBD3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Apr 2023 20:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682626541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wl/J1rdCc6nkbkS/7/gIiAE1ID11G6DWdBaUMdDfhBg=;
 b=gyPspsiXnZzORGSnjYsOGLyeW3CsjhGV4iPkZueE67cqeTi9u3jolK4HjPIbc+j4luVQyq
 7n9iis3rbRWUA/ZUgm2LJ8/UicPqOBJMtUk2VtuDntxQe4si4P5fhsZ5j6nQ/rqarFQUTd
 wy01pu8YBtDd1MEvzVMpwAc9BgGvZko=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-NLLUUQNvN56TQI9IkgJo7Q-1; Thu, 27 Apr 2023 16:15:36 -0400
X-MC-Unique: NLLUUQNvN56TQI9IkgJo7Q-1
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-7606d6b2fddso1376570339f.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Apr 2023 13:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682626536; x=1685218536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wl/J1rdCc6nkbkS/7/gIiAE1ID11G6DWdBaUMdDfhBg=;
 b=BwW12oQw5QlUcpQTA/G4tpPF5zxlkSf+5IG+RFoYP3ZWAuoB4bGm5DlY8v29aTzQzp
 0C8vjq1TVEmF9KoZENaiM7IHOmCub7o16KsvE6CC0iKBSOlT36zOc1AatBot5DyRO0eO
 fZCwh2qPKHcmfuFNgGMlaO0wdNp1Etp1QHhUhZUd72ygyT6patMlaV/D2bN3kekaYKXF
 qzPLFsuvadyiNwZ+bFxOBOEJcnLIIawUiX3ahBbatXTqKykJC3rUO+gSYmUdg1JYCkhp
 w7szy8R39Gsc1eLFb9ky24UmLGK6sdUAE3hUmB8gU7XzKLJglfIILrvvvPUBUf8OkETU
 ToEQ==
X-Gm-Message-State: AC+VfDxoQWORaIQmGHXk7vdBb2kyKoTW125xSRaoV7Y4v+ITdUQlGBHb
 46woesbwph9V5D++lOAv8ZGnIjOTj0mJqyPRwUosD/+yzlbY2BSWLg1WyVGZn9sFHbWkHPP2IN6
 qyNOAoEbI6f//T2sEYyVTqdohrQp6kgCgDw==
X-Received: by 2002:a5d:8585:0:b0:760:ee5e:848c with SMTP id
 f5-20020a5d8585000000b00760ee5e848cmr1684065ioj.13.1682626535917; 
 Thu, 27 Apr 2023 13:15:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4PNVHc//cXWlpOc7BKX7kJAmACaBv5p6Nje67l7q6SM5Vh/At3wQmsKqoUGUCLaKGClia3Qg==
X-Received: by 2002:a5d:8585:0:b0:760:ee5e:848c with SMTP id
 f5-20020a5d8585000000b00760ee5e848cmr1684035ioj.13.1682626535480; 
 Thu, 27 Apr 2023 13:15:35 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 q13-20020a056638238d00b00411c522c454sm2756543jat.29.2023.04.27.13.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 13:15:34 -0700 (PDT)
Date: Thu, 27 Apr 2023 14:15:33 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v4 8/9] vfio/pci: Extend
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO for vfio device cdev
Message-ID: <20230427141533.7d8861ed.alex.williamson@redhat.com>
In-Reply-To: <20230427140405.2afe27d4.alex.williamson@redhat.com>
References: <20230426145419.450922-1-yi.l.liu@intel.com>
 <20230426145419.450922-9-yi.l.liu@intel.com>
 <20230427140405.2afe27d4.alex.williamson@redhat.com>
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
Cc: mjrosato@linux.ibm.com, jasowang@redhat.com, xudong.hao@intel.com,
 zhenzhong.duan@intel.com, peterx@redhat.com, terrence.xu@intel.com,
 chao.p.peng@linux.intel.com, linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 jgg@nvidia.com, kevin.tian@intel.com, yan.y.zhao@intel.com,
 intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 27 Apr 2023 14:04:05 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Wed, 26 Apr 2023 07:54:18 -0700
> Yi Liu <yi.l.liu@intel.com> wrote:
> 
> > This makes VFIO_DEVICE_GET_PCI_HOT_RESET_INFO ioctl to use the bound
> > iommufd of the cdev device to check the ownership of the other affected
> > devices and set a flag to tell user if the cdev device is resettable
> > with a zero-length fd array.
> > 
> > For each of the affected devices, if it is bound to the iommufd of the
> > cdev device, _INFO reports a valid dev_id > 0; if it is not opened by
> > the calling user, but it is in the iommu_group of a device that is bound
> > to the iommufd of the cdev device, reports dev_id == 0; If the device is
> > un-owned device, configured within a different iommufd, or opened outside
> > of the vfio device cdev API, the _INFO ioctl shall report dev_id==-1 for
> > such affected devices. dev_id >=0 doesn't block hot-reset, while
> > dev_id == -1 will block hot-reset.
> > 
> > This adds flag VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID to tell the user
> > dev_id is returned and adds flag VFIO_PCI_HOT_RESET_FLAG_RESETTABLE to
> > tell user if the cdev device is resettable or not.
> > 
> > Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> > Suggested-by: Alex Williamson <alex.williamson@redhat.com>
> > Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> > ---
> >  drivers/vfio/pci/vfio_pci_core.c | 101 ++++++++++++++++++++++++++++---
> >  include/uapi/linux/vfio.h        |  39 +++++++++++-
> >  2 files changed, 132 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> > index 39e7823088e7..43858d471447 100644
> > --- a/drivers/vfio/pci/vfio_pci_core.c
> > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > @@ -766,6 +766,51 @@ static int vfio_pci_get_irq_count(struct vfio_pci_core_device *vdev, int irq_typ
> >  	return 0;
> >  }
> >  
> > +static struct vfio_device *
> > +vfio_pci_find_device_in_devset(struct vfio_device_set *dev_set,
> > +			       struct pci_dev *pdev)
> > +{
> > +	struct vfio_device *cur;
> > +
> > +	lockdep_assert_held(&dev_set->lock);
> > +
> > +	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
> > +		if (cur->dev == &pdev->dev)
> > +			return cur;
> > +	return NULL;
> > +}  
> 
> Couldn't this just as easily take a struct device arg and live in
> vfio/vfio_main.?
> 
> > +
> > +/*
> > + * Check if a given iommu_group has been bound to an iommufd within a
> > + * devset.  Returns true if there is device in the devset which is in
> > + * the input iommu_group and meanwhile bound to the input iommufd.
> > + * Otherwise, returns false.
> > + */
> > +static bool
> > +vfio_devset_iommufd_has_group(struct vfio_device_set *dev_set,
> > +			      struct iommufd_ctx *iommufd,
> > +			      struct iommu_group *iommu_group)
> > +{
> > +	struct vfio_device *cur;
> > +	struct iommu_group *grp;
> > +	bool found = false;
> > +
> > +	lockdep_assert_held(&dev_set->lock);
> > +
> > +	list_for_each_entry(cur, &dev_set->device_list, dev_set_list) {
> > +		grp = iommu_group_get(cur->dev);
> > +		if (!grp)
> > +			continue;
> > +		iommu_group_put(grp);
> > +		if (iommu_group == grp &&
> > +		    iommufd == vfio_iommufd_physical_ictx(cur)) {
> > +			found = true;
> > +			break;
> > +		}
> > +	}
> > +	return found;
> > +}  
> 
> And should this live in vfio/iommufd.c?  I'd change the variables to
> vdev and group for consistency elsewhere (yeah, I see cur from removed
> code below).  We also don't need the found variable, we can simply
> return true from within the loop and false outside of the loop.  The
> group variable could also be scoped within the loop.
> 
> > +
> >  static int vfio_pci_count_devs(struct pci_dev *pdev, void *data)
> >  {
> >  	(*(int *)data)++;
> > @@ -776,13 +821,20 @@ struct vfio_pci_fill_info {
> >  	int max;
> >  	int cur;
> >  	struct vfio_pci_dependent_device *devices;
> > +	struct vfio_device *vdev;
> > +	bool devid;
> > +	bool resettable;  
> 
> See other current threads on list about using bitfields.
> 
> >  };
> >  
> >  static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
> >  {
> >  	struct vfio_pci_fill_info *fill = data;
> > +	struct iommufd_ctx *iommufd = vfio_iommufd_physical_ictx(fill->vdev);
> > +	struct vfio_device_set *dev_set = fill->vdev->dev_set;  
> 
> Curious that we didn't added iommufd and dev_set fields to
> vfio_pci_fill_info instead.  Both vars can be scoped within the devid
> branch below.
> 
> >  	struct iommu_group *iommu_group;
> >  
> > +	lockdep_assert_held(&dev_set->lock);
> > +
> >  	if (fill->cur == fill->max)
> >  		return -EAGAIN; /* Something changed, try again */
> >  
> > @@ -790,7 +842,34 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
> >  	if (!iommu_group)
> >  		return -EPERM; /* Cannot reset non-isolated devices */
> >  
> > -	fill->devices[fill->cur].group_id = iommu_group_id(iommu_group);
> > +	if (fill->devid) {
> > +		struct vfio_device *vdev;
> > +
> > +		/*
> > +		 * Report devid for the affected devices:
> > +		 * - valid devid > 0 for the devices that are bound with
> > +		 *   the iommufd of the calling device.
> > +		 * - devid == 0 for the devices that have not been opened
> > +		 *   but have same group with one of the devices bound to
> > +		 *   the iommufd of the calling device.
> > +		 * - devid == -1 for others, and clear resettable flag.
> > +		 */
> > +		vdev = vfio_pci_find_device_in_devset(dev_set, pdev);
> > +		if (vdev && iommufd == vfio_iommufd_physical_ictx(vdev)) {
> > +			fill->devices[fill->cur].dev_id =
> > +						vfio_iommufd_physical_devid(vdev);
> > +			if (unlikely(!fill->devices[fill->cur].dev_id))
> > +				return -EINVAL;  
> 
> This looks more like a WARN_ON, it requires an inconsistent kernel
> state, right?
> 
> > +		} else if (vfio_devset_iommufd_has_group(dev_set, iommufd,
> > +							 iommu_group)) {
> > +			fill->devices[fill->cur].dev_id = VFIO_PCI_DEVID_NONBLOCKING;
> > +		} else {
> > +			fill->devices[fill->cur].dev_id = VFIO_PCI_DEVID_BLOCKING;
> > +			fill->resettable = false;
> > +		}
> > +	} else {
> > +		fill->devices[fill->cur].group_id = iommu_group_id(iommu_group);
> > +	}
> >  	fill->devices[fill->cur].segment = pci_domain_nr(pdev->bus);
> >  	fill->devices[fill->cur].bus = pdev->bus->number;
> >  	fill->devices[fill->cur].devfn = pdev->devfn;
> > @@ -1229,17 +1308,27 @@ static int vfio_pci_ioctl_get_pci_hot_reset_info(
> >  		return -ENOMEM;
> >  
> >  	fill.devices = devices;
> > +	fill.vdev = &vdev->vdev;
> >  
> > +	mutex_lock(&vdev->vdev.dev_set->lock);
> > +	fill.devid = fill.resettable = vfio_device_cdev_opened(&vdev->vdev);
> >  	ret = vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_fill_devs,
> >  					    &fill, slot);
> > +	mutex_unlock(&vdev->vdev.dev_set->lock);
> >  
> >  	/*
> >  	 * If a device was removed between counting and filling, we may come up
> >  	 * short of fill.max.  If a device was added, we'll have a return of
> >  	 * -EAGAIN above.
> >  	 */
> > -	if (!ret)
> > +	if (!ret) {
> >  		hdr.count = fill.cur;
> > +		if (fill.devid) {
> > +			hdr.flags = VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID;  
> 
> hdr.flags is cleared early in the function, this should also mask in
> DEV_ID for future proofing.
> 
> Note this implementation doesn't allow flags to be returned w/o a fully
> sized return structure, as suggested might be a reason to maintain the
> redundancy between the below flag and the devid semantics.
> 
> > +			if (fill.resettable)
> > +				hdr.flags |= VFIO_PCI_HOT_RESET_FLAG_RESETTABLE;
> > +		}
> > +	}
> >  
> >  reset_info_exit:
> >  	if (copy_to_user(arg, &hdr, minsz))
> > @@ -2335,12 +2424,10 @@ static bool vfio_dev_in_groups(struct vfio_pci_core_device *vdev,
> >  static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *data)
> >  {
> >  	struct vfio_device_set *dev_set = data;
> > -	struct vfio_device *cur;
> >  
> > -	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
> > -		if (cur->dev == &pdev->dev)
> > -			return 0;
> > -	return -EBUSY;
> > +	lockdep_assert_held(&dev_set->lock);
> > +
> > +	return vfio_pci_find_device_in_devset(dev_set, pdev) ? 0 : -EBUSY;
> >  }
> >  
> >  /*
> > diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> > index 0552e8dcf0cb..4b4e2c28984b 100644
> > --- a/include/uapi/linux/vfio.h
> > +++ b/include/uapi/linux/vfio.h
> > @@ -650,11 +650,46 @@ enum {
> >   * VFIO_DEVICE_GET_PCI_HOT_RESET_INFO - _IOWR(VFIO_TYPE, VFIO_BASE + 12,
> >   *					      struct vfio_pci_hot_reset_info)
> >   *
> > + * This command is used to query the affected devices in the hot reset for
> > + * a given device.
> > + *
> > + * This command always reports the segment, bus, and devfn information for
> > + * each affected device, and selectively reports the group_id or dev_id per
> > + * the way how the calling device is opened.
> > + *
> > + *	- If the calling device is opened via the traditional group/container
> > + *	  API, group_id is reported.  User should check if it has owned all
> > + *	  the affected devices and provides a set of group fds to prove the
> > + *	  ownership in VFIO_DEVICE_PCI_HOT_RESET ioctl.
> > + *
> > + *	- If the calling device is opened as a cdev, dev_id is reported.
> > + *	  Flag VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID would be set.  Flag  
> 
> s/would be set/is set to indicate this data type/
> 
> > + *	  VFIO_PCI_HOT_RESET_FLAG_RESETTABLE would be set per the ownership  
> 
> I think we need to work on this flag name, see below.
> 
> > + *	  of the other affected devices.  If it is set, the user could invoke
> > + *	  VFIO_DEVICE_PCI_HOT_RESET with a zero-length fd array.  Kernel  
> 
> We don't have that support yet.
> 
> > + *	  set this flag when all the affected devices are owned by the user.
> > + *	  This flag is available only VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID
> > + *	  is set, otherwise ignored.  For a given affected device, it is owned  
> 
> s/ignored/reserved/
> 
> > + *	  if it suits one of the below cases:  
> 
> "...it is considered owned by this interface if it meets the following
> conditions:"
> 
> > + *		1) bound to the same iommufd_ctx with the calling device  
> 
> "1) Has a valid devid within the iommufd_ctx of the calling device.
> Ownership cannot be determined across separate iommufd_ctx and the cdev
> calling conventions do not support a proof-of-ownership model as
> provided in the legacy group interface.  In this case a valid devid
> with value greater than zero is provided in the return structure."
> 
> 
> > + *		2) has not been bound to iommufd_ctx, but it is within the
> > + *		   iommu_group of an owned device.  
> 
> "2) Does not have a valid devid within iommufd_ctx of the calling
> device, but belongs to the same IOMMU group as the calling device.
> This provides implicit ownership for devices within the same DMA
> isolation context.  In this case the invalid devid value of zero is
> provided in the return structure."
> 
> > + *	  For 1), the dev_id > 0, for 2) dev_id == 0. Otherwise, dev_id == -1.  
> 
> "A devid value of -1 is provided in the return structure for devices
> where ownership is not available.  Such devices prevent use of
> VFIO_DEVICE_PCI_HOT_RESET outside of proof-of-ownership calling
> conventions (ie. via legacy group accessed devices)."
> 
> > + *
> > + * If the affected devices of a calling device span into multiple iommufds
> > + * or opened by different APIs (group/container or cdev), hot-reset on
> > + * this device would be rejected.  
> 
> I believe this is already covered in the wording suggestions above.
> 
> > + *
> >   * Return: 0 on success, -errno on failure:
> >   *	-enospc = insufficient buffer, -enodev = unsupported for device.
> >   */
> >  struct vfio_pci_dependent_device {
> > -	__u32	group_id;
> > +	union {
> > +		__u32   group_id;
> > +		__u32	dev_id;
> > +#define VFIO_PCI_DEVID_NONBLOCKING	0
> > +#define VFIO_PCI_DEVID_BLOCKING	-1  
> 
> The above description seems like it's leaning towards OWNED rather than
> BLOCKING.

Also these should be defined relative to something defined in IOMMUFD
rather than inventing values here.  We can't have the valid devid
number space owned by IOMMUFD conflict with these definitions.  Thanks,

Alex

> 
> > +	};
> >  	__u16	segment;
> >  	__u8	bus;
> >  	__u8	devfn; /* Use PCI_SLOT/PCI_FUNC */
> > @@ -663,6 +698,8 @@ struct vfio_pci_dependent_device {
> >  struct vfio_pci_hot_reset_info {
> >  	__u32	argsz;
> >  	__u32	flags;
> > +#define VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID	(1 << 0)
> > +#define VFIO_PCI_HOT_RESET_FLAG_RESETTABLE	(1 << 1)  
> 
> Maybe:
> 
> VFIO_PCI_HOT_RESET_FLAG_DEV_ID
> 
> and
>  
> VFIO_PCI_HOT_RESET_FLAG_DEV_ID_OWNED
> 
> I think we want to make the naming of the flag clearly specific to
> DEV_ID and perhaps avoid "INFO said this was resettable, but HOT_RESET
> failed" sorts of expectations.  Thanks,
> 
> Alex
> 
> >  	__u32	count;
> >  	struct vfio_pci_dependent_device	devices[];
> >  };  
> 

