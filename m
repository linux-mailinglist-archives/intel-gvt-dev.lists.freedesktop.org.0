Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4288F6DE6B8
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Apr 2023 23:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184C810E36B;
	Tue, 11 Apr 2023 21:58:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2756010E69B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 Apr 2023 21:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681250312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=01X3BW9dSWKkUKI3evx8TswH2vODNC63/L+kOwOV660=;
 b=cRg1bo0KL8LmvXttLzxm4peQx78oidVe453fJIKDUkM7yGnrhNxJ7bwJdjV3J9Aw80rzDl
 3x7I64MbrcE8gmXtibNtEpOly92F337Gac9pqhVGlQ8+CfswkgH/a0vZGMyV899LJKuBKJ
 77sGboIvGWcLU9rwoGcCZg+pGfWp7Co=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-8NqT-YpSPh-TaJphJXhwcA-1; Tue, 11 Apr 2023 17:58:31 -0400
X-MC-Unique: 8NqT-YpSPh-TaJphJXhwcA-1
Received: by mail-il1-f199.google.com with SMTP id
 z18-20020a921a52000000b003293147d824so558302ill.18
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 Apr 2023 14:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681250311; x=1683842311;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=01X3BW9dSWKkUKI3evx8TswH2vODNC63/L+kOwOV660=;
 b=iozrWRCsJinfEAAiktWO7bHboq+dhEvL6hs/4cuX/x3nMBHub/JgvG4FheA3dEyoxn
 k63TtlqFfytY7G3IpRBvz6C3uN+/fAJU8bb634su3csVhAodVjt6Un1XXMk2OkYS441U
 fam4flpuXW6S+vB7cUjXjsmWapepYRS9XenjwJ8ctODo0jguj7j8FhlHnierEWr60O3y
 Fl4U+umV9bE2A47KlYuHPUKR6MzV4Iqa7Hy7HMo3RIbuQnIYAQZSjEecnb/Fe2Tuftv/
 Lny9o+1m28S71nfDUlui+dxlfiWGlJ6m0BziYnkbG6JgQbeITi56D+JyEsohitXZa++E
 6Jrw==
X-Gm-Message-State: AAQBX9fxlqv3oriPkr/g4QUypnBYM/Q8cp8jCxPnP7AuhF9hyC2+cfJ8
 Bp986F1hud26dvUhSm4anXj7+lH35l1gu3kdXPhTTXs8bMZy4F+rw4Kqq11dcGGOl4TUCLhsWJB
 CC35o+a88Zebz0z+i8b4RXpd1Trjgn0/sUw==
X-Received: by 2002:a92:cb48:0:b0:325:d010:4e93 with SMTP id
 f8-20020a92cb48000000b00325d0104e93mr2822035ilq.3.1681250310675; 
 Tue, 11 Apr 2023 14:58:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZPt9ytggYszjYFVCea2twsohapA89hh1BsB5dfHUIIYocTkhUjNToAA92tZSJuFguO8ydorQ==
X-Received: by 2002:a92:cb48:0:b0:325:d010:4e93 with SMTP id
 f8-20020a92cb48000000b00325d0104e93mr2822021ilq.3.1681250310279; 
 Tue, 11 Apr 2023 14:58:30 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g19-20020a925213000000b00329361e8bb2sm113487ilb.67.2023.04.11.14.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 14:58:29 -0700 (PDT)
Date: Tue, 11 Apr 2023 15:58:27 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230411155827.3489400a.alex.williamson@redhat.com>
In-Reply-To: <ZDWph7g0hcbJHU1B@nvidia.com>
References: <ZC2un1LaTUR1OrrJ@nvidia.com>
 <20230405125621.4627ca19.alex.williamson@redhat.com>
 <ZC3KJUxJa0O0M+9O@nvidia.com>
 <20230405134945.29e967be.alex.williamson@redhat.com>
 <ZC4CwH2ouTfZ9DNN@nvidia.com>
 <DS0PR11MB75292DA91ED15AE94A85EB3DC3919@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230406115347.7af28448.alex.williamson@redhat.com>
 <ZDVfqpOCnImKr//m@nvidia.com>
 <20230411095417.240bac39.alex.williamson@redhat.com>
 <20230411111117.0766ad52.alex.williamson@redhat.com>
 <ZDWph7g0hcbJHU1B@nvidia.com>
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
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

On Tue, 11 Apr 2023 15:40:07 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Apr 11, 2023 at 11:11:17AM -0600, Alex Williamson wrote:
> > [Appears the list got dropped, replying to my previous message to re-add]  
> 
> Wowo this got mesed up alot, mutt drops the cc when replying for some
> reason. I think it is fixed up now
> 
> > > Our cdev model says that opening a cdev locks out other cdevs from
> > > independent use, eg because of the group sharing. Extending this to
> > > include the reset group as well seems consistent.  
> > 
> > The DMA ownership model based on the IOMMU group is consistent with
> > legacy vfio, but now you're proposing a new ownership model that
> > optionally allows a user to extend their ownership, opportunistically
> > lock out other users, and wreaking havoc for management utilities that
> > also have no insight into dev_sets or userspace driver behavior.  
> 
> I suggested below that the owership require enough open devices - so
> it doesn't "extend ownership opportunistically", and there is no
> havoc.
> 
> Management tools already need to understand dev_set if they want to
> offer reliable reset support to the VMs. Same as today.

I don't think that's true.  Our primary hot-reset use case is GPUs and
subordinate functions, where the isolation and reset scope are often
sufficiently similar to make hot-reset possible, regardless whether
all the functions are assigned to a VM.  I don't think you'll find any
management tools that takes reset scope into account otherwise.

> > > There is some security concern here, but that goes both ways, a 3rd
> > > party should not be able to break an application that needs to use
> > > this RESET and had sufficient privileges to assert an ownership.  
> > 
> > There are clearly scenarios we have now that could break.  For example,
> > today if QEMU doesn't own all the IOMMU groups for a mult-function
> > device, it can't do a reset, the remaining functions are available for
> > other users.   
> 
> Sure, and we can keep that with this approach.
> 
> > As I understand the proposal, QEMU now gets to attempt to
> > claim ownership of the dev_set, so it opportunistically extends its
> > ownership and may block other users from the affected devices.  
> 
> We can decide the policy for the kernel to accept a claim. I suggested
> below "same as today" - it must hold all the groups within the
> iommufd_ctx.

It must hold all the groups [that the user doesn't know about because
it's not a formal part of the cdev API] within the iommufd_ctx?
 
> The main point is to make this claiming operation qemu needs to do
> clearer and more explicit. I view this as better than trying to guess
> if it successfully made the claim by inspecting the _INFO output.

There is no guessing in the current API.  Guessing is what happens
when hot-reset magically works because one of the devices wasn't opened
at the time, or the iommufd_ctx happens to hold all the affected groups
that the user doesn't have an API to understand.  The current API has a
very concise requirement, the user must own all of the groups affected
by the hot-reset in order to effect a hot-reset.

> > > I'd say anyone should be able to assert RESET ownership if, like
> > > today, the iommufd_ctx has all the groups of the dev_set inside
> > > it. Once asserted it becomes safe against all forms of hotplug, and
> > > continues to be safe even if some of the devices are closed. eg hot
> > > unplugging from the VM doesn't change the availability of RESET.
> > > 
> > > This comes from your ask that qemu know clearly if RESET works, and it
> > > doesn't change while qemu is running. This seems stronger and clearer
> > > than the current implicit scheme. It also doesn't require usespace to
> > > do any calculations with groups or BDFs to figure out of RESET is
> > > available, kernel confirms it directly.  
> > 
> > As above, clarity and predictability seem lacking in this proposal.
> > With the current scheme, the ownership of the affected devices is
> > implied if they exist within an owned group, but the strength of that
> > ownership is clear.    
> 
> Same logic holds here
> 
> Ownership is claimed same as today by having all groups representated
> in the iommufd_ctx. This seems just as clear as today.

I don't know if anyone else is having this trouble, but I'm seeing
conflicting requirements.  The cdev API is not to expose groups unless
a requirement is found to need them, of which this is apparently not
one, but all the groups need to be represented in the iommufd_ctx in
order to make use of this interface.  How is that clear?

> > > > seems this proposal essentially extends the ownership model to the
> > > > greater of the dev_set or iommu group, apparently neither of which
> > > > are explicitly exposed to the user in the cdev API.    
> > > 
> > > IIRC the group id can be learned from sysfs before opening the cdev
> > > file. Something like /sys/class/vfio/XX/../../iommu_group  
> > 
> > And in the passed cdev fd model... ?  
> 
> IMHO we should try to avoid needing to expose group_id specifically to
> userspace. We are missing a way to learn the "same ioas" restriction
> in iommufd, and it should provide that directly based on dev_ids.

Is this yet another "we need to expose groups to understand the ioas
restriction but we're not going to because reasons" argument?

> Otherwise if we really really need group_id then iommufd should
> provide an ioctl to get it. Let's find a good reason first

If needing to have all of the groups represented in an iommufd_ctx in
order to effect a reset without allowing the user to know the set of
affected groups and device to group relationship isn't a reason... well
I'm just lost.

> > > We should also have an iommufd ioctl to report the "same ioas"
> > > groupings of dev_ids to make it easy on userspace. I haven't checked
> > > to see what the current qemu patches are doing with this..  
> > 
> > Seems we're ignoring that no-iommu doesn't have a valid iommufd.  
> 
> no-iommu doesn't and shouldn't have iommu_groups either. It also
> doesn't have an IOAS so querying for same-IOAS is not necessary.
> 
> The simplest option for no-iommu is to require it to pass in every
> device fd to the reset ioctl.

Which ironically is exactly how it ends up working today, each no-iommu
device has a fake IOMMU group, so every affected device (group) needs
to be provided.

> > > > How does a user determine when devices cannot be used independently
> > > > in the cdev API?     
> > > 
> > > We have this problem right now. The only way to learn the reset group
> > > is to call the _INFO ioctl. We could add a sysfs "pci_reset_group"
> > > under /sys/class/vfio/XX/ if something needs it earlier.  
> > 
> > For all the complaints about complexity, now we're asking management
> > tools to not only take into account IOMMU groups, but also reset
> > groups, and some inferred knowledge about the application and devices
> > to speculate whether reset group ownership is taken by a given
> > userspace??  
> 
> No, we are trying to keep things pretty much the same as today without
> resorting to exposing a lot of group related concepts.
> 
> The reset group is a clear concept that already exists and isn't
> exposed. If we really need to know about it then it should be exposed
> on its own, as a seperate discussion from this cdev stuff.

"[A]nd isn't exposed"... what exactly is the hot-reset INFO ioctl
exposing if not that?

> I want to re-focus on the basics of what cdev is supposed to be doing,
> because several of the idea you suggested seem against this direction:
> 
>  - cdev does not have, and cannot rely on vfio_groups. We enforce this
>    by compiling all the vfio_group infrastructure out. iommu_groups
>    continue to exist.
>    
>    So converting a cdev to a vfio_group is not an allowed operation.

My only statements in this respect were towards the notion that IOMMU
groups continue to exist.  I'm well aware of the desire to deprecate
and remove vfio groups.
 
>  - no-iommu should not have iommu_groups. We enforce this by compiling
>    out all the no-iommu vfio_group infrastructure.

This is not logically inferred from the above if IOMMU groups continue
to exist and continue to be a basis for describing DMA ownership as
well as "reset groups" 

>  - cdev APIs should ideally not require the user to know the group_id,
>    we should try hard to design APIs to avoid this.

This is a nuance, group_id vs group, where it's been previously
discussed that users will need to continue to know the boundaries of a
group for the purpose of DMA isolation and potentially IOAS
independence should cdev/iommufd choose to tackle those topics.
 
> We have solved every other problem but reset like this, I would like
> to get past reset without compromising the above.

"These aren't the droids we're looking for."

What is the actual proposal here?  You've said that hot-reset works if
the iommufd_ctx has representation from each affected group, the INFO
ioctl remains as it is, which suggests that it's reporting group ID and
BDF, yet only sysfs tells the user the relation between a vfio cdev and
a group and we're trying to enable a pass-by-fd model for cdev where
the user has no reference to a sysfs node for the device.  Show me how
these pieces fit together.

OTOH, if we say IOMMU groups continue to exist [agreed], every vfio
device has an IOMMU group, and there's an API to learn the group ID, the
solution becomes much more clear and no-iommu devices require no
special cases or restrictions.  Not only does the INFO ioctl remain the
same, but the hot-reset ioctl itself remains effectively the same
accepting either vfio cdevs or groups.  Thanks,

Alex

