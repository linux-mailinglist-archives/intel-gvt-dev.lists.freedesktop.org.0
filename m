Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A08B68AA8C
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  4 Feb 2023 15:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E859510E220;
	Sat,  4 Feb 2023 14:25:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606A710E220
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  4 Feb 2023 14:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675520724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BPb3zmrBo8hI1QaL+QoDXfm9YTI2O8rGNvKyRtuVNJ4=;
 b=TEbjoqJS9KO5VroVSWszpzn+LsWOIeSbxytx+JCy9tH9WVPvTME+WC6ZTuPlEYgqAqEPj1
 3U0Ns1cf/UW7dOv5pAYRvh+uIipTW6iF6CNiVI4d6ngn6P32j9LKtEp+6vp9l2dP1mrdV8
 xUcDtSMNzJ0nuPl96LVckIsRs1GSKrY=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121-iQEpv6SGPkGRqrvKhmvlVA-1; Sat, 04 Feb 2023 09:25:21 -0500
X-MC-Unique: iQEpv6SGPkGRqrvKhmvlVA-1
Received: by mail-il1-f200.google.com with SMTP id
 s12-20020a056e021a0c00b0030efd0ed890so5134837ild.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 04 Feb 2023 06:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BPb3zmrBo8hI1QaL+QoDXfm9YTI2O8rGNvKyRtuVNJ4=;
 b=AmRkJ3TxTzuwFxs3g6Lr0DxrYsh5SZFuuEB12bVC+WxudwpfG5mbY+/2dlTI9dWr9m
 2G6pmU7w7u3evB3d2HEEqYWjApAhTXDr6hllJOkgSXrsb85TQBcaMGvZzWNeu3euocRe
 IlvOpZfp9jVe5epZBSw9IzVBXJeU1IuA/YWBqKZMcvldr2WAl0aySVDPN5mglaDwkE7x
 cLo8kHJBHSjDb3tHINnIzk9n7PpErR2P5h+MJ+YBoB2b89OetkBloDXAahHs+26GtW/J
 xYNZmCnxv8hFtdx1HtficGrZozTgdQVSWtdSboTGBVGDGNVox2H+Nowwu+siMRLdADrI
 Z3GQ==
X-Gm-Message-State: AO0yUKVQ4gi6eojWcdEoqUTNUi4VnvxL90+DLdo8W3ysKZ2Vn7z62qKB
 Gb/FE+uOUKREQ2RdXt2KpdyVTWzxh29dsCYPMx7kk+zEnlf0eFGS4YSdf4p0uKKxMoxhvro/L/9
 fA9Uh4deo+te1OaXpLeSwyqTp8ZfysWB76g==
X-Received: by 2002:a5d:8e0c:0:b0:729:63de:4546 with SMTP id
 e12-20020a5d8e0c000000b0072963de4546mr4655320iod.3.1675520721121; 
 Sat, 04 Feb 2023 06:25:21 -0800 (PST)
X-Google-Smtp-Source: AK7set8hCr+StI5YhRk/qZS/3KcSos6ZFduXHTX04WfBJmgHPj/mpHyfvyuLXevwkRlA04qUDb9YPw==
X-Received: by 2002:a5d:8e0c:0:b0:729:63de:4546 with SMTP id
 e12-20020a5d8e0c000000b0072963de4546mr4655303iod.3.1675520720796; 
 Sat, 04 Feb 2023 06:25:20 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 u13-20020a02aa8d000000b003a9595b7e3asm1806920jai.46.2023.02.04.06.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 06:25:19 -0800 (PST)
Date: Sat, 4 Feb 2023 07:25:18 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v4 1/2] vfio: fix deadlock between group lock and kvm lock
Message-ID: <20230204072518.537ab50b.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529CE3027A713D6F2EE7F68C3D49@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230203215027.151988-1-mjrosato@linux.ibm.com>
 <20230203215027.151988-2-mjrosato@linux.ibm.com>
 <DS0PR11MB7529CE3027A713D6F2EE7F68C3D49@DS0PR11MB7529.namprd11.prod.outlook.com>
Organization: Red Hat
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>,
 "david@redhat.com" <david@redhat.com>, "Tian, 
 Kevin" <kevin.tian@intel.com>,
 "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "pmorel@linux.ibm.com" <pmorel@linux.ibm.com>, "Christopherson, ,
 Sean" <seanjc@google.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Sat, 4 Feb 2023 06:21:48 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Matthew Rosato <mjrosato@linux.ibm.com>
> > Sent: Saturday, February 4, 2023 5:50 AM
> > To: alex.williamson@redhat.com; pbonzini@redhat.com; Liu, Yi L
> > 
> > After 51cdc8bc120e, we have another deadlock scenario between the
> > kvm->lock and the vfio group_lock with two different codepaths acquiring
> > the locks in different order.  Specifically in vfio_open_device, vfio
> > holds the vfio group_lock when issuing device->ops->open_device but
> > some
> > drivers (like vfio-ap) need to acquire kvm->lock during their open_device
> > routine;  Meanwhile, kvm_vfio_release will acquire the kvm->lock first
> > before calling vfio_file_set_kvm which will acquire the vfio group_lock.
> > 
> > To resolve this, let's remove the need for the vfio group_lock from the
> > kvm_vfio_release codepath.  This is done by introducing a new spinlock to
> > protect modifications to the vfio group kvm pointer, and acquiring a kvm
> > ref from within vfio while holding this spinlock, with the reference held
> > until the last close for the device in question.
> > 
> > Fixes: 51cdc8bc120e ("kvm/vfio: Fix potential deadlock on vfio group_lock")
> > Reported-by: Anthony Krowiak <akrowiak@linux.ibm.com>
> > Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> > ---
> >  drivers/vfio/group.c     | 44 +++++++++++++++++++++++-----
> >  drivers/vfio/vfio.h      | 15 ++++++++++
> >  drivers/vfio/vfio_main.c | 63
> > +++++++++++++++++++++++++++++++++++-----
> >  include/linux/vfio.h     |  2 +-
> >  4 files changed, 109 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> > index bb24b2f0271e..98621ac082f0 100644
> > --- a/drivers/vfio/group.c
> > +++ b/drivers/vfio/group.c
> > @@ -154,6 +154,18 @@ static int vfio_group_ioctl_set_container(struct
> > vfio_group *group,
> >  	return ret;
> >  }
> > 
> > +static void vfio_device_group_get_kvm_safe(struct vfio_device *device)
> > +{
> > +	spin_lock(&device->group->kvm_ref_lock);
> > +	if (!device->group->kvm)
> > +		goto unlock;
> > +
> > +	_vfio_device_get_kvm_safe(device, device->group->kvm);
> > +
> > +unlock:
> > +	spin_unlock(&device->group->kvm_ref_lock);
> > +}
> > +
> >  static int vfio_device_group_open(struct vfio_device *device)
> >  {
> >  	int ret;
> > @@ -164,13 +176,23 @@ static int vfio_device_group_open(struct
> > vfio_device *device)
> >  		goto out_unlock;
> >  	}
> > 
> > +	mutex_lock(&device->dev_set->lock);
> > +
> >  	/*
> > -	 * Here we pass the KVM pointer with the group under the lock.  If
> > the
> > -	 * device driver will use it, it must obtain a reference and release it
> > -	 * during close_device.
> > +	 * Before the first device open, get the KVM pointer currently
> > +	 * associated with the group (if there is one) and obtain a reference
> > +	 * now that will be held until the open_count reaches 0 again.  Save  
> 
> Nit: a redundant space before "Save". Other part looks good to me.

Two spaces between sentences is a common standard.  Not everyone
prefers this, but I do.  Thanks,

Alex

> Reviewed-by: Yi Liu <yi.l.liu@intel.com>
> 
> Regards,
> Yi Liu
> 
> > +	 * the pointer in the device for use by drivers.
> >  	 */
> > -	ret = vfio_device_open(device, device->group->iommufd,
> > -			       device->group->kvm);
> > +	if (device->open_count == 0)
> > +		vfio_device_group_get_kvm_safe(device);
> > +
> > +	ret = vfio_device_open(device, device->group->iommufd, device->kvm);
> > +
> > +	if (device->open_count == 0)
> > +		vfio_device_put_kvm(device);
> > +
> > +	mutex_unlock(&device->dev_set->lock);
> > 
> >  out_unlock:
> >  	mutex_unlock(&device->group->group_lock);
> > @@ -180,7 +202,14 @@ static int vfio_device_group_open(struct
> > vfio_device *device)
> >  void vfio_device_group_close(struct vfio_device *device)
> >  {
> >  	mutex_lock(&device->group->group_lock);
> > +	mutex_lock(&device->dev_set->lock);
> > +
> >  	vfio_device_close(device, device->group->iommufd);
> > +
> > +	if (device->open_count == 0)
> > +		vfio_device_put_kvm(device);
> > +
> > +	mutex_unlock(&device->dev_set->lock);
> >  	mutex_unlock(&device->group->group_lock);
> >  }
> > 
> > @@ -450,6 +479,7 @@ static struct vfio_group *vfio_group_alloc(struct
> > iommu_group *iommu_group,
> > 
> >  	refcount_set(&group->drivers, 1);
> >  	mutex_init(&group->group_lock);
> > +	spin_lock_init(&group->kvm_ref_lock);
> >  	INIT_LIST_HEAD(&group->device_list);
> >  	mutex_init(&group->device_lock);
> >  	group->iommu_group = iommu_group;
> > @@ -803,9 +833,9 @@ void vfio_file_set_kvm(struct file *file, struct kvm
> > *kvm)
> >  	if (!vfio_file_is_group(file))
> >  		return;
> > 
> > -	mutex_lock(&group->group_lock);
> > +	spin_lock(&group->kvm_ref_lock);
> >  	group->kvm = kvm;
> > -	mutex_unlock(&group->group_lock);
> > +	spin_unlock(&group->kvm_ref_lock);
> >  }
> >  EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
> > 
> > diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> > index f8219a438bfb..24d6cd285945 100644
> > --- a/drivers/vfio/vfio.h
> > +++ b/drivers/vfio/vfio.h
> > @@ -74,6 +74,7 @@ struct vfio_group {
> >  	struct file			*opened_file;
> >  	struct blocking_notifier_head	notifier;
> >  	struct iommufd_ctx		*iommufd;
> > +	spinlock_t			kvm_ref_lock;
> >  };
> > 
> >  int vfio_device_set_group(struct vfio_device *device,
> > @@ -251,4 +252,18 @@ extern bool vfio_noiommu __read_mostly;
> >  enum { vfio_noiommu = false };
> >  #endif
> > 
> > +#ifdef CONFIG_HAVE_KVM
> > +void _vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm
> > *kvm);
> > +void vfio_device_put_kvm(struct vfio_device *device);
> > +#else
> > +static inline void _vfio_device_get_kvm_safe(struct vfio_device *device,
> > +					     struct kvm *kvm)
> > +{
> > +}
> > +
> > +static inline void vfio_device_put_kvm(struct vfio_device *device)
> > +{
> > +}
> > +#endif
> > +
> >  #endif
> > diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> > index 5177bb061b17..28c47cd6a6b5 100644
> > --- a/drivers/vfio/vfio_main.c
> > +++ b/drivers/vfio/vfio_main.c
> > @@ -16,6 +16,9 @@
> >  #include <linux/fs.h>
> >  #include <linux/idr.h>
> >  #include <linux/iommu.h>
> > +#ifdef CONFIG_HAVE_KVM
> > +#include <linux/kvm_host.h>
> > +#endif
> >  #include <linux/list.h>
> >  #include <linux/miscdevice.h>
> >  #include <linux/module.h>
> > @@ -338,6 +341,55 @@ void vfio_unregister_group_dev(struct vfio_device
> > *device)
> >  }
> >  EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
> > 
> > +#ifdef CONFIG_HAVE_KVM
> > +void _vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm
> > *kvm)
> > +{
> > +	void (*pfn)(struct kvm *kvm);
> > +	bool (*fn)(struct kvm *kvm);
> > +	bool ret;
> > +
> > +	lockdep_assert_held(&device->dev_set->lock);
> > +
> > +	pfn = symbol_get(kvm_put_kvm);
> > +	if (WARN_ON(!pfn))
> > +		return;
> > +
> > +	fn = symbol_get(kvm_get_kvm_safe);
> > +	if (WARN_ON(!fn)) {
> > +		symbol_put(kvm_put_kvm);
> > +		return;
> > +	}
> > +
> > +	ret = fn(kvm);
> > +	symbol_put(kvm_get_kvm_safe);
> > +	if (!ret) {
> > +		symbol_put(kvm_put_kvm);
> > +		return;
> > +	}
> > +
> > +	device->put_kvm = pfn;
> > +	device->kvm = kvm;
> > +}
> > +
> > +void vfio_device_put_kvm(struct vfio_device *device)
> > +{
> > +	lockdep_assert_held(&device->dev_set->lock);
> > +
> > +	if (!device->kvm)
> > +		return;
> > +
> > +	if (WARN_ON(!device->put_kvm))
> > +		goto clear;
> > +
> > +	device->put_kvm(device->kvm);
> > +	device->put_kvm = NULL;
> > +	symbol_put(kvm_put_kvm);
> > +
> > +clear:
> > +	device->kvm = NULL;
> > +}
> > +#endif
> > +
> >  /* true if the vfio_device has open_device() called but not close_device()
> > */
> >  static bool vfio_assert_device_open(struct vfio_device *device)
> >  {
> > @@ -361,7 +413,6 @@ static int vfio_device_first_open(struct vfio_device
> > *device,
> >  	if (ret)
> >  		goto err_module_put;
> > 
> > -	device->kvm = kvm;
> >  	if (device->ops->open_device) {
> >  		ret = device->ops->open_device(device);
> >  		if (ret)
> > @@ -370,7 +421,6 @@ static int vfio_device_first_open(struct vfio_device
> > *device,
> >  	return 0;
> > 
> >  err_unuse_iommu:
> > -	device->kvm = NULL;
> >  	if (iommufd)
> >  		vfio_iommufd_unbind(device);
> >  	else
> > @@ -387,7 +437,6 @@ static void vfio_device_last_close(struct vfio_device
> > *device,
> > 
> >  	if (device->ops->close_device)
> >  		device->ops->close_device(device);
> > -	device->kvm = NULL;
> >  	if (iommufd)
> >  		vfio_iommufd_unbind(device);
> >  	else
> > @@ -400,14 +449,14 @@ int vfio_device_open(struct vfio_device *device,
> >  {
> >  	int ret = 0;
> > 
> > -	mutex_lock(&device->dev_set->lock);
> > +	lockdep_assert_held(&device->dev_set->lock);
> > +
> >  	device->open_count++;
> >  	if (device->open_count == 1) {
> >  		ret = vfio_device_first_open(device, iommufd, kvm);
> >  		if (ret)
> >  			device->open_count--;
> >  	}
> > -	mutex_unlock(&device->dev_set->lock);
> > 
> >  	return ret;
> >  }
> > @@ -415,12 +464,12 @@ int vfio_device_open(struct vfio_device *device,
> >  void vfio_device_close(struct vfio_device *device,
> >  		       struct iommufd_ctx *iommufd)
> >  {
> > -	mutex_lock(&device->dev_set->lock);
> > +	lockdep_assert_held(&device->dev_set->lock);
> > +
> >  	vfio_assert_device_open(device);
> >  	if (device->open_count == 1)
> >  		vfio_device_last_close(device, iommufd);
> >  	device->open_count--;
> > -	mutex_unlock(&device->dev_set->lock);
> >  }
> > 
> >  /*
> > diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> > index 35be78e9ae57..87ff862ff555 100644
> > --- a/include/linux/vfio.h
> > +++ b/include/linux/vfio.h
> > @@ -46,7 +46,6 @@ struct vfio_device {
> >  	struct vfio_device_set *dev_set;
> >  	struct list_head dev_set_list;
> >  	unsigned int migration_flags;
> > -	/* Driver must reference the kvm during open_device or never
> > touch it */
> >  	struct kvm *kvm;
> > 
> >  	/* Members below here are private, not for driver use */
> > @@ -58,6 +57,7 @@ struct vfio_device {
> >  	struct list_head group_next;
> >  	struct list_head iommu_entry;
> >  	struct iommufd_access *iommufd_access;
> > +	void (*put_kvm)(struct kvm *kvm);
> >  #if IS_ENABLED(CONFIG_IOMMUFD)
> >  	struct iommufd_device *iommufd_device;
> >  	struct iommufd_ctx *iommufd_ictx;
> > --
> > 2.39.1  
> 

