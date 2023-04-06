Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EE16D9E27
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  6 Apr 2023 19:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9B210E346;
	Thu,  6 Apr 2023 17:07:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6177010EC62
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  6 Apr 2023 17:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680800861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CYs/YTBPAeoCCyWf8iNbjYyQ4fg6NFRZSOGDs3dDQx0=;
 b=D84xwKyAx9EoiGU87w24Bwp3CojSfjCqWOHa1ADfjQPYszUtl/ZAVVuoMyETr/uSLCYSRL
 WrkGoymCn22Fu/1yE7mf8xIkDg0oWXl70zd5FefViPb7ef+964CCbxWu02F1yOLToF46Ao
 khrxj/+zXVk0Txyx0qq99zrvcC94pmM=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-OWhYpAUfOx2XpYqNuuD_tQ-1; Thu, 06 Apr 2023 13:07:40 -0400
X-MC-Unique: OWhYpAUfOx2XpYqNuuD_tQ-1
Received: by mail-il1-f197.google.com with SMTP id
 o8-20020a056e0214c800b00325f0a48812so23535455ilk.13
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 06 Apr 2023 10:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680800859; x=1683392859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CYs/YTBPAeoCCyWf8iNbjYyQ4fg6NFRZSOGDs3dDQx0=;
 b=e2oCcuuobsZ+cvHPzHjG0DSa3r1A4pTnqPoDrk4T45XRj29fBB50GYohIhtIX+heMA
 HzrEpOOIp0lOKpz+mc16wbSd6Mg5D2B1L/GLkCuFxh3mm/D6E/gdgkKyrEDE1ZVuJKVz
 qjEUZ0WuDvmWy/PVpVXXQKZXYlfY0x+aH/i2276SN13ljV0XSEYxK73+aackB70XvycS
 CkpVU1jImzhkwTNlqkvm2XutqPwU9Mp3CL0ozE+/CC9qUJJ2lS3CnhF62YVFEvLvIdq/
 pQWU5zdSUzD7Va9DZbOrBRXfdlbKtr5Rn2YL8HvO4JvLRY0xQj0pNNB0CjAAEFJaKwrQ
 T6jg==
X-Gm-Message-State: AAQBX9djMi2Q5VmfPSSmhN/yUJrDt1HJxxyT9RTeE/MzhoRpgw3Na4II
 X66V21+JXLwVZJA07Md3oNkiwjDPYGUkU2q89NYZw+2kTfA56BDJxzVk7KwHuaoi3AoNgOg96+n
 3JEB/JymlO6OGs7O5xs3ajgcTPyA+BGz+wg==
X-Received: by 2002:a6b:dc12:0:b0:760:932:6540 with SMTP id
 s18-20020a6bdc12000000b0076009326540mr199359ioc.5.1680800859192; 
 Thu, 06 Apr 2023 10:07:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350bgCWzDSICKLPrjf6kX9FAgkvxckObpMsDIUL+65Km3Qn1IhEw3KlB4zvoWm6GDUacxz8McNg==
X-Received: by 2002:a6b:dc12:0:b0:760:932:6540 with SMTP id
 s18-20020a6bdc12000000b0076009326540mr199331ioc.5.1680800858848; 
 Thu, 06 Apr 2023 10:07:38 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 p16-20020a056638191000b003b015157f47sm514912jal.9.2023.04.06.10.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 10:07:38 -0700 (PDT)
Date: Thu, 6 Apr 2023 11:07:36 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230406110736.335ad2e8.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB752987A5B996D93582F8A8BCC3919@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-13-yi.l.liu@intel.com>
 <a937e622-ce32-6dda-d77c-7d8d76474ee0@redhat.com>
 <DS0PR11MB7529D4E354C3B85D7698017DC3909@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230405102545.41a61424.alex.williamson@redhat.com>
 <ZC2jsQuWiMYM6JZb@nvidia.com>
 <20230405105215.428fa9f5.alex.williamson@redhat.com>
 <ZC2un1LaTUR1OrrJ@nvidia.com>
 <20230405125621.4627ca19.alex.williamson@redhat.com>
 <ZC3KJUxJa0O0M+9O@nvidia.com>
 <20230405134945.29e967be.alex.williamson@redhat.com>
 <DS0PR11MB752987A5B996D93582F8A8BCC3919@DS0PR11MB7529.namprd11.prod.outlook.com>
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
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "Zhao, 
 Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 6 Apr 2023 06:34:08 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> Hi Alex,
> 
> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Thursday, April 6, 2023 3:50 AM
> > 
> > On Wed, 5 Apr 2023 16:21:09 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > On Wed, Apr 05, 2023 at 12:56:21PM -0600, Alex Williamson wrote:  
> > > > Usability needs to be a consideration as well.  An interface where the
> > > > result is effectively arbitrary from a user perspective because the
> > > > kernel is solely focused on whether the operation is allowed,
> > > > evaluating constraints that the user is unaware of and cannot control,
> > > > is unusable.  
> > >
> > > Considering this API is only invoked by qemu we might be overdoing
> > > this usability and 'no shoot in foot' view.  
> > 
> > Ok, I'm not sure why we're diminishing the de facto vfio userspace...
> >   
> > > > > This is a good point that qemu needs to make a policy decision if it
> > > > > is happy about the VFIO configuration - but that is a policy decision
> > > > > that should not become entangled with the kernel's security checks.
> > > > >
> > > > > Today qemu can make this policy choice the same way it does right now
> > > > > - call _INFO and check the group_ids. It gets the exact same outcome
> > > > > as today. We already discussed that we need to expose the group ID
> > > > > through an ioctl someplace.  
> > > >
> > > > QEMU can make a policy decision today because the kernel provides a
> > > > sufficiently reliable interface, ie. based on the set of owned groups, a
> > > > hot-reset is all but guaranteed to work.  
> > >
> > > And we don't change that with cdev. If qemu wants to make the policy
> > > decision it keeps using the exact same _INFO interface to make that
> > > decision same it has always made.
> > >
> > > We weaken the actual reset action to only consider the security side.
> > >
> > > Applications that want this exclusive reset group policy simply must
> > > check it on their own. It is a reasonable API design.  
> > 
> > I disagree, as I've argued before, the info ioctl becomes so weak and
> > effectively arbitrary from a user perspective at being able to predict
> > whether the hot-reset ioctl works that it becomes useless, diminishing
> > the entire hot-reset info/execute API.
> >   
> > > > > If this is too awkward we could add a query to the kernel if the cdev
> > > > > is "reset exclusive" - eg the iommufd covers all the groups that span
> > > > > the reset set.  
> > > >
> > > > That's essentially what we have if there are valid dev-ids for each
> > > > affected device in the info ioctl.  
> > >
> > > If you have dev-ids for everything, yes. If you don't, then you can't
> > > make the same policy choice using a dev-id interface.  
> > 
> > Exactly, you can't make any policy choice because the success or
> > failure of the hot-reset ioctl can't be known.  
> 
> could you elaborate a bit about what the policy is here. As far as I know,
> QEMU makes use of the information reported by _INFO to check:
> - if all the affected groups are owned by the current QEMU[1]
> - if the affected devices are opened by the current QEMU, if yes, QEMU
>   needs to use vfio_pci_pre_reset() to do preparation before issuing
>   hot rest[1]
> 
> [1] vfio_pci_hot_reset() in https://github.com/qemu/qemu/blob/master/hw/vfio/pci.c

Regarding the policy decisions, look for instance at the distinction
between vfio_pci_hot_reset_one() vs vfio_pci_hot_reset_multi(), or the
way QEMU will opt for a bus reset if it believes only a PM reset is
available.

In my proposal, I did miss that if _INFO reports the group and bdf that
allows QEMU to associate fd passed devices to a group affected by the
reset, but not specifically whether the device is affected by the
reset.  I think that would be justification for capabilities on the
DEVICE_GET_INFO ioctl to report both the group and PCI address as
separate capabilities.
 
> > > > I don't think it helps the user experience to create loopholes where
> > > > the hot-reset ioctl can still work in spite of those missing
> > > > devices.  
> > >
> > > I disagree. The easy straightforward design is that the reset ioctl
> > > works if the process has security permissions. Mixing a policy check
> > > into the kernel on this path is creating complexity we don't really
> > > need.
> > >
> > > I don't view it as a loophole, it is flexability to use the API in a
> > > way that is different from what qemu wants - eg an app like dpdk may
> > > be willing to tolerate a reset group that becomes unavailable after
> > > startup. Who knows, why should we force this in the kernel?  
> > 
> > Because look at all the problems it's causing to try to introduce these
> > loopholes without also introducing subtle bugs.  There's an argument
> > that we're overly strict, which is better than the alternative, which
> > seems to be what we're dabbling with.  It is a straightforward
> > interface for the hot-reset ioctl to mirror the information provided
> > via the hot-reset info ioctl.
> >   
> > > > For example, we have a VFIO_DEVICE_GET_INFO ioctl that supports
> > > > capability chains, we could add a capability that reports the group ID
> > > > for the device.  
> > >
> > > I was going to put that in an iommufd ioctl so it works with VDPA too,
> > > but sure, lets assume we can get the group ID from a cdev fd.
> > >  
> > > > The hot-reset info ioctl remains as it is today, reporting group-ids
> > > > and bdfs.  
> > >
> > > Sure, but userspace still needs to know how to map the reset sets into
> > > dev-ids.  
> > 
> > No, it doesn't.
> >   
> > > Remember the reason we started doing this is because we don't
> > > have easy access to the BDF anymore.  
> > 
> > We don't need it, the info ioctl provides the groups, the group
> > association can be learned from the DEVICE_GET_INFO ioctl, the
> > hot-reset ioctl only requires a single representative fd per affected
> > group.  dev-ids not required.
> >   
> > > I like leaving this ioctl alone, lets go back to a dedicated ioctl to
> > > return the dev_ids.  
> > 
> > I don't see any justification for this.  We could add another PCI
> > specific DEVICE_GET_INFO capability to report the bdf if we really need
> > it, but reporting the group seems sufficient for this use case.  
> 
> IMHO, the knowledge of group may be not enough. Take QEMU as an example.
> QEMU not only needs to ensure the group is owned by it, it also needs to
> do preparation on the devices that are already in use and affected by
> the hot reset on a new opened device. If there is only group knowledge,
> QEMU may blindly prepares all the devices that are already opened and
> belong to the same iommu group. But as I got in the discussion iommu
> group is not equal to hot reset scope (a.k.a. dev_set). is it? It is
> possible that devices in an iommu_group may span into multiple hot
> reset scope. For such case, get bdf info from cdev fd is necessary.

Yes, you're correct, group and reset scope are not equivalent, so we'd
require a means to get both the group and the bdf for the device.
Knowing the bdf allows the user to know which opened devices are
directly affected by the reset, knowing the group allows the user to
know if ancillary affected devices are within the set of groups the
user owns and therefore effectively under their purview.  Thanks,

Alex

