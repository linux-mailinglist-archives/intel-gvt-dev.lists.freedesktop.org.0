Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ADD72D4A9
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Jun 2023 00:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCEF10E0F0;
	Mon, 12 Jun 2023 22:46:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D21710E0F0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 12 Jun 2023 22:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686609981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uw96ygv6BCbN8RZaCmP8x2EvtrfsPem903iDK/5hEsA=;
 b=g6RTKOjBDYo5l4iCMtGVcClAEm8BvbkbRTgk9AxOlinYsY0de+p2Qoj73WGlczVmo0PsXR
 jMt3t0LMoy7BLbYeIM5cG7ILx7M7BhNDeqFgM63Xk2gNHhYX1to/7lXZ79UTOYCBPrKoB1
 SBlUK3lSAvnDJh158+B7bbSk1V31Ubo=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-CQnN-I5BM9yqAQgEJuxSZw-1; Mon, 12 Jun 2023 18:46:18 -0400
X-MC-Unique: CQnN-I5BM9yqAQgEJuxSZw-1
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-33bf805e901so53991495ab.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 12 Jun 2023 15:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686609978; x=1689201978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uw96ygv6BCbN8RZaCmP8x2EvtrfsPem903iDK/5hEsA=;
 b=fiZMWEN0bx/ZhDadMOkinzKPtt1Smzmj6tic4ATn6I7q0sJUC0bwKGFmB1v8fez6Hz
 Kh4shFBUULihoOScdvX9T2Q36BAlTIQDijcfXNK+DDna/36Ik2oQnjq2TbN+YNeivO7x
 1PI81tiQbVqHGoCdKZ6redeGl1cO0Ei3uZSqdsvUBsZvCFZu8q1PVgx0SyhVJYGd4ESd
 U71Q+opnuTgu1rMLU8orXxWnK6XbmVpt96ctCmqOGll9+oMqmkVmrvBMirFCJDXWSVt/
 /vQd6TJ8LTPDzeNaQdnA345/URHwiGCksy+As991SvqvtpQM4Hh3/1igLGV9R4J0nhEx
 ENQg==
X-Gm-Message-State: AC+VfDzBmoe7rrH7/+K4UziAozJcYKYiJo336uZsjttMIP/Pyquns2Lr
 LsRnBkJY+gqFLKzLTqK6hR5hreV+/IzimMrCONZ7VZyssjpKTKh2Sv6a7k8OZo7KS+WjWuBSaCZ
 3jEFnNfJInWvmn9LlEmXWaSD96W3f5ygD4w==
X-Received: by 2002:a92:dd90:0:b0:331:5aec:5a34 with SMTP id
 g16-20020a92dd90000000b003315aec5a34mr8338494iln.0.1686609977872; 
 Mon, 12 Jun 2023 15:46:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5dfG+PFJ0UiXdi0OXecGMIBW8zpmfJBKJn2JyVoW6iOVg2ooM2fOd7rcUv+x9jNJiSnAAEng==
X-Received: by 2002:a92:dd90:0:b0:331:5aec:5a34 with SMTP id
 g16-20020a92dd90000000b003315aec5a34mr8338469iln.0.1686609977671; 
 Mon, 12 Jun 2023 15:46:17 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 l5-20020a92d8c5000000b00338a1272ce1sm3454418ilo.52.2023.06.12.15.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 15:46:17 -0700 (PDT)
Date: Mon, 12 Jun 2023 16:46:15 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v12 22/24] vfio: Remove vfio_device_is_noiommu()
Message-ID: <20230612164615.71a9211c.alex.williamson@redhat.com>
In-Reply-To: <20230602121653.80017-23-yi.l.liu@intel.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
 <20230602121653.80017-23-yi.l.liu@intel.com>
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
 clegoate@redhat.com, cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri,  2 Jun 2023 05:16:51 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> This converts noiommu test to use vfio_device->noiommu flag. Per this
> change, vfio_device_is_noiommu() is removed.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/group.c   | 2 +-
>  drivers/vfio/iommufd.c | 4 ++--
>  drivers/vfio/vfio.h    | 9 ++-------
>  3 files changed, 5 insertions(+), 10 deletions(-)

Drop this as well.  You can see here all the code paths that wouldn't
have even been compiled with CONFIG_VFIO_NOIOMMU unset.  Thanks,

Alex
 
> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> index 64cdd0ea8825..08d37811507e 100644
> --- a/drivers/vfio/group.c
> +++ b/drivers/vfio/group.c
> @@ -191,7 +191,7 @@ static int vfio_df_group_open(struct vfio_device_file *df)
>  		vfio_device_group_get_kvm_safe(device);
>  
>  	df->iommufd = device->group->iommufd;
> -	if (df->iommufd && vfio_device_is_noiommu(device) && device->open_count == 0) {
> +	if (df->iommufd && device->noiommu && device->open_count == 0) {
>  		/*
>  		 * Require no compat ioas to be assigned to proceed.  The basic
>  		 * statement is that the user cannot have done something that
> diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
> index a59ed4f881aa..fac8ca74ec85 100644
> --- a/drivers/vfio/iommufd.c
> +++ b/drivers/vfio/iommufd.c
> @@ -37,7 +37,7 @@ int vfio_iommufd_compat_attach_ioas(struct vfio_device *vdev,
>  	lockdep_assert_held(&vdev->dev_set->lock);
>  
>  	/* compat noiommu does not need to do ioas attach */
> -	if (vfio_device_is_noiommu(vdev))
> +	if (vdev->noiommu)
>  		return 0;
>  
>  	ret = iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id);
> @@ -54,7 +54,7 @@ void vfio_df_iommufd_unbind(struct vfio_device_file *df)
>  
>  	lockdep_assert_held(&vdev->dev_set->lock);
>  
> -	if (vfio_device_is_noiommu(vdev))
> +	if (vdev->noiommu)
>  		return;
>  
>  	if (vdev->ops->unbind_iommufd)
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index 1b89e8bc8571..b138b8334fe0 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -106,11 +106,6 @@ bool vfio_device_has_container(struct vfio_device *device);
>  int __init vfio_group_init(void);
>  void vfio_group_cleanup(void);
>  
> -static inline bool vfio_device_is_noiommu(struct vfio_device *vdev)
> -{
> -	return vdev->group->type == VFIO_NO_IOMMU;
> -}
> -
>  #if IS_ENABLED(CONFIG_VFIO_CONTAINER)
>  /**
>   * struct vfio_iommu_driver_ops - VFIO IOMMU driver callbacks
> @@ -271,7 +266,7 @@ void vfio_init_device_cdev(struct vfio_device *device);
>  static inline int vfio_device_add(struct vfio_device *device)
>  {
>  	/* cdev does not support noiommu device */
> -	if (vfio_device_is_noiommu(device))
> +	if (device->noiommu)
>  		return device_add(&device->device);
>  	vfio_init_device_cdev(device);
>  	return cdev_device_add(&device->cdev, &device->device);
> @@ -279,7 +274,7 @@ static inline int vfio_device_add(struct vfio_device *device)
>  
>  static inline void vfio_device_del(struct vfio_device *device)
>  {
> -	if (vfio_device_is_noiommu(device))
> +	if (device->noiommu)
>  		device_del(&device->device);
>  	else
>  		cdev_device_del(&device->cdev, &device->device);

