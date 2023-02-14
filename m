Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6698D6970D9
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Feb 2023 23:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D18010E9B6;
	Tue, 14 Feb 2023 22:46:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EA410E9B6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Feb 2023 22:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676414799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1jldO6fmfgoCuH/YvBSf2KGCik/zXLxK5KGgKzWj5sI=;
 b=WpGrCkFG+GWv/b2wUVmh2EUrtq6PX6gtIpzAzrzfdqLMen7WYRB7VCCkLxYgaJGUDn5Ohu
 lCIaJXVc9MiROPtV1OCg7pu0WsNJqXKr17RI+FQUfxWKIenyPfJXeK1uR4Hm5/88JyMqA9
 DbDzmR2vc9fAN6YaFw1bHYILsIQ06eA=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-20-Fc88d9NaNDGxqZ3pPO4TVg-1; Tue, 14 Feb 2023 17:46:38 -0500
X-MC-Unique: Fc88d9NaNDGxqZ3pPO4TVg-1
Received: by mail-io1-f69.google.com with SMTP id
 u6-20020a6be406000000b00716ceebf132so11083539iog.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Feb 2023 14:46:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1jldO6fmfgoCuH/YvBSf2KGCik/zXLxK5KGgKzWj5sI=;
 b=v2nyx1wJuam/EtWMkCqI3pR+4cJxYI48XnWzk+AXgawhqmzwR0YzByfjcVI0mGiMUz
 cvGJTOWa90kJJo9L3YEmSt7eNrevNp1Q/59/OTBBQ0sl6H2kpuDc/nzYCaocxrBKhmBQ
 Y4dxg52NAK7MNMVir83/tK5Kx6mcEg4PQ9jl8xuIigxszr1zfY55PKVBkqxdJxo3Wzny
 DJZsEe4MoM54GMetb0mjAs4QWsMPzTjjvAUr6JQPvhnljiSrzVMzvRDKj/YNYWdHdw0m
 esyvjTPmn9n2qTShij7aiCO3P4GN1o/WSJVDNRTExcoSf9IGydu7Wk7Ov2VAM+GGfXve
 gnSQ==
X-Gm-Message-State: AO0yUKXF8/6fxGCgZHijuL6JOKMq7AC53laSHz10EnbPKC6ERHj1aea+
 ti5bOVo+HLrqhsHaiAjFrUfcxjwaSkGcN9T75MgEDONZXJSw6C7eKkX1SPXJKDSv/oG+E11yxYJ
 dUyZ8lMgFEk3xmYbCNhK1jirr5UyWe6TfOw==
X-Received: by 2002:a5d:9d9f:0:b0:723:8cb5:6702 with SMTP id
 ay31-20020a5d9d9f000000b007238cb56702mr1318086iob.1.1676414797218; 
 Tue, 14 Feb 2023 14:46:37 -0800 (PST)
X-Google-Smtp-Source: AK7set9cfDgyngyCVpoASbTracVSC7acBm/bzA5JaqsBngxVoSVzbVeauNEuEuVYlZXiKXiEdIcJqA==
X-Received: by 2002:a5d:9d9f:0:b0:723:8cb5:6702 with SMTP id
 ay31-20020a5d9d9f000000b007238cb56702mr1318066iob.1.1676414796958; 
 Tue, 14 Feb 2023 14:46:36 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 u17-20020a02c051000000b003c2b67fac92sm5245727jam.81.2023.02.14.14.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 14:46:36 -0800 (PST)
Date: Tue, 14 Feb 2023 15:46:34 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 07/15] vfio: Block device access via device fd until
 device is opened
Message-ID: <20230214154634.4bc5dcd6.alex.williamson@redhat.com>
In-Reply-To: <20230213151348.56451-8-yi.l.liu@intel.com>
References: <20230213151348.56451-1-yi.l.liu@intel.com>
 <20230213151348.56451-8-yi.l.liu@intel.com>
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
Cc: linux-s390@vger.kernel.org, kevin.tian@intel.com, yi.y.sun@linux.intel.com,
 mjrosato@linux.ibm.com, kvm@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, joro@8bytes.org, cohuck@redhat.com,
 peterx@redhat.com, suravee.suthikulpanit@amd.com, eric.auger@redhat.com,
 nicolinc@nvidia.com, shameerali.kolothum.thodi@huawei.com, jgg@nvidia.com,
 intel-gfx@lists.freedesktop.org, chao.p.peng@linux.intel.com, lulu@redhat.com,
 robin.murphy@arm.com, jasowang@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, 13 Feb 2023 07:13:40 -0800
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
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> ---
>  drivers/vfio/vfio.h      |  1 +
>  drivers/vfio/vfio_main.c | 34 +++++++++++++++++++++++++++++++++-
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index 11e56fe079a1..d56cdb114024 100644
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
> index c517252aba19..2267057240bd 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -476,7 +476,15 @@ int vfio_device_open(struct vfio_device_file *df)
>  			device->open_count--;
>  	}
>  
> -	return ret;
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Paired with smp_load_acquire() in vfio_device_fops::ioctl/
> +	 * read/write/mmap
> +	 */
> +	smp_store_release(&df->access_granted, true);
> +	return 0;
>  }
>  
>  void vfio_device_close(struct vfio_device_file *df)
> @@ -1104,8 +1112,14 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
>  {
>  	struct vfio_device_file *df = filep->private_data;
>  	struct vfio_device *device = df->device;
> +	bool access;
>  	int ret;
>  
> +	/* Paired with smp_store_release() in vfio_device_open() */
> +	access = smp_load_acquire(&df->access_granted);
> +	if (!access)
> +		return -EINVAL;
> +

Nit,

	if (!smp_load_acquire(&df->access_granted))
		...

Thanks,
Alex

>  	ret = vfio_device_pm_runtime_get(device);
>  	if (ret)
>  		return ret;
> @@ -1132,6 +1146,12 @@ static ssize_t vfio_device_fops_read(struct file *filep, char __user *buf,
>  {
>  	struct vfio_device_file *df = filep->private_data;
>  	struct vfio_device *device = df->device;
> +	bool access;
> +
> +	/* Paired with smp_store_release() in vfio_device_open() */
> +	access = smp_load_acquire(&df->access_granted);
> +	if (!access)
> +		return -EINVAL;
>  
>  	if (unlikely(!device->ops->read))
>  		return -EINVAL;
> @@ -1145,6 +1165,12 @@ static ssize_t vfio_device_fops_write(struct file *filep,
>  {
>  	struct vfio_device_file *df = filep->private_data;
>  	struct vfio_device *device = df->device;
> +	bool access;
> +
> +	/* Paired with smp_store_release() in vfio_device_open() */
> +	access = smp_load_acquire(&df->access_granted);
> +	if (!access)
> +		return -EINVAL;
>  
>  	if (unlikely(!device->ops->write))
>  		return -EINVAL;
> @@ -1156,6 +1182,12 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
>  {
>  	struct vfio_device_file *df = filep->private_data;
>  	struct vfio_device *device = df->device;
> +	bool access;
> +
> +	/* Paired with smp_store_release() in vfio_device_open() */
> +	access = smp_load_acquire(&df->access_granted);
> +	if (!access)
> +		return -EINVAL;
>  
>  	if (unlikely(!device->ops->mmap))
>  		return -EINVAL;

