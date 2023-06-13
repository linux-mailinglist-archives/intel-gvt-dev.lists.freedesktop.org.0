Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8595672E605
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Jun 2023 16:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC0610E264;
	Tue, 13 Jun 2023 14:42:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A95C10E264
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 14:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686667343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJBdM5iFqkTDpWUz6Au4hD17+lrzXhHFsk4TwJivz9s=;
 b=KnmSelLR0z0cSHE25ObgmocscIrEzUalKV9q2IKF+1aVZ1ai4mf4+9EMNqacrJM7k0Thyg
 YBVkXe/Q9nSeD0OQWHMRZjlOrVME8naNn4sAbf0HXIkkfiLCar0a6jfJix3JfZKf8ezqEi
 VTDLIf/c954h8XlFdBakyPY/tcPrabU=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-TPFnyroFMESdzc8jdkJtwg-1; Tue, 13 Jun 2023 10:42:21 -0400
X-MC-Unique: TPFnyroFMESdzc8jdkJtwg-1
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-77a0fd9d2eeso649574939f.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 07:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686667340; x=1689259340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MJBdM5iFqkTDpWUz6Au4hD17+lrzXhHFsk4TwJivz9s=;
 b=aZl0BpI/uNARa738GyXivRmWR1k+rK10kHe5SYPDn02JlhpgdCgi+VNlG9sOxIMrsu
 tLW0ylQbAtt/Em7MbxyHwK9jujOaK2H2EB9E9XVbKrgFc1AV8lC4Aw3bKYyhIjd/6YY1
 86qq7kQDZVQI57L1zJF3ZVVnv/uWBDEX2WG1/lvnA6WBYsP6OVb7/oMuLt6BuhoN5fao
 6SwHCYowX3r/nA6vZxzyOB/HUbyBMt/SWbdZgKqBajKE8dhpKDCK3yKZNX6kakRmWVZG
 glHsBqAlVkTMZk0klftVLEaa7ICguEFD4bKiAKLMbBn0YMwwIPkz98JSoSXIlknGczTY
 AJkw==
X-Gm-Message-State: AC+VfDyqSd8DBgYDoyEde7DJLV9jc7tZpy6SIezvFrFQ6ZT6xXqwAe+d
 f32GXp3yBbYkRPFZr55P5XM/QpBxH8SlrMle734Kr7tiaonSrqo/MhRlzOA1FMxOxEE8ArzCC/S
 PEx90ue25EmbmkkE5YYgu/JzOjAPclErrOw==
X-Received: by 2002:a6b:7b45:0:b0:77a:ec0c:5907 with SMTP id
 m5-20020a6b7b45000000b0077aec0c5907mr8777945iop.13.1686667340570; 
 Tue, 13 Jun 2023 07:42:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4rchrvAq7uL6qdxBGPgYc5Il7VncBPd83zFXMFGzPeWvh3heO7+g3e0YZao/Y4oWkkn0QpGA==
X-Received: by 2002:a6b:7b45:0:b0:77a:ec0c:5907 with SMTP id
 m5-20020a6b7b45000000b0077aec0c5907mr8777918iop.13.1686667340197; 
 Tue, 13 Jun 2023 07:42:20 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 e5-20020a02caa5000000b0040908cbbc5asm3525944jap.68.2023.06.13.07.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 07:42:19 -0700 (PDT)
Date: Tue, 13 Jun 2023 08:42:18 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v12 07/24] vfio: Block device access via device fd until
 device is opened
Message-ID: <20230613084218.169f1c4c.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529B3DB059798EA474ACB3DC355A@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
 <20230602121653.80017-8-yi.l.liu@intel.com>
 <20230612155210.5fd3579f.alex.williamson@redhat.com>
 <DS0PR11MB75293327BDE6D268996FFFCCC355A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230613081647.740f5217.alex.williamson@redhat.com>
 <DS0PR11MB7529B3DB059798EA474ACB3DC355A@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Tue, 13 Jun 2023 14:36:14 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Tuesday, June 13, 2023 10:17 PM
> > 
> > On Tue, 13 Jun 2023 05:46:32 +0000
> > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >   
> > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > Sent: Tuesday, June 13, 2023 5:52 AM
> > > >
> > > > On Fri,  2 Jun 2023 05:16:36 -0700
> > > > Yi Liu <yi.l.liu@intel.com> wrote:
> > > >  
> > > > > Allow the vfio_device file to be in a state where the device FD is
> > > > > opened but the device cannot be used by userspace (i.e. its .open_device()
> > > > > hasn't been called). This inbetween state is not used when the device
> > > > > FD is spawned from the group FD, however when we create the device FD
> > > > > directly by opening a cdev it will be opened in the blocked state.
> > > > >
> > > > > The reason for the inbetween state is that userspace only gets a FD but
> > > > > doesn't gain access permission until binding the FD to an iommufd. So in
> > > > > the blocked state, only the bind operation is allowed. Completing bind
> > > > > will allow user to further access the device.
> > > > >
> > > > > This is implemented by adding a flag in struct vfio_device_file to mark
> > > > > the blocked state and using a simple smp_load_acquire() to obtain the
> > > > > flag value and serialize all the device setup with the thread accessing
> > > > > this device.
> > > > >
> > > > > Following this lockless scheme, it can safely handle the device FD
> > > > > unbound->bound but it cannot handle bound->unbound. To allow this we'd
> > > > > need to add a lock on all the vfio ioctls which seems costly. So once
> > > > > device FD is bound, it remains bound until the FD is closed.
> > > > >
> > > > > Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> > > > > Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> > > > > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > > > > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > > > > Tested-by: Terrence Xu <terrence.xu@intel.com>
> > > > > Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> > > > > Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
> > > > > Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> > > > > Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > > > > Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> > > > > ---
> > > > >  drivers/vfio/group.c     | 11 ++++++++++-
> > > > >  drivers/vfio/vfio.h      |  1 +
> > > > >  drivers/vfio/vfio_main.c | 16 ++++++++++++++++
> > > > >  3 files changed, 27 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> > > > > index caf53716ddb2..088dd34c8931 100644
> > > > > --- a/drivers/vfio/group.c
> > > > > +++ b/drivers/vfio/group.c
> > > > > @@ -194,9 +194,18 @@ static int vfio_df_group_open(struct vfio_device_file *df)
> > > > >  	df->iommufd = device->group->iommufd;
> > > > >
> > > > >  	ret = vfio_df_open(df);
> > > > > -	if (ret)
> > > > > +	if (ret) {
> > > > >  		df->iommufd = NULL;
> > > > > +		goto out_put_kvm;
> > > > > +	}
> > > > > +
> > > > > +	/*
> > > > > +	 * Paired with smp_load_acquire() in vfio_device_fops::ioctl/
> > > > > +	 * read/write/mmap and vfio_file_has_device_access()
> > > > > +	 */
> > > > > +	smp_store_release(&df->access_granted, true);
> > > > >
> > > > > +out_put_kvm:
> > > > >  	if (device->open_count == 0)
> > > > >  		vfio_device_put_kvm(device);
> > > > >
> > > > > diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> > > > > index f9eb52eb9ed7..fdf2fc73f880 100644
> > > > > --- a/drivers/vfio/vfio.h
> > > > > +++ b/drivers/vfio/vfio.h
> > > > > @@ -18,6 +18,7 @@ struct vfio_container;
> > > > >
> > > > >  struct vfio_device_file {
> > > > >  	struct vfio_device *device;
> > > > > +	bool access_granted;  
> > > >
> > > > Should we make this a more strongly defined data type and later move
> > > > devid (u32) here to partially fill the hole created?  
> > >
> > > Before your question, let me describe how I place the fields
> > > of this structure to see if it is common practice. The first two
> > > fields are static, so they are in the beginning. The access_granted
> > > is lockless and other fields are protected by locks. So I tried to
> > > put the lock and the fields it protects closely. So this is why I put
> > > devid behind iommufd as both are protected by the same lock.  
> > 
> > I think the primary considerations are locality and compactness.  Hot
> > paths data should be within the first cache line of the structure,
> > related data should share a cache line, and we should use the space
> > efficiently.  What you describe seems largely an aesthetic concern,
> > which was not evident to me by the segmentation alone.  
> 
> Sure.
> 
> >   
> > > struct vfio_device_file {
> > >         struct vfio_device *device;
> > >         struct vfio_group *group;
> > >
> > >         bool access_granted;
> > >         spinlock_t kvm_ref_lock; /* protect kvm field */
> > >         struct kvm *kvm;
> > >         struct iommufd_ctx *iommufd; /* protected by struct vfio_device_set::lock */
> > >         u32 devid; /* only valid when iommufd is valid */
> > > };
> > >  
> > > >
> > > > I think this is being placed towards the front of the data structure
> > > > for cache line locality given this is a hot path for file operations.
> > > > But bool types have an implementation dependent size, making them
> > > > difficult to pack.  Also there will be a tendency to want to make this
> > > > a bit field, which is probably not compatible with the smp lockless
> > > > operations being used here.  We might get in front of these issues if
> > > > we just define it as a u8 now.  Thanks,  
> > >
> > > Not quite get why bit field is going to be incompatible with smp
> > > lockless operations. Could you elaborate a bit? And should I define
> > > the access_granted as u8 or "u8:1"?  
> > 
> > Perhaps FUD on my part, but load-acquire type operations have specific
> > semantics and it's not clear to me that they interest with compiler
> > generated bit operations.  Thanks,  
> 
> I see. How about below? 
> 
> struct vfio_device_file {
>         struct vfio_device *device;
>         struct vfio_group *group;
>         u8 access_granted;
>         u32 devid; /* only valid when iommufd is valid */
>         spinlock_t kvm_ref_lock; /* protect kvm field */
>         struct kvm *kvm;
>         struct iommufd_ctx *iommufd; /* protected by struct vfio_device_set::lock */
> };

Yep, that's essentially what I was suggesting.  Thanks,

Alex

