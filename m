Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE17572D38C
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 12 Jun 2023 23:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0F610E103;
	Mon, 12 Jun 2023 21:52:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4178110E101
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 12 Jun 2023 21:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686606735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=boA3uYLp9Lq3xOIcpkhvQI3DYCAEvrjZcD5trap1f04=;
 b=NLEcMe1SrKj9XrYo5BQRoT9292t4/G+/lTzLlFMV4WIzUOpOvx3vdRwP/dp/JadX+Djg1n
 DUfwXsH5gS4JP+/EtIDLJ9xmMS87cYXJyVKwoNqVd7daX99P7jQvXSUJNTiCoxvIRC4niB
 8qTWG8QNHCZDDLhkx7aLPVIOxW+JRfc=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-jOrHE7i3OwSEUUUOE4mf6Q-1; Mon, 12 Jun 2023 17:52:14 -0400
X-MC-Unique: jOrHE7i3OwSEUUUOE4mf6Q-1
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-77a0fd9d2eeso584919739f.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 12 Jun 2023 14:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686606733; x=1689198733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=boA3uYLp9Lq3xOIcpkhvQI3DYCAEvrjZcD5trap1f04=;
 b=PK0v1hBxsICnPrDXJoSW1tr7Iwzqb99IbyYx0K+Shz4ecnUAhYSAC2cqUfhwdeNm7Z
 tPb385R/lCTr02djmFrpgA5Mh2lTMMeFzJGzrbrRHq7sW9WVguGzYX7zmNDb+IkkdPNa
 dKvlSUgwt8hGz5mSNKj3vqGY3AA/Hikpc0LExR/2FkSPMj2J9PimKCfadBfJe5Mwu+uB
 Q7YCMH7f1xyGs4dyZNiw20xU8ibKele9D4/28TnDjJwwuH1o94E7LMZ7pfrRT4u6LBOy
 vDsZNgMrp7fn4sJPMqRL2KHAsxz/mlGcf0DzAl2wGXik6kS4rfkz3zCqdKgQ9LVY8FX5
 HQkg==
X-Gm-Message-State: AC+VfDyslSlW401Aan45bUOHwZwEBethJ1iWnQEeT4WcPKsFjFkO+0vf
 On+ek9Z26N6F+WMRtruq6irRfHMA8fdjXG5uZeC5I8r1/P9KW+Jdi5gpANtt2peJA5g+xrAN1+o
 DK6s5G1j85jru0PhncZp0j3SQ7hceIho1oQ==
X-Received: by 2002:a6b:7b45:0:b0:77a:ec0c:5907 with SMTP id
 m5-20020a6b7b45000000b0077aec0c5907mr6931534iop.13.1686606733153; 
 Mon, 12 Jun 2023 14:52:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ63rekNLLQDnyK8nJOL8AIQHD4qdXRPI2wqFuMCbJroFEC5NjXVpyDmFDmxaenIzEmd4Wxl3A==
X-Received: by 2002:a6b:7b45:0:b0:77a:ec0c:5907 with SMTP id
 m5-20020a6b7b45000000b0077aec0c5907mr6931503iop.13.1686606732857; 
 Mon, 12 Jun 2023 14:52:12 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 u15-20020a02cbcf000000b0040f9af9237asm160026jaq.41.2023.06.12.14.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:52:12 -0700 (PDT)
Date: Mon, 12 Jun 2023 15:52:10 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v12 07/24] vfio: Block device access via device fd until
 device is opened
Message-ID: <20230612155210.5fd3579f.alex.williamson@redhat.com>
In-Reply-To: <20230602121653.80017-8-yi.l.liu@intel.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
 <20230602121653.80017-8-yi.l.liu@intel.com>
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

On Fri,  2 Jun 2023 05:16:36 -0700
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
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/group.c     | 11 ++++++++++-
>  drivers/vfio/vfio.h      |  1 +
>  drivers/vfio/vfio_main.c | 16 ++++++++++++++++
>  3 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> index caf53716ddb2..088dd34c8931 100644
> --- a/drivers/vfio/group.c
> +++ b/drivers/vfio/group.c
> @@ -194,9 +194,18 @@ static int vfio_df_group_open(struct vfio_device_file *df)
>  	df->iommufd = device->group->iommufd;
>  
>  	ret = vfio_df_open(df);
> -	if (ret)
> +	if (ret) {
>  		df->iommufd = NULL;
> +		goto out_put_kvm;
> +	}
> +
> +	/*
> +	 * Paired with smp_load_acquire() in vfio_device_fops::ioctl/
> +	 * read/write/mmap and vfio_file_has_device_access()
> +	 */
> +	smp_store_release(&df->access_granted, true);
>  
> +out_put_kvm:
>  	if (device->open_count == 0)
>  		vfio_device_put_kvm(device);
>  
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index f9eb52eb9ed7..fdf2fc73f880 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -18,6 +18,7 @@ struct vfio_container;
>  
>  struct vfio_device_file {
>  	struct vfio_device *device;
> +	bool access_granted;

Should we make this a more strongly defined data type and later move
devid (u32) here to partially fill the hole created?

I think this is being placed towards the front of the data structure
for cache line locality given this is a hot path for file operations.
But bool types have an implementation dependent size, making them
difficult to pack.  Also there will be a tendency to want to make this
a bit field, which is probably not compatible with the smp lockless
operations being used here.  We might get in front of these issues if
we just define it as a u8 now.  Thanks,

Alex

>  	spinlock_t kvm_ref_lock; /* protect kvm field */
>  	struct kvm *kvm;
>  	struct iommufd_ctx *iommufd; /* protected by struct vfio_device_set::lock */
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index a3c5817fc545..4c8b7713dc3d 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -1129,6 +1129,10 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
>  	struct vfio_device *device = df->device;
>  	int ret;
>  
> +	/* Paired with smp_store_release() following vfio_df_open() */
> +	if (!smp_load_acquire(&df->access_granted))
> +		return -EINVAL;
> +
>  	ret = vfio_device_pm_runtime_get(device);
>  	if (ret)
>  		return ret;
> @@ -1156,6 +1160,10 @@ static ssize_t vfio_device_fops_read(struct file *filep, char __user *buf,
>  	struct vfio_device_file *df = filep->private_data;
>  	struct vfio_device *device = df->device;
>  
> +	/* Paired with smp_store_release() following vfio_df_open() */
> +	if (!smp_load_acquire(&df->access_granted))
> +		return -EINVAL;
> +
>  	if (unlikely(!device->ops->read))
>  		return -EINVAL;
>  
> @@ -1169,6 +1177,10 @@ static ssize_t vfio_device_fops_write(struct file *filep,
>  	struct vfio_device_file *df = filep->private_data;
>  	struct vfio_device *device = df->device;
>  
> +	/* Paired with smp_store_release() following vfio_df_open() */
> +	if (!smp_load_acquire(&df->access_granted))
> +		return -EINVAL;
> +
>  	if (unlikely(!device->ops->write))
>  		return -EINVAL;
>  
> @@ -1180,6 +1192,10 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
>  	struct vfio_device_file *df = filep->private_data;
>  	struct vfio_device *device = df->device;
>  
> +	/* Paired with smp_store_release() following vfio_df_open() */
> +	if (!smp_load_acquire(&df->access_granted))
> +		return -EINVAL;
> +
>  	if (unlikely(!device->ops->mmap))
>  		return -EINVAL;
>  

