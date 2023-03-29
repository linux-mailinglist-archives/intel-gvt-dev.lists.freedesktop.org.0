Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12AD6CF3D2
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 29 Mar 2023 21:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A8A10EC08;
	Wed, 29 Mar 2023 19:57:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB41F10EC10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 29 Mar 2023 19:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680119846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mlzNdSqBUq7hFdpaURYUAN0/X+/m9jx/CyLubt4sDCs=;
 b=a3ZvOr2sh+PdcmsS4Yq3vewJ60DBdgxN56rEM6IkGwqfsG34BC4xhcdqqADSglh0Z3bthm
 V/L+iEU3Y2jEftmbtUOwl2nI0wH6rXc0J41FhXPpXf8F5DXtE8vXy1FOdRxio2uXfpOF6b
 JWCY0mqJQvIwRQ8wGQW+W9O42y4BXNU=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-4BkzxwwZMDOtrxxTZ39KqQ-1; Wed, 29 Mar 2023 15:57:23 -0400
X-MC-Unique: 4BkzxwwZMDOtrxxTZ39KqQ-1
Received: by mail-il1-f200.google.com with SMTP id
 h19-20020a056e021d9300b00318f6b50475so10677320ila.21
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 29 Mar 2023 12:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680119842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mlzNdSqBUq7hFdpaURYUAN0/X+/m9jx/CyLubt4sDCs=;
 b=Ij1q6j8ThY8Ku1OgHaWCKAdJCgbAFeozhIReFqzfwyXO6a15HuaBMFGJUEhV+YK64N
 fNhP1sJ8ftbznY1P8lWLWQr/wTn6xyHnAWicBirCM/kDwgqusfbH1bTT53t922RtPBGF
 znopPM9W9L/0un2PpIMHc/K0/mgFn7Y6kU6gBfxW3TvXMv06XRHunhfMIzvYpure8wns
 nvgrKtrRlGitz9FI8X9glEhq/46CVHsFmqDFvH7no4s6q2fYfmuBPOvsRbbsqwFWlXUA
 vqMwMKQXJvma3h3xeV4sh7fIQyIk5kg2mWFCko+teCBhrhCwhhx4xbZ+0kOK1cYAuwqG
 Hxdw==
X-Gm-Message-State: AAQBX9feUch//CovVAgDhe8CqeSUGJaR9wp5Cn5w01qeWFk5ywfG62Pd
 PBAfokoMz6fLUMwYc96HQw8KPAOdgeRMThqgodRB43C1ZLDT2ic45gkLnXP6AgFm12IEGRuOHFW
 r5KW4G7GaBL7sRIiUHATql0AawiBNTxU/vQ==
X-Received: by 2002:a92:6f04:0:b0:326:2025:84e4 with SMTP id
 k4-20020a926f04000000b00326202584e4mr4998918ilc.3.1680119842336; 
 Wed, 29 Mar 2023 12:57:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350aYXa0G8+E8laT0e6XCb4RulheIoXfK+T0gQxRLx9CaDoZVRLKJon6W/GPMEeYbFb3gGnwj0w==
X-Received: by 2002:a92:6f04:0:b0:326:2025:84e4 with SMTP id
 k4-20020a926f04000000b00326202584e4mr4998898ilc.3.1680119841975; 
 Wed, 29 Mar 2023 12:57:21 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 q10-20020a056e020c2a00b00316e54a8287sm9583344ilg.14.2023.03.29.12.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 12:57:21 -0700 (PDT)
Date: Wed, 29 Mar 2023 13:57:19 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v8 20/24] vfio: Add cdev for vfio_device
Message-ID: <20230329135719.22ac6c12.alex.williamson@redhat.com>
In-Reply-To: <20230327094047.47215-21-yi.l.liu@intel.com>
References: <20230327094047.47215-1-yi.l.liu@intel.com>
 <20230327094047.47215-21-yi.l.liu@intel.com>
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

On Mon, 27 Mar 2023 02:40:43 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> This allows user to directly open a vfio device w/o using the legacy
> container/group interface, as a prerequisite for supporting new iommu
> features like nested translation.
> 
> The device fd opened in this manner doesn't have the capability to access
> the device as the fops open() doesn't open the device until the successful
> BIND_IOMMUFD which be added in next patch.
> 
> With this patch, devices registered to vfio core have both group and device
> interface created.
> 
> - group interface : /dev/vfio/$groupID
> - device interface: /dev/vfio/devices/vfioX - normal device
> 		    /dev/vfio/devices/noiommu-vfioX - noiommu device
> 		    ("X" is the minor number and is unique across devices)
> 
> Given a vfio device the user can identify the matching vfioX by checking
> the sysfs path of the device. Take PCI device (0000:6a:01.0) for example,
> /sys/bus/pci/devices/0000\:6a\:01.0/vfio-dev/vfio0/dev contains the
> major:minor of the matching vfioX.
> 
> Userspace then opens the /dev/vfio/devices/vfioX and checks with fstat
> that the major:minor matches.
> 
> The vfio_device cdev logic in this patch:
> *) __vfio_register_dev() path ends up doing cdev_device_add() for each
>    vfio_device if VFIO_DEVICE_CDEV configured.
> *) vfio_unregister_group_dev() path does cdev_device_del();
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/Kconfig       | 11 +++++++
>  drivers/vfio/Makefile      |  1 +
>  drivers/vfio/device_cdev.c | 62 ++++++++++++++++++++++++++++++++++++++
>  drivers/vfio/vfio.h        | 46 ++++++++++++++++++++++++++++
>  drivers/vfio/vfio_main.c   | 26 +++++++++++-----
>  include/linux/vfio.h       |  4 +++
>  6 files changed, 143 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/vfio/device_cdev.c
> 
> diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
> index 89e06c981e43..e2105b4dac2d 100644
> --- a/drivers/vfio/Kconfig
> +++ b/drivers/vfio/Kconfig
> @@ -12,6 +12,17 @@ menuconfig VFIO
>  	  If you don't know what to do here, say N.
>  
>  if VFIO
> +config VFIO_DEVICE_CDEV
> +	bool "Support for the VFIO cdev /dev/vfio/devices/vfioX"
> +	depends on IOMMUFD
> +	help
> +	  The VFIO device cdev is another way for userspace to get device
> +	  access. Userspace gets device fd by opening device cdev under
> +	  /dev/vfio/devices/vfioX, and then bind the device fd with an iommufd
> +	  to set up secure DMA context for device access.
> +
> +	  If you don't know what to do here, say N.
> +
>  config VFIO_CONTAINER
>  	bool "Support for the VFIO container /dev/vfio/vfio"
>  	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
> diff --git a/drivers/vfio/Makefile b/drivers/vfio/Makefile
> index 70e7dcb302ef..245394aeb94b 100644
> --- a/drivers/vfio/Makefile
> +++ b/drivers/vfio/Makefile
> @@ -4,6 +4,7 @@ obj-$(CONFIG_VFIO) += vfio.o
>  vfio-y += vfio_main.o \
>  	  group.o \
>  	  iova_bitmap.o
> +vfio-$(CONFIG_VFIO_DEVICE_CDEV) += device_cdev.o
>  vfio-$(CONFIG_IOMMUFD) += iommufd.o
>  vfio-$(CONFIG_VFIO_CONTAINER) += container.o
>  vfio-$(CONFIG_VFIO_VIRQFD) += virqfd.o
> diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
> new file mode 100644
> index 000000000000..1c640016a824
> --- /dev/null
> +++ b/drivers/vfio/device_cdev.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023 Intel Corporation.
> + */
> +#include <linux/vfio.h>
> +
> +#include "vfio.h"
> +
> +static dev_t device_devt;
> +
> +void vfio_init_device_cdev(struct vfio_device *device)
> +{
> +	device->device.devt = MKDEV(MAJOR(device_devt), device->index);
> +	cdev_init(&device->cdev, &vfio_device_fops);
> +	device->cdev.owner = THIS_MODULE;
> +}
> +
> +/*
> + * device access via the fd opened by this function is blocked until
> + * .open_device() is called successfully during BIND_IOMMUFD.
> + */
> +int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
> +{
> +	struct vfio_device *device = container_of(inode->i_cdev,
> +						  struct vfio_device, cdev);
> +	struct vfio_device_file *df;
> +	int ret;
> +
> +	if (!vfio_device_try_get_registration(device))
> +		return -ENODEV;
> +
> +	df = vfio_allocate_device_file(device);
> +	if (IS_ERR(df)) {
> +		ret = PTR_ERR(df);
> +		goto err_put_registration;
> +	}
> +
> +	filep->private_data = df;
> +
> +	return 0;
> +
> +err_put_registration:
> +	vfio_device_put_registration(device);
> +	return ret;
> +}
> +
> +static char *vfio_device_devnode(const struct device *dev, umode_t *mode)
> +{
> +	return kasprintf(GFP_KERNEL, "vfio/devices/%s", dev_name(dev));
> +}
> +
> +int vfio_cdev_init(struct class *device_class)
> +{
> +	device_class->devnode = vfio_device_devnode;
> +	return alloc_chrdev_region(&device_devt, 0,
> +				   MINORMASK + 1, "vfio-dev");
> +}
> +
> +void vfio_cdev_cleanup(void)
> +{
> +	unregister_chrdev_region(device_devt, MINORMASK + 1);
> +}
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index 41dfc9d5205a..3a8fd0e32f59 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -268,6 +268,52 @@ static inline void vfio_iommufd_unbind(struct vfio_device_file *df)
>  }
>  #endif
>  
> +#if IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV)
> +static inline int vfio_device_add(struct vfio_device *device)
> +{
> +	return cdev_device_add(&device->cdev, &device->device);
> +}
> +
> +static inline void vfio_device_del(struct vfio_device *device)
> +{
> +	cdev_device_del(&device->cdev, &device->device);
> +}
> +
> +void vfio_init_device_cdev(struct vfio_device *device);
> +int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep);
> +int vfio_cdev_init(struct class *device_class);
> +void vfio_cdev_cleanup(void);
> +#else
> +static inline int vfio_device_add(struct vfio_device *device)
> +{
> +	return device_add(&device->device);
> +}
> +
> +static inline void vfio_device_del(struct vfio_device *device)
> +{
> +	device_del(&device->device);
> +}
> +
> +static inline void vfio_init_device_cdev(struct vfio_device *device)
> +{
> +}
> +
> +static inline int vfio_device_fops_cdev_open(struct inode *inode,
> +					     struct file *filep)
> +{
> +	return 0;
> +}
> +
> +static inline int vfio_cdev_init(struct class *device_class)
> +{
> +	return 0;
> +}
> +
> +static inline void vfio_cdev_cleanup(void)
> +{
> +}
> +#endif /* CONFIG_VFIO_DEVICE_CDEV */
> +
>  #if IS_ENABLED(CONFIG_VFIO_VIRQFD)
>  int __init vfio_virqfd_init(void);
>  void vfio_virqfd_exit(void);
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 8e96aab27029..58fc3bb768f2 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -242,6 +242,7 @@ static int vfio_init_device(struct vfio_device *device, struct device *dev,
>  	device->device.release = vfio_device_release;
>  	device->device.class = vfio.device_class;
>  	device->device.parent = device->dev;
> +	vfio_init_device_cdev(device);
>  	return 0;
>  
>  out_uninit:
> @@ -280,7 +281,7 @@ static int __vfio_register_dev(struct vfio_device *device,
>  	if (ret)
>  		goto err_out;
>  
> -	ret = device_add(&device->device);
> +	ret = vfio_device_add(device);
>  	if (ret)
>  		goto err_out;
>  
> @@ -320,6 +321,12 @@ void vfio_unregister_group_dev(struct vfio_device *device)
>  	bool interrupted = false;
>  	long rc;
>  
> +	/* Prevent new device opened in the group path */
> +	vfio_device_group_unregister(device);
> +
> +	/* Prevent new device opened in the cdev path */
> +	vfio_device_del(device);
> +
>  	vfio_device_put_registration(device);
>  	rc = try_wait_for_completion(&device->comp);
>  	while (rc <= 0) {
> @@ -343,11 +350,6 @@ void vfio_unregister_group_dev(struct vfio_device *device)
>  		}
>  	}
>  
> -	vfio_device_group_unregister(device);
> -
> -	/* Balances device_add in register path */
> -	device_del(&device->device);
> -

Why were these relocated?  And additionally why was the comment
regarding the balance operations dropped?  The move seems unrelated to
the patch here, so if it's actually advisable for some reason, it
should be a separate patch.  Thanks,

Alex

>  	/* Balances vfio_device_set_group in register path */
>  	vfio_device_remove_group(device);
>  }
> @@ -555,7 +557,8 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
>  	struct vfio_device_file *df = filep->private_data;
>  	struct vfio_device *device = df->device;
>  
> -	vfio_device_group_close(df);
> +	if (df->group)
> +		vfio_device_group_close(df);
>  
>  	vfio_device_put_registration(device);
>  
> @@ -1204,6 +1207,7 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
>  
>  const struct file_operations vfio_device_fops = {
>  	.owner		= THIS_MODULE,
> +	.open		= vfio_device_fops_cdev_open,
>  	.release	= vfio_device_fops_release,
>  	.read		= vfio_device_fops_read,
>  	.write		= vfio_device_fops_write,
> @@ -1590,9 +1594,16 @@ static int __init vfio_init(void)
>  		goto err_dev_class;
>  	}
>  
> +	ret = vfio_cdev_init(vfio.device_class);
> +	if (ret)
> +		goto err_alloc_dev_chrdev;
> +
>  	pr_info(DRIVER_DESC " version: " DRIVER_VERSION "\n");
>  	return 0;
>  
> +err_alloc_dev_chrdev:
> +	class_destroy(vfio.device_class);
> +	vfio.device_class = NULL;
>  err_dev_class:
>  	vfio_virqfd_exit();
>  err_virqfd:
> @@ -1603,6 +1614,7 @@ static int __init vfio_init(void)
>  static void __exit vfio_cleanup(void)
>  {
>  	ida_destroy(&vfio.device_ida);
> +	vfio_cdev_cleanup();
>  	class_destroy(vfio.device_class);
>  	vfio.device_class = NULL;
>  	vfio_virqfd_exit();
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 5c06af04ed9e..8719ec2adbbb 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -13,6 +13,7 @@
>  #include <linux/mm.h>
>  #include <linux/workqueue.h>
>  #include <linux/poll.h>
> +#include <linux/cdev.h>
>  #include <uapi/linux/vfio.h>
>  #include <linux/iova_bitmap.h>
>  
> @@ -51,6 +52,9 @@ struct vfio_device {
>  	/* Members below here are private, not for driver use */
>  	unsigned int index;
>  	struct device device;	/* device.kref covers object life circle */
> +#if IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV)
> +	struct cdev cdev;
> +#endif
>  	refcount_t refcount;	/* user count on registered device*/
>  	unsigned int open_count;
>  	struct completion comp;

