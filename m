Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D473570FA1F
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 24 May 2023 17:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A0310E2B8;
	Wed, 24 May 2023 15:31:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549B910E2B8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 24 May 2023 15:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684942308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvdaBvxVvgbIEoVnHfDqGdU+6IOYKpfr6BkQPhMy2q4=;
 b=RQj3KdaBAf6CQjJF1veWJtyxqjGt89rQLSfzc8nuYy5LKq9GIKuZmlVtSAAcgNMXddmmCL
 z3ZCC5RN8aD6YpD4BdkDe9vVVC1gN1XgmPQcitRHdzjpkBs4RZ+XebGumRSkKNGm+9lQ+x
 /7fdOfVN67R2gwIQ/p6DIWfpxua3Sps=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-P6Wd8CMbOV2nxOZ1rz1EYQ-1; Wed, 24 May 2023 11:31:46 -0400
X-MC-Unique: P6Wd8CMbOV2nxOZ1rz1EYQ-1
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-335a27baefbso5763545ab.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 24 May 2023 08:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684942306; x=1687534306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nvdaBvxVvgbIEoVnHfDqGdU+6IOYKpfr6BkQPhMy2q4=;
 b=I/Sqc7aj/KyxCvEta74dPqjz8FADxXd0cMmDC5JsAEo8C8YZ0ZmVt9xCtqyGOqQUFO
 MS+JbermvrWGLje4vCQbaVpiJ9GrGajrxklNMI4MfjYz0VOgi3WGse/Ne25m9rZcjqKQ
 lTHfI6hYRXZ9rOLB6MP6MOiqROIYg31tTjutC+Oou199ebH0jVddRI77W2fbj1CHONr5
 73ebYDm+u2FciEnJd2stJlpvF7qK6m39RJ6YrEFeMDpEVbZeMed3y9Y2JYZwm62XvlBR
 hvO8XbOwVxU5XZRkkhjZwjsEVRG/q0GeWz47poUYHIrLz4baStdI9RgJCA3ep2hxfZCo
 WYvQ==
X-Gm-Message-State: AC+VfDwrj/qoqihNLbH/v39ZTRTaAuycNZyVAxi8F6POjPLiWVGX8Vf7
 5ZlAcxWvEqrpCwd/hst9yADkwfu29REPGUnUKkk/gs7HRxsbCLwz4lhKBnRNR9xDiDb88pQu/H4
 i5KydJWhs1PzsFn1S5cvwz2aOmI6gnwrYeA==
X-Received: by 2002:a92:c907:0:b0:32b:2884:667d with SMTP id
 t7-20020a92c907000000b0032b2884667dmr4338100ilp.7.1684942305655; 
 Wed, 24 May 2023 08:31:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5cy4JMLj0bwMPsJjsNyex61B0gji72MRQyMprj4D6oX0LlHGIbVejgmylTAcQIeRDEmquiBA==
X-Received: by 2002:a92:c907:0:b0:32b:2884:667d with SMTP id
 t7-20020a92c907000000b0032b2884667dmr4338057ilp.7.1684942305320; 
 Wed, 24 May 2023 08:31:45 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 o3-20020a056e02068300b0033079f435f7sm3133927ils.65.2023.05.24.08.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 08:31:44 -0700 (PDT)
Date: Wed, 24 May 2023 09:31:42 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v11 20/23] vfio: Add VFIO_DEVICE_[AT|DE]TACH_IOMMUFD_PT
Message-ID: <20230524093142.3cac798e.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB75292161F081F27C0650EFB3C3419@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230513132827.39066-1-yi.l.liu@intel.com>
 <20230513132827.39066-21-yi.l.liu@intel.com>
 <20230522161534.32f3bf8e.alex.williamson@redhat.com>
 <DS0PR11MB7529096D1BE1D337BA50884BC3409@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230523095025.1898297c.alex.williamson@redhat.com>
 <DS0PR11MB75292161F081F27C0650EFB3C3419@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Wed, 24 May 2023 02:12:14 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Tuesday, May 23, 2023 11:50 PM
> > 
> > On Tue, 23 May 2023 01:20:17 +0000
> > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >   
> > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > Sent: Tuesday, May 23, 2023 6:16 AM
> > > >
> > > > On Sat, 13 May 2023 06:28:24 -0700
> > > > Yi Liu <yi.l.liu@intel.com> wrote:
> > > >  
> > > > > This adds ioctl for userspace to attach device cdev fd to and detach
> > > > > from IOAS/hw_pagetable managed by iommufd.
> > > > >
> > > > >     VFIO_DEVICE_ATTACH_IOMMUFD_PT: attach vfio device to IOAS, hw_pagetable
> > > > > 				   managed by iommufd. Attach can be
> > > > > 				   undo by VFIO_DEVICE_DETACH_IOMMUFD_PT
> > > > > 				   or device fd close.
> > > > >     VFIO_DEVICE_DETACH_IOMMUFD_PT: detach vfio device from the current  
> > attached  
> > > > > 				   IOAS or hw_pagetable managed by iommufd.
> > > > >
> > > > > Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> > > > > Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > > > > Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> > > > > ---
> > > > >  drivers/vfio/device_cdev.c | 66 ++++++++++++++++++++++++++++++++++++++
> > > > >  drivers/vfio/iommufd.c     | 18 +++++++++++
> > > > >  drivers/vfio/vfio.h        | 18 +++++++++++
> > > > >  drivers/vfio/vfio_main.c   |  8 +++++
> > > > >  include/uapi/linux/vfio.h  | 52 ++++++++++++++++++++++++++++++
> > > > >  5 files changed, 162 insertions(+)
> > > > >
> > > > > diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
> > > > > index 291cc678a18b..3f14edb80a93 100644
> > > > > --- a/drivers/vfio/device_cdev.c
> > > > > +++ b/drivers/vfio/device_cdev.c
> > > > > @@ -174,6 +174,72 @@ long vfio_device_ioctl_bind_iommufd(struct  
> > vfio_device_file  
> > > > *df,  
> > > > >  	return ret;
> > > > >  }
> > > > >
> > > > > +int vfio_ioctl_device_attach(struct vfio_device_file *df,
> > > > > +			     struct vfio_device_attach_iommufd_pt __user *arg)
> > > > > +{
> > > > > +	struct vfio_device *device = df->device;
> > > > > +	struct vfio_device_attach_iommufd_pt attach;
> > > > > +	unsigned long minsz;
> > > > > +	int ret;
> > > > > +
> > > > > +	minsz = offsetofend(struct vfio_device_attach_iommufd_pt, pt_id);
> > > > > +
> > > > > +	if (copy_from_user(&attach, arg, minsz))
> > > > > +		return -EFAULT;
> > > > > +
> > > > > +	if (attach.argsz < minsz || attach.flags)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	/* ATTACH only allowed for cdev fds */
> > > > > +	if (df->group)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	mutex_lock(&device->dev_set->lock);
> > > > > +	ret = vfio_iommufd_attach(device, &attach.pt_id);
> > > > > +	if (ret)
> > > > > +		goto out_unlock;
> > > > > +
> > > > > +	ret = copy_to_user(&arg->pt_id, &attach.pt_id,
> > > > > +			   sizeof(attach.pt_id)) ? -EFAULT : 0;
> > > > > +	if (ret)
> > > > > +		goto out_detach;
> > > > > +	mutex_unlock(&device->dev_set->lock);
> > > > > +
> > > > > +	return 0;
> > > > > +
> > > > > +out_detach:
> > > > > +	vfio_iommufd_detach(device);
> > > > > +out_unlock:
> > > > > +	mutex_unlock(&device->dev_set->lock);
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +int vfio_ioctl_device_detach(struct vfio_device_file *df,
> > > > > +			     struct vfio_device_detach_iommufd_pt __user *arg)
> > > > > +{
> > > > > +	struct vfio_device *device = df->device;
> > > > > +	struct vfio_device_detach_iommufd_pt detach;
> > > > > +	unsigned long minsz;
> > > > > +
> > > > > +	minsz = offsetofend(struct vfio_device_detach_iommufd_pt, flags);
> > > > > +
> > > > > +	if (copy_from_user(&detach, arg, minsz))
> > > > > +		return -EFAULT;
> > > > > +
> > > > > +	if (detach.argsz < minsz || detach.flags)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	/* DETACH only allowed for cdev fds */
> > > > > +	if (df->group)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	mutex_lock(&device->dev_set->lock);
> > > > > +	vfio_iommufd_detach(device);
> > > > > +	mutex_unlock(&device->dev_set->lock);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > >  static char *vfio_device_devnode(const struct device *dev, umode_t *mode)
> > > > >  {
> > > > >  	return kasprintf(GFP_KERNEL, "vfio/devices/%s", dev_name(dev));
> > > > > diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
> > > > > index 83575b65ea01..799ea322a7d4 100644
> > > > > --- a/drivers/vfio/iommufd.c
> > > > > +++ b/drivers/vfio/iommufd.c
> > > > > @@ -112,6 +112,24 @@ void vfio_iommufd_unbind(struct vfio_device_file *df)
> > > > >  		vdev->ops->unbind_iommufd(vdev);
> > > > >  }
> > > > >
> > > > > +int vfio_iommufd_attach(struct vfio_device *vdev, u32 *pt_id)
> > > > > +{
> > > > > +	lockdep_assert_held(&vdev->dev_set->lock);
> > > > > +
> > > > > +	if (vfio_device_is_noiommu(vdev))
> > > > > +		return 0;  
> > > >
> > > > Isn't this an invalid operation for a noiommu cdev, ie. -EINVAL?  We
> > > > return success and copy back the provided pt_id, why would a user not
> > > > consider it a bug that they can't use whatever value was there with
> > > > iommufd?  
> > >
> > > Yes, this is the question I asked in [1]. At that time, it appears to me
> > > that better to allow it [2]. Maybe it's more suitable to ask it here.  
> > 
> > From an API perspective it seems wrong.  We return success without
> > doing anything.  A user would be right to consider it a bug that the
> > attach operation works but there's not actually any association to the
> > IOAS.  Thanks,  
> 
> The current version is kind of tradeoff based on prior remarks when
> I asked the question. As prior comment[2], it appears to me the attach
> shall success for noiommu devices as well, but per your remark it seems
> not in plan. So anyway, we may just fail the attach/detach for noiommu
> devices. Is it?

If a user creates an ioas within an iommufd, attaches a device to that
ioas and populates it with mappings, wouldn't the user expect the
device to have access to and honor those mappings?  I think that's the
path we're headed down if we report a successful attach of a noiommu
device to an ioas.

We need to keep in mind that noiommu was meant to be a minimally
intrusive mechanism to provide a dummy vfio IOMMU backend and satisfy
the group requirements, solely for the purpose of making use of the
vfio device interface and without providing any DMA mapping services or
expectations.  IMO, an argument that we need the attach op to succeed in
order to avoid too much disruption in userspace code is nonsense.  On
the contrary, userspace needs to be very aware of this difference and
we shouldn't invest effort trying to make noiommu more convenient to
use.  It's inherently unsafe.

I'm not fond of what a mess noiommu has become with cdev, we're well
beyond the minimal code trickery of the legacy implementation.  I hate
to ask, but could we reiterate our requirements for noiommu as a part of
the native iommufd interface for vfio?  The nested userspace requirement
is gone now that hypervisors have vIOMMU support, so my assumption is
that this is only for bare metal systems without an IOMMU, which
ideally are less and less prevalent.  Are there any noiommu userspaces
that are actually going to adopt the noiommu cdev interface?  What
terrible things happen if noiommu only exists in the vfio group compat
interface to iommufd and at some distant point in the future dies when
that gets disabled?

> btw. Should we document it somewhere as well? E.g. noiommu userspace
> does not support attach/detach? Userspace should know it is opening
> noiommu devices.

Documentation never hurts.  This is such a specialized use case I'm not
sure we've bothered to do much documentation for noiommu previously.
Thanks,

Alex

