Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EBF6F0DD9
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Apr 2023 23:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C7E10E187;
	Thu, 27 Apr 2023 21:55:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DB210E181
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Apr 2023 21:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682632528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5fzyLq8vaXX2WkxkBurVk4i9r+MSL0BjCV2zrmsNLg=;
 b=dUW+eU1R/pH6gjY41Ood1Cke7Pjs4P4x2A/LhAIaMhBTvgfU6kpj9C6lxqvzaUHGG55rkL
 +2n2OZ3IVMFMVzfK0uMdjQWsUM/vQQ/B+BX3dCkSVJIgZrVkBm8KS+jYb/EUUTremRE0pg
 xdV1u3rzZsVXOJdc03HGfBXMGlNko1I=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-kcI4-jx8N4mFhflLrXR7iA-1; Thu, 27 Apr 2023 17:55:27 -0400
X-MC-Unique: kcI4-jx8N4mFhflLrXR7iA-1
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-329572e5abeso137194885ab.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Apr 2023 14:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682632527; x=1685224527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I5fzyLq8vaXX2WkxkBurVk4i9r+MSL0BjCV2zrmsNLg=;
 b=NUP4olTgQ7Zhi2toBzh0gAUHink/2Tm/dcZCsKBhpXiBe8KF/BY3/ZXDjN+oHWYWDn
 zTzp23pCFq68B3E01bH0bZI2uHjYgEHN+NFwUw0vWPy17H67IQpUiObWCo7be6e0/ppT
 GFB5vdbca+WnmLma5PfyhJCKaqd4WgmPPo36Nc+bRnUKI2b2KhamXSoWR9o0CQq7BPUr
 qLNBRD3HAzmM4n0or0+4oMoebI8wo0mAWDLXLl9NLx5laHE0HtdiRSJpVe3Ykn1w8tao
 BCx9yewAQxuVQG6H0DO1ecfsChiYmaslTAF74ew0Ur4yMxlmA3iMnTyBoDeLvUA1Mu2p
 RO5g==
X-Gm-Message-State: AC+VfDyGg82uPiXfivx6mYiOeYHh0F8QY/qknqM5QjOVp4v4TEaJP2fz
 f+3DKFgzPlxNi+iZ3Mef5iLLqYVJPQrKEOQhlAIVwYeEOWo40IXCtdw+CoeCilvb4F91oIaM+R6
 IvyaLZONom000wYPHa6Jjt5S8hGqrSOJQyg==
X-Received: by 2002:a92:130a:0:b0:32b:c70b:92af with SMTP id
 10-20020a92130a000000b0032bc70b92afmr2068521ilt.16.1682632526825; 
 Thu, 27 Apr 2023 14:55:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4uoLHWlrAANpBduD0DHlq1d1KUlStgxbwMdzX1TBpEVi+MUMWdM8WFF+f3sWR2GcPTn+UIaA==
X-Received: by 2002:a92:130a:0:b0:32b:c70b:92af with SMTP id
 10-20020a92130a000000b0032bc70b92afmr2068509ilt.16.1682632526504; 
 Thu, 27 Apr 2023 14:55:26 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 x14-20020a056638248e00b0040fadb4f6d8sm5905986jat.81.2023.04.27.14.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 14:55:25 -0700 (PDT)
Date: Thu, 27 Apr 2023 15:55:24 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v4 9/9] vfio/pci: Allow passing zero-length fd array in
 VFIO_DEVICE_PCI_HOT_RESET
Message-ID: <20230427155524.732c878d.alex.williamson@redhat.com>
In-Reply-To: <20230426145419.450922-10-yi.l.liu@intel.com>
References: <20230426145419.450922-1-yi.l.liu@intel.com>
 <20230426145419.450922-10-yi.l.liu@intel.com>
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

On Wed, 26 Apr 2023 07:54:19 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> This is the way user to invoke hot-reset for the devices opened by cdev
> interface. User should check the flag VFIO_PCI_HOT_RESET_FLAG_RESETTABLE
> in the output of VFIO_DEVICE_GET_PCI_HOT_RESET_INFO ioctl before doing
> hot-reset for cdev devices.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 66 +++++++++++++++++++++++++++-----
>  include/uapi/linux/vfio.h        | 22 +++++++++++
>  2 files changed, 79 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 43858d471447..f70e3b948b16 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -180,7 +180,8 @@ static void vfio_pci_probe_mmaps(struct vfio_pci_core_device *vdev)
>  struct vfio_pci_group_info;
>  static void vfio_pci_dev_set_try_reset(struct vfio_device_set *dev_set);
>  static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
> -				      struct vfio_pci_group_info *groups);
> +				      struct vfio_pci_group_info *groups,
> +				      struct iommufd_ctx *iommufd_ctx);
>  
>  /*
>   * INTx masking requires the ability to disable INTx signaling via PCI_COMMAND
> @@ -1364,8 +1365,7 @@ vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
>  	if (ret)
>  		return ret;
>  
> -	/* Somewhere between 1 and count is OK */
> -	if (!array_count || array_count > count)
> +	if (array_count > count)
>  		return -EINVAL;

Doesn't this need a || vfio_device_cdev_opened(vdev) test as well?
It's invalid to pass fds for a cdev device.  Presumably it would fail
later collecting group fds as well, but might as well enforce the
semantics early.

>  
>  	group_fds = kcalloc(array_count, sizeof(*group_fds), GFP_KERNEL);
> @@ -1414,7 +1414,7 @@ vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
>  	info.count = array_count;
>  	info.files = files;
>  
> -	ret = vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, &info);
> +	ret = vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, &info, NULL);
>  
>  hot_reset_release:
>  	for (file_idx--; file_idx >= 0; file_idx--)
> @@ -1429,6 +1429,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
>  {
>  	unsigned long minsz = offsetofend(struct vfio_pci_hot_reset, count);
>  	struct vfio_pci_hot_reset hdr;
> +	struct iommufd_ctx *iommufd;
>  	bool slot = false;
>  
>  	if (copy_from_user(&hdr, arg, minsz))
> @@ -1443,7 +1444,12 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
>  	else if (pci_probe_reset_bus(vdev->pdev->bus))
>  		return -ENODEV;
>  
> -	return vfio_pci_ioctl_pci_hot_reset_groups(vdev, hdr.count, slot, arg);
> +	if (hdr.count)
> +		return vfio_pci_ioctl_pci_hot_reset_groups(vdev, hdr.count, slot, arg);
> +
> +	iommufd = vfio_iommufd_physical_ictx(&vdev->vdev);
> +
> +	return vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, NULL, iommufd);

Why did we need to store iommufd in a variable?

>  }
>  
>  static int vfio_pci_ioctl_ioeventfd(struct vfio_pci_core_device *vdev,
> @@ -2415,6 +2421,9 @@ static bool vfio_dev_in_groups(struct vfio_pci_core_device *vdev,
>  {
>  	unsigned int i;
>  
> +	if (!groups)
> +		return false;
> +
>  	for (i = 0; i < groups->count; i++)
>  		if (vfio_file_has_dev(groups->files[i], &vdev->vdev))
>  			return true;
> @@ -2488,13 +2497,38 @@ static int vfio_pci_dev_set_pm_runtime_get(struct vfio_device_set *dev_set)
>  	return ret;
>  }
>  
> +static bool vfio_dev_in_iommufd_ctx(struct vfio_pci_core_device *vdev,
> +				    struct iommufd_ctx *iommufd_ctx)
> +{
> +	struct iommufd_ctx *iommufd = vfio_iommufd_physical_ictx(&vdev->vdev);
> +	struct iommu_group *iommu_group;
> +
> +	if (!iommufd_ctx)
> +		return false;
> +
> +	if (iommufd == iommufd_ctx)
> +		return true;
> +
> +	iommu_group = iommu_group_get(vdev->vdev.dev);
> +	if (!iommu_group)
> +		return false;
> +
> +	/*
> +	 * Try to check if any device within iommu_group is bound with
> +	 * the input iommufd_ctx.
> +	 */
> +	return vfio_devset_iommufd_has_group(vdev->vdev.dev_set,
> +					     iommufd_ctx, iommu_group);
> +}

This last test makes this not do what the function name suggests it
does.  If it were true, the device is not in the iommufd_ctx, it simply
cannot be within another iommu ctx.

> +
>  /*
>   * We need to get memory_lock for each device, but devices can share mmap_lock,
>   * therefore we need to zap and hold the vma_lock for each device, and only then
>   * get each memory_lock.
>   */
>  static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
> -				      struct vfio_pci_group_info *groups)
> +				      struct vfio_pci_group_info *groups,
> +				      struct iommufd_ctx *iommufd_ctx)
>  {
>  	struct vfio_pci_core_device *cur_mem;
>  	struct vfio_pci_core_device *cur_vma;
> @@ -2525,10 +2559,24 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>  
>  	list_for_each_entry(cur_vma, &dev_set->device_list, vdev.dev_set_list) {
>  		/*
> -		 * Test whether all the affected devices are contained by the
> -		 * set of groups provided by the user.
> +		 * Test whether all the affected devices can be reset by the
> +		 * user.
> +		 *
> +		 * If user provides a set of groups, all the opened devices
> +		 * in the dev_set should be contained by the set of groups
> +		 * provided by the user.
> +		 *
> +		 * If user provides a zero-length group fd array, then all
> +		 * the affected devices must be bound to same iommufd_ctx as
> +		 * the input iommufd_ctx.  If there is device that has not
> +		 * been bound to iommufd_ctx yet, shall check if there is any
> +		 * device within its iommu_group that has been bound to the
> +		 * input iommufd_ctx.
> +		 *
> +		 * Otherwise, reset is not allowed.
>  		 */
> -		if (!vfio_dev_in_groups(cur_vma, groups)) {
> +		if (!vfio_dev_in_groups(cur_vma, groups) &&
> +		    !vfio_dev_in_iommufd_ctx(cur_vma, iommufd_ctx)) {


Rather than mangling vfio_dev_in_groups() and inventing
vfio_dev_in_iommufd_ctx() that doesn't do what it implies, how about:

bool vfio_device_owned(struct vfio_device *vdev,
		       struct vfio_pci_group_info *groups,
		       struct iommufd_ctx *iommufd_ctx)
{
	struct iommu_group *group;

	WARN_ON(!!groups == !!iommufd_ctx);

	if (groups)
		return vfio_dev_in_groups(vdev, groups));

	if (vfio_iommufd_physical_ictx(vdev) == iommufd_ctx)
		return true;

	group = iommu_group_get(vdev->dev);
	if (group)
		return vfio_devset_iommufd_has_group(vdev->vdev.dev_set,
						     iommufd_ctx, group);
	return false;
}

Seems like such a function would live in vfio_main.c

>  			ret = -EINVAL;
>  			goto err_undo;
>  		}
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 4b4e2c28984b..1241d02d8701 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -710,6 +710,28 @@ struct vfio_pci_hot_reset_info {
>   * VFIO_DEVICE_PCI_HOT_RESET - _IOW(VFIO_TYPE, VFIO_BASE + 13,
>   *				    struct vfio_pci_hot_reset)
>   *
> + * Userspace requests hot reset for the devices it operates.  Due to the
> + * underlying topology, multiple devices can be affected in the reset
> + * while some might be opened by another user.  To avoid interference
> + * the calling user must ensure all affected devices are owned by itself.
> + * The ownership proof needs to refer the output of
> + * VFIO_DEVICE_GET_PCI_HOT_RESET_INFO.  Ownership can be proved as:
> + *
> + *   1) An array of group fds - This is used for the devices opened via
> + *				the group/container interface.
> + *   2) A zero-length array - This is used for the devices opened via
> + *			      the cdev interface.  User should check the
> + *			      flag VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID
> + *			      and flag VFIO_PCI_HOT_RESET_FLAG_RESETTABLE
> + *			      before using this method.
> + *
> + * In case a non void group fd array is passed, the devices affected by
> + * the reset must belong to those opened VFIO groups.  In case a zero
> + * length array is passed, the other devices affected by the reset, if
> + * any, must be either bound to the same iommufd as this VFIO device or
> + * in the same iommu_group with a device that does.  Either of the two
> + * methods is applied to check the feasibility of the hot reset.

This should probably just refer to the concept of ownership described
in the INFO ioctl and clarify that cdev opened device must exclusively
provide an empty array and group opened devices must exclusively use an
array of group fds for proof of ownership.  Mixed access to devices
between cdev and legacy groups are not supported by this interface.
Thanks,

Alex

> + *
>   * Return: 0 on success, -errno on failure.
>   */
>  struct vfio_pci_hot_reset {

