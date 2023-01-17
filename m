Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DAB66E858
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 17 Jan 2023 22:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE1810E35D;
	Tue, 17 Jan 2023 21:23:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE83110E358
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 17 Jan 2023 21:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673990582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QeSklMeMSoVeudTQC5ciHBckx9nBB5Aw6Kjov/8/jjI=;
 b=N0jBIQMzwaUKUlDJpC0tNDcSfBjWhQs6bz0hlpaKvUMFVZXXLSzKwOwEBTJWvkLapx6yFP
 iftqU53wiGjvhZZilBL4DT0dga7lThSXS0Gky6VKxs2KE3+0R1HAvXX/j132yD4YI7C10E
 J2fxwC5A9iHLieWoB1z7WqgH/nyJ/RI=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-389-yMCMfPrKM0ic9cfTdkOO-A-1; Tue, 17 Jan 2023 16:23:00 -0500
X-MC-Unique: yMCMfPrKM0ic9cfTdkOO-A-1
Received: by mail-il1-f199.google.com with SMTP id
 z8-20020a056e02088800b0030c247efc7dso23743555ils.15
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 17 Jan 2023 13:23:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QeSklMeMSoVeudTQC5ciHBckx9nBB5Aw6Kjov/8/jjI=;
 b=aBcCezzy/9H+NoCbduWHex448V5FZXh3oXKwOC7+ZLaC3VxlHcHolp5YT1yFVxYfbc
 cm3aGLnWvTSYpqFJeIQFE3QShuNnxy60Mlcf3OeVwM/v0IVebJR+rhHlZZSBYqtd/OJe
 OvTFMiKQSKxXdEb0Ic5qmFGObB2aZXWahcamSvqffMmnOxHsy5VQyWQSgeDmIl6B168V
 dlfieMyHT0wk78ezYsZ0u5WmHVoUS5m5wZrXECccF7Vn0XMwOibE5RQllStHhnDb2Dsw
 wVyc31SSokNtMNl2jJm3ggTWm8oUUXWFd8sXmKK67wsqWtVC6F5AWCINL5CtOJE2sYyj
 DNCA==
X-Gm-Message-State: AFqh2kqJd1aJh1KAFsbX0DQffwWN4yPoTmkM7XwkyKI6o6V1u45w+Uv+
 u4MT/XOdHzUx0fKkbSV6g13RyK/4swIqM6TACGfDxRrMpiEOnWG6kqbSgtTYldHW7VrYQk/U3XN
 UaSRXcJE2NGSugm9ux1lHsndkWjm6td4bAQ==
X-Received: by 2002:a05:6e02:50e:b0:30e:dcfb:6b9d with SMTP id
 d14-20020a056e02050e00b0030edcfb6b9dmr3964147ils.3.1673990576370; 
 Tue, 17 Jan 2023 13:22:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuwYzJIi7PTPrlEprlQbMxxydrTJmjaOJ4Q9jFc1jIJdvjOhgIIkYyHBtR5D65vkYIl3IuCsw==
X-Received: by 2002:a05:6e02:50e:b0:30e:dcfb:6b9d with SMTP id
 d14-20020a056e02050e00b0030edcfb6b9dmr3964131ils.3.1673990576020; 
 Tue, 17 Jan 2023 13:22:56 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f12-20020a056e020c6c00b0030c0217dde6sm9533440ilj.0.2023.01.17.13.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 13:22:55 -0800 (PST)
Date: Tue, 17 Jan 2023 14:22:52 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH v4] vfio: fix potential deadlock on vfio group lock
Message-ID: <20230117142252.70cc85c7.alex.williamson@redhat.com>
In-Reply-To: <20230114000351.115444-1-mjrosato@linux.ibm.com>
References: <20230114000351.115444-1-mjrosato@linux.ibm.com>
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
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, farman@linux.ibm.com,
 imbrenda@linux.ibm.com, frankja@linux.ibm.com, pmorel@linux.ibm.com,
 david@redhat.com, seanjc@google.com, intel-gfx@lists.freedesktop.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com,
 pasic@linux.ibm.com, jgg@nvidia.com, kvm@vger.kernel.org, pbonzini@redhat.com,
 linux-s390@vger.kernel.org, borntraeger@linux.ibm.com,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 13 Jan 2023 19:03:51 -0500
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> Currently it is possible that the final put of a KVM reference comes from
> vfio during its device close operation.  This occurs while the vfio group
> lock is held; however, if the vfio device is still in the kvm device list,
> then the following call chain could result in a deadlock:
> 
> kvm_put_kvm
>  -> kvm_destroy_vm
>   -> kvm_destroy_devices
>    -> kvm_vfio_destroy
>     -> kvm_vfio_file_set_kvm
>      -> vfio_file_set_kvm
>       -> group->group_lock/group_rwsem  
> 
> Avoid this scenario by having vfio core code acquire a KVM reference
> the first time a device is opened and hold that reference until right
> after the group lock is released after the last device is closed.
> 
> Fixes: 421cfe6596f6 ("vfio: remove VFIO_GROUP_NOTIFY_SET_KVM")
> Reported-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
> Changes from v3:
> * Can't check for open_count after the group lock has been dropped because
>   it would be possible for the count to change again once the group lock
>   is dropped (Jason)
>   Solve this by stashing a copy of the kvm and put_kvm while the group
>   lock is held, nullifying the device copies of these in device_close()
>   as soon as the open_count reaches 0, and then checking to see if the
>   device->kvm changed before dropping the group lock.  If it changed
>   during close, we can drop the reference using the stashed kvm and put
>   function after dropping the group lock.
> 
> Changes from v2:
> * Re-arrange vfio_kvm_set_kvm_safe error path to still trigger
>   device_open with device->kvm=NULL (Alex)
> * get device->dev_set->lock when checking device->open_count (Alex)
> * but don't hold it over the kvm_put_kvm (Jason)
> * get kvm_put symbol upfront and stash it in device until close (Jason)
> * check CONFIG_HAVE_KVM to avoid build errors on architectures without
>   KVM support
> 
> Changes from v1:
> * Re-write using symbol get logic to get kvm ref during first device
>   open, release the ref during device fd close after group lock is
>   released
> * Drop kvm get/put changes to drivers; now that vfio core holds a
>   kvm ref until sometime after the device_close op is called, it
>   should be fine for drivers to get and put their own references to it.
> ---
>  drivers/vfio/group.c     | 23 +++++++++++++--
>  drivers/vfio/vfio.h      |  9 ++++++
>  drivers/vfio/vfio_main.c | 61 +++++++++++++++++++++++++++++++++++++---
>  include/linux/vfio.h     |  2 +-
>  4 files changed, 87 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> index bb24b2f0271e..b396c17d7390 100644
> --- a/drivers/vfio/group.c
> +++ b/drivers/vfio/group.c
> @@ -165,9 +165,9 @@ static int vfio_device_group_open(struct vfio_device *device)
>  	}
>  
>  	/*
> -	 * Here we pass the KVM pointer with the group under the lock.  If the
> -	 * device driver will use it, it must obtain a reference and release it
> -	 * during close_device.
> +	 * Here we pass the KVM pointer with the group under the lock.  A
> +	 * reference will be obtained the first time the device is opened and
> +	 * will be held until the open_count reaches 0.
>  	 */
>  	ret = vfio_device_open(device, device->group->iommufd,
>  			       device->group->kvm);
> @@ -179,9 +179,26 @@ static int vfio_device_group_open(struct vfio_device *device)
>  
>  void vfio_device_group_close(struct vfio_device *device)
>  {
> +	void (*put_kvm)(struct kvm *kvm);
> +	struct kvm *kvm;
> +
>  	mutex_lock(&device->group->group_lock);
> +	kvm = device->kvm;
> +	put_kvm = device->put_kvm;
>  	vfio_device_close(device, device->group->iommufd);
> +	if (kvm == device->kvm)
> +		kvm = NULL;

Hmm, so we're using whether the device->kvm pointer gets cleared in
last_close to detect whether we should put the kvm reference.  That's a
bit obscure.  Our get and put is also asymmetric.

Did we decide that we couldn't do this via a schedule_work() from the
last_close function, ie. implementing our own version of an async put?
It seems like that potentially has a cleaner implementation, symmetric
call points, handling all the storing and clearing of kvm related
pointers within the get/put wrappers, passing only a vfio_device to the
put wrapper, using the "vfio_device_" prefix for both.  Potentially
we'd just want an unconditional flush outside of lock here for
deterministic release.

What's the downside?  Thanks,

Alex

>  	mutex_unlock(&device->group->group_lock);
> +
> +	/*
> +	 * The last kvm reference will trigger kvm_destroy_vm, which
> can in
> +	 * turn re-enter vfio and attempt to acquire the group lock.
>  Therefore
> +	 * we get a copy of the kvm pointer and the put function
> under the
> +	 * group lock but wait to put that reference until after
> releasing the
> +	 * lock.
> +	 */
> +	if (kvm)
> +		vfio_kvm_put_kvm(put_kvm, kvm);
>  }
>  
>  static struct file *vfio_device_open_file(struct vfio_device *device)
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index f8219a438bfb..08a5a23d6fef 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -251,4 +251,13 @@ extern bool vfio_noiommu __read_mostly;
>  enum { vfio_noiommu = false };
>  #endif
>  
> +#ifdef CONFIG_HAVE_KVM
> +void vfio_kvm_put_kvm(void (*put)(struct kvm *kvm), struct kvm *kvm);
> +#else
> +static inline void vfio_kvm_put_kvm(void (*put)(struct kvm *kvm),
> +				    struct kvm *kvm)
> +{
> +}
> +#endif
> +
>  #endif
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 5177bb061b17..c6bb07af46b8 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -16,6 +16,9 @@
>  #include <linux/fs.h>
>  #include <linux/idr.h>
>  #include <linux/iommu.h>
> +#ifdef CONFIG_HAVE_KVM
> +#include <linux/kvm_host.h>
> +#endif
>  #include <linux/list.h>
>  #include <linux/miscdevice.h>
>  #include <linux/module.h>
> @@ -344,6 +347,49 @@ static bool vfio_assert_device_open(struct
> vfio_device *device) return
> !WARN_ON_ONCE(!READ_ONCE(device->open_count)); }
>  
> +#ifdef CONFIG_HAVE_KVM
> +static bool vfio_kvm_get_kvm_safe(struct vfio_device *device, struct
> kvm *kvm) +{
> +	void (*pfn)(struct kvm *kvm);
> +	bool (*fn)(struct kvm *kvm);
> +	bool ret;
> +
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
> +void vfio_kvm_put_kvm(void (*put)(struct kvm *kvm), struct kvm *kvm)
> +{
> +	if (WARN_ON(!put))
> +		return;
> +
> +	put(kvm);
> +	symbol_put(kvm_put_kvm);
> +}
> +#else
> +static bool vfio_kvm_get_kvm_safe(struct vfio_device *device, struct
> kvm *kvm) +{
> +	return false;
> +}
> +#endif
> +
>  static int vfio_device_first_open(struct vfio_device *device,
>  				  struct iommufd_ctx *iommufd,
> struct kvm *kvm) {
> @@ -361,16 +407,22 @@ static int vfio_device_first_open(struct
> vfio_device *device, if (ret)
>  		goto err_module_put;
>  
> -	device->kvm = kvm;
> +	if (kvm && vfio_kvm_get_kvm_safe(device, kvm))
> +		device->kvm = kvm;
> +
>  	if (device->ops->open_device) {
>  		ret = device->ops->open_device(device);
>  		if (ret)
> -			goto err_unuse_iommu;
> +			goto err_put_kvm;
>  	}
>  	return 0;
>  
> -err_unuse_iommu:
> -	device->kvm = NULL;
> +err_put_kvm:
> +	if (device->kvm) {
> +		vfio_kvm_put_kvm(device->put_kvm, device->kvm);
> +		device->put_kvm = NULL;
> +		device->kvm = NULL;
> +	}
>  	if (iommufd)
>  		vfio_iommufd_unbind(device);
>  	else
> @@ -388,6 +440,7 @@ static void vfio_device_last_close(struct
> vfio_device *device, if (device->ops->close_device)
>  		device->ops->close_device(device);
>  	device->kvm = NULL;
> +	device->put_kvm = NULL;
>  	if (iommufd)
>  		vfio_iommufd_unbind(device);
>  	else
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 35be78e9ae57..87ff862ff555 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -46,7 +46,6 @@ struct vfio_device {
>  	struct vfio_device_set *dev_set;
>  	struct list_head dev_set_list;
>  	unsigned int migration_flags;
> -	/* Driver must reference the kvm during open_device or never
> touch it */ struct kvm *kvm;
>  
>  	/* Members below here are private, not for driver use */
> @@ -58,6 +57,7 @@ struct vfio_device {
>  	struct list_head group_next;
>  	struct list_head iommu_entry;
>  	struct iommufd_access *iommufd_access;
> +	void (*put_kvm)(struct kvm *kvm);
>  #if IS_ENABLED(CONFIG_IOMMUFD)
>  	struct iommufd_device *iommufd_device;
>  	struct iommufd_ctx *iommufd_ictx;

