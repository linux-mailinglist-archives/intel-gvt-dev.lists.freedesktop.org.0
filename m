Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA3F6871E4
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  2 Feb 2023 00:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1E510E1B0;
	Wed,  1 Feb 2023 23:27:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D2910E1B0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  1 Feb 2023 23:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675294056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sXoQvVrTzYsdEyLij+fdiknvHP5DRqaJ4e72GDsPbAA=;
 b=SmNRQbRztMB37W27sztXlpPZp7I7niL0PseTnIJDXDU8qm3xSyimF2qeTZXNnknOWULIi3
 3Wl9n0WS7091Ko4fut355L/bBpIDpVeOaTjjk/o1ozeEBEMxfi4f4FiSCcyeJQ7BqXTYTk
 H6Wlx+Kb362DZIfNtnkj+e8/jZ3t3Zk=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-113-vQvJ7-KgOV658V0VPzdY9A-1; Wed, 01 Feb 2023 18:27:35 -0500
X-MC-Unique: vQvJ7-KgOV658V0VPzdY9A-1
Received: by mail-io1-f69.google.com with SMTP id
 b10-20020a5ea70a000000b0071a96a509a7so146202iod.22
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 01 Feb 2023 15:27:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sXoQvVrTzYsdEyLij+fdiknvHP5DRqaJ4e72GDsPbAA=;
 b=Rrzzoay/W3Erhw4JFQVOFt6paFnl3LeWWHj3eLtYeYrJWkOhSH5mRIDK9lHTiB0FHH
 zmKomaqPeU62k8t8r4Wkd1b0BM4EBist31eV1IonpyOcoaymWb14mnUCdTMErHFrefLH
 B0/F0FGFH0JGP1JqJvcNgnjuhRVsm85pW8MQ9DeqUobuXH+RJuAqM7R4SvQdHtD0xbYH
 WSs3QH++f+7TfPRS7XatEk5+LapgpGy31o7gCmMt3a/J7vjXhHscNhCC8fEGZs4v0bdD
 fIxxYMeYJffjtBiQ3n1tdfjVBI3NuNSKvBLgw46f2ZbeONzJqYVXfK3aUoFSNfCuT1NK
 Goog==
X-Gm-Message-State: AO0yUKUG7vlw0xS/rt+zXI9HqEeaoVIlh0Fa3F5f6FdXdMdKHE9M1u7o
 NvWqj41kr1uPPNv1eg60gCA9t32P+KGMOY6+GBYbiMerW/05M1FLX8vrtpEgIiksdy4xgPKyZRe
 6Up9B8RiC1SaBPcvWD/tGPtz+cdGY6vOpiQ==
X-Received: by 2002:a92:1a49:0:b0:312:7a4e:e94d with SMTP id
 z9-20020a921a49000000b003127a4ee94dmr1722571ill.2.1675294054456; 
 Wed, 01 Feb 2023 15:27:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9MjiBziwTIHNmlWFdw11glj8cooml8tewS+nx1zwidAC5HMpy92oxemwoUyVXyjV7jd9LSyA==
X-Received: by 2002:a92:1a49:0:b0:312:7a4e:e94d with SMTP id
 z9-20020a921a49000000b003127a4ee94dmr1722541ill.2.1675294054113; 
 Wed, 01 Feb 2023 15:27:34 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 v4-20020a02b904000000b003b15f4ecde8sm3127725jan.88.2023.02.01.15.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 15:27:33 -0800 (PST)
Date: Wed, 1 Feb 2023 16:27:30 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH v2] vfio: fix deadlock between group lock and kvm lock
Message-ID: <20230201162730.685b5332.alex.williamson@redhat.com>
In-Reply-To: <20230201192010.42748-1-mjrosato@linux.ibm.com>
References: <20230201192010.42748-1-mjrosato@linux.ibm.com>
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
Cc: kvm@vger.kernel.org, david@redhat.com, kevin.tian@intel.com,
 imbrenda@linux.ibm.com, linux-s390@vger.kernel.org, yi.l.liu@intel.com,
 frankja@linux.ibm.com, pasic@linux.ibm.com, jgg@nvidia.com,
 borntraeger@linux.ibm.com, zhi.a.wang@intel.com, jjherne@linux.ibm.com,
 farman@linux.ibm.com, intel-gfx@lists.freedesktop.org, zhenyuw@linux.intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 pmorel@linux.ibm.com, seanjc@google.com, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, pbonzini@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed,  1 Feb 2023 14:20:10 -0500
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> After 51cdc8bc120e, we have another deadlock scenario between the
> kvm->lock and the vfio group_lock with two different codepaths acquiring
> the locks in different order.  Specifically in vfio_open_device, vfio
> holds the vfio group_lock when issuing device->ops->open_device but some
> drivers (like vfio-ap) need to acquire kvm->lock during their open_device
> routine;  Meanwhile, kvm_vfio_release will acquire the kvm->lock first
> before calling vfio_file_set_kvm which will acquire the vfio group_lock.
> 
> To resolve this, let's remove the need for the vfio group_lock from the
> kvm_vfio_release codepath.  This is done by introducing a new spinlock to
> protect modifications to the vfio group kvm pointer, and acquiring a kvm
> ref from within vfio while holding this spinlock, with the reference held
> until the last close for the device in question.
> 
> Fixes: 51cdc8bc120e ("kvm/vfio: Fix potential deadlock on vfio group_lock")
> Reported-by: Anthony Krowiak <akrowiak@linux.ibm.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
> Changes from v1:
> * use spin_lock instead of spin_lock_irqsave (Jason)
> * clear device->kvm_put as part of vfio_kvm_put_kvm (Yi)
> * Re-arrange code to avoid referencing the group contents from within
>   vfio_main (Kevin) which meant moving most of the code in this patch 
>   to group.c along with getting/dropping of the dev_set lock
> ---
>  drivers/vfio/group.c     | 90 +++++++++++++++++++++++++++++++++++++---
>  drivers/vfio/vfio.h      |  1 +
>  drivers/vfio/vfio_main.c | 11 ++---
>  include/linux/vfio.h     |  2 +-
>  4 files changed, 91 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> index bb24b2f0271e..52f434861294 100644
> --- a/drivers/vfio/group.c
> +++ b/drivers/vfio/group.c
> @@ -13,6 +13,9 @@
>  #include <linux/vfio.h>
>  #include <linux/iommufd.h>
>  #include <linux/anon_inodes.h>
> +#ifdef CONFIG_HAVE_KVM
> +#include <linux/kvm_host.h>
> +#endif
>  #include "vfio.h"
>  
>  static struct vfio {
> @@ -154,6 +157,55 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
>  	return ret;
>  }
>  
> +#ifdef CONFIG_HAVE_KVM
> +static bool vfio_kvm_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)

I'm tempted to name these vfio_device_get_kvm_safe() and only pass the
vfio_device, where of course we can get the kvm pointer from the group
internally.

> +{
> +	void (*pfn)(struct kvm *kvm);
> +	bool (*fn)(struct kvm *kvm);
> +	bool ret;
> +

We should assert_lockdep_held(&device->dev_set->lock) in both of these
since that seems to be what's protecting device->kvm and
device->put_kvm.

If we change as above to get the kvm pointer from the group within this
function, we can also move the kvm_ref_lock here, which seems to
simplify the caller quite a bit.

> +	pfn = symbol_get(kvm_put_kvm);
> +	if (WARN_ON(!pfn))
> +		return false;
> +
> +	fn = symbol_get(kvm_get_kvm_safe);
> +	if (WARN_ON(!fn)) {
> +		symbol_put(kvm_put_kvm);
> +		return false;
> +	}
> +
> +	ret = fn(kvm);
> +	if (ret)
> +		device->put_kvm = pfn;
> +	else
> +		symbol_put(kvm_put_kvm);
> +
> +	symbol_put(kvm_get_kvm_safe);
> +
> +	return ret;
> +}
> +
> +static void vfio_kvm_put_kvm(struct vfio_device *device)
> +{
> +	if (WARN_ON(!device->kvm || !device->put_kvm))
> +		return;

It simplifies the caller if we can use this even in the !device->kvm
case.

> +
> +	device->put_kvm(device->kvm);
> +	device->put_kvm = NULL;
> +	symbol_put(kvm_put_kvm);
> +}
> +
> +#else
> +static bool vfio_kvm_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
> +{
> +	return false;
> +}
> +
> +static void vfio_kvm_put_kvm(struct vfio_device *device)
> +{
> +}
> +#endif
> +
>  static int vfio_device_group_open(struct vfio_device *device)
>  {
>  	int ret;
> @@ -164,14 +216,32 @@ static int vfio_device_group_open(struct vfio_device *device)
>  		goto out_unlock;
>  	}
>  
> +	mutex_lock(&device->dev_set->lock);
> +
>  	/*
> -	 * Here we pass the KVM pointer with the group under the lock.  If the
> -	 * device driver will use it, it must obtain a reference and release it
> -	 * during close_device.
> +	 * Before the first device open, get the KVM pointer currently
> +	 * associated with the group (if there is one) and obtain a reference
> +	 * now that will be held until the open_count reaches 0 again.  Save
> +	 * the pointer in the device for use by drivers.
>  	 */
> +	if (device->open_count == 0) {
> +		spin_lock(&device->group->kvm_ref_lock);
> +		if (device->group->kvm &&
> +		    vfio_kvm_get_kvm_safe(device, device->group->kvm))
> +			device->kvm = device->group->kvm;
> +		spin_unlock(&device->group->kvm_ref_lock);
> +	}
> +
>  	ret = vfio_device_open(device, device->group->iommufd,
>  			       device->group->kvm);

We're using device->group->kvm outside of kvm_ref_lock here, it should
be using device->kvm.

>  
> +	if (ret && device->kvm && device->open_count == 0) {

Slightly redundant, if device->open_count == 0 here, we can infer ret
is non-zero.

I fiddled with it a little further, see if you like anything from the
version below and incorporate what you do.  Thanks,

Alex

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index bb24b2f0271e..5121a34e1489 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -13,6 +13,9 @@
 #include <linux/vfio.h>
 #include <linux/iommufd.h>
 #include <linux/anon_inodes.h>
+#ifdef CONFIG_HAVE_KVM
+#include <linux/kvm_host.h>
+#endif
 #include "vfio.h"
 
 static struct vfio {
@@ -154,6 +157,64 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
 	return ret;
 }
 
+#ifdef CONFIG_HAVE_KVM
+static void vfio_device_get_kvm_safe(struct vfio_device *device)
+{
+	void (*pfn)(struct kvm *kvm);
+	bool (*fn)(struct kvm *kvm);
+	bool ret;
+
+	lockdep_assert_held(&device->dev_set->lock);
+
+	spin_lock(&device->group->kvm_ref_lock);
+	if (!device->group->kvm)
+		goto unlock;
+
+	pfn = symbol_get(kvm_put_kvm);
+	if (WARN_ON(!pfn))
+		goto unlock;
+
+	fn = symbol_get(kvm_get_kvm_safe);
+	if (WARN_ON(!fn)) {
+		symbol_put(kvm_put_kvm);
+		goto unlock;
+	}
+
+	ret = fn(device->group->kvm);
+	symbol_put(kvm_get_kvm_safe);
+	if (!ret) {
+		symbol_put(kvm_put_kvm);
+		goto unlock;
+	}
+
+	device->put_kvm = pfn;
+	device->kvm = device->group->kvm;
+unlock:
+	spin_unlock(&device->group->kvm_ref_lock);
+}
+
+static void vfio_device_put_kvm(struct vfio_device *device)
+{
+	lockdep_assert_held(&device->dev_set->lock);
+
+	if (!device->kvm)
+		return;
+
+	if (WARN_ON(!device->put_kvm))
+		goto clear;
+
+	device->put_kvm(device->kvm);
+	device->put_kvm = NULL;
+	symbol_put(kvm_put_kvm);
+
+clear:
+	device->kvm = NULL;
+}
+#else
+static void vfio_device_get_kvm_safe(struct vfio_device *device) {}
+static void vfio_device_put_kvm(struct vfio_device *device) {}
+#endif
+
 static int vfio_device_group_open(struct vfio_device *device)
 {
 	int ret;
@@ -164,13 +225,23 @@ static int vfio_device_group_open(struct vfio_device *device)
 		goto out_unlock;
 	}
 
+	mutex_lock(&device->dev_set->lock);
+
 	/*
-	 * Here we pass the KVM pointer with the group under the lock.  If the
-	 * device driver will use it, it must obtain a reference and release it
-	 * during close_device.
+	 * Before the first device open, get the KVM pointer currently
+	 * associated with the group (if there is one) and obtain a reference
+	 * now that will be held until the open_count reaches 0 again.  Save
+	 * the pointer in the device for use by drivers.
 	 */
-	ret = vfio_device_open(device, device->group->iommufd,
-			       device->group->kvm);
+	if (device->open_count == 0)
+		vfio_device_get_kvm_safe(device);
+
+	ret = vfio_device_open(device, device->group->iommufd, device->kvm);
+
+	if (device->open_count == 0)
+		vfio_device_put_kvm(device);
+
+	mutex_unlock(&device->dev_set->lock);
 
 out_unlock:
 	mutex_unlock(&device->group->group_lock);
@@ -180,7 +251,14 @@ static int vfio_device_group_open(struct vfio_device *device)
 void vfio_device_group_close(struct vfio_device *device)
 {
 	mutex_lock(&device->group->group_lock);
+	mutex_lock(&device->dev_set->lock);
+
 	vfio_device_close(device, device->group->iommufd);
+
+	if (device->open_count == 0)
+		vfio_device_put_kvm(device);
+
+	mutex_unlock(&device->dev_set->lock);
 	mutex_unlock(&device->group->group_lock);
 }
 
@@ -450,6 +528,7 @@ static struct vfio_group *vfio_group_alloc(struct iommu_group *iommu_group,
 
 	refcount_set(&group->drivers, 1);
 	mutex_init(&group->group_lock);
+	spin_lock_init(&group->kvm_ref_lock);
 	INIT_LIST_HEAD(&group->device_list);
 	mutex_init(&group->device_lock);
 	group->iommu_group = iommu_group;
@@ -803,9 +882,9 @@ void vfio_file_set_kvm(struct file *file, struct kvm *kvm)
 	if (!vfio_file_is_group(file))
 		return;
 
-	mutex_lock(&group->group_lock);
+	spin_lock(&group->kvm_ref_lock);
 	group->kvm = kvm;
-	mutex_unlock(&group->group_lock);
+	spin_unlock(&group->kvm_ref_lock);
 }
 EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
 
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index f8219a438bfb..20c6bc249cb8 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -74,6 +74,7 @@ struct vfio_group {
 	struct file			*opened_file;
 	struct blocking_notifier_head	notifier;
 	struct iommufd_ctx		*iommufd;
+	spinlock_t			kvm_ref_lock;
 };
 
 int vfio_device_set_group(struct vfio_device *device,
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 5177bb061b17..14dbf781ea8c 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -361,7 +361,6 @@ static int vfio_device_first_open(struct vfio_device *device,
 	if (ret)
 		goto err_module_put;
 
-	device->kvm = kvm;
 	if (device->ops->open_device) {
 		ret = device->ops->open_device(device);
 		if (ret)
@@ -370,7 +369,6 @@ static int vfio_device_first_open(struct vfio_device *device,
 	return 0;
 
 err_unuse_iommu:
-	device->kvm = NULL;
 	if (iommufd)
 		vfio_iommufd_unbind(device);
 	else
@@ -387,7 +385,6 @@ static void vfio_device_last_close(struct vfio_device *device,
 
 	if (device->ops->close_device)
 		device->ops->close_device(device);
-	device->kvm = NULL;
 	if (iommufd)
 		vfio_iommufd_unbind(device);
 	else
@@ -400,14 +397,14 @@ int vfio_device_open(struct vfio_device *device,
 {
 	int ret = 0;
 
-	mutex_lock(&device->dev_set->lock);
+	lockdep_assert_held(&device->dev_set->lock);
+
 	device->open_count++;
 	if (device->open_count == 1) {
 		ret = vfio_device_first_open(device, iommufd, kvm);
 		if (ret)
 			device->open_count--;
 	}
-	mutex_unlock(&device->dev_set->lock);
 
 	return ret;
 }
@@ -415,12 +412,12 @@ int vfio_device_open(struct vfio_device *device,
 void vfio_device_close(struct vfio_device *device,
 		       struct iommufd_ctx *iommufd)
 {
-	mutex_lock(&device->dev_set->lock);
+	lockdep_assert_held(&device->dev_set->lock);
+
 	vfio_assert_device_open(device);
 	if (device->open_count == 1)
 		vfio_device_last_close(device, iommufd);
 	device->open_count--;
-	mutex_unlock(&device->dev_set->lock);
 }
 
 /*
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 35be78e9ae57..87ff862ff555 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -46,7 +46,6 @@ struct vfio_device {
 	struct vfio_device_set *dev_set;
 	struct list_head dev_set_list;
 	unsigned int migration_flags;
-	/* Driver must reference the kvm during open_device or never touch it */
 	struct kvm *kvm;
 
 	/* Members below here are private, not for driver use */
@@ -58,6 +57,7 @@ struct vfio_device {
 	struct list_head group_next;
 	struct list_head iommu_entry;
 	struct iommufd_access *iommufd_access;
+	void (*put_kvm)(struct kvm *kvm);
 #if IS_ENABLED(CONFIG_IOMMUFD)
 	struct iommufd_device *iommufd_device;
 	struct iommufd_ctx *iommufd_ictx;

