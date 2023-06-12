Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FF472D499
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Jun 2023 00:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DE810E106;
	Mon, 12 Jun 2023 22:42:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A3710E106
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 12 Jun 2023 22:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686609751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F75ik3Gqkzq0N+7Vu1ovwO7gqAH3ydx4ZbmNUzc5hkM=;
 b=Naw4BPVb41IY4H1V619rH7QdeRD25SQcnJxCHhaA/itT+gkOy7YWj3b5QycxGqPhEuNFsX
 TpP4kIpduE70Nw7YKnFqHTp9iKTWajOt3zbWDU+HukwInGOQGRKpFSEdONFwSpjrFaiDDC
 B2bLEqVuH6fq3N/+X/rEbVo08xA8rEg=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-9X7tDKjyPpGNslC2EoTN7w-1; Mon, 12 Jun 2023 18:42:30 -0400
X-MC-Unique: 9X7tDKjyPpGNslC2EoTN7w-1
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-7778eb7966eso589062939f.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 12 Jun 2023 15:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686609750; x=1689201750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F75ik3Gqkzq0N+7Vu1ovwO7gqAH3ydx4ZbmNUzc5hkM=;
 b=XIHbIAM7aEDiMdOSHqXFO2Hh0bPhDLzFXgNn151XbaVvKhkANebER+UfcMK/LG12/u
 Ogqlr8tmQ6Kk/6ZpD86tK68hCPe3g8/GIMIlYzbhW3mp+f8qffm8jFldKfi4Zfi9aa4i
 m1VtJTGcCobxxxLTZznPkka740sapvRoz+Uz/zTxKruQcg4C0CqURC7YtuTbVEOKbR4/
 LwGVUAzdgbbZRWA48Hyxb69TJs/gG8Q4B10yLghIdAc9MvV5ZwZ4xJStsIxgOtKBHyLi
 w6VTe8+5f94qc9LwGsJpxL3ZqoPf5zVSMsrLMMCMx6O5Pu+C4FGMSjiqjwfMd2FRAeBv
 kh/A==
X-Gm-Message-State: AC+VfDyDzSFqpIyFIwiTgTYYKwVzx7jhg9b4NDv1z4rGLXjXRqoCl+Ap
 yOGG1Y0GL3S7wjUfeS8qpm4MmORck9Q4HXjVSF8uYkZvte9xgCsOPj3DqfKyxVVNEmsq+JFyhz+
 MHZGgve0cE1Uo04Z8DrYlknYoAf1P5/jJlw==
X-Received: by 2002:a6b:7b45:0:b0:77a:ec0c:5907 with SMTP id
 m5-20020a6b7b45000000b0077aec0c5907mr7030179iop.13.1686609750031; 
 Mon, 12 Jun 2023 15:42:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ659aPve/JGIQqnJc4um0EzETnEkwaU4sAoCUXmtup2XV1i32AN8041DFRUd8E22BOJmpf8JA==
X-Received: by 2002:a6b:7b45:0:b0:77a:ec0c:5907 with SMTP id
 m5-20020a6b7b45000000b0077aec0c5907mr7030155iop.13.1686609749769; 
 Mon, 12 Jun 2023 15:42:29 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 h19-20020a02c4d3000000b0041f52ea3514sm2963153jaj.158.2023.06.12.15.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 15:42:29 -0700 (PDT)
Date: Mon, 12 Jun 2023 16:42:28 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v12 21/24] vfio: Determine noiommu device in
 __vfio_register_dev()
Message-ID: <20230612164228.65b500e0.alex.williamson@redhat.com>
In-Reply-To: <20230602121653.80017-22-yi.l.liu@intel.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
 <20230602121653.80017-22-yi.l.liu@intel.com>
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

On Fri,  2 Jun 2023 05:16:50 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> This moves the noiommu device determination and noiommu taint out of
> vfio_group_find_or_alloc(). noiommu device is determined in
> __vfio_register_dev() and result is stored in flag vfio_device->noiommu,
> the noiommu taint is added in the end of __vfio_register_dev().
> 
> This is also a preparation for compiling out vfio_group infrastructure
> as it makes the noiommu detection and taint common between the cdev path
> and group path though cdev path does not support noiommu.

Does this really still make sense?  The motivation for the change is
really not clear without cdev support for noiommu.  Thanks,

Alex
 
> Suggested-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/group.c     | 15 ---------------
>  drivers/vfio/vfio_main.c | 31 ++++++++++++++++++++++++++++++-
>  include/linux/vfio.h     |  1 +
>  3 files changed, 31 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> index 653b62f93474..64cdd0ea8825 100644
> --- a/drivers/vfio/group.c
> +++ b/drivers/vfio/group.c
> @@ -668,21 +668,6 @@ static struct vfio_group *vfio_group_find_or_alloc(struct device *dev)
>  	struct vfio_group *group;
>  
>  	iommu_group = iommu_group_get(dev);
> -	if (!iommu_group && vfio_noiommu) {
> -		/*
> -		 * With noiommu enabled, create an IOMMU group for devices that
> -		 * don't already have one, implying no IOMMU hardware/driver
> -		 * exists.  Taint the kernel because we're about to give a DMA
> -		 * capable device to a user without IOMMU protection.
> -		 */
> -		group = vfio_noiommu_group_alloc(dev, VFIO_NO_IOMMU);
> -		if (!IS_ERR(group)) {
> -			add_taint(TAINT_USER, LOCKDEP_STILL_OK);
> -			dev_warn(dev, "Adding kernel taint for vfio-noiommu group on device\n");
> -		}
> -		return group;
> -	}
> -
>  	if (!iommu_group)
>  		return ERR_PTR(-EINVAL);
>  
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 6d8f9b0f3637..00a699b9f76b 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -265,6 +265,18 @@ static int vfio_init_device(struct vfio_device *device, struct device *dev,
>  	return ret;
>  }
>  
> +static int vfio_device_set_noiommu(struct vfio_device *device)
> +{
> +	struct iommu_group *iommu_group = iommu_group_get(device->dev);
> +
> +	if (!iommu_group && !vfio_noiommu)
> +		return -EINVAL;
> +
> +	device->noiommu = !iommu_group;
> +	iommu_group_put(iommu_group); /* Accepts NULL */
> +	return 0;
> +}
> +
>  static int __vfio_register_dev(struct vfio_device *device,
>  			       enum vfio_group_type type)
>  {
> @@ -277,6 +289,13 @@ static int __vfio_register_dev(struct vfio_device *device,
>  		     !device->ops->detach_ioas)))
>  		return -EINVAL;
>  
> +	/* Only physical devices can be noiommu device */
> +	if (type == VFIO_IOMMU) {
> +		ret = vfio_device_set_noiommu(device);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	/*
>  	 * If the driver doesn't specify a set then the device is added to a
>  	 * singleton set just for itself.
> @@ -288,7 +307,8 @@ static int __vfio_register_dev(struct vfio_device *device,
>  	if (ret)
>  		return ret;
>  
> -	ret = vfio_device_set_group(device, type);
> +	ret = vfio_device_set_group(device,
> +				    device->noiommu ? VFIO_NO_IOMMU : type);
>  	if (ret)
>  		return ret;
>  
> @@ -301,6 +321,15 @@ static int __vfio_register_dev(struct vfio_device *device,
>  
>  	vfio_device_group_register(device);
>  
> +	if (device->noiommu) {
> +		/*
> +		 * noiommu deivces have no IOMMU hardware/driver.  Taint the
> +		 * kernel because we're about to give a DMA capable device to
> +		 * a user without IOMMU protection.
> +		 */
> +		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
> +		dev_warn(device->dev, "Adding kernel taint for vfio-noiommu on device\n");
> +	}
>  	return 0;
>  err_out:
>  	vfio_device_remove_group(device);
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index e80a8ac86e46..183e620009e7 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -67,6 +67,7 @@ struct vfio_device {
>  	bool iommufd_attached;
>  #endif
>  	bool cdev_opened:1;
> +	bool noiommu:1;
>  };
>  
>  /**

