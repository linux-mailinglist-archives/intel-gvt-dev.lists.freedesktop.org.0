Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AB772E577
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Jun 2023 16:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4841510E264;
	Tue, 13 Jun 2023 14:17:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BB910E265
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 14:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686665819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NYatJhHx6nSYO+TZbVqZK7LDirziHUeBGTIfum2S5Mk=;
 b=WekrZ+4d1qsNhKhk0Exts4Q0zpKzsLbXMMTrWjmroH1tMNRYJFcTs6+LxCt9+zKgFBmetY
 fvnIi9zjOl7caRtraBh6GPTePoINT7XcHvHN937ul2idDmXf30U7PWkyFn6P4EoQAbC2Lg
 HRmlYXTZZNqCRVxBJabzMjDZLfnQY3Y=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-t0jczERNPk-HvBczb2NgHQ-1; Tue, 13 Jun 2023 10:16:57 -0400
X-MC-Unique: t0jczERNPk-HvBczb2NgHQ-1
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-33d5df1a8ddso49763015ab.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 07:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686665810; x=1689257810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NYatJhHx6nSYO+TZbVqZK7LDirziHUeBGTIfum2S5Mk=;
 b=WY6TuoMJ2DxGuKa/rN44wcSErkzIwLMxzXnu6NalpXn5pM1x6xpPlj7COAjhtUBpTZ
 PdlZcQQUJNqsD9RwIZwMkZNi8fMb+4ev0xkiiBZh9JVmnEeSYQEYZcBO3SWUVqPu3Hen
 uJAxGj0HWvQv7qMra+/vaOxC/+6JS8yy/5O507Wb5EGPoi3HDitWfqyxM8FLBoFFXhtE
 h1KCwzPVB09Q83u1L+KYVCpNfHwjVL2d/l1YtK2KhpcVNDiwtv21NJUK0xwyuroP+jdO
 DUQTIPgvROxmDEFnAwI20IndXpVvUrK+mv+jpL0Q6Jltn0Mp552eGEp4G9stYfwOaWSr
 DL+w==
X-Gm-Message-State: AC+VfDymQcPNA5ICl/kx91lESPTPYAUSr8dvJ1SuBq0K/gHATvYxEhiY
 YXY+0QfNgwOEceVPUZT5uyX3cABnjfTTfMLJWYf0ozBnvT5NTEi8OjA99qLdctsBvnCLoq3n19I
 ZigNW+kGe8GmGmKLEGFfAgsu4x//4I1ye6g==
X-Received: by 2002:a92:d409:0:b0:338:a648:9c8 with SMTP id
 q9-20020a92d409000000b00338a64809c8mr9928849ilm.17.1686665809870; 
 Tue, 13 Jun 2023 07:16:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4dvOnTcWtOwv+q2/EoekGwnRzAO73yzLn1NP0J05Lkv0h5eXb2N1tj6bmPqmEs9rHHcJOL2Q==
X-Received: by 2002:a92:d409:0:b0:338:a648:9c8 with SMTP id
 q9-20020a92d409000000b00338a64809c8mr9928794ilm.17.1686665809492; 
 Tue, 13 Jun 2023 07:16:49 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g5-20020a92d7c5000000b003383276d260sm3827903ilq.40.2023.06.13.07.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 07:16:48 -0700 (PDT)
Date: Tue, 13 Jun 2023 08:16:47 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v12 07/24] vfio: Block device access via device fd until
 device is opened
Message-ID: <20230613081647.740f5217.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB75293327BDE6D268996FFFCCC355A@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
 <20230602121653.80017-8-yi.l.liu@intel.com>
 <20230612155210.5fd3579f.alex.williamson@redhat.com>
 <DS0PR11MB75293327BDE6D268996FFFCCC355A@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Tue, 13 Jun 2023 05:46:32 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Tuesday, June 13, 2023 5:52 AM
> > 
> > On Fri,  2 Jun 2023 05:16:36 -0700
> > Yi Liu <yi.l.liu@intel.com> wrote:
> >   
> > > Allow the vfio_device file to be in a state where the device FD is
> > > opened but the device cannot be used by userspace (i.e. its .open_device()
> > > hasn't been called). This inbetween state is not used when the device
> > > FD is spawned from the group FD, however when we create the device FD
> > > directly by opening a cdev it will be opened in the blocked state.
> > >
> > > The reason for the inbetween state is that userspace only gets a FD but
> > > doesn't gain access permission until binding the FD to an iommufd. So in
> > > the blocked state, only the bind operation is allowed. Completing bind
> > > will allow user to further access the device.
> > >
> > > This is implemented by adding a flag in struct vfio_device_file to mark
> > > the blocked state and using a simple smp_load_acquire() to obtain the
> > > flag value and serialize all the device setup with the thread accessing
> > > this device.
> > >
> > > Following this lockless scheme, it can safely handle the device FD
> > > unbound->bound but it cannot handle bound->unbound. To allow this we'd
> > > need to add a lock on all the vfio ioctls which seems costly. So once
> > > device FD is bound, it remains bound until the FD is closed.
> > >
> > > Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> > > Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> > > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > > Tested-by: Terrence Xu <terrence.xu@intel.com>
> > > Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> > > Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
> > > Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> > > Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > > Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> > > ---
> > >  drivers/vfio/group.c     | 11 ++++++++++-
> > >  drivers/vfio/vfio.h      |  1 +
> > >  drivers/vfio/vfio_main.c | 16 ++++++++++++++++
> > >  3 files changed, 27 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> > > index caf53716ddb2..088dd34c8931 100644
> > > --- a/drivers/vfio/group.c
> > > +++ b/drivers/vfio/group.c
> > > @@ -194,9 +194,18 @@ static int vfio_df_group_open(struct vfio_device_file *df)
> > >  	df->iommufd = device->group->iommufd;
> > >
> > >  	ret = vfio_df_open(df);
> > > -	if (ret)
> > > +	if (ret) {
> > >  		df->iommufd = NULL;
> > > +		goto out_put_kvm;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Paired with smp_load_acquire() in vfio_device_fops::ioctl/
> > > +	 * read/write/mmap and vfio_file_has_device_access()
> > > +	 */
> > > +	smp_store_release(&df->access_granted, true);
> > >
> > > +out_put_kvm:
> > >  	if (device->open_count == 0)
> > >  		vfio_device_put_kvm(device);
> > >
> > > diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> > > index f9eb52eb9ed7..fdf2fc73f880 100644
> > > --- a/drivers/vfio/vfio.h
> > > +++ b/drivers/vfio/vfio.h
> > > @@ -18,6 +18,7 @@ struct vfio_container;
> > >
> > >  struct vfio_device_file {
> > >  	struct vfio_device *device;
> > > +	bool access_granted;  
> > 
> > Should we make this a more strongly defined data type and later move
> > devid (u32) here to partially fill the hole created?  
> 
> Before your question, let me describe how I place the fields
> of this structure to see if it is common practice. The first two
> fields are static, so they are in the beginning. The access_granted
> is lockless and other fields are protected by locks. So I tried to
> put the lock and the fields it protects closely. So this is why I put
> devid behind iommufd as both are protected by the same lock.

I think the primary considerations are locality and compactness.  Hot
paths data should be within the first cache line of the structure,
related data should share a cache line, and we should use the space
efficiently.  What you describe seems largely an aesthetic concern,
which was not evident to me by the segmentation alone.
 
> struct vfio_device_file {
>         struct vfio_device *device;
>         struct vfio_group *group;
> 
>         bool access_granted;
>         spinlock_t kvm_ref_lock; /* protect kvm field */
>         struct kvm *kvm;
>         struct iommufd_ctx *iommufd; /* protected by struct vfio_device_set::lock */
>         u32 devid; /* only valid when iommufd is valid */
> };
> 
> > 
> > I think this is being placed towards the front of the data structure
> > for cache line locality given this is a hot path for file operations.
> > But bool types have an implementation dependent size, making them
> > difficult to pack.  Also there will be a tendency to want to make this
> > a bit field, which is probably not compatible with the smp lockless
> > operations being used here.  We might get in front of these issues if
> > we just define it as a u8 now.  Thanks,  
> 
> Not quite get why bit field is going to be incompatible with smp
> lockless operations. Could you elaborate a bit? And should I define
> the access_granted as u8 or "u8:1"?

Perhaps FUD on my part, but load-acquire type operations have specific
semantics and it's not clear to me that they interest with compiler
generated bit operations.  Thanks,

Alex

> > >  	spinlock_t kvm_ref_lock; /* protect kvm field */
> > >  	struct kvm *kvm;
> > >  	struct iommufd_ctx *iommufd; /* protected by struct vfio_device_set::lock */
> > > diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> > > index a3c5817fc545..4c8b7713dc3d 100644
> > > --- a/drivers/vfio/vfio_main.c
> > > +++ b/drivers/vfio/vfio_main.c
> > > @@ -1129,6 +1129,10 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
> > >  	struct vfio_device *device = df->device;
> > >  	int ret;
> > >
> > > +	/* Paired with smp_store_release() following vfio_df_open() */
> > > +	if (!smp_load_acquire(&df->access_granted))
> > > +		return -EINVAL;
> > > +
> > >  	ret = vfio_device_pm_runtime_get(device);
> > >  	if (ret)
> > >  		return ret;
> > > @@ -1156,6 +1160,10 @@ static ssize_t vfio_device_fops_read(struct file *filep, char  
> > __user *buf,  
> > >  	struct vfio_device_file *df = filep->private_data;
> > >  	struct vfio_device *device = df->device;
> > >
> > > +	/* Paired with smp_store_release() following vfio_df_open() */
> > > +	if (!smp_load_acquire(&df->access_granted))
> > > +		return -EINVAL;
> > > +
> > >  	if (unlikely(!device->ops->read))
> > >  		return -EINVAL;
> > >
> > > @@ -1169,6 +1177,10 @@ static ssize_t vfio_device_fops_write(struct file *filep,
> > >  	struct vfio_device_file *df = filep->private_data;
> > >  	struct vfio_device *device = df->device;
> > >
> > > +	/* Paired with smp_store_release() following vfio_df_open() */
> > > +	if (!smp_load_acquire(&df->access_granted))
> > > +		return -EINVAL;
> > > +
> > >  	if (unlikely(!device->ops->write))
> > >  		return -EINVAL;
> > >
> > > @@ -1180,6 +1192,10 @@ static int vfio_device_fops_mmap(struct file *filep, struct  
> > vm_area_struct *vma)  
> > >  	struct vfio_device_file *df = filep->private_data;
> > >  	struct vfio_device *device = df->device;
> > >
> > > +	/* Paired with smp_store_release() following vfio_df_open() */
> > > +	if (!smp_load_acquire(&df->access_granted))
> > > +		return -EINVAL;
> > > +
> > >  	if (unlikely(!device->ops->mmap))
> > >  		return -EINVAL;
> > >  
> 

