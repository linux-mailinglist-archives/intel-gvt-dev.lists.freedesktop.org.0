Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DDD6DE1F6
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Apr 2023 19:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD7610E5DC;
	Tue, 11 Apr 2023 17:11:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9298010E5DC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 Apr 2023 17:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681233091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pru4wSn1J8eS15hl8Fm55x4gAkwrxfQ4lSZCtGAnlEY=;
 b=P5wIQOcPxRLnh8IXA3k2IoyMXF8OKnPpOhepcRiXPVuQQdL4UpYWs+eQ6MB/iXG/KjLio0
 sNT67IJuyAPhO042o6GVdJdbCzid4svWGf8dYINtIUnkqzUhxhucJT/DKMFnIuQOediZ90
 Ytz+ytFRwlqmj2w8GglhDn/asME45Jk=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-giXnQeBpPaauVRAN0EFNNg-1; Tue, 11 Apr 2023 13:11:23 -0400
X-MC-Unique: giXnQeBpPaauVRAN0EFNNg-1
Received: by mail-io1-f71.google.com with SMTP id
 m22-20020a0566022e9600b007608fe7d67dso2382783iow.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 Apr 2023 10:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233080; x=1683825080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pru4wSn1J8eS15hl8Fm55x4gAkwrxfQ4lSZCtGAnlEY=;
 b=TZHLEHyRHhjYBYJ1dDOEiG/hn/TtqE8Rnrrz12DctchMv/7OD5Ekben6B44DzIbnLH
 J5s3WIfE0/IM2EzN4Im3YrJsAWsGbgSz2m90lkL3ejgomwDkvEu/Y9OBfQD1T6sfQW/G
 fBbC9A6ubiO7oKb3/FXz13z7+BhmzbFg/M56kmfOnLiJHBpwW3QAMfqCe0OP5qrBSU4B
 JT0U24Pn1UtwTELGsV7UlZR87+/jb3puWx1nUzMIAkqB4G1KrAR/rvV/zUymPrHyZ93d
 0v7bnzOS1WF5Evd4+xnLlg7UWbbti04FL790DgOQnVTT1cxvXwTD+wEbe2F5csYHB89j
 VbAw==
X-Gm-Message-State: AAQBX9cO3xEbT/kx56cL3GnBVv4gsbgT1vkMdcgmkip2o5azUK/ZfDWc
 2oOYien+rnZ4IV4sgtqcrnvY3nGBUQ8bJ+/6TFqkASztjbsbUexf5I4IJqUfSUGv+Z586oWARjo
 RZK2Jq01J812qDxY9ZFNF3AqHtjiQbvPDSw==
X-Received: by 2002:a6b:c897:0:b0:760:a418:2507 with SMTP id
 y145-20020a6bc897000000b00760a4182507mr188877iof.1.1681233080314; 
 Tue, 11 Apr 2023 10:11:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZYsautaeHqRkRwEXJm6JG4hlSAmw0cm1T0Wkx7MrW3wE/+JenB6cHwiIQ+rkkkN+Jf4bTjMw==
X-Received: by 2002:a6b:c897:0:b0:760:a418:2507 with SMTP id
 y145-20020a6bc897000000b00760a4182507mr188846iof.1.1681233080012; 
 Tue, 11 Apr 2023 10:11:20 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 v3-20020a05663812c300b0040b64b68862sm4155947jas.165.2023.04.11.10.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:11:19 -0700 (PDT)
Date: Tue, 11 Apr 2023 11:11:17 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230411111117.0766ad52.alex.williamson@redhat.com>
In-Reply-To: <20230411095417.240bac39.alex.williamson@redhat.com>
References: <20230405102545.41a61424.alex.williamson@redhat.com>
 <ZC2jsQuWiMYM6JZb@nvidia.com>
 <20230405105215.428fa9f5.alex.williamson@redhat.com>
 <ZC2un1LaTUR1OrrJ@nvidia.com>
 <20230405125621.4627ca19.alex.williamson@redhat.com>
 <ZC3KJUxJa0O0M+9O@nvidia.com>
 <20230405134945.29e967be.alex.williamson@redhat.com>
 <ZC4CwH2ouTfZ9DNN@nvidia.com>
 <DS0PR11MB75292DA91ED15AE94A85EB3DC3919@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230406115347.7af28448.alex.williamson@redhat.com>
 <ZDVfqpOCnImKr//m@nvidia.com>
 <20230411095417.240bac39.alex.williamson@redhat.com>
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
Cc: Yanting@freedesktop.org,
	"mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"peterx@redhat.com" <peterx@redhat.com>,
	"  <lulu@redhat.com>, "@freedesktop.org,
	suravee.suthikulpanit@amd.com,
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
	"Liu,  Yi L" <yi.l.liu@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>, Yan@freedesktop.org,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"     <intel-gvt-dev@lists.freedesktop.org>,  "@freedesktop.org,
	intel-gfx@lists.freedesktop.org, <linux-s390@vger.kernel.org>, ,
	"Tian,  Kevin" <kevin.tian@intel.com>, Xudong@freedesktop.org,
	Zhenzhong@freedesktop.org,
	"  <suravee.suthikulpanit@amd.com>, "@freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,,
	" <intel-gfx@lists.freedesktop.org>,   "@freedesktop.org,
	linux-s390@vger.kernel.org, Terrence@freedesktop.org,
	"yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"shameerali.kolothum.thodi@huawei.com\"          <shameerali.kolothum.thodi@huawei.com>, "@freedesktop.org,
	lulu@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

[Appears the list got dropped, replying to my previous message to re-add]

On Tue, 11 Apr 2023 13:32:16 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Apr 11, 2023 at 09:54:17AM -0600, Alex Williamson wrote:
> > On Tue, 11 Apr 2023 10:24:58 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > On Thu, Apr 06, 2023 at 11:53:47AM -0600, Alex Williamson wrote:
> > >   
> > > > Where whether a device is opened is subject to change outside of the
> > > > user's control.  This essentially allows the user to perform hot-resets
> > > > of devices outside of their ownership so long as the device is not
> > > > used elsewhere, versus the current requirement that the user own all the
> > > > affected groups, which implies device ownership.  It's not been
> > > > justified why this feature needs to exist, imo.    
> > > 
> > > The cdev API doesn't have the notion that owning a group means you
> > > "own" some collection of devices. It still happens as a side effect,
> > > but it isn't obviously part of the API. I'm really loath to
> > > re-introduce that group-based concept just for this. We are trying
> > > reduce the group API surface.
> > > 
> > > How about a different direction.
> > > 
> > > We add a new uAPI for cdev mode that is "take ownership of the reset
> > > group". Maybe it can be a flag in during bind.
> > > 
> > > When requested vfio will ensure that every device in the reset group
> > > is only bound to this iommufd_ctx or left closed. Now and in the
> > > future. Since no-iommu has no iommufd_ctx this means we can open only
> > > one device in the reset group.
> > > 
> > > With this flag RESET is guaranteed to always work by definition.
> > > 
> > > We continue with the zero-length FD, but we can just replace the
> > > security checks with a check if we are in reset group ownership mode.
> > > 
> > > _INFO is unchanged.
> > > 
> > > We decide if we add a new IOCTL to return the BDF so the existing
> > > _INFO can get back to the dev_id or a new IOCTL that returns the
> > > dev_id list of the reset group.
> > > 
> > > Userspace is required to figure out the extent of the reset, but we
> > > don't require that userspace prove to the kernel it did this when
> > > requesting the reset.  
> > 
> > Take for example a multi-function PCIe device with ACS isolation between
> > functions, are you going to allow a user who has only been granted
> > ownership of a subset of functions control of the entire dev_set?  
> 
> Our cdev model says that opening a cdev locks out other cdevs from
> independent use, eg because of the group sharing. Extending this to
> include the reset group as well seems consistent.

The DMA ownership model based on the IOMMU group is consistent with
legacy vfio, but now you're proposing a new ownership model that
optionally allows a user to extend their ownership, opportunistically
lock out other users, and wreaking havoc for management utilities that
also have no insight into dev_sets or userspace driver behavior.

> There is some security concern here, but that goes both ways, a 3rd
> party should not be able to break an application that needs to use
> this RESET and had sufficient privileges to assert an ownership.

There are clearly scenarios we have now that could break.  For example,
today if QEMU doesn't own all the IOMMU groups for a mult-function
device, it can't do a reset, the remaining functions are available for
other users.  As I understand the proposal, QEMU now gets to attempt to
claim ownership of the dev_set, so it opportunistically extends its
ownership and may block other users from the affected devices.
Ordering makes this effectively unpredictable, if a userspace like DPDK
that doesn't assert dev_set ownership is started first, QEMU can start
and be denied hot-reset support.  In the reverse ordering, the DPDK
application can be locked out by QEMU.

> I'd say anyone should be able to assert RESET ownership if, like
> today, the iommufd_ctx has all the groups of the dev_set inside
> it. Once asserted it becomes safe against all forms of hotplug, and
> continues to be safe even if some of the devices are closed. eg hot
> unplugging from the VM doesn't change the availability of RESET.
> 
> This comes from your ask that qemu know clearly if RESET works, and it
> doesn't change while qemu is running. This seems stronger and clearer
> than the current implicit scheme. It also doesn't require usespace to
> do any calculations with groups or BDFs to figure out of RESET is
> available, kernel confirms it directly.

As above, clarity and predictability seem lacking in this proposal.
With the current scheme, the ownership of the affected devices is
implied if they exist within an owned group, but the strength of that
ownership is clear.  Affected devices outside the set of owned groups
says that hot-reset is unavailable without any of this "but QEMU might
be able to request it" or "unless the affected device is currently
unopened" variables.

> > seems this proposal essentially extends the ownership model to the
> > greater of the dev_set or iommu group, apparently neither of which
> > are explicitly exposed to the user in the cdev API.  
> 
> IIRC the group id can be learned from sysfs before opening the cdev
> file. Something like /sys/class/vfio/XX/../../iommu_group

And in the passed cdev fd model... ?

> We should also have an iommufd ioctl to report the "same ioas"
> groupings of dev_ids to make it easy on userspace. I haven't checked
> to see what the current qemu patches are doing with this..

Seems we're ignoring that no-iommu doesn't have a valid iommufd.

> > How does a user determine when devices cannot be used independently
> > in the cdev API?   
> 
> We have this problem right now. The only way to learn the reset group
> is to call the _INFO ioctl. We could add a sysfs "pci_reset_group"
> under /sys/class/vfio/XX/ if something needs it earlier.

For all the complaints about complexity, now we're asking management
tools to not only take into account IOMMU groups, but also reset
groups, and some inferred knowledge about the application and devices
to speculate whether reset group ownership is taken by a given
userspace??  Thanks,

Alex

