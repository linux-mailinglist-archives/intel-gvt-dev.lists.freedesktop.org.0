Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB8272D459
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Jun 2023 00:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EBC10E2C6;
	Mon, 12 Jun 2023 22:27:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF73510E1E7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 12 Jun 2023 22:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686608850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u7yFiATbLIA5V3pSv1HQvfxsdGnzO7UHaWzDCSMoHuI=;
 b=Rl7mFHK8keoOQGHgrWyU7HwbOnT7tYtqq6dIDAWaY66y+Mp2E0FLMFyA3ULStX4WSnJKg2
 56Dzu7Vy7Kz3AwSGURU7/Q882fg6n+rUxnDwVw+5LwdhT/PIg9GLKD5cUIwm0rv7Vm9nMa
 7pt1Z1A61WP0GSfVDb9ZY9VqNTJn+qU=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-T398q4OUMuS1-G6X-y0sCg-1; Mon, 12 Jun 2023 18:27:29 -0400
X-MC-Unique: T398q4OUMuS1-G6X-y0sCg-1
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-33fd4eed094so21872165ab.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 12 Jun 2023 15:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686608848; x=1689200848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u7yFiATbLIA5V3pSv1HQvfxsdGnzO7UHaWzDCSMoHuI=;
 b=WorutQ/k3V7VOebxF9/i6LCM2Qc2v6urE95S32L8dvVOfL6LCItkThIo/CPxUM8uRD
 LEmkAImKJfa8vAFnPJTLW/hQOmf3mb8vcwustisg7iLVtMolF69MgGEHq/jJGN9y4FEX
 JVmtIulFhZdRCzKtH88F9F8tdPJsj8wUpPS7caMis0u5KGsTn2p4objnwc8XgXFWLQVw
 13omDFHwygO2YNWw3t0H/251X0QAdpz735wogGeJchHLHPupMyCUPE9i9a82653Ljgsn
 of+Qb/UiTFc0+9nKRmxLfKhZmr+moKaVWX1/0P075nkLMFvIZxYIWvUjc+rRKGyPOgOO
 jJQg==
X-Gm-Message-State: AC+VfDw49SfLX+f5G5El43Lu6r3sNRl+2ww+67YmYGnQ4Xp0U35zd/pL
 Mv9MgRRFl1gKhBJAeF6WZKywCNArT7W+8hce00fHpnw3X42Am+fcc8KRVMbiAWOL6GmsjbhJD5a
 JKlf2g8aDZVZXIaclRjeWuYrL8ooXkrP9Tw==
X-Received: by 2002:a92:ceca:0:b0:33d:73fe:3971 with SMTP id
 z10-20020a92ceca000000b0033d73fe3971mr7870205ilq.9.1686608848564; 
 Mon, 12 Jun 2023 15:27:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7w5e5PisRLS7jAQzwuZKoWDibRbgbo3q542VRJEJXviOc0ggWMLi4p4yFG27CG0GdHn8jwIw==
X-Received: by 2002:a92:ceca:0:b0:33d:73fe:3971 with SMTP id
 z10-20020a92ceca000000b0033d73fe3971mr7870190ilq.9.1686608848252; 
 Mon, 12 Jun 2023 15:27:28 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 p10-20020a0566380e8a00b00420e045a3ddsm3018327jas.148.2023.06.12.15.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 15:27:27 -0700 (PDT)
Date: Mon, 12 Jun 2023 16:27:26 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v12 18/24] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Message-ID: <20230612162726.16f58ea4.alex.williamson@redhat.com>
In-Reply-To: <20230602121653.80017-19-yi.l.liu@intel.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
 <20230602121653.80017-19-yi.l.liu@intel.com>
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

On Fri,  2 Jun 2023 05:16:47 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> This adds ioctl for userspace to bind device cdev fd to iommufd.
> 
>     VFIO_DEVICE_BIND_IOMMUFD: bind device to an iommufd, hence gain DMA
> 			      control provided by the iommufd. open_device
> 			      op is called after bind_iommufd op.
> 
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/device_cdev.c | 123 +++++++++++++++++++++++++++++++++++++
>  drivers/vfio/vfio.h        |  13 ++++
>  drivers/vfio/vfio_main.c   |   5 ++
>  include/linux/vfio.h       |   3 +-
>  include/uapi/linux/vfio.h  |  27 ++++++++
>  5 files changed, 170 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
> index 1c640016a824..a4498ddbe774 100644
> --- a/drivers/vfio/device_cdev.c
> +++ b/drivers/vfio/device_cdev.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2023 Intel Corporation.
>   */
>  #include <linux/vfio.h>
> +#include <linux/iommufd.h>
>  
>  #include "vfio.h"
>  
> @@ -44,6 +45,128 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
>  	return ret;
>  }
>  
> +static void vfio_device_get_kvm_safe(struct vfio_device_file *df)
> +{
> +	spin_lock(&df->kvm_ref_lock);
> +	if (df->kvm)
> +		_vfio_device_get_kvm_safe(df->device, df->kvm);
> +	spin_unlock(&df->kvm_ref_lock);
> +}
> +
> +void vfio_df_cdev_close(struct vfio_device_file *df)
> +{
> +	struct vfio_device *device = df->device;
> +
> +	/*
> +	 * In the time of close, there is no contention with another one
> +	 * changing this flag.  So read df->access_granted without lock
> +	 * and no smp_load_acquire() is ok.
> +	 */
> +	if (!df->access_granted)
> +		return;
> +
> +	mutex_lock(&device->dev_set->lock);
> +	vfio_df_close(df);
> +	vfio_device_put_kvm(device);
> +	iommufd_ctx_put(df->iommufd);
> +	device->cdev_opened = false;
> +	mutex_unlock(&device->dev_set->lock);
> +	vfio_device_unblock_group(device);
> +}
> +
> +static struct iommufd_ctx *vfio_get_iommufd_from_fd(int fd)
> +{
> +	struct iommufd_ctx *iommufd;
> +	struct fd f;
> +
> +	f = fdget(fd);
> +	if (!f.file)
> +		return ERR_PTR(-EBADF);
> +
> +	iommufd = iommufd_ctx_from_file(f.file);
> +
> +	fdput(f);
> +	return iommufd;
> +}
> +
> +long vfio_df_ioctl_bind_iommufd(struct vfio_device_file *df,
> +				struct vfio_device_bind_iommufd __user *arg)
> +{
> +	struct vfio_device *device = df->device;
> +	struct vfio_device_bind_iommufd bind;
> +	unsigned long minsz;
> +	int ret;
> +
> +	static_assert(__same_type(arg->out_devid, df->devid));
> +
> +	minsz = offsetofend(struct vfio_device_bind_iommufd, out_devid);
> +
> +	if (copy_from_user(&bind, arg, minsz))
> +		return -EFAULT;
> +
> +	if (bind.argsz < minsz || bind.flags || bind.iommufd < 0)
> +		return -EINVAL;
> +
> +	/* BIND_IOMMUFD only allowed for cdev fds */
> +	if (df->group)
> +		return -EINVAL;
> +
> +	ret = vfio_device_block_group(device);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&device->dev_set->lock);
> +	/* one device cannot be bound twice */
> +	if (df->access_granted) {
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	df->iommufd = vfio_get_iommufd_from_fd(bind.iommufd);
> +	if (IS_ERR(df->iommufd)) {
> +		ret = PTR_ERR(df->iommufd);
> +		df->iommufd = NULL;
> +		goto out_unlock;
> +	}
> +
> +	/*
> +	 * Before the device open, get the KVM pointer currently
> +	 * associated with the device file (if there is) and obtain
> +	 * a reference.  This reference is held until device closed.
> +	 * Save the pointer in the device for use by drivers.
> +	 */
> +	vfio_device_get_kvm_safe(df);
> +
> +	ret = vfio_df_open(df);
> +	if (ret)
> +		goto out_put_kvm;
> +
> +	ret = copy_to_user(&arg->out_devid, &df->devid,
> +			   sizeof(df->devid)) ? -EFAULT : 0;
> +	if (ret)
> +		goto out_close_device;
> +
> +	/*
> +	 * Paired with smp_load_acquire() in vfio_device_fops::ioctl/
> +	 * read/write/mmap
> +	 */
> +	smp_store_release(&df->access_granted, true);
> +	device->cdev_opened = true;
> +	mutex_unlock(&device->dev_set->lock);
> +	return 0;
> +
> +out_close_device:
> +	vfio_df_close(df);
> +out_put_kvm:
> +	vfio_device_put_kvm(device);
> +	iommufd_ctx_put(df->iommufd);
> +	df->iommufd = NULL;
> +out_unlock:
> +	mutex_unlock(&device->dev_set->lock);
> +	vfio_device_unblock_group(device);
> +	return ret;
> +}
> +
>  static char *vfio_device_devnode(const struct device *dev, umode_t *mode)
>  {
>  	return kasprintf(GFP_KERNEL, "vfio/devices/%s", dev_name(dev));
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index d12b5b524bfc..42de40d2cd4d 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -287,6 +287,9 @@ static inline void vfio_device_del(struct vfio_device *device)
>  }
>  
>  int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep);
> +void vfio_df_cdev_close(struct vfio_device_file *df);
> +long vfio_df_ioctl_bind_iommufd(struct vfio_device_file *df,
> +				struct vfio_device_bind_iommufd __user *arg);
>  int vfio_cdev_init(struct class *device_class);
>  void vfio_cdev_cleanup(void);
>  #else
> @@ -310,6 +313,16 @@ static inline int vfio_device_fops_cdev_open(struct inode *inode,
>  	return 0;
>  }
>  
> +static inline void vfio_df_cdev_close(struct vfio_device_file *df)
> +{
> +}
> +
> +static inline long vfio_df_ioctl_bind_iommufd(struct vfio_device_file *df,
> +					      struct vfio_device_bind_iommufd __user *arg)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
>  static inline int vfio_cdev_init(struct class *device_class)
>  {
>  	return 0;
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index ef55af75f459..9ba4d420eda2 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -572,6 +572,8 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
>  
>  	if (df->group)
>  		vfio_df_group_close(df);
> +	else
> +		vfio_df_cdev_close(df);
>  
>  	vfio_device_put_registration(device);
>  
> @@ -1145,6 +1147,9 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
>  	struct vfio_device *device = df->device;
>  	int ret;
>  
> +	if (cmd == VFIO_DEVICE_BIND_IOMMUFD)
> +		return vfio_df_ioctl_bind_iommufd(df, (void __user *)arg);
> +
>  	/* Paired with smp_store_release() following vfio_df_open() */
>  	if (!smp_load_acquire(&df->access_granted))
>  		return -EINVAL;
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 83cc5dc28b7a..e80a8ac86e46 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -66,6 +66,7 @@ struct vfio_device {
>  	struct iommufd_device *iommufd_device;
>  	bool iommufd_attached;
>  #endif
> +	bool cdev_opened:1;

Perhaps a more strongly defined data type here as well and roll
iommufd_attached into the same bit field scheme.

>  };
>  
>  /**
> @@ -170,7 +171,7 @@ vfio_iommufd_device_hot_reset_devid(struct vfio_device *vdev,
>  
>  static inline bool vfio_device_cdev_opened(struct vfio_device *device)
>  {
> -	return false;
> +	return device->cdev_opened;
>  }
>  
>  /**
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index f753124e1c82..7296012b7f36 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -194,6 +194,33 @@ struct vfio_group_status {
>  
>  /* --------------- IOCTLs for DEVICE file descriptors --------------- */
>  
> +/*
> + * VFIO_DEVICE_BIND_IOMMUFD - _IOR(VFIO_TYPE, VFIO_BASE + 18,
> + *				   struct vfio_device_bind_iommufd)
> + * @argsz:	 User filled size of this data.
> + * @flags:	 Must be 0.
> + * @iommufd:	 iommufd to bind.
> + * @out_devid:	 The device id generated by this bind. devid is a handle for
> + *		 this device/iommufd bond and can be used in IOMMUFD commands.
> + *
> + * Bind a vfio_device to the specified iommufd.
> + *
> + * User is restricted from accessing the device before the binding operation
> + * is completed.
> + *
> + * Unbind is automatically conducted when device fd is closed.
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +struct vfio_device_bind_iommufd {
> +	__u32		argsz;
> +	__u32		flags;
> +	__s32		iommufd;
> +	__u32		out_devid;
> +};
> +
> +#define VFIO_DEVICE_BIND_IOMMUFD	_IO(VFIO_TYPE, VFIO_BASE + 18)
> +

Why are we still defining device ioctls 18-20 before existing device
ioctls?  18 should be defined after 17...  Thanks,

Alex

>  /**
>   * VFIO_DEVICE_GET_INFO - _IOR(VFIO_TYPE, VFIO_BASE + 7,
>   *						struct vfio_device_info)

