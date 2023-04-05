Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D3C6D856A
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Apr 2023 19:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90F010E231;
	Wed,  5 Apr 2023 17:58:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B518E10E329
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Apr 2023 17:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680717505;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=380bqGdmN/J3+3GudvxHzAsrSJkRz0+zfZPDcP5TCsg=;
 b=c9KTPHXtAQHGHk6zheN3c+BYJtu7XoFo9CHZ4DpdGOTt0XC9c8PGGAfNdga3pGzkqpE8tx
 DAd1A05VbCVAHHoc81AFqxtkr2mLpihqDQjaAv6WtjQIkwJNNAAk6pYEjcIVz5L2X9Rx4+
 k3LQoSmRyydaqylXGVFx9R0sR6qQYpY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-uD8TH4YrNRKapROinl86BQ-1; Wed, 05 Apr 2023 13:58:22 -0400
X-MC-Unique: uD8TH4YrNRKapROinl86BQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 e4-20020a05622a110400b003e4e915a164so20480811qty.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 05 Apr 2023 10:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680717502;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=380bqGdmN/J3+3GudvxHzAsrSJkRz0+zfZPDcP5TCsg=;
 b=bL8bchKM5ffjbtV1vmfsZjO0BGrM+MPXGkXfJvxdB6AeXdjX0P8or3hw6nnHXdPWM3
 t0QmASR2Fp4IWfEQfGF4+k0ZZ+mIwh/dTIrs9pRFM5/2ov9VC+Ejbnw3ymZgfNLWWTWd
 NBzvxn2dM9jxjlHgD6ihvzVAgcJvVnla9Jvg0Yh2I+qtY1biFkz55uuZwu5iLjYNxsWW
 c8tZ3OVE+KCzGOzsyk+Gkiyd2jqCOJO/8Fw++80aKHeg4fHWttwetgjuI+McrDuGMLU5
 Dt2WFcpEBU+Z8k7rFOcUygpXUgOOtcjOkoPqLu3rB9XIJQLTiSuRsjvReLycMguZOL8z
 gvSg==
X-Gm-Message-State: AAQBX9fUA0DfiB70Bj2pxy6Mx6jLQhRar7hnGbEmzUxAfzxPWGMov+ai
 yDgHM6lIAIjk68LWHWkagBdqJ3iKVn/SEpxyjWgdKyFLRZaQc7bKMgoM1s5hP27HWLcv1j2LOUT
 B7pAbj4Z4Sz1JNYILSscRhQjsoLdqrrzzlQ==
X-Received: by 2002:ad4:5bc8:0:b0:5e0:47aa:40a6 with SMTP id
 t8-20020ad45bc8000000b005e047aa40a6mr136468qvt.16.1680717502234; 
 Wed, 05 Apr 2023 10:58:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZksC2LVBFlakR/QV0e90iMdBfeTz+PxJh0tY5FA9f1axDsojNcTMMC3Qt8fTWx/ZEqJLVa7A==
X-Received: by 2002:ad4:5bc8:0:b0:5e0:47aa:40a6 with SMTP id
 t8-20020ad45bc8000000b005e047aa40a6mr136432qvt.16.1680717501875; 
 Wed, 05 Apr 2023 10:58:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 cp6-20020ad44ae6000000b005dd8b9345aesm4385044qvb.70.2023.04.05.10.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 10:58:20 -0700 (PDT)
Message-ID: <afbfbfe5-5334-6e18-6211-a3908816dc6e@redhat.com>
Date: Wed, 5 Apr 2023 19:58:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
To: Alex Williamson <alex.williamson@redhat.com>,
 "Liu, Yi L" <yi.l.liu@intel.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-13-yi.l.liu@intel.com>
 <a937e622-ce32-6dda-d77c-7d8d76474ee0@redhat.com>
 <DS0PR11MB7529D4E354C3B85D7698017DC3909@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230405102545.41a61424.alex.williamson@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230405102545.41a61424.alex.williamson@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Reply-To: eric.auger@redhat.com
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>



On 4/5/23 18:25, Alex Williamson wrote:
> On Wed, 5 Apr 2023 14:04:51 +0000
> "Liu, Yi L" <yi.l.liu@intel.com> wrote:
>
>> Hi Eric,
>>
>>> From: Eric Auger <eric.auger@redhat.com>
>>> Sent: Wednesday, April 5, 2023 8:20 PM
>>>
>>> Hi Yi,
>>> On 4/1/23 16:44, Yi Liu wrote:  
>>>> for the users that accept device fds passed from management stacks to be
>>>> able to figure out the host reset affected devices among the devices
>>>> opened by the user. This is needed as such users do not have BDF (bus,
>>>> devfn) knowledge about the devices it has opened, hence unable to use
>>>> the information reported by existing VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
>>>> to figure out the affected devices.
>>>>
>>>> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
>>>> ---
>>>>  drivers/vfio/pci/vfio_pci_core.c | 58 ++++++++++++++++++++++++++++----
>>>>  include/uapi/linux/vfio.h        | 24 ++++++++++++-
>>>>  2 files changed, 74 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
>>>> index 19f5b075d70a..a5a7e148dce1 100644
>>>> --- a/drivers/vfio/pci/vfio_pci_core.c
>>>> +++ b/drivers/vfio/pci/vfio_pci_core.c
>>>> @@ -30,6 +30,7 @@
>>>>  #if IS_ENABLED(CONFIG_EEH)
>>>>  #include <asm/eeh.h>
>>>>  #endif
>>>> +#include <uapi/linux/iommufd.h>
>>>>
>>>>  #include "vfio_pci_priv.h"
>>>>
>>>> @@ -767,6 +768,20 @@ static int vfio_pci_get_irq_count(struct  
>>> vfio_pci_core_device *vdev, int irq_typ  
>>>>  	return 0;
>>>>  }
>>>>
>>>> +static struct vfio_device *
>>>> +vfio_pci_find_device_in_devset(struct vfio_device_set *dev_set,
>>>> +			       struct pci_dev *pdev)
>>>> +{
>>>> +	struct vfio_device *cur;
>>>> +
>>>> +	lockdep_assert_held(&dev_set->lock);
>>>> +
>>>> +	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
>>>> +		if (cur->dev == &pdev->dev)
>>>> +			return cur;
>>>> +	return NULL;
>>>> +}
>>>> +
>>>>  static int vfio_pci_count_devs(struct pci_dev *pdev, void *data)
>>>>  {
>>>>  	(*(int *)data)++;
>>>> @@ -776,13 +791,20 @@ static int vfio_pci_count_devs(struct pci_dev *pdev, void  
>>> *data)  
>>>>  struct vfio_pci_fill_info {
>>>>  	int max;
>>>>  	int cur;
>>>> +	bool require_devid;
>>>> +	struct iommufd_ctx *iommufd;
>>>> +	struct vfio_device_set *dev_set;
>>>>  	struct vfio_pci_dependent_device *devices;
>>>>  };
>>>>
>>>>  static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
>>>>  {
>>>>  	struct vfio_pci_fill_info *fill = data;
>>>> +	struct vfio_device_set *dev_set = fill->dev_set;
>>>>  	struct iommu_group *iommu_group;
>>>> +	struct vfio_device *vdev;
>>>> +
>>>> +	lockdep_assert_held(&dev_set->lock);
>>>>
>>>>  	if (fill->cur == fill->max)
>>>>  		return -EAGAIN; /* Something changed, try again */
>>>> @@ -791,7 +813,21 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev, void  
>>> *data)  
>>>>  	if (!iommu_group)
>>>>  		return -EPERM; /* Cannot reset non-isolated devices */
>>>>
>>>> -	fill->devices[fill->cur].group_id = iommu_group_id(iommu_group);
>>>> +	if (fill->require_devid) {
>>>> +		/*
>>>> +		 * Report dev_id of the devices that are opened as cdev
>>>> +		 * and have the same iommufd with the fill->iommufd.
>>>> +		 * Otherwise, just fill IOMMUFD_INVALID_ID.
>>>> +		 */
>>>> +		vdev = vfio_pci_find_device_in_devset(dev_set, pdev);
>>>> +		if (vdev && vfio_device_cdev_opened(vdev) &&
>>>> +		    fill->iommufd == vfio_iommufd_physical_ictx(vdev))
>>>> +			vfio_iommufd_physical_devid(vdev, &fill->devices[fill-
>>>> cur].dev_id);
>>>> +		else
>>>> +			fill->devices[fill->cur].dev_id = IOMMUFD_INVALID_ID;
>>>> +	} else {
>>>> +		fill->devices[fill->cur].group_id = iommu_group_id(iommu_group);
>>>> +	}
>>>>  	fill->devices[fill->cur].segment = pci_domain_nr(pdev->bus);
>>>>  	fill->devices[fill->cur].bus = pdev->bus->number;
>>>>  	fill->devices[fill->cur].devfn = pdev->devfn;
>>>> @@ -1230,17 +1266,27 @@ static int vfio_pci_ioctl_get_pci_hot_reset_info(
>>>>  		return -ENOMEM;
>>>>
>>>>  	fill.devices = devices;
>>>> +	fill.dev_set = vdev->vdev.dev_set;
>>>>
>>>> +	mutex_lock(&vdev->vdev.dev_set->lock);
>>>> +	if (vfio_device_cdev_opened(&vdev->vdev)) {
>>>> +		fill.require_devid = true;
>>>> +		fill.iommufd = vfio_iommufd_physical_ictx(&vdev->vdev);
>>>> +	}
>>>>  	ret = vfio_pci_for_each_slot_or_bus(vdev->pdev, vfio_pci_fill_devs,
>>>>  					    &fill, slot);
>>>> +	mutex_unlock(&vdev->vdev.dev_set->lock);
>>>>
>>>>  	/*
>>>>  	 * If a device was removed between counting and filling, we may come up
>>>>  	 * short of fill.max.  If a device was added, we'll have a return of
>>>>  	 * -EAGAIN above.
>>>>  	 */
>>>> -	if (!ret)
>>>> +	if (!ret) {
>>>>  		hdr.count = fill.cur;
>>>> +		if (fill.require_devid)
>>>> +			hdr.flags = VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID;
>>>> +	}
>>>>
>>>>  reset_info_exit:
>>>>  	if (copy_to_user(arg, &hdr, minsz))
>>>> @@ -2346,12 +2392,10 @@ static bool vfio_dev_in_files(struct  
>>> vfio_pci_core_device *vdev,  
>>>>  static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *data)
>>>>  {
>>>>  	struct vfio_device_set *dev_set = data;
>>>> -	struct vfio_device *cur;
>>>>
>>>> -	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
>>>> -		if (cur->dev == &pdev->dev)
>>>> -			return 0;
>>>> -	return -EBUSY;
>>>> +	lockdep_assert_held(&dev_set->lock);
>>>> +
>>>> +	return vfio_pci_find_device_in_devset(dev_set, pdev) ? 0 : -EBUSY;
>>>>  }
>>>>
>>>>  /*
>>>> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
>>>> index 25432ef213ee..5a34364e3b94 100644
>>>> --- a/include/uapi/linux/vfio.h
>>>> +++ b/include/uapi/linux/vfio.h
>>>> @@ -650,11 +650,32 @@ enum {
>>>>   * VFIO_DEVICE_GET_PCI_HOT_RESET_INFO - _IOWR(VFIO_TYPE, VFIO_BASE + 12,
>>>>   *					      struct vfio_pci_hot_reset_info)
>>>>   *
>>>> + * This command is used to query the affected devices in the hot reset for
>>>> + * a given device.  User could use the information reported by this command
>>>> + * to figure out the affected devices among the devices it has opened.
the 'opened' terminology does not look sufficient here because it is not
only a matter of the device being opened using cdev but it also needs to
have been bound to an iommufd, dev_id being the output of the
dev-iommufd binding.

By the way I am now confused. What does happen if the reset impact some
devices which are not bound to an iommu ctx. Previously we returned the
iommu group which always pre-exists but now you will report invalid id?
>>>> + * This command always reports the segment, bus and devfn information for
>>>> + * each affected device, and selectively report the group_id or the dev_id
>>>> + * per the way how the device being queried is opened.
>>>> + *	- If the device is opened via the traditional group/container manner,
>>>> + *	  this command reports the group_id for each affected device.
>>>> + *
>>>> + *	- If the device is opened as a cdev, this command needs to report  
>>> s/needs to report/reports  
>> got it.
>>
>>>> + *	  dev_id for each affected device and set the
>>>> + *	  VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID flag.  For the affected
>>>> + *	  devices that are not opened as cdev or bound to different iommufds
>>>> + *	  with the device that is queried, report an invalid dev_id to avoid  
or not bound at all
>>> s/bound to different iommufds with the device that is queried/bound to
>>> iommufds different from the reset device one?  
>> hmmm, I'm not a native speaker here. This _INFO is to query if want
>> hot reset a given device, what devices would be affected. So it appears
>> the queried device is better. But I'd admit "the queried device" is also
>> "the reset device". may Alex help pick one. 😊
> 	- If the calling device is opened directly via cdev rather than
> 	  accessed through the vfio group, the returned
> 	  vfio_pci_depdendent_device structure reports the dev_id
> 	  rather than the group_id, which is indicated by the
> 	  VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID flag in
> 	  vfio_pci_hot_reset_info.  If the reset affects devices that
> 	  are not opened within the same iommufd context as the calling
> 	  device, IOMMUFD_INVALID_ID will be provided as the dev_id.
>
> But that kind of brings to light the question of what does the user do
> when they encounter this situation.  If the device is not opened, the
> reset can complete.  If the device is opened by a different user, the
> reset is blocked.  The only logical conclusion is that the user should
> try the reset regardless of the result of the info ioctl, which the
> null-array approach further solidifies as the direction of the API.
> I'm not liking this.  Thanks,
>
> Alex

Thanks

Eric
>
>
>>>> + *	  potential dev_id conflict as dev_id is local to iommufd.  For such
>>>> + *	  affected devices, user shall fall back to use the segment, bus and
>>>> + *	  devfn info to map it to opened device.
>>>> + *
>>>>   * Return: 0 on success, -errno on failure:
>>>>   *	-enospc = insufficient buffer, -enodev = unsupported for device.
>>>>   */
>>>>  struct vfio_pci_dependent_device {
>>>> -	__u32	group_id;
>>>> +	union {
>>>> +		__u32   group_id;
>>>> +		__u32	dev_id;
>>>> +	};
>>>>  	__u16	segment;
>>>>  	__u8	bus;
>>>>  	__u8	devfn; /* Use PCI_SLOT/PCI_FUNC */
>>>> @@ -663,6 +684,7 @@ struct vfio_pci_dependent_device {
>>>>  struct vfio_pci_hot_reset_info {
>>>>  	__u32	argsz;
>>>>  	__u32	flags;
>>>> +#define VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID	(1 << 0)
>>>>  	__u32	count;
>>>>  	struct vfio_pci_dependent_device	devices[];
>>>>  };  
>>> Eric  

