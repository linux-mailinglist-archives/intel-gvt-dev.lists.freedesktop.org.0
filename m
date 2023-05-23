Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AFB70E0FD
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 23 May 2023 17:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D175010E469;
	Tue, 23 May 2023 15:51:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB2D10E468
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 May 2023 15:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684857086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ffFlRnxDhkqavn7yvdBgJwj9RUS/Xk0FK9gf/ckanJU=;
 b=FpyVBPqQy6isobBVgYIOuzFoKB8NfdGbXxNsMm/b9/vFqBZwaOQlDckCMHXu0rmEmRyKyw
 jwT5OnMJuvkCa/sacVVzIkgD6wcHBaxE2kPVqUATBB8FFtkBNipFBU/ZSGsg4DL3Kc8rQP
 ylZ+sf5G9zcal4FYkyqvQtvQgKl8Nek=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-Brbmw3X3N9GCyJm-XV0e0Q-1; Tue, 23 May 2023 11:51:24 -0400
X-MC-Unique: Brbmw3X3N9GCyJm-XV0e0Q-1
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-7748b80141aso23997639f.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 May 2023 08:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684857084; x=1687449084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ffFlRnxDhkqavn7yvdBgJwj9RUS/Xk0FK9gf/ckanJU=;
 b=FPNMGJVvxc0BVizFfLH+KffBe/c2T2LB7qD6sDphs851I24Yo2dMB4pifdwvKllsKx
 Z89M7hCzZbXH3pKG+zh+JkSkN0dnUarOHzADB0kou6I/36ucMBthI5nhbtZcpPC8YG6/
 /iG4MmCAmLLHuj6hsfOZ4Ye4PCVCf7pDV+2KZ4mJfFhTpMApdiDurLPUPlVdQkKtwxaV
 cVwbJFZK7GKnm6MTy7Ckznn0+h4QcxXy2VF44d73BBz/U5LTJ70mJICM62tYApGq+Hj9
 qyKekBUUWvpzj3wK6lnDgDT/s1N6AkIh5a9dzoWCkg0FbS36mOAlFMWN+BXacC+MM2CV
 qWzw==
X-Gm-Message-State: AC+VfDw24v+YFRlvNrjaFvmKdjvHtiHp1/EPNpLLOLfjxBSXWKFiffgK
 GnAZXraHlXXJrbwOOnVZbRBViNLiMgS4yl2dsCeWKq5qz2zJBqUwK7m9797uRnClH5tW2H0hKEV
 PlVQg/WsAtKiRLKIB0nkOgUvhvW3kJuAFRw==
X-Received: by 2002:a6b:db04:0:b0:76f:f462:34d2 with SMTP id
 t4-20020a6bdb04000000b0076ff46234d2mr9680031ioc.14.1684857083909; 
 Tue, 23 May 2023 08:51:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4s2oY12m90VVYTK9dxF+HkSqm06XXvBX9tRE5XFoCNlD3yg24BUPg0oDodHHSqTpRLwPF3hg==
X-Received: by 2002:a6b:db04:0:b0:76f:f462:34d2 with SMTP id
 t4-20020a6bdb04000000b0076ff46234d2mr9680001ioc.14.1684857083536; 
 Tue, 23 May 2023 08:51:23 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 h25-20020a056638063900b0040bbe6013d3sm2591376jar.141.2023.05.23.08.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 08:51:22 -0700 (PDT)
Date: Tue, 23 May 2023 09:51:21 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v11 19/23] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Message-ID: <20230523095121.1a7a255d.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB752935BF70AC95B564685DC0C3409@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230513132827.39066-1-yi.l.liu@intel.com>
 <20230513132827.39066-20-yi.l.liu@intel.com>
 <20230522160124.768430b4.alex.williamson@redhat.com>
 <DS0PR11MB752935BF70AC95B564685DC0C3409@DS0PR11MB7529.namprd11.prod.outlook.com>
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "Zhao, 
 Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "clegoate@redhat.com" <clegoate@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 23 May 2023 01:41:36 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Tuesday, May 23, 2023 6:01 AM
> > 
> > On Sat, 13 May 2023 06:28:23 -0700
> > Yi Liu <yi.l.liu@intel.com> wrote:
> >   
> > > This adds ioctl for userspace to bind device cdev fd to iommufd.
> > >
> > >     VFIO_DEVICE_BIND_IOMMUFD: bind device to an iommufd, hence gain DMA
> > > 			      control provided by the iommufd. open_device
> > > 			      op is called after bind_iommufd op.
> > >
> > > Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> > > Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > > Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> > > ---
> > >  drivers/vfio/device_cdev.c | 130 +++++++++++++++++++++++++++++++++++++
> > >  drivers/vfio/vfio.h        |  13 ++++
> > >  drivers/vfio/vfio_main.c   |   5 ++
> > >  include/linux/vfio.h       |   3 +-
> > >  include/uapi/linux/vfio.h  |  28 ++++++++
> > >  5 files changed, 178 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
> > > index 1c640016a824..291cc678a18b 100644
> > > --- a/drivers/vfio/device_cdev.c
> > > +++ b/drivers/vfio/device_cdev.c
> > > @@ -3,6 +3,7 @@
> > >   * Copyright (c) 2023 Intel Corporation.
> > >   */
> > >  #include <linux/vfio.h>
> > > +#include <linux/iommufd.h>
> > >
> > >  #include "vfio.h"
> > >
> > > @@ -44,6 +45,135 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct  
> > file *filep)  
> > >  	return ret;
> > >  }
> > >
> > > +static void vfio_device_get_kvm_safe(struct vfio_device_file *df)
> > > +{
> > > +	spin_lock(&df->kvm_ref_lock);
> > > +	if (df->kvm)
> > > +		_vfio_device_get_kvm_safe(df->device, df->kvm);
> > > +	spin_unlock(&df->kvm_ref_lock);
> > > +}
> > > +
> > > +void vfio_device_cdev_close(struct vfio_device_file *df)
> > > +{
> > > +	struct vfio_device *device = df->device;
> > > +
> > > +	/*
> > > +	 * In the time of close, there is no contention with another one
> > > +	 * changing this flag.  So read df->access_granted without lock
> > > +	 * and no smp_load_acquire() is ok.
> > > +	 */
> > > +	if (!df->access_granted)
> > > +		return;
> > > +
> > > +	mutex_lock(&device->dev_set->lock);
> > > +	vfio_device_close(df);
> > > +	vfio_device_put_kvm(device);
> > > +	iommufd_ctx_put(df->iommufd);
> > > +	device->cdev_opened = false;
> > > +	mutex_unlock(&device->dev_set->lock);
> > > +	vfio_device_unblock_group(device);
> > > +}
> > > +
> > > +static struct iommufd_ctx *vfio_get_iommufd_from_fd(int fd)
> > > +{
> > > +	struct iommufd_ctx *iommufd;
> > > +	struct fd f;
> > > +
> > > +	f = fdget(fd);
> > > +	if (!f.file)
> > > +		return ERR_PTR(-EBADF);
> > > +
> > > +	iommufd = iommufd_ctx_from_file(f.file);
> > > +
> > > +	fdput(f);
> > > +	return iommufd;
> > > +}
> > > +
> > > +long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
> > > +				    struct vfio_device_bind_iommufd __user *arg)
> > > +{
> > > +	struct vfio_device *device = df->device;
> > > +	struct vfio_device_bind_iommufd bind;
> > > +	unsigned long minsz;
> > > +	int ret;
> > > +
> > > +	static_assert(__same_type(arg->out_devid, df->devid));
> > > +
> > > +	minsz = offsetofend(struct vfio_device_bind_iommufd, out_devid);
> > > +
> > > +	if (copy_from_user(&bind, arg, minsz))
> > > +		return -EFAULT;
> > > +
> > > +	if (bind.argsz < minsz || bind.flags || bind.iommufd < 0)
> > > +		return -EINVAL;
> > > +
> > > +	/* BIND_IOMMUFD only allowed for cdev fds */
> > > +	if (df->group)
> > > +		return -EINVAL;
> > > +
> > > +	if (vfio_device_is_noiommu(device) && !capable(CAP_SYS_RAWIO))
> > > +		return -EPERM;
> > > +
> > > +	ret = vfio_device_block_group(device);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	mutex_lock(&device->dev_set->lock);
> > > +	/* one device cannot be bound twice */
> > > +	if (df->access_granted) {
> > > +		ret = -EINVAL;
> > > +		goto out_unlock;
> > > +	}
> > > +
> > > +	df->iommufd = vfio_get_iommufd_from_fd(bind.iommufd);
> > > +	if (IS_ERR(df->iommufd)) {
> > > +		ret = PTR_ERR(df->iommufd);
> > > +		df->iommufd = NULL;
> > > +		goto out_unlock;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Before the device open, get the KVM pointer currently
> > > +	 * associated with the device file (if there is) and obtain
> > > +	 * a reference.  This reference is held until device closed.
> > > +	 * Save the pointer in the device for use by drivers.
> > > +	 */
> > > +	vfio_device_get_kvm_safe(df);
> > > +
> > > +	ret = vfio_device_open(df);
> > > +	if (ret)
> > > +		goto out_put_kvm;
> > > +
> > > +	ret = copy_to_user(&arg->out_devid, &df->devid,
> > > +			   sizeof(df->devid)) ? -EFAULT : 0;
> > > +	if (ret)
> > > +		goto out_close_device;
> > > +
> > > +	/*
> > > +	 * Paired with smp_load_acquire() in vfio_device_fops::ioctl/
> > > +	 * read/write/mmap
> > > +	 */
> > > +	smp_store_release(&df->access_granted, true);
> > > +	device->cdev_opened = true;
> > > +	mutex_unlock(&device->dev_set->lock);
> > > +
> > > +	if (vfio_device_is_noiommu(device))
> > > +		dev_warn(device->dev, "noiommu device is bound to iommufd by user  
> > "  
> > > +			 "(%s:%d)\n", current->comm, task_pid_nr(current));  
> > 
> > The noiommu kernel taint only happens in vfio_group_find_or_alloc(), so
> > how does noiommu taint the kernel when !CONFIG_VFIO_GROUP?  
> 
> Yeah, in the cdev path, no taint. I add this just in order to par with the below
> message in the group path.
> 
> vfio_device_open_file()
> {
> 	dev_warn(device->dev, "vfio-noiommu device opened by user "
> 		   "(%s:%d)\n", current->comm, task_pid_nr(current));
> }

There needs to be a taint when VFIO_GROUP is disabled.  Thanks,

Alex
 
> > > +	return 0;
> > > +
> > > +out_close_device:
> > > +	vfio_device_close(df);
> > > +out_put_kvm:
> > > +	vfio_device_put_kvm(device);
> > > +	iommufd_ctx_put(df->iommufd);
> > > +	df->iommufd = NULL;
> > > +out_unlock:
> > > +	mutex_unlock(&device->dev_set->lock);
> > > +	vfio_device_unblock_group(device);
> > > +	return ret;
> > > +}
> > > +
> > >  static char *vfio_device_devnode(const struct device *dev, umode_t *mode)
> > >  {
> > >  	return kasprintf(GFP_KERNEL, "vfio/devices/%s", dev_name(dev));
> > > diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> > > index 6861f8ebb64d..8b359a7794be 100644
> > > --- a/drivers/vfio/vfio.h
> > > +++ b/drivers/vfio/vfio.h
> > > @@ -279,6 +279,9 @@ static inline void vfio_device_del(struct vfio_device *device)
> > >
> > >  void vfio_init_device_cdev(struct vfio_device *device);
> > >  int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep);
> > > +void vfio_device_cdev_close(struct vfio_device_file *df);
> > > +long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
> > > +				    struct vfio_device_bind_iommufd __user *arg);
> > >  int vfio_cdev_init(struct class *device_class);
> > >  void vfio_cdev_cleanup(void);
> > >  #else
> > > @@ -302,6 +305,16 @@ static inline int vfio_device_fops_cdev_open(struct inode  
> > *inode,  
> > >  	return 0;
> > >  }
> > >
> > > +static inline void vfio_device_cdev_close(struct vfio_device_file *df)
> > > +{
> > > +}
> > > +
> > > +static inline long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
> > > +						  struct vfio_device_bind_iommufd  
> > __user *arg)  
> > > +{
> > > +	return -EOPNOTSUPP;
> > > +}
> > > +
> > >  static inline int vfio_cdev_init(struct class *device_class)
> > >  {
> > >  	return 0;
> > > diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> > > index c87cc7afe92c..c9fa39ac4b02 100644
> > > --- a/drivers/vfio/vfio_main.c
> > > +++ b/drivers/vfio/vfio_main.c
> > > @@ -574,6 +574,8 @@ static int vfio_device_fops_release(struct inode *inode, struct  
> > file *filep)  
> > >
> > >  	if (df->group)
> > >  		vfio_device_group_close(df);
> > > +	else
> > > +		vfio_device_cdev_close(df);
> > >
> > >  	vfio_device_put_registration(device);
> > >
> > > @@ -1147,6 +1149,9 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
> > >  	struct vfio_device *device = df->device;
> > >  	int ret;
> > >
> > > +	if (cmd == VFIO_DEVICE_BIND_IOMMUFD)
> > > +		return vfio_device_ioctl_bind_iommufd(df, (void __user *)arg);
> > > +
> > >  	/* Paired with smp_store_release() following vfio_device_open() */
> > >  	if (!smp_load_acquire(&df->access_granted))
> > >  		return -EINVAL;
> > > diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> > > index 873275419f13..cf9d082a623c 100644
> > > --- a/include/linux/vfio.h
> > > +++ b/include/linux/vfio.h
> > > @@ -67,6 +67,7 @@ struct vfio_device {
> > >  	struct iommufd_device *iommufd_device;
> > >  	bool iommufd_attached;
> > >  #endif
> > > +	bool cdev_opened:1;
> > >  };
> > >
> > >  /**
> > > @@ -169,7 +170,7 @@ vfio_iommufd_physical_devid(struct vfio_device *vdev)
> > >
> > >  static inline bool vfio_device_cdev_opened(struct vfio_device *device)
> > >  {
> > > -	return false;
> > > +	return device->cdev_opened;
> > >  }
> > >
> > >  /**
> > > diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> > > index 24858b650562..07c917de31e9 100644
> > > --- a/include/uapi/linux/vfio.h
> > > +++ b/include/uapi/linux/vfio.h
> > > @@ -194,6 +194,34 @@ struct vfio_group_status {
> > >
> > >  /* --------------- IOCTLs for DEVICE file descriptors --------------- */
> > >
> > > +/*
> > > + * VFIO_DEVICE_BIND_IOMMUFD - _IOR(VFIO_TYPE, VFIO_BASE + 19,
> > > + *				   struct vfio_device_bind_iommufd)
> > > + *
> > > + * Bind a vfio_device to the specified iommufd.
> > > + *
> > > + * User is restricted from accessing the device before the binding operation
> > > + * is completed.
> > > + *
> > > + * Unbind is automatically conducted when device fd is closed.
> > > + *
> > > + * @argsz:	 User filled size of this data.
> > > + * @flags:	 Must be 0.
> > > + * @iommufd:	 iommufd to bind.
> > > + * @out_devid:	 The device id generated by this bind. devid is a handle for
> > > + *		 this device/iommufd bond and can be used in IOMMUFD commands.
> > > + *
> > > + * Return: 0 on success, -errno on failure.
> > > + */
> > > +struct vfio_device_bind_iommufd {
> > > +	__u32		argsz;
> > > +	__u32		flags;
> > > +	__s32		iommufd;
> > > +	__u32		out_devid;
> > > +};
> > > +
> > > +#define VFIO_DEVICE_BIND_IOMMUFD	_IO(VFIO_TYPE, VFIO_BASE + 19)
> > > +  
> > 
> > Why is this preempting the first device ioctl below rather than being
> > added in sequential order?  I'm also not sure what's at device ioctl 18
> > that we started at 19.  VFIO_DEVICE_FEATURE is at 17.  Yes, they're
> > hard to keep track of.  Thanks,  
> 
> yes, 17 is the last occupied ioctl offset on device fd. Will correct
> it.
> 
> Regards,
> Yi Liu
> 

