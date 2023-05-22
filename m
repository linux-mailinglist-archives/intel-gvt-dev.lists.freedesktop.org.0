Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B5D70CD9F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 23 May 2023 00:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8016D10E3A3;
	Mon, 22 May 2023 22:15:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664EF10E3A3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 May 2023 22:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684793738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/wpX6oIs/hyRRACUSQVIZ8LfVgaDNLnjGaFoeGml7/c=;
 b=hcdmb/ItbsBuARkxaNN+Go0uzuRl7i3cTHfOZTMqfFRRdKvFhlDS5LpvUfrwmbs2H0v4EV
 JaR9F28ebi6l8AwCZVGm6IVfyYa57ic1aY9Av50naB9Jv+z6EnZUC6/9p+w2wVHrSS6BiH
 FG254oj+m7yQw5ukbINmTWS8/MIoHQM=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-KJZ4mXxFPpuDvveb6CgLBA-1; Mon, 22 May 2023 18:15:37 -0400
X-MC-Unique: KJZ4mXxFPpuDvveb6CgLBA-1
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3381796d685so2272745ab.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 May 2023 15:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684793736; x=1687385736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/wpX6oIs/hyRRACUSQVIZ8LfVgaDNLnjGaFoeGml7/c=;
 b=ZSnF5Cn9IFCDH7o2xR7uRpWcGwWy0G985Utkz7nWZVUICp8i1iHkPsl+oJH8zNpLlu
 xHwV4BcgGIhOt7fRD+qj37ESpKxfrhOXfSOC/OUR9nGUvoDP3MG52DP6XbKwWR7zKPOq
 kGwyXSJ7Y8vUJsAGKereqZa+/TTbIvbNHlj9NdeMOR/h8hYjJ7y+OyiN+Icv5No3HQDa
 BKxaINhSP6oAvEUm4WTiBapcQ4qscT4/b+jZlq2cGP7+XSkY6v+b3CLNX1v/pm1iex18
 36SQBsVsikK4y7P045eHeq6YZulGkQxCjprDZw9MqgfFVCFRfx6i3dcuZNpUNM+bCx4x
 MS3g==
X-Gm-Message-State: AC+VfDxB3k2FWLoz+RG6bjhqfl64LtZ7wh6PHDphCxx6OFXbuvtf+C+h
 qPyihTr3k6q9csjMxD5vPkpb6baxUiXN5lEfN3SCDYbAtuqOYQ/nevrO9ivvNkhi6XHI3ZEh/sC
 B1YODDbBkUzP278fM6CGoToI8Q63jrZmz8w==
X-Received: by 2002:a92:d301:0:b0:337:3577:2862 with SMTP id
 x1-20020a92d301000000b0033735772862mr6980748ila.16.1684793736238; 
 Mon, 22 May 2023 15:15:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ55jCuKlbq3Ozr4tNWRn1NofklXnvZPB1Fi8hI05bjBLPnb/B4ra87IZXI1ZUIBlA4SWm9/2w==
X-Received: by 2002:a92:d301:0:b0:337:3577:2862 with SMTP id
 x1-20020a92d301000000b0033735772862mr6980731ila.16.1684793735820; 
 Mon, 22 May 2023 15:15:35 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 o4-20020a92c684000000b0033842c3f6b4sm2018805ilg.83.2023.05.22.15.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 15:15:35 -0700 (PDT)
Date: Mon, 22 May 2023 16:15:34 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v11 20/23] vfio: Add VFIO_DEVICE_[AT|DE]TACH_IOMMUFD_PT
Message-ID: <20230522161534.32f3bf8e.alex.williamson@redhat.com>
In-Reply-To: <20230513132827.39066-21-yi.l.liu@intel.com>
References: <20230513132827.39066-1-yi.l.liu@intel.com>
 <20230513132827.39066-21-yi.l.liu@intel.com>
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

On Sat, 13 May 2023 06:28:24 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> This adds ioctl for userspace to attach device cdev fd to and detach
> from IOAS/hw_pagetable managed by iommufd.
> 
>     VFIO_DEVICE_ATTACH_IOMMUFD_PT: attach vfio device to IOAS, hw_pagetable
> 				   managed by iommufd. Attach can be
> 				   undo by VFIO_DEVICE_DETACH_IOMMUFD_PT
> 				   or device fd close.
>     VFIO_DEVICE_DETACH_IOMMUFD_PT: detach vfio device from the current attached
> 				   IOAS or hw_pagetable managed by iommufd.
> 
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/device_cdev.c | 66 ++++++++++++++++++++++++++++++++++++++
>  drivers/vfio/iommufd.c     | 18 +++++++++++
>  drivers/vfio/vfio.h        | 18 +++++++++++
>  drivers/vfio/vfio_main.c   |  8 +++++
>  include/uapi/linux/vfio.h  | 52 ++++++++++++++++++++++++++++++
>  5 files changed, 162 insertions(+)
> 
> diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
> index 291cc678a18b..3f14edb80a93 100644
> --- a/drivers/vfio/device_cdev.c
> +++ b/drivers/vfio/device_cdev.c
> @@ -174,6 +174,72 @@ long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
>  	return ret;
>  }
>  
> +int vfio_ioctl_device_attach(struct vfio_device_file *df,
> +			     struct vfio_device_attach_iommufd_pt __user *arg)
> +{
> +	struct vfio_device *device = df->device;
> +	struct vfio_device_attach_iommufd_pt attach;
> +	unsigned long minsz;
> +	int ret;
> +
> +	minsz = offsetofend(struct vfio_device_attach_iommufd_pt, pt_id);
> +
> +	if (copy_from_user(&attach, arg, minsz))
> +		return -EFAULT;
> +
> +	if (attach.argsz < minsz || attach.flags)
> +		return -EINVAL;
> +
> +	/* ATTACH only allowed for cdev fds */
> +	if (df->group)
> +		return -EINVAL;
> +
> +	mutex_lock(&device->dev_set->lock);
> +	ret = vfio_iommufd_attach(device, &attach.pt_id);
> +	if (ret)
> +		goto out_unlock;
> +
> +	ret = copy_to_user(&arg->pt_id, &attach.pt_id,
> +			   sizeof(attach.pt_id)) ? -EFAULT : 0;
> +	if (ret)
> +		goto out_detach;
> +	mutex_unlock(&device->dev_set->lock);
> +
> +	return 0;
> +
> +out_detach:
> +	vfio_iommufd_detach(device);
> +out_unlock:
> +	mutex_unlock(&device->dev_set->lock);
> +	return ret;
> +}
> +
> +int vfio_ioctl_device_detach(struct vfio_device_file *df,
> +			     struct vfio_device_detach_iommufd_pt __user *arg)
> +{
> +	struct vfio_device *device = df->device;
> +	struct vfio_device_detach_iommufd_pt detach;
> +	unsigned long minsz;
> +
> +	minsz = offsetofend(struct vfio_device_detach_iommufd_pt, flags);
> +
> +	if (copy_from_user(&detach, arg, minsz))
> +		return -EFAULT;
> +
> +	if (detach.argsz < minsz || detach.flags)
> +		return -EINVAL;
> +
> +	/* DETACH only allowed for cdev fds */
> +	if (df->group)
> +		return -EINVAL;
> +
> +	mutex_lock(&device->dev_set->lock);
> +	vfio_iommufd_detach(device);
> +	mutex_unlock(&device->dev_set->lock);
> +
> +	return 0;
> +}
> +
>  static char *vfio_device_devnode(const struct device *dev, umode_t *mode)
>  {
>  	return kasprintf(GFP_KERNEL, "vfio/devices/%s", dev_name(dev));
> diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
> index 83575b65ea01..799ea322a7d4 100644
> --- a/drivers/vfio/iommufd.c
> +++ b/drivers/vfio/iommufd.c
> @@ -112,6 +112,24 @@ void vfio_iommufd_unbind(struct vfio_device_file *df)
>  		vdev->ops->unbind_iommufd(vdev);
>  }
>  
> +int vfio_iommufd_attach(struct vfio_device *vdev, u32 *pt_id)
> +{
> +	lockdep_assert_held(&vdev->dev_set->lock);
> +
> +	if (vfio_device_is_noiommu(vdev))
> +		return 0;

Isn't this an invalid operation for a noiommu cdev, ie. -EINVAL?  We
return success and copy back the provided pt_id, why would a user not
consider it a bug that they can't use whatever value was there with
iommufd?

> +
> +	return vdev->ops->attach_ioas(vdev, pt_id);
> +}
> +
> +void vfio_iommufd_detach(struct vfio_device *vdev)
> +{
> +	lockdep_assert_held(&vdev->dev_set->lock);
> +
> +	if (!vfio_device_is_noiommu(vdev))
> +		vdev->ops->detach_ioas(vdev);
> +}
> +
>  struct iommufd_ctx *vfio_iommufd_physical_ictx(struct vfio_device *vdev)
>  {
>  	if (vdev->iommufd_device)
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index 8b359a7794be..50553f67600f 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -241,6 +241,8 @@ int vfio_iommufd_bind(struct vfio_device_file *df);
>  void vfio_iommufd_unbind(struct vfio_device_file *df);
>  int vfio_iommufd_compat_attach_ioas(struct vfio_device *device,
>  				    struct iommufd_ctx *ictx);
> +int vfio_iommufd_attach(struct vfio_device *vdev, u32 *pt_id);
> +void vfio_iommufd_detach(struct vfio_device *vdev);
>  #else
>  static inline int
>  vfio_iommufd_compat_probe_noiommu(struct vfio_device *device,
> @@ -282,6 +284,10 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep);
>  void vfio_device_cdev_close(struct vfio_device_file *df);
>  long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
>  				    struct vfio_device_bind_iommufd __user *arg);
> +int vfio_ioctl_device_attach(struct vfio_device_file *df,
> +			     struct vfio_device_attach_iommufd_pt __user *arg);
> +int vfio_ioctl_device_detach(struct vfio_device_file *df,
> +			     struct vfio_device_detach_iommufd_pt __user *arg);
>  int vfio_cdev_init(struct class *device_class);
>  void vfio_cdev_cleanup(void);
>  #else
> @@ -315,6 +321,18 @@ static inline long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
>  	return -EOPNOTSUPP;
>  }
>  
> +static inline int vfio_ioctl_device_attach(struct vfio_device_file *df,
> +					   struct vfio_device_attach_iommufd_pt __user *arg)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int vfio_ioctl_device_detach(struct vfio_device_file *df,
> +					   struct vfio_device_detach_iommufd_pt __user *arg)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
>  static inline int vfio_cdev_init(struct class *device_class)
>  {
>  	return 0;
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index c9fa39ac4b02..8c3f26b4929b 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -1165,6 +1165,14 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
>  		ret = vfio_ioctl_device_feature(device, (void __user *)arg);
>  		break;
>  
> +	case VFIO_DEVICE_ATTACH_IOMMUFD_PT:
> +		ret = vfio_ioctl_device_attach(df, (void __user *)arg);
> +		break;
> +
> +	case VFIO_DEVICE_DETACH_IOMMUFD_PT:
> +		ret = vfio_ioctl_device_detach(df, (void __user *)arg);
> +		break;
> +
>  	default:
>  		if (unlikely(!device->ops->ioctl))
>  			ret = -EINVAL;
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 07c917de31e9..770f5f949929 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -222,6 +222,58 @@ struct vfio_device_bind_iommufd {
>  
>  #define VFIO_DEVICE_BIND_IOMMUFD	_IO(VFIO_TYPE, VFIO_BASE + 19)
>  
> +/*
> + * VFIO_DEVICE_ATTACH_IOMMUFD_PT - _IOW(VFIO_TYPE, VFIO_BASE + 20,
> + *					struct vfio_device_attach_iommufd_pt)
> + *
> + * Attach a vfio device to an iommufd address space specified by IOAS
> + * id or hw_pagetable (hwpt) id.
> + *
> + * Available only after a device has been bound to iommufd via
> + * VFIO_DEVICE_BIND_IOMMUFD
> + *
> + * Undo by VFIO_DEVICE_DETACH_IOMMUFD_PT or device fd close.
> + *
> + * @argsz:	User filled size of this data.
> + * @flags:	Must be 0.
> + * @pt_id:	Input the target id which can represent an ioas or a hwpt
> + *		allocated via iommufd subsystem.
> + *		Output the input ioas id or the attached hwpt id which could
> + *		be the specified hwpt itself or a hwpt automatically created
> + *		for the specified ioas by kernel during the attachment.
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +struct vfio_device_attach_iommufd_pt {
> +	__u32	argsz;
> +	__u32	flags;
> +	__u32	pt_id;
> +};
> +
> +#define VFIO_DEVICE_ATTACH_IOMMUFD_PT		_IO(VFIO_TYPE, VFIO_BASE + 20)
> +
> +/*
> + * VFIO_DEVICE_DETACH_IOMMUFD_PT - _IOW(VFIO_TYPE, VFIO_BASE + 21,
> + *					struct vfio_device_detach_iommufd_pt)
> + *
> + * Detach a vfio device from the iommufd address space it has been
> + * attached to. After it, device should be in a blocking DMA state.
> + *
> + * Available only after a device has been bound to iommufd via
> + * VFIO_DEVICE_BIND_IOMMUFD.

These "[a]vailable only after" comments are meaningless, if the user
has the file descriptor the ioctl is available.  We can say that ATTACH
should be used after BIND to associate the device with an address space
within the bound iommufd and DETACH removes that association, but the
user is welcome to call everything in the wrong order and we need to be
prepared for that anyway.  Thanks,

Alex

> + *
> + * @argsz:	User filled size of this data.
> + * @flags:	Must be 0.
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +struct vfio_device_detach_iommufd_pt {
> +	__u32	argsz;
> +	__u32	flags;
> +};
> +
> +#define VFIO_DEVICE_DETACH_IOMMUFD_PT		_IO(VFIO_TYPE, VFIO_BASE + 21)
> +
>  /**
>   * VFIO_DEVICE_GET_INFO - _IOR(VFIO_TYPE, VFIO_BASE + 7,
>   *						struct vfio_device_info)

