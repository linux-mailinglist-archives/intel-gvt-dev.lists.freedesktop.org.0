Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 738D5702612
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 May 2023 09:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D5310E163;
	Mon, 15 May 2023 07:29:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38CD10E161
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 15 May 2023 07:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684135779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4v7guimfp0Jor9R+TS6zrt6E6syIcXKtYeOkFMgHuh4=;
 b=g3SRpEeSzbLcp8NxPCkdIlGnjEgCSAX8ceb5gDdTpcHPMB9KP0CUAU3z5a5XukeUR2nZlC
 viC8QFRWL8pYaYoF+Lv5l0D3RFza+rbu0LU+aLjGlfNqRLlJ9e8TSmmn5Wo1MW+7hhPPEe
 adr8gbZM2fwkdu5/V3syAGK3/JjDujk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-gtF2gdDfOii8ad1PBBuIpg-1; Mon, 15 May 2023 03:29:38 -0400
X-MC-Unique: gtF2gdDfOii8ad1PBBuIpg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f33f8ffa37so42298165e9.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 15 May 2023 00:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684135777; x=1686727777;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4v7guimfp0Jor9R+TS6zrt6E6syIcXKtYeOkFMgHuh4=;
 b=HfxfkiooJVajoHJOxkvvowlb4grTk5Lpw7141gvzfAVgdVSQ5zInbPuofGD5swsqVV
 rhv/1zZMjTw7IqEZ+wx0Tefk13LERR/hC0oXalWnEUTLfJq65K8EKE8kxFDK3u2zdXit
 btElkVlse+GkpwNpYwktDLrNWY6OnyrXqYpTKSrIpiNDOuo4D63DzNHvu8szTBXNo8Hn
 PgrOb89KmYAaShjE3GrO0+YL4qES0kbtN5YQipOks2QiwCyD9Sc8y4+POMqcNsZLML3J
 l6R+KoAGQ4iPVDI1Goxr/0WWjkA/7LVES9W6KcQQoG00qU5tEUBI3/ZPNUKu1hCKBRGs
 21Vw==
X-Gm-Message-State: AC+VfDwTulsTLNhDSfG2S+eMVSwzMAOG/ECuGVliEPGL3edeOdZizpQt
 Aakv6HQEcuQuvodI1GQ/k3LHNaeUPQ3IS59nrYFsX/zBqymwx9F7bmdNlcpqdiRM4OoUCFejXrI
 FX3B4JtaoIJD7K6vHnPS+8fz/jdtJO1+szA==
X-Received: by 2002:a05:600c:204e:b0:3f4:ebfb:7414 with SMTP id
 p14-20020a05600c204e00b003f4ebfb7414mr8963054wmg.1.1684135776890; 
 Mon, 15 May 2023 00:29:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ64HWEz6FvoUsOXcYS6FC6zeByToeguSZqKsaDge9emk+wPbn8AWQQaz29iXRr0f2WjxNxQKw==
X-Received: by 2002:a05:600c:204e:b0:3f4:ebfb:7414 with SMTP id
 p14-20020a05600c204e00b003f4ebfb7414mr8963035wmg.1.1684135776483; 
 Mon, 15 May 2023 00:29:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a1c740e000000b003f420667807sm26104380wmc.11.2023.05.15.00.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 00:29:35 -0700 (PDT)
Message-ID: <aa59a555-0f6f-9cd7-5253-621c98d19fb8@redhat.com>
Date: Mon, 15 May 2023 09:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 09/10] vfio/pci: Extend
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO for vfio device cdev
To: Yi Liu <yi.l.liu@intel.com>, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com
References: <20230513132136.15021-1-yi.l.liu@intel.com>
 <20230513132136.15021-10-yi.l.liu@intel.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <20230513132136.15021-10-yi.l.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 zhenzhong.duan@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, yanting.jiang@intel.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 5/13/23 15:21, Yi Liu wrote:
> This makes VFIO_DEVICE_GET_PCI_HOT_RESET_INFO ioctl to use the iommufd_ctx
> of the cdev device to check the ownership of the other affected devices.
> 
> This returns devid for each of the affected devices. If it is bound to the
> iommufd_ctx of the cdev device, _INFO reports a valid devid > 0; If it is
> not opened by the calling user, but it belongs to the same iommu_group of
> a device that is bound to the iommufd_ctx of the cdev device, reports devid
> value of 0; If the device is un-owned device, configured within a different
> iommufd, or opened outside of the vfio device cdev API, the _INFO ioctl shall
> report devid value of -1.
> 
> devid >=0 doesn't block hot-reset as the affected devices are considered to
> be owned, while devid == -1 will block the use of VFIO_DEVICE_PCI_HOT_RESET
> outside of proof-of-ownership calling conventions (ie. via legacy group
> accessed devices).
> 
> This adds flag VFIO_PCI_HOT_RESET_FLAG_DEV_ID to tell the user devid is
> returned in case of calling user get device fd from other software stack
> and adds flag VFIO_PCI_HOT_RESET_FLAG_DEV_ID_OWNED to tell user if all
> the affected devices are owned, so user can know it without looping all
> the returned devids.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Suggested-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>   drivers/vfio/pci/vfio_pci_core.c | 52 ++++++++++++++++++++++++++++++--
>   include/uapi/linux/vfio.h        | 46 +++++++++++++++++++++++++++-
>   2 files changed, 95 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 4df2def35bdd..57586be770af 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -27,6 +27,7 @@
>   #include <linux/vgaarb.h>
>   #include <linux/nospec.h>
>   #include <linux/sched/mm.h>
> +#include <linux/iommufd.h>
>   #if IS_ENABLED(CONFIG_EEH)
>   #include <asm/eeh.h>
>   #endif
> @@ -36,6 +37,10 @@
>   #define DRIVER_AUTHOR   "Alex Williamson <alex.williamson@redhat.com>"
>   #define DRIVER_DESC "core driver for VFIO based PCI devices"
>   
> +#ifdef CONFIG_IOMMUFD

To import the IOMMUFD namespace, I had to use :

#if IS_ENABLED(CONFIG_IOMMUFD)

Thanks,

C.


> +MODULE_IMPORT_NS(IOMMUFD);
> +#endif
> +
>   static bool nointxmask;
>   static bool disable_vga;
>   static bool disable_idle_d3;
> @@ -776,6 +781,9 @@ struct vfio_pci_fill_info {
>   	int max;
>   	int cur;
>   	struct vfio_pci_dependent_device *devices;
> +	struct vfio_device *vdev;
> +	bool devid:1;
> +	bool dev_owned:1;
>   };
>   
>   static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
> @@ -790,7 +798,37 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
>   	if (!iommu_group)
>   		return -EPERM; /* Cannot reset non-isolated devices */
>   
> -	fill->devices[fill->cur].group_id = iommu_group_id(iommu_group);
> +	if (fill->devid) {
> +		struct iommufd_ctx *iommufd = vfio_iommufd_physical_ictx(fill->vdev);
> +		struct vfio_device_set *dev_set = fill->vdev->dev_set;
> +		struct vfio_device *vdev;
> +
> +		/*
> +		 * Report devid for the affected devices:
> +		 * - valid devid > 0 for the devices that are bound with
> +		 *   the iommufd of the calling device.
> +		 * - devid == 0 for the devices that have not been opened
> +		 *   but have same group with one of the devices bound to
> +		 *   the iommufd of the calling device.
> +		 * - devid == -1 for others, and clear dev_owned flag.
> +		 */
> +		vdev = vfio_find_device_in_devset(dev_set, &pdev->dev);
> +		if (vdev && iommufd == vfio_iommufd_physical_ictx(vdev)) {
> +			int ret;
> +
> +			ret = vfio_iommufd_physical_devid(vdev);
> +			if (WARN_ON(ret < 0))
> +				return ret;
> +			fill->devices[fill->cur].devid = ret;
> +		} else if (vdev && iommufd_ctx_has_group(iommufd, iommu_group)) {
> +			fill->devices[fill->cur].devid = VFIO_PCI_DEVID_OWNED;
> +		} else {
> +			fill->devices[fill->cur].devid = VFIO_PCI_DEVID_NOT_OWNED;
> +			fill->dev_owned = false;
> +		}
> +	} else {
> +		fill->devices[fill->cur].group_id = iommu_group_id(iommu_group);
> +	}
>   	fill->devices[fill->cur].segment = pci_domain_nr(pdev->bus);
>   	fill->devices[fill->cur].bus = pdev->bus->number;
>   	fill->devices[fill->cur].devfn = pdev->devfn;
> @@ -1229,17 +1267,27 @@ static int vfio_pci_ioctl_get_pci_hot_reset_info(
>   		return -ENOMEM;
>   
>   	fill.devices = devices;
> +	fill.vdev = &vdev->vdev;
>   
> +	mutex_lock(&vdev->vdev.dev_set->lock);
> +	fill.devid = fill.dev_owned = vfio_device_cdev_opened(&vdev->vdev);
>   	ret = vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_fill_devs,
>   					    &fill, slot);
> +	mutex_unlock(&vdev->vdev.dev_set->lock);
>   
>   	/*
>   	 * If a device was removed between counting and filling, we may come up
>   	 * short of fill.max.  If a device was added, we'll have a return of
>   	 * -EAGAIN above.
>   	 */
> -	if (!ret)
> +	if (!ret) {
>   		hdr.count = fill.cur;
> +		if (fill.devid) {
> +			hdr.flags |= VFIO_PCI_HOT_RESET_FLAG_DEV_ID;
> +			if (fill.dev_owned)
> +				hdr.flags |= VFIO_PCI_HOT_RESET_FLAG_DEV_ID_OWNED;
> +		}
> +	}
>   
>   reset_info_exit:
>   	if (copy_to_user(arg, &hdr, minsz))
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 0552e8dcf0cb..01203215251a 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -650,11 +650,53 @@ enum {
>    * VFIO_DEVICE_GET_PCI_HOT_RESET_INFO - _IOWR(VFIO_TYPE, VFIO_BASE + 12,
>    *					      struct vfio_pci_hot_reset_info)
>    *
> + * This command is used to query the affected devices in the hot reset for
> + * a given device.
> + *
> + * This command always reports the segment, bus, and devfn information for
> + * each affected device, and selectively reports the group_id or devid per
> + * the way how the calling device is opened.
> + *
> + *	- If the calling device is opened via the traditional group/container
> + *	  API, group_id is reported.  User should check if it has owned all
> + *	  the affected devices and provides a set of group fds to prove the
> + *	  ownership in VFIO_DEVICE_PCI_HOT_RESET ioctl.
> + *
> + *	- If the calling device is opened as a cdev, devid is reported.
> + *	  Flag VFIO_PCI_HOT_RESET_FLAG_DEV_ID is set to indicate this
> + *	  data type.  For a given affected device, it is considered owned by
> + *	  this interface if it meets the following conditions:
> + *	  1) Has a valid devid within the iommufd_ctx of the calling device.
> + *	     Ownership cannot be determined across separate iommufd_ctx and the
> + *	     cdev calling conventions do not support a proof-of-ownership model
> + *	     as provided in the legacy group interface.  In this case a valid
> + *	     devid with value greater than zero is provided in the return
> + *	     structure.
> + *	  2) Does not have a valid devid within the iommufd_ctx of the calling
> + *	     device, but belongs to the same IOMMU group as the calling device
> + *	     or another opened device that has a valid devid within the
> + *	     iommufd_ctx of the calling device.  This provides implicit ownership
> + *	     for devices within the same DMA isolation context.  In this case
> + *	     the invalid devid value of zero is provided in the return structure.
> + *
> + *	  A devid value of -1 is provided in the return structure for devices
> + *	  where ownership is not available.  Such devices prevent the use of
> + *	  VFIO_DEVICE_PCI_HOT_RESET outside of proof-of-ownership calling
> + *	  conventions (ie. via legacy group accessed devices).
> + *	  Flag VFIO_PCI_HOT_RESET_FLAG_DEV_ID_OWNED would be set when all the
> + *	  affected devices are owned by the user.  This flag is available only
> + *	  when VFIO_PCI_HOT_RESET_FLAG_DEV_ID is set, otherwise reserved.
> + *
>    * Return: 0 on success, -errno on failure:
>    *	-enospc = insufficient buffer, -enodev = unsupported for device.
>    */
>   struct vfio_pci_dependent_device {
> -	__u32	group_id;
> +	union {
> +		__u32   group_id;
> +		__u32	devid;
> +#define VFIO_PCI_DEVID_OWNED		0
> +#define VFIO_PCI_DEVID_NOT_OWNED	-1
> +	};
>   	__u16	segment;
>   	__u8	bus;
>   	__u8	devfn; /* Use PCI_SLOT/PCI_FUNC */
> @@ -663,6 +705,8 @@ struct vfio_pci_dependent_device {
>   struct vfio_pci_hot_reset_info {
>   	__u32	argsz;
>   	__u32	flags;
> +#define VFIO_PCI_HOT_RESET_FLAG_DEV_ID		(1 << 0)
> +#define VFIO_PCI_HOT_RESET_FLAG_DEV_ID_OWNED	(1 << 1)
>   	__u32	count;
>   	struct vfio_pci_dependent_device	devices[];
>   };

