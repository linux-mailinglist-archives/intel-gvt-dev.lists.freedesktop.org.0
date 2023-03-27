Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601B66CB010
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Mar 2023 22:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1098910E13A;
	Mon, 27 Mar 2023 20:41:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D64710E13A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 Mar 2023 20:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679949663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HRYgJ9/+Wuog4XaTVV+awcC53+j2uceVG6lMhh42Rq0=;
 b=GY8bFyGe0G5TSbVYBlQFGDPvOyIKok/WuKdIsXkXXj2woOD+OddLa+kXT39BXIZSKVYXGa
 48DJ13g3GrdOSEojTjx95XJcfkG8ukAJupMmOpcOuRCfwjSnVVObJakvd4GqXnXwso8zyF
 GKueEH3XlywcUmIH7hJtSuoZBW5hZ3E=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-f6CAhLL1O7GBjhKKIhkv7w-1; Mon, 27 Mar 2023 16:41:00 -0400
X-MC-Unique: f6CAhLL1O7GBjhKKIhkv7w-1
Received: by mail-il1-f197.google.com with SMTP id
 i17-20020a056e020d9100b00325a80f683cso6828636ilj.22
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 Mar 2023 13:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679949659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HRYgJ9/+Wuog4XaTVV+awcC53+j2uceVG6lMhh42Rq0=;
 b=iKpLMC5OxucE9eGERAC1We2xNpk2VQdWQkSwHycuMl00aH557WCGT5PQTLRMpylACt
 jsOA1tgXK0o7b5YtISUC+6QzvWfm8pxvXB+PhgMHtmxIpJU/qxYK9QDWWjl8JjXYJZ/A
 syH2LKrQvW9M2n6JPh9ZkSYTSWCeiQ/C3jLSJHRxD8BWOjkJJEIrHR6I6t8vp1RNo+kf
 CjGq20WK7GOEvKVW4eCuVUPW3/OyguVHu+HOSFgR3rcZl6V66xSWgZd+0veG5D6Q0fO0
 x0Cwx1j4kptM1WDB1fRv8ws2hu1T17DGVNpHDsIRYvRlKmZzQqugHFOyXpfROF3bLrqh
 x8Bg==
X-Gm-Message-State: AAQBX9f5vsM2Ud2bhqvL7HBZQbnLzwtf9CgwYASxQ5h6DguExd8UkVl1
 CR4EDHvFKrxgKiRgmxhJl5Ng7340sDcsL482X6sTCYsCrQ3MFgHRRLhnJMYfkR02MZ54Ggwu+uL
 y2faFS+A7F33/cSMR2EHbNO+kUunjMqKgSQ==
X-Received: by 2002:a92:bf07:0:b0:325:b52f:2e3d with SMTP id
 z7-20020a92bf07000000b00325b52f2e3dmr9302505ilh.27.1679949659309; 
 Mon, 27 Mar 2023 13:40:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZdWpzm/Ar0l6rjXk9PNDDzIhsCEOf71bh4ka2BktibvC83gCP3GX1zGhGWlodWlSunsDOHyQ==
X-Received: by 2002:a92:bf07:0:b0:325:b52f:2e3d with SMTP id
 z7-20020a92bf07000000b00325b52f2e3dmr9302489ilh.27.1679949659012; 
 Mon, 27 Mar 2023 13:40:59 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 c28-20020a02331c000000b0040071bcb216sm9472089jae.102.2023.03.27.13.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 13:40:58 -0700 (PDT)
Date: Mon, 27 Mar 2023 14:40:56 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v2 10/10] vfio/pci: Add
 VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO
Message-ID: <20230327144056.3a287eea.alex.williamson@redhat.com>
In-Reply-To: <20230327132619.5ab15440.alex.williamson@redhat.com>
References: <20230327093458.44939-1-yi.l.liu@intel.com>
 <20230327093458.44939-11-yi.l.liu@intel.com>
 <20230327132619.5ab15440.alex.williamson@redhat.com>
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
 peterx@redhat.com, terrence.xu@intel.com, chao.p.peng@linux.intel.com,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org, lulu@redhat.com,
 yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com, jgg@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org,
 eric.auger@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 yi.y.sun@linux.intel.com, cohuck@redhat.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, 27 Mar 2023 13:26:19 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Mon, 27 Mar 2023 02:34:58 -0700
> Yi Liu <yi.l.liu@intel.com> wrote:
> 
> > This is a preparation for vfio device cdev as cdev gives userspace the
> > capability to open device cdev fd and management stack (e.g. libvirt)
> > could pass the device fd to the actual user (e.g. QEMU). As a result,
> > the actual user has no idea about the device's bus:devfn information.
> > This is a problem when user uses VFIO_DEVICE_GET_PCI_HOT_RESET_INFO to
> > know the hot reset affected device scope as this ioctl returns bus:devfn
> > info. For the fd passing usage, the acutal user cannot map the bus:devfn
> > to the devices it has opened via the fd passed from management stack. So
> > a new ioctl is required.
> > 
> > This new ioctl reports the list of iommufd dev_id that is opened by the
> > user. If there is affected device that is not bound to vfio driver or
> > opened by another user, this command shall fail with -EPERM. For the
> > noiommu mode in the vfio device cdev path, this shall fail as no dev_id
> > would be generated, hence nothing to report.
> > 
> > This ioctl is useless to the users that open vfio group as such users
> > have no idea about the iommufd dev_id and it can use the existing
> > VFIO_DEVICE_GET_PCI_HOT_RESET_INFO. The user that uses the traditional
> > mode vfio group/container would be failed if invoking this ioctl. But
> > the user that uses the iommufd compat mode vfio group/container shall
> > succeed. This is harmless as long as user cannot make use of it and
> > should use VFIO_DEVICE_GET_PCI_HOT_RESET_INFO.  
> 
> 
> So VFIO_DEVICE_GET_PCI_HOT_RESET_INFO reports a group and bdf, but
> VFIO_DEVICE_GET_PCI_HOT_RESET_*GROUP*_INFO is meant for the non-group,
> cdev use case and returns a dev_id rather than a group???
> 
> Additionally, VFIO_DEVICE_GET_PCI_HOT_RESET_INFO has a flags arg that
> isn't used, why do we need a new ioctl vs defining
> VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID.  In fact, we could define
> vfio_dependent_device as:
> 
> struct vfio_pci_dependent_device {
> 	union {
> 	        __u32   group_id;
> 		__u32	dev_id;
> 	}
>         __u16   segment;
>         __u8    bus;
>         __u8    devfn;
> };
> 
> If the user calls with the above flag, dev_id is valid, otherwise
> group_id.  Perhaps segment:buus:devfn could still be filled in with a
> NULL/invalid dev_id if the user doesn't have permissions for the device
> so that debugging from userspace isn't so opaque.  Thanks,
> 
> Alex
>  
> > Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> > ---
> >  drivers/vfio/pci/vfio_pci_core.c | 98 ++++++++++++++++++++++++++++++++
> >  include/uapi/linux/vfio.h        | 47 +++++++++++++++
> >  2 files changed, 145 insertions(+)
> > 
> > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> > index 19f5b075d70a..45edf4e9b98b 100644
> > --- a/drivers/vfio/pci/vfio_pci_core.c
> > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > @@ -1181,6 +1181,102 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
> >  	return ret;
> >  }
> >  
> > +static struct pci_dev *
> > +vfio_pci_dev_set_resettable(struct vfio_device_set *dev_set);
> > +
> > +static int vfio_pci_ioctl_get_pci_hot_reset_group_info(
> > +	struct vfio_pci_core_device *vdev,
> > +	struct vfio_pci_hot_reset_group_info __user *arg)
> > +{
> > +	unsigned long minsz =
> > +		offsetofend(struct vfio_pci_hot_reset_group_info, count);
> > +	struct vfio_pci_hot_reset_group_info hdr;
> > +	struct iommufd_ctx *iommufd, *cur_iommufd;
> > +	u32 count = 0, index = 0, *devices = NULL;
> > +	struct vfio_pci_core_device *cur;
> > +	bool slot = false;
> > +	int ret = 0;
> > +
> > +	if (copy_from_user(&hdr, arg, minsz))
> > +		return -EFAULT;
> > +
> > +	if (hdr.argsz < minsz)
> > +		return -EINVAL;
> > +
> > +	hdr.flags = 0;
> > +
> > +	/* Can we do a slot or bus reset or neither? */
> > +	if (!pci_probe_reset_slot(vdev->pdev->slot))
> > +		slot = true;
> > +	else if (pci_probe_reset_bus(vdev->pdev->bus))
> > +		return -ENODEV;
> > +
> > +	mutex_lock(&vdev->vdev.dev_set->lock);
> > +	if (!vfio_pci_dev_set_resettable(vdev->vdev.dev_set)) {
> > +		ret = -EPERM;
> > +		goto out_unlock;
> > +	}
> > +
> > +	iommufd = vfio_iommufd_physical_ictx(&vdev->vdev);
> > +	if (!iommufd) {
> > +		ret = -EPERM;
> > +		goto out_unlock;
> > +	}
> > +
> > +	/* How many devices are affected? */
> > +	ret = vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_count_devs,
> > +					    &count, slot);
> > +	if (ret)
> > +		goto out_unlock;
> > +
> > +	WARN_ON(!count); /* Should always be at least one */
> > +
> > +	/*
> > +	 * If there's enough space, fill it now, otherwise return -ENOSPC and
> > +	 * the number of devices affected.
> > +	 */
> > +	if (hdr.argsz < sizeof(hdr) + (count * sizeof(*devices))) {
> > +		ret = -ENOSPC;
> > +		hdr.count = count;
> > +		goto reset_info_exit;
> > +	}
> > +
> > +	devices = kcalloc(count, sizeof(*devices), GFP_KERNEL);
> > +	if (!devices) {
> > +		ret = -ENOMEM;
> > +		goto reset_info_exit;
> > +	}
> > +
> > +	list_for_each_entry(cur, &vdev->vdev.dev_set->device_list, vdev.dev_set_list) {
> > +		cur_iommufd = vfio_iommufd_physical_ictx(&cur->vdev);
> > +		if (cur->vdev.open_count) {
> > +			if (cur_iommufd != iommufd) {
> > +				ret = -EPERM;
> > +				break;
> > +			}
> > +			ret = vfio_iommufd_physical_devid(&cur->vdev, &devices[index]);
> > +			if (ret)
> > +				break;
> > +			index++;
> > +		}
> > +	}

This also makes use of vfio_pci_for_each_slot_or_bus() to iterate
affected devices, but then still assumes those affected devices are
necessarily represented in the dev_set.  For example, a two-function
device with ACS isolation can have function 0 bound to vfio and
function 1 bound to a native host driver.  The above code requires the
user to pass a buffer large enough for both functions, but only
function 0 is part of the dev_set, so function 1 is not reported as
affected, nor does it generate an error.

It looks like we also fail to set hdr.count except in the error path
above, so the below copy_to_user() copies a user specified range beyond
the end the allocated devices buffer out to userspace!  Thanks,

Alex

> > +
> > +reset_info_exit:
> > +	if (copy_to_user(arg, &hdr, minsz))
> > +		ret = -EFAULT;
> > +
> > +	if (!ret) {
> > +		if (copy_to_user(&arg->devices, devices,
> > +				 hdr.count * sizeof(*devices)))
> > +			ret = -EFAULT;
> > +	}
> > +
> > +	kfree(devices);
> > +out_unlock:
> > +	mutex_unlock(&vdev->vdev.dev_set->lock);
> > +	return ret;
> > +}
> > +
> >  static int vfio_pci_ioctl_get_pci_hot_reset_info(
> >  	struct vfio_pci_core_device *vdev,
> >  	struct vfio_pci_hot_reset_info __user *arg)
> > @@ -1404,6 +1500,8 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
> >  		return vfio_pci_ioctl_get_irq_info(vdev, uarg);
> >  	case VFIO_DEVICE_GET_PCI_HOT_RESET_INFO:
> >  		return vfio_pci_ioctl_get_pci_hot_reset_info(vdev, uarg);
> > +	case VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO:
> > +		return vfio_pci_ioctl_get_pci_hot_reset_group_info(vdev, uarg);
> >  	case VFIO_DEVICE_GET_REGION_INFO:
> >  		return vfio_pci_ioctl_get_region_info(vdev, uarg);
> >  	case VFIO_DEVICE_IOEVENTFD:
> > diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> > index 25432ef213ee..61b801dfd40b 100644
> > --- a/include/uapi/linux/vfio.h
> > +++ b/include/uapi/linux/vfio.h
> > @@ -669,6 +669,53 @@ struct vfio_pci_hot_reset_info {
> >  
> >  #define VFIO_DEVICE_GET_PCI_HOT_RESET_INFO	_IO(VFIO_TYPE, VFIO_BASE + 12)
> >  
> > +/**
> > + * VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO - _IOWR(VFIO_TYPE, VFIO_BASE + 12,
> > + *						    struct vfio_pci_hot_reset_group_info)
> > + *
> > + * This is used in the vfio device cdev mode.  It returns the list of
> > + * affected devices (represented by iommufd dev_id) when hot reset is
> > + * issued on the current device with which this ioctl is invoked.  It
> > + * only includes the devices that are opened by the current user in the
> > + * time of this command is invoked.  This list may change when user opens
> > + * new device or close opened device, hence user should re-invoke it
> > + * after open/close devices.  This command has no guarantee on the result
> > + * of VFIO_DEVICE_PCI_HOT_RESET since the not-opened affected device can
> > + * be by other users in the window between the two ioctls.  If the affected
> > + * devices are opened by multiple users, the VFIO_DEVICE_PCI_HOT_RESET
> > + * shall fail, detail can check the description of VFIO_DEVICE_PCI_HOT_RESET.
> > + *
> > + * For the users that open vfio group/container, this ioctl is useless as
> > + * they have no idea about the iommufd dev_id returned by this ioctl.  For
> > + * the users of the traditional mode vfio group/container, this ioctl will
> > + * fail as this mode does not use iommufd hence no dev_id to report back.
> > + * For the users of the iommufd compat mode vfio group/container, this ioctl
> > + * would succeed as this mode uses iommufd as container fd.  But such users
> > + * still have no idea about the iommufd dev_id as the dev_id is only stored
> > + * in kernel in this mode.  For the users of the vfio group/container, the
> > + * VFIO_DEVICE_GET_PCI_HOT_RESET_INFO should be used to know the hot reset
> > + * affected devices.
> > + *
> > + * Return: 0 on success, -errno on failure:
> > + *	-enospc = insufficient buffer;
> > + *	-enodev = unsupported for device;
> > + *	-eperm = no permission for device, this error comes:
> > + *		 - when there are affected devices that are opened but
> > + *		   not bound to the same iommufd with the current device
> > + *		   with which this ioctl is invoked,
> > + *		 - there are affected devices that are not bound to vfio
> > + *		   driver yet.
> > + *		 - no valid iommufd is bound (e.g. noiommu mode)
> > + */
> > +struct vfio_pci_hot_reset_group_info {
> > +	__u32	argsz;
> > +	__u32	flags;
> > +	__u32	count;
> > +	__u32	devices[];
> > +};
> > +
> > +#define VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO	_IO(VFIO_TYPE, VFIO_BASE + 18)
> > +
> >  /**
> >   * VFIO_DEVICE_PCI_HOT_RESET - _IOW(VFIO_TYPE, VFIO_BASE + 13,
> >   *				    struct vfio_pci_hot_reset)  
> 

