Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6066CCC1F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 Mar 2023 23:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F33710E10A;
	Tue, 28 Mar 2023 21:34:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B260410E10A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 Mar 2023 21:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680039237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uqOJKbgb7ATLpuIGdDhmD1/D9xzym09yCeZarta+PK8=;
 b=TwkVD2IgzNVhc1/vfbt2c/CiqiOkTfompqXDwqHrPaW8rh2WWPFSbIusepKZa7+VhxwmhR
 ujAzv/VA8/P7T0CyMJXG0Zyn6E6HJdl2sRJ477+8wJza9eNd27+dk4MWv4Buk3HYTQuXjL
 zqjAvrm9SEQ/ns1r/Vq54OVtvpSiOLk=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-sH8PNAfqMKaDexVwt124VQ-1; Tue, 28 Mar 2023 17:33:56 -0400
X-MC-Unique: sH8PNAfqMKaDexVwt124VQ-1
Received: by mail-il1-f197.google.com with SMTP id
 d12-20020a056e020bec00b00325e125fbe5so8557037ilu.12
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 Mar 2023 14:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680039236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uqOJKbgb7ATLpuIGdDhmD1/D9xzym09yCeZarta+PK8=;
 b=oE2OTopoRKxPU41OuqB6BC9oAD1PEudWYLuOnLcSyB6B5lDwtZikeJIBhC1AFStlSL
 X4Ccuhq9KeV0qatiU8AnE3J7I3gZAvXR2Wkfso+5+mIG6DS/fc/06mSray3XmaN3ewGg
 mmOQ4WHkmB3sSL2hZ7Z4fQOc+d72RZREYdoF8+IFvDwZZM+knRLhpx1DH2VJkxn66guF
 jjgWDDKeRlNToAx18LIOka4VEfA8+w2BlSPLHcuJMg3Se/yiFWk/cV2cC9EBHAb9v9jc
 SQ/6M8N6oHAyzjgNU3wz8EZegHkLr8hZE7QNPIcsT+LDC4A7xb45jQhvhd9Rxe53Yjt5
 Aa0g==
X-Gm-Message-State: AAQBX9cGpI0pmjDwO48F8shEowiGGSEzwy2XqJNKFauY40hPoanTS9de
 4cPiGf9GPY6RFVniVs40XaRd4ISSEUTw0hhS7IZd66ENilOJ0sHJuFGLlN54UufiUpidaE3YuoK
 XYtjYP5M6kC1bentANScvkFBeQfkxTuEYkg==
X-Received: by 2002:a05:6e02:782:b0:315:6e7f:f429 with SMTP id
 q2-20020a056e02078200b003156e7ff429mr12502997ils.9.1680039235805; 
 Tue, 28 Mar 2023 14:33:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350bFTQnx3N9HNY32zRuYKOSoKbrxT758XDlpNXJefLuxy6Ef6baspB62jLxo+aOJR0orePzHQQ==
X-Received: by 2002:a05:6e02:782:b0:315:6e7f:f429 with SMTP id
 q2-20020a056e02078200b003156e7ff429mr12502984ils.9.1680039235506; 
 Tue, 28 Mar 2023 14:33:55 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056638339600b00374bf3b62a0sm9785701jav.99.2023.03.28.14.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 14:33:54 -0700 (PDT)
Date: Tue, 28 Mar 2023 15:33:52 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v8 08/24] vfio: Block device access via device fd until
 device is opened
Message-ID: <20230328153352.6c1e2088.alex.williamson@redhat.com>
In-Reply-To: <20230327094047.47215-9-yi.l.liu@intel.com>
References: <20230327094047.47215-1-yi.l.liu@intel.com>
 <20230327094047.47215-9-yi.l.liu@intel.com>
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

On Mon, 27 Mar 2023 02:40:31 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> Allow the vfio_device file to be in a state where the device FD is
> opened but the device cannot be used by userspace (i.e. its .open_device()
> hasn't been called). This inbetween state is not used when the device
> FD is spawned from the group FD, however when we create the device FD
> directly by opening a cdev it will be opened in the blocked state.
> 
> The reason for the inbetween state is that userspace only gets a FD but
> doesn't gain access permission until binding the FD to an iommufd. So in
> the blocked state, only the bind operation is allowed. Completing bind
> will allow user to further access the device.
> 
> This is implemented by adding a flag in struct vfio_device_file to mark
> the blocked state and using a simple smp_load_acquire() to obtain the
> flag value and serialize all the device setup with the thread accessing
> this device.
> 
> Following this lockless scheme, it can safely handle the device FD
> unbound->bound but it cannot handle bound->unbound. To allow this we'd
> need to add a lock on all the vfio ioctls which seems costly. So once
> device FD is bound, it remains bound until the FD is closed.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/group.c     | 11 ++++++++++-
>  drivers/vfio/vfio.h      |  1 +
>  drivers/vfio/vfio_main.c | 41 ++++++++++++++++++++++++++++++++++------
>  3 files changed, 46 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> index 9a7b2765eef6..4f267ae7bebc 100644
> --- a/drivers/vfio/group.c
> +++ b/drivers/vfio/group.c
> @@ -194,9 +194,18 @@ static int vfio_device_group_open(struct vfio_device_file *df)
>  	df->iommufd = device->group->iommufd;
>  
>  	ret = vfio_device_open(df);
> -	if (ret)
> +	if (ret) {
>  		df->iommufd = NULL;
> +		goto out_put_kvm;
> +	}
> +
> +	/*
> +	 * Paired with smp_load_acquire() in vfio_device_fops::ioctl/
> +	 * read/write/mmap
> +	 */
> +	smp_store_release(&df->access_granted, true);
>  
> +out_put_kvm:
>  	if (device->open_count == 0)
>  		vfio_device_put_kvm(device);
>  
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index cffc08f5a6f1..854f2c97cb9a 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -18,6 +18,7 @@ struct vfio_container;
>  
>  struct vfio_device_file {
>  	struct vfio_device *device;
> +	bool access_granted;
>  	spinlock_t kvm_ref_lock; /* protect kvm field */
>  	struct kvm *kvm;
>  	struct iommufd_ctx *iommufd; /* protected by struct vfio_device_set::lock */
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 2ea6cb6d03c7..b515bbda4c74 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -1114,6 +1114,10 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
>  	struct vfio_device *device = df->device;
>  	int ret;
>  
> +	/* Paired with smp_store_release() following vfio_device_open() */
> +	if (!smp_load_acquire(&df->access_granted))
> +		return -EINVAL;
> +
>  	ret = vfio_device_pm_runtime_get(device);
>  	if (ret)
>  		return ret;
> @@ -1141,6 +1145,10 @@ static ssize_t vfio_device_fops_read(struct file *filep, char __user *buf,
>  	struct vfio_device_file *df = filep->private_data;
>  	struct vfio_device *device = df->device;
>  
> +	/* Paired with smp_store_release() following vfio_device_open() */
> +	if (!smp_load_acquire(&df->access_granted))
> +		return -EINVAL;
> +
>  	if (unlikely(!device->ops->read))
>  		return -EINVAL;
>  
> @@ -1154,6 +1162,10 @@ static ssize_t vfio_device_fops_write(struct file *filep,
>  	struct vfio_device_file *df = filep->private_data;
>  	struct vfio_device *device = df->device;
>  
> +	/* Paired with smp_store_release() following vfio_device_open() */
> +	if (!smp_load_acquire(&df->access_granted))
> +		return -EINVAL;
> +
>  	if (unlikely(!device->ops->write))
>  		return -EINVAL;
>  
> @@ -1165,6 +1177,10 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
>  	struct vfio_device_file *df = filep->private_data;
>  	struct vfio_device *device = df->device;
>  
> +	/* Paired with smp_store_release() following vfio_device_open() */
> +	if (!smp_load_acquire(&df->access_granted))
> +		return -EINVAL;
> +
>  	if (unlikely(!device->ops->mmap))
>  		return -EINVAL;
>  
> @@ -1201,6 +1217,24 @@ bool vfio_file_is_valid(struct file *file)
>  }
>  EXPORT_SYMBOL_GPL(vfio_file_is_valid);
>  
> +/*
> + * Return true if the input file is a vfio device file and has opened
> + * the input device. Otherwise, return false.
> + */
> +static bool vfio_file_has_device_access(struct file *file,
> +					struct vfio_device *device)
> +{
> +	struct vfio_device *vdev = vfio_device_from_file(file);
> +	struct vfio_device_file *df;
> +
> +	if (!vdev || vdev != device)
> +		return false;
> +
> +	df = file->private_data;
> +
> +	return READ_ONCE(df->access_granted);

Why did we change from smp_load_acquire() to READ_ONCE() here?  Thanks,

Alex

> +}
> +
>  /**
>   * vfio_file_has_dev - True if the VFIO file is a handle for device
>   * @file: VFIO file to check
> @@ -1211,17 +1245,12 @@ EXPORT_SYMBOL_GPL(vfio_file_is_valid);
>  bool vfio_file_has_dev(struct file *file, struct vfio_device *device)
>  {
>  	struct vfio_group *group;
> -	struct vfio_device *vdev;
>  
>  	group = vfio_group_from_file(file);
>  	if (group)
>  		return vfio_group_has_dev(group, device);
>  
> -	vdev = vfio_device_from_file(file);
> -	if (vdev)
> -		return vdev == device;
> -
> -	return false;
> +	return vfio_file_has_device_access(file, device);
>  }
>  EXPORT_SYMBOL_GPL(vfio_file_has_dev);
>  

