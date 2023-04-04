Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA8B6D700A
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Apr 2023 00:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1911E10E7D6;
	Tue,  4 Apr 2023 22:20:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E1510E7DB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Apr 2023 22:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680646848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wtedyzqZlxnYrFGj+qXmrLzgKTFLw2c+Vuc4YDvBs9Y=;
 b=UzOHpne7GntJwANdqJiIkMbRE592H7Tkg+YYwnSe8uXju1UBjDmSc0gsAvopDeS6wl2Cu9
 clmyiIvLYmLmpVXNEy91GUCArM3Z+kY0Cerjke0VIXlDnegApQqX4r8t0JQC9IIszcj9F2
 f5J3/c/poom9eqsrT6tLZ01IKyUK05E=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-pgK8kq-DPR2yofOOy62PbA-1; Tue, 04 Apr 2023 18:20:47 -0400
X-MC-Unique: pgK8kq-DPR2yofOOy62PbA-1
Received: by mail-il1-f198.google.com with SMTP id
 n17-20020a056e02141100b003259a56715bso21940958ilo.15
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 04 Apr 2023 15:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680646846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wtedyzqZlxnYrFGj+qXmrLzgKTFLw2c+Vuc4YDvBs9Y=;
 b=DkyY0UCviO9htDEZX0yPyA7tvqWmEvAFJumlxXrTIOURTpyUollC08ous83RRIroCD
 YhCz7lN7XFDv4YYxPAdJNBjdjTRnMMg4bsBHdNdoMapkAlk4dXNftz6k+EvRbmi/f/QY
 wM7SIrfy8xSOU14ecBnnimzk/V8B3CX7yeTveb+DEthGMWshP//MLwDdDu+wJ+VmK0rx
 hC1nb6qR4cUggO8i1uKnW2YUTK21Sk4oyIAtDpo3m4qL6oZip7PspyOwWpQcUn5Rc63m
 Zk7VeVUtzxK0beMQwwai5HX6srCvC+O/aqfeP+beLfyhCEgHfNhHweFpKiHdL5JLHoxv
 PbGw==
X-Gm-Message-State: AAQBX9eyc2MsneID1dn+ZuP4O9GEtd+LbWB4uswiMD7sE8Kay/Fw/Qom
 bKg4GKdkngbAtcvM1xilaQ3niMQ53JRJY8DAPrDx8sDGg0XFsAEitDl1LR3EXOADU4ji1NDut8U
 G7UZNYmg0pk6pD1acUBhNo81a2C41NStnS8Q0r7BImQ==
X-Received: by 2002:a92:d987:0:b0:325:fe9f:b89e with SMTP id
 r7-20020a92d987000000b00325fe9fb89emr2656648iln.30.1680646846638; 
 Tue, 04 Apr 2023 15:20:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350bG28gnLkRr7C9UJ/JFxsCc3vxT4/kcNZsJIuMjQPoAsqhmlGTrjKd2rtr7Dssvge/zd/DKMA==
X-Received: by 2002:a92:d987:0:b0:325:fe9f:b89e with SMTP id
 r7-20020a92d987000000b00325fe9fb89emr2656616iln.30.1680646846274; 
 Tue, 04 Apr 2023 15:20:46 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 m17-20020a056638409100b004040f9898ebsm3653932jam.148.2023.04.04.15.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 15:20:45 -0700 (PDT)
Date: Tue, 4 Apr 2023 16:20:44 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230404162044.25fb0f93.alex.williamson@redhat.com>
In-Reply-To: <20230401144429.88673-13-yi.l.liu@intel.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-13-yi.l.liu@intel.com>
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

On Sat,  1 Apr 2023 07:44:29 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> for the users that accept device fds passed from management stacks to be
> able to figure out the host reset affected devices among the devices
> opened by the user. This is needed as such users do not have BDF (bus,
> devfn) knowledge about the devices it has opened, hence unable to use
> the information reported by existing VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
> to figure out the affected devices.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 58 ++++++++++++++++++++++++++++----
>  include/uapi/linux/vfio.h        | 24 ++++++++++++-
>  2 files changed, 74 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 19f5b075d70a..a5a7e148dce1 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -30,6 +30,7 @@
>  #if IS_ENABLED(CONFIG_EEH)
>  #include <asm/eeh.h>
>  #endif
> +#include <uapi/linux/iommufd.h>
>  
>  #include "vfio_pci_priv.h"
>  
> @@ -767,6 +768,20 @@ static int vfio_pci_get_irq_count(struct vfio_pci_core_device *vdev, int irq_typ
>  	return 0;
>  }
>  
> +static struct vfio_device *
> +vfio_pci_find_device_in_devset(struct vfio_device_set *dev_set,
> +			       struct pci_dev *pdev)
> +{
> +	struct vfio_device *cur;
> +
> +	lockdep_assert_held(&dev_set->lock);
> +
> +	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
> +		if (cur->dev == &pdev->dev)
> +			return cur;
> +	return NULL;
> +}
> +
>  static int vfio_pci_count_devs(struct pci_dev *pdev, void *data)
>  {
>  	(*(int *)data)++;
> @@ -776,13 +791,20 @@ static int vfio_pci_count_devs(struct pci_dev *pdev, void *data)
>  struct vfio_pci_fill_info {
>  	int max;
>  	int cur;
> +	bool require_devid;
> +	struct iommufd_ctx *iommufd;
> +	struct vfio_device_set *dev_set;
>  	struct vfio_pci_dependent_device *devices;

Poor structure packing, move the bool to the end.

Nit, maybe just name it @devid.

>  };
>  
>  static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
>  {
>  	struct vfio_pci_fill_info *fill = data;
> +	struct vfio_device_set *dev_set = fill->dev_set;
>  	struct iommu_group *iommu_group;
> +	struct vfio_device *vdev;
> +
> +	lockdep_assert_held(&dev_set->lock);
>  
>  	if (fill->cur == fill->max)
>  		return -EAGAIN; /* Something changed, try again */
> @@ -791,7 +813,21 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
>  	if (!iommu_group)
>  		return -EPERM; /* Cannot reset non-isolated devices */
>  
> -	fill->devices[fill->cur].group_id = iommu_group_id(iommu_group);
> +	if (fill->require_devid) {

Nit, @vdev could be scoped here.

> +		/*
> +		 * Report dev_id of the devices that are opened as cdev
> +		 * and have the same iommufd with the fill->iommufd.
> +		 * Otherwise, just fill IOMMUFD_INVALID_ID.
> +		 */
> +		vdev = vfio_pci_find_device_in_devset(dev_set, pdev);

I wish I had a better solution to this, but I don't.

> +		if (vdev && vfio_device_cdev_opened(vdev) &&
> +		    fill->iommufd == vfio_iommufd_physical_ictx(vdev))
> +			vfio_iommufd_physical_devid(vdev, &fill->devices[fill->cur].dev_id);

Long line, maybe a pointer to &fill->devices[fill->cur] would help.

> +		else
> +			fill->devices[fill->cur].dev_id = IOMMUFD_INVALID_ID;
> +	} else {
> +		fill->devices[fill->cur].group_id = iommu_group_id(iommu_group);
> +	}
>  	fill->devices[fill->cur].segment = pci_domain_nr(pdev->bus);
>  	fill->devices[fill->cur].bus = pdev->bus->number;
>  	fill->devices[fill->cur].devfn = pdev->devfn;
> @@ -1230,17 +1266,27 @@ static int vfio_pci_ioctl_get_pci_hot_reset_info(
>  		return -ENOMEM;
>  
>  	fill.devices = devices;
> +	fill.dev_set = vdev->vdev.dev_set;
>  
> +	mutex_lock(&vdev->vdev.dev_set->lock);
> +	if (vfio_device_cdev_opened(&vdev->vdev)) {
> +		fill.require_devid = true;
> +		fill.iommufd = vfio_iommufd_physical_ictx(&vdev->vdev);
> +	}

We can do this unconditionally:

	fill.devid = vfio_device_cdev_opened(&vdev->vdev);
	fill.iommufd = vfio_iommufd_physical_ictx(&vdev->vdev);

Thanks,
Alex

>  	ret = vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_fill_devs,
>  					    &fill, slot);
> +	mutex_unlock(&vdev->vdev.dev_set->lock);
>  
>  	/*
>  	 * If a device was removed between counting and filling, we may come up
>  	 * short of fill.max.  If a device was added, we'll have a return of
>  	 * -EAGAIN above.
>  	 */
> -	if (!ret)
> +	if (!ret) {
>  		hdr.count = fill.cur;
> +		if (fill.require_devid)
> +			hdr.flags = VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID;
> +	}
>  
>  reset_info_exit:
>  	if (copy_to_user(arg, &hdr, minsz))
> @@ -2346,12 +2392,10 @@ static bool vfio_dev_in_files(struct vfio_pci_core_device *vdev,
>  static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *data)
>  {
>  	struct vfio_device_set *dev_set = data;
> -	struct vfio_device *cur;
>  
> -	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
> -		if (cur->dev == &pdev->dev)
> -			return 0;
> -	return -EBUSY;
> +	lockdep_assert_held(&dev_set->lock);
> +
> +	return vfio_pci_find_device_in_devset(dev_set, pdev) ? 0 : -EBUSY;
>  }
>  
>  /*
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 25432ef213ee..5a34364e3b94 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -650,11 +650,32 @@ enum {
>   * VFIO_DEVICE_GET_PCI_HOT_RESET_INFO - _IOWR(VFIO_TYPE, VFIO_BASE + 12,
>   *					      struct vfio_pci_hot_reset_info)
>   *
> + * This command is used to query the affected devices in the hot reset for
> + * a given device.  User could use the information reported by this command
> + * to figure out the affected devices among the devices it has opened.
> + * This command always reports the segment, bus and devfn information for
> + * each affected device, and selectively report the group_id or the dev_id
> + * per the way how the device being queried is opened.
> + *	- If the device is opened via the traditional group/container manner,
> + *	  this command reports the group_id for each affected device.
> + *
> + *	- If the device is opened as a cdev, this command needs to report
> + *	  dev_id for each affected device and set the
> + *	  VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID flag.  For the affected
> + *	  devices that are not opened as cdev or bound to different iommufds
> + *	  with the device that is queried, report an invalid dev_id to avoid
> + *	  potential dev_id conflict as dev_id is local to iommufd.  For such
> + *	  affected devices, user shall fall back to use the segment, bus and
> + *	  devfn info to map it to opened device.
> + *
>   * Return: 0 on success, -errno on failure:
>   *	-enospc = insufficient buffer, -enodev = unsupported for device.
>   */
>  struct vfio_pci_dependent_device {
> -	__u32	group_id;
> +	union {
> +		__u32   group_id;
> +		__u32	dev_id;
> +	};
>  	__u16	segment;
>  	__u8	bus;
>  	__u8	devfn; /* Use PCI_SLOT/PCI_FUNC */
> @@ -663,6 +684,7 @@ struct vfio_pci_dependent_device {
>  struct vfio_pci_hot_reset_info {
>  	__u32	argsz;
>  	__u32	flags;
> +#define VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID	(1 << 0)
>  	__u32	count;
>  	struct vfio_pci_dependent_device	devices[];
>  };

