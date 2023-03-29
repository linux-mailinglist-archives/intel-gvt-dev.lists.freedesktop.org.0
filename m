Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAB26CF51C
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 29 Mar 2023 23:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260DE10EC8A;
	Wed, 29 Mar 2023 21:19:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D29310EC8A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 29 Mar 2023 21:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680124749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IGVHQslX/4Q2nBwMZykirgQDOWEjwl8r9/yUI1mNVoU=;
 b=QQ2RJMlOm4xN2ZmIHJ/vP48bdMRV84WUvYuSVHoSdWvPe4QhQx+j0EVbZ8Na5ECOEc1HK+
 c+8aA9fbtUOjtlxPsTQZqkRmv5qNv0XL8FScp+3vArroU8y9gZMCo1qT09NrW7a1c41BLL
 C1wWB6PtQvhnwG8p+rLBMcdSSdUTwyM=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-l1kB9DkyO4SWwzfz4qm94g-1; Wed, 29 Mar 2023 17:19:05 -0400
X-MC-Unique: l1kB9DkyO4SWwzfz4qm94g-1
Received: by mail-il1-f200.google.com with SMTP id
 h19-20020a056e021d9300b00318f6b50475so10799865ila.21
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 29 Mar 2023 14:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680124744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IGVHQslX/4Q2nBwMZykirgQDOWEjwl8r9/yUI1mNVoU=;
 b=BW7SBtjDYYzwj/F3+jMKa4uFBfn6vNWjYAKrUnlZqKZirU691XYVFKMfZyeVrNXAwm
 xseuTzbboddRBX5IrU6xmqXdazS6goT93I3MhB5dRabusitXEMUVYvMC8gD4564XMOr7
 Vb9K8FwdmLodsRTCbfHQ2BCkB2m+JFoJYN/8BcOVOotbzCZvcZxcaDeK4q1DY5Si19X1
 EWPPPcHAgTwyyf3wyJRYBJsI1kcIjrukJqtvALtKdOqdLm8aCdS9VquttUBYT1dqbPjN
 YAp396Z066wJrUtXbXyEJ2eR7/EZ5LcHpydTEvQrxJoHMQ/prLV3cjcPY2tikNER+tzD
 9DXg==
X-Gm-Message-State: AAQBX9e5j8w25ahuoyr2sLC+PkP72xugOsVsB+Hu9ABz0P0xF7kpSkyh
 zoD8EIcUOOuPJV4S/hZ1/e91Tfvid5dnKCIMm+Kmj621Tbzya13pmIExfPEPJHuowDqTRRPiKew
 HaiVIxElWjdReOvrIAKoDlMJ1LamZcTxWQw==
X-Received: by 2002:a92:d9c6:0:b0:317:99b9:3d1c with SMTP id
 n6-20020a92d9c6000000b0031799b93d1cmr15068246ilq.26.1680124744091; 
 Wed, 29 Mar 2023 14:19:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350ajQ4SKKBVBjAHaP/aw41f4QFgk7HVdYnc6BROfSNFgwlwllegkuthAdtgSC0+A+lGPIbjj7Q==
X-Received: by 2002:a92:d9c6:0:b0:317:99b9:3d1c with SMTP id
 n6-20020a92d9c6000000b0031799b93d1cmr15068243ilq.26.1680124743779; 
 Wed, 29 Mar 2023 14:19:03 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 cd8-20020a0566381a0800b00406521ad090sm9814930jab.94.2023.03.29.14.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 14:19:03 -0700 (PDT)
Date: Wed, 29 Mar 2023 15:19:02 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v8 22/24] vfio: Add VFIO_DEVICE_AT[DE]TACH_IOMMUFD_PT
Message-ID: <20230329151902.453ed743.alex.williamson@redhat.com>
In-Reply-To: <20230327094047.47215-23-yi.l.liu@intel.com>
References: <20230327094047.47215-1-yi.l.liu@intel.com>
 <20230327094047.47215-23-yi.l.liu@intel.com>
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


Nit, ATDETACH?  [AT|DE]TACH?

On Mon, 27 Mar 2023 02:40:45 -0700
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
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/device_cdev.c | 85 ++++++++++++++++++++++++++++++++++++++
>  drivers/vfio/vfio.h        | 16 +++++++
>  drivers/vfio/vfio_main.c   |  8 ++++
>  include/uapi/linux/vfio.h  | 52 +++++++++++++++++++++++
>  4 files changed, 161 insertions(+)
> 
> diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
> index 2b563bac50b9..b5de997bff6d 100644
> --- a/drivers/vfio/device_cdev.c
> +++ b/drivers/vfio/device_cdev.c
> @@ -197,6 +197,91 @@ long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
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
> +	static_assert(__same_type(arg->pt_id, attach.pt_id));

Same comment as previous, given these are the same field of the same
structure, I don't understand how this could ever assert.

> +
> +	minsz = offsetofend(struct vfio_device_attach_iommufd_pt, pt_id);
> +
> +	if (copy_from_user(&attach, arg, minsz))
> +		return -EFAULT;
> +
> +	if (attach.argsz < minsz || attach.flags)
> +		return -EINVAL;
> +
> +	if (!device->ops->bind_iommufd)
> +		return -ENODEV;

Same as previous, we already require this to enable cdev support, so
this seems ultra paranoid.

> +
> +	/* ATTACH only allowed for cdev fds */
> +	if (df->group)
> +		return -EINVAL;
> +
> +	mutex_lock(&device->dev_set->lock);
> +	/* noiommufd mode doesn't allow attach */
> +	if (!df->iommufd) {
> +		ret = -EOPNOTSUPP;
> +		goto out_unlock;
> +	}
> +
> +	ret = device->ops->attach_ioas(device, &attach.pt_id);
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
> +	device->ops->detach_ioas(device);
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
> +	if (!device->ops->bind_iommufd)
> +		return -ENODEV;
> +
> +	/* DETACH only allowed for cdev fds */
> +	if (df->group)
> +		return -EINVAL;
> +
> +	mutex_lock(&device->dev_set->lock);
> +	/* noiommufd mode doesn't support detach */
> +	if (!df->iommufd) {
> +		mutex_unlock(&device->dev_set->lock);
> +		return -EOPNOTSUPP;
> +	}
> +	device->ops->detach_ioas(device);
> +	mutex_unlock(&device->dev_set->lock);
> +
> +	return 0;
> +}

For both of these, can't a user trigger the
WARN_ON(!vdev->iommufd_device) if they call either of these before
VFIO_DEVICE_BIND_IOMMUFD?  Thanks,

Alex

> +
>  static char *vfio_device_devnode(const struct device *dev, umode_t *mode)
>  {
>  	return kasprintf(GFP_KERNEL, "vfio/devices/%s", dev_name(dev));
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index ace3d52b0928..c199e410db18 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -284,6 +284,10 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep);
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
> @@ -317,6 +321,18 @@ static inline long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
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
> index 375086c8803f..896d8bb49585 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -1150,6 +1150,14 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
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
> index 62b2f2497525..bf6c97e759c7 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -231,6 +231,58 @@ struct vfio_device_bind_iommufd {
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
> + * @argsz:	user filled size of this data.
> + * @flags:	must be 0.
> + * @pt_id:	Input the target id which can represent an ioas or a hwpt
> + *		allocated via iommufd subsystem.
> + *		Output the attached hwpt id which could be the specified
> + *		hwpt itself or a hwpt automatically created for the
> + *		specified ioas by kernel during the attachment.
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
> + *
> + * @argsz:	user filled size of this data.
> + * @flags:	must be 0.
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

