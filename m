Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF5A68744D
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  2 Feb 2023 05:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5827C10E2E1;
	Thu,  2 Feb 2023 04:15:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820E610E2E1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  2 Feb 2023 04:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675311297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkSvZazpJaCzeN4iB/UP5EFUCE7zPAFjyxOF4y5Wi/o=;
 b=NQ45OAVMr57aODnY5ddwUgV3+/cOg9ofXseCiNPRWRDstYa/aqE/vGiLeTip+7qYS+lId+
 FI9FORPJ+oUsFavoCw6JbE5A+1mjZLJpKu7n/t/TAsAu4kGSwyW/2R+cWDhrXkTroWpLf4
 3NUZxFQqkcCc+3YUBw8r3G3MiOPSdWc=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-uKMznzaWPfSc45ZWFwPQgA-1; Wed, 01 Feb 2023 23:14:55 -0500
X-MC-Unique: uKMznzaWPfSc45ZWFwPQgA-1
Received: by mail-il1-f200.google.com with SMTP id
 v6-20020a056e0213c600b00310f8577354so532897ilj.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 01 Feb 2023 20:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IkSvZazpJaCzeN4iB/UP5EFUCE7zPAFjyxOF4y5Wi/o=;
 b=eELRqyeC6roDEXAF+7Kz/lE+4J+eVHN++mrYKsNDuCpouYXCzlGqfFEaUqzrz3QqGg
 GQzP3xHFaJ/WwqHLRUZilNsXkUDP5Arl7IiFsIZd0jo+PUc15j5e7rVvGDt3YW9ncakl
 ujRfnx2/4XYgzDO/PVRY+nhauozUjyKk/E8qi0ioRXwOigZH/K7z0wt5Rxb472HNjfCG
 aoO1FnfSaagXZsTLVfGZyXHELt0Z6mvyOIqXPgZMVNyrSpoDKpBMmCmMS9Xyxe27nktZ
 1WwPIi+2HCaqi2b8fwLZglAKVmXww5KD+PU+AkYA3VJF1C72T9TK/FFY+td+svt21plK
 r+iA==
X-Gm-Message-State: AO0yUKWdwCtCYISaLkXqvgLAFwkfbOWWcp18lmt+wqMFRC5Szoirvq2X
 cTv4xnsbZvC8P59PFuVvRs2FEZFoKqXZpgdTURaHHFsxU6xS698jIA18Rtprtp2gAfYi/rux2kX
 6JLU6B1KGuWkFLLYWzRdX30k5ngMcy6UR6Q==
X-Received: by 2002:a05:6e02:b45:b0:310:aa02:4903 with SMTP id
 f5-20020a056e020b4500b00310aa024903mr4159255ilu.29.1675311294851; 
 Wed, 01 Feb 2023 20:14:54 -0800 (PST)
X-Google-Smtp-Source: AK7set/RdjucV7vuU7onJfFNgb3o6687/AcURZBDpW/6jJHQ1GTN8KVhF58TgmLZvlpQ2kLQeel/yg==
X-Received: by 2002:a05:6e02:b45:b0:310:aa02:4903 with SMTP id
 f5-20020a056e020b4500b00310aa024903mr4159233ilu.29.1675311294543; 
 Wed, 01 Feb 2023 20:14:54 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 t2-20020a02c902000000b003a650adf5b0sm7205298jao.95.2023.02.01.20.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 20:14:53 -0800 (PST)
Date: Wed, 1 Feb 2023 21:14:52 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v2] vfio: fix deadlock between group lock and kvm lock
Message-ID: <20230201211452.429c8e34.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB75298437F96D08758DB92368C3D69@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230201192010.42748-1-mjrosato@linux.ibm.com>
 <20230201162730.685b5332.alex.williamson@redhat.com>
 <DS0PR11MB75298437F96D08758DB92368C3D69@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Thu, 2 Feb 2023 03:46:59 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Thursday, February 2, 2023 7:28 AM
> > 
> > On Wed,  1 Feb 2023 14:20:10 -0500
> > Matthew Rosato <mjrosato@linux.ibm.com> wrote:
> >   
> > > After 51cdc8bc120e, we have another deadlock scenario between the
> > > kvm->lock and the vfio group_lock with two different codepaths acquiring
> > > the locks in different order.  Specifically in vfio_open_device, vfio
> > > holds the vfio group_lock when issuing device->ops->open_device but  
> > some  
> > > drivers (like vfio-ap) need to acquire kvm->lock during their open_device
> > > routine;  Meanwhile, kvm_vfio_release will acquire the kvm->lock first
> > > before calling vfio_file_set_kvm which will acquire the vfio group_lock.
> > >
> > > To resolve this, let's remove the need for the vfio group_lock from the
> > > kvm_vfio_release codepath.  This is done by introducing a new spinlock to
> > > protect modifications to the vfio group kvm pointer, and acquiring a kvm
> > > ref from within vfio while holding this spinlock, with the reference held
> > > until the last close for the device in question.
> > >
> > > Fixes: 51cdc8bc120e ("kvm/vfio: Fix potential deadlock on vfio group_lock")
> > > Reported-by: Anthony Krowiak <akrowiak@linux.ibm.com>
> > > Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> > > Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> > > ---
> > > Changes from v1:
> > > * use spin_lock instead of spin_lock_irqsave (Jason)
> > > * clear device->kvm_put as part of vfio_kvm_put_kvm (Yi)
> > > * Re-arrange code to avoid referencing the group contents from within
> > >   vfio_main (Kevin) which meant moving most of the code in this patch
> > >   to group.c along with getting/dropping of the dev_set lock
> > > ---
> > >  drivers/vfio/group.c     | 90  
> > +++++++++++++++++++++++++++++++++++++---  
> > >  drivers/vfio/vfio.h      |  1 +
> > >  drivers/vfio/vfio_main.c | 11 ++---
> > >  include/linux/vfio.h     |  2 +-
> > >  4 files changed, 91 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> > > index bb24b2f0271e..52f434861294 100644
> > > --- a/drivers/vfio/group.c
> > > +++ b/drivers/vfio/group.c
> > > @@ -13,6 +13,9 @@
> > >  #include <linux/vfio.h>
> > >  #include <linux/iommufd.h>
> > >  #include <linux/anon_inodes.h>
> > > +#ifdef CONFIG_HAVE_KVM
> > > +#include <linux/kvm_host.h>
> > > +#endif
> > >  #include "vfio.h"
> > >
> > >  static struct vfio {
> > > @@ -154,6 +157,55 @@ static int vfio_group_ioctl_set_container(struct  
> > vfio_group *group,  
> > >  	return ret;
> > >  }
> > >
> > > +#ifdef CONFIG_HAVE_KVM
> > > +static bool vfio_kvm_get_kvm_safe(struct vfio_device *device, struct  
> > kvm *kvm)
> > 
> > I'm tempted to name these vfio_device_get_kvm_safe() and only pass the
> > vfio_device, where of course we can get the kvm pointer from the group
> > internally.
> >   
> > > +{
> > > +	void (*pfn)(struct kvm *kvm);
> > > +	bool (*fn)(struct kvm *kvm);
> > > +	bool ret;
> > > +  
> > 
> > We should assert_lockdep_held(&device->dev_set->lock) in both of these
> > since that seems to be what's protecting device->kvm and
> > device->put_kvm.
> > 
> > If we change as above to get the kvm pointer from the group within this
> > function, we can also move the kvm_ref_lock here, which seems to
> > simplify the caller quite a bit.
> >   
> > > +	pfn = symbol_get(kvm_put_kvm);
> > > +	if (WARN_ON(!pfn))
> > > +		return false;
> > > +
> > > +	fn = symbol_get(kvm_get_kvm_safe);
> > > +	if (WARN_ON(!fn)) {
> > > +		symbol_put(kvm_put_kvm);
> > > +		return false;
> > > +	}
> > > +
> > > +	ret = fn(kvm);
> > > +	if (ret)
> > > +		device->put_kvm = pfn;
> > > +	else
> > > +		symbol_put(kvm_put_kvm);
> > > +
> > > +	symbol_put(kvm_get_kvm_safe);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void vfio_kvm_put_kvm(struct vfio_device *device)
> > > +{
> > > +	if (WARN_ON(!device->kvm || !device->put_kvm))
> > > +		return;  
> > 
> > It simplifies the caller if we can use this even in the !device->kvm
> > case.
> >   
> > > +
> > > +	device->put_kvm(device->kvm);
> > > +	device->put_kvm = NULL;
> > > +	symbol_put(kvm_put_kvm);
> > > +}
> > > +
> > > +#else
> > > +static bool vfio_kvm_get_kvm_safe(struct vfio_device *device, struct  
> > kvm *kvm)  
> > > +{
> > > +	return false;
> > > +}
> > > +
> > > +static void vfio_kvm_put_kvm(struct vfio_device *device)
> > > +{
> > > +}
> > > +#endif
> > > +
> > >  static int vfio_device_group_open(struct vfio_device *device)
> > >  {
> > >  	int ret;
> > > @@ -164,14 +216,32 @@ static int vfio_device_group_open(struct  
> > vfio_device *device)  
> > >  		goto out_unlock;
> > >  	}
> > >
> > > +	mutex_lock(&device->dev_set->lock);
> > > +
> > >  	/*
> > > -	 * Here we pass the KVM pointer with the group under the lock.  If  
> > the  
> > > -	 * device driver will use it, it must obtain a reference and release it
> > > -	 * during close_device.
> > > +	 * Before the first device open, get the KVM pointer currently
> > > +	 * associated with the group (if there is one) and obtain a reference
> > > +	 * now that will be held until the open_count reaches 0 again.  Save
> > > +	 * the pointer in the device for use by drivers.
> > >  	 */
> > > +	if (device->open_count == 0) {
> > > +		spin_lock(&device->group->kvm_ref_lock);
> > > +		if (device->group->kvm &&
> > > +		    vfio_kvm_get_kvm_safe(device, device->group->kvm))
> > > +			device->kvm = device->group->kvm;
> > > +		spin_unlock(&device->group->kvm_ref_lock);
> > > +	}
> > > +
> > >  	ret = vfio_device_open(device, device->group->iommufd,
> > >  			       device->group->kvm);  
> > 
> > We're using device->group->kvm outside of kvm_ref_lock here, it should
> > be using device->kvm.  
> 
> Existing code set device->kvm in the vfio_device_first_open() which is
> called by vfio_device_open(). After above change, seems not necessary
> to pass kvm pointer into the call chain. Isn't it?

Yes, we can get it from the device.  I didn't check how much this
bloats the patch though.  As a fix, it might make sense to save that
refactoring for a follow-on patch.  Thanks,

Alex

