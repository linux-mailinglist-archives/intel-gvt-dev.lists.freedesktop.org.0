Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B335C6D8662
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Apr 2023 20:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770D010E242;
	Wed,  5 Apr 2023 18:56:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4073A10E242
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Apr 2023 18:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680720993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D5gvU5+wL9d+/QjlV5LG0iqavbMIY4VzdbFTDzjvPj0=;
 b=E227WNJsW7mFtTZ0J/GJ3KniFYpxSxuxEvGpwHXPAqQQ1S0Rvb45SNpT8WQ09HB7kc6oCF
 ofAksnuCWbE82Bw2jM/6t6zs4ZYpNcLiQaHPAbp67W3AL1spAQRPsivO4StD+mqQkg0vG8
 XrGgaKfzLbJgFGy070agTzC4+M2u1To=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-rkIQf78HMjiHSlYWoKByGA-1; Wed, 05 Apr 2023 14:56:24 -0400
X-MC-Unique: rkIQf78HMjiHSlYWoKByGA-1
Received: by mail-il1-f197.google.com with SMTP id
 d6-20020a92d786000000b00316f1737173so24756231iln.16
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 05 Apr 2023 11:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680720984;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D5gvU5+wL9d+/QjlV5LG0iqavbMIY4VzdbFTDzjvPj0=;
 b=A7bC/OZ7I6bv90ZrD3PMwikEp30JiJCpu3LRLiqNtvC2M7R7NNPDUSKJDeQ6jFhwHK
 ViHlRXjXSwymHu4PVeIblIcNtQDSDri7h3ciOOd7Hd6yMQXjHxJ7CxwMggIpyvPPJpEy
 vwEkgqnTUze7KLLYDCNgYdJdSHw/goSdjHB1n63xZJtJyje8ezy59l6JdetX3JJOtFXz
 MIoJLuzpqKaqVbgLdBSlTXAo95UnHe/s5f4GryzJnMhzPq5oyEwlLhtgHTwH/yNhsgV0
 FG73z8bEPgHNIN/vSobVV/acM9KUbK222/gMW2G9drzlGXfHzAWwpgW1edi5tlmkC+om
 PkAw==
X-Gm-Message-State: AAQBX9dL+98KIJ2uJ7Dq+mwjitqw0vKXoVOfWilEZjiQ9j1hv89gAcr7
 WCUVqwBZL0YQTTjrxsR5kcPbizjDhs38ehb5TcKTbBnwqb+epILtSB5btyH0x1ENTF99ppGBwtW
 F5bCKPvjlQo4b0q0vX+FspmMco19fFwoEsg==
X-Received: by 2002:a05:6e02:6c1:b0:316:fcbe:627b with SMTP id
 p1-20020a056e0206c100b00316fcbe627bmr4807480ils.4.1680720983890; 
 Wed, 05 Apr 2023 11:56:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZfR8D+etX4VTls7ehjxiZ31pZIT2O0xKHqFI1R1O/tzzHthRH0Hc7OfLoJ6LqPbIVjxjDENw==
X-Received: by 2002:a05:6e02:6c1:b0:316:fcbe:627b with SMTP id
 p1-20020a056e0206c100b00316fcbe627bmr4807450ils.4.1680720983583; 
 Wed, 05 Apr 2023 11:56:23 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 n9-20020a922609000000b003179d2677f4sm3989318ile.48.2023.04.05.11.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 11:56:23 -0700 (PDT)
Date: Wed, 5 Apr 2023 12:56:21 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230405125621.4627ca19.alex.williamson@redhat.com>
In-Reply-To: <ZC2un1LaTUR1OrrJ@nvidia.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-13-yi.l.liu@intel.com>
 <a937e622-ce32-6dda-d77c-7d8d76474ee0@redhat.com>
 <DS0PR11MB7529D4E354C3B85D7698017DC3909@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230405102545.41a61424.alex.williamson@redhat.com>
 <ZC2jsQuWiMYM6JZb@nvidia.com>
 <20230405105215.428fa9f5.alex.williamson@redhat.com>
 <ZC2un1LaTUR1OrrJ@nvidia.com>
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

On Wed, 5 Apr 2023 14:23:43 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Apr 05, 2023 at 10:52:15AM -0600, Alex Williamson wrote:
> > On Wed, 5 Apr 2023 13:37:05 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > On Wed, Apr 05, 2023 at 10:25:45AM -0600, Alex Williamson wrote:
> > >   
> > > > But that kind of brings to light the question of what does the user do
> > > > when they encounter this situation.    
> > > 
> > > What does it do now when it encounters a group_id it doesn't
> > > understand? Userspace already doesn't know if the foreign group is
> > > open or not, right?  
> > 
> > It's simple, there is currently no screwiness around opened devices.
> > If the caller doesn't own all the groups mapping to the affected
> > devices, hot-reset is not available.  
> 
> That still has nasty edge cases. If the reset group spans beyond a
> single iommu group you end up with qemu being unable to operate reset
> at all, and it is unfixable from an API perspective as we can't pass
> in groups that VFIO isn't going to use.

Hmm, s/nasty/niche/?  Yes, QEMU currently has no way to own a group
without assigning a device from the group, but technically that could
be fixed within QEMU.  If QEMU doesn't own that affected group, then it
can't very well count on that group to not be used in some other way
when it comes time to actually do a hot-reset.
 
> I think you are right, the fact we'd have to return -1 dev_ids to this
> modified API is pretty damaging, it doesn't seem like a good
> direction.
> 
> > This leads to scenarios where the info ioctl indicates a hot-reset is
> > initially available, perhaps only because one of the affected devices
> > was not opened at the time, and now it fails when QEMU actually tries
> > to use it.  
> 
> I would like it if the APIs toward the kernel were only about the
> kernel's security apparatus. It is makes it easier to reason about the
> kernel side and gives nice simple well defined APIs.

Usability needs to be a consideration as well.  An interface where the
result is effectively arbitrary from a user perspective because the
kernel is solely focused on whether the operation is allowed,
evaluating constraints that the user is unaware of and cannot control,
is unusable.

> This is a good point that qemu needs to make a policy decision if it
> is happy about the VFIO configuration - but that is a policy decision
> that should not become entangled with the kernel's security checks.
> 
> Today qemu can make this policy choice the same way it does right now
> - call _INFO and check the group_ids. It gets the exact same outcome
> as today. We already discussed that we need to expose the group ID
> through an ioctl someplace.

QEMU can make a policy decision today because the kernel provides a
sufficiently reliable interface, ie. based on the set of owned groups, a
hot-reset is all but guaranteed to work.  If we focus only on whether a
given reset is allowed from a kernel perspective and ignore that
userspace needs some predictability of the kernel behavior, then QEMU
cannot reasonable make that policy decision.

> If this is too awkward we could add a query to the kernel if the cdev
> is "reset exclusive" - eg the iommufd covers all the groups that span
> the reset set.

That's essentially what we have if there are valid dev-ids for each
affected device in the info ioctl.  I don't think it helps the user
experience to create loopholes where the hot-reset ioctl can still work
in spite of those missing devices.  The group interface uses the fact
that ownership of the group implies ownership of all devices within the
group such that the user only needs to prove group ownership.

But we still have underlying groups even with the cdev model, with the
same ownership principles, so don't we just need to prove group
ownership based on a device fd rather than a group fd?

For example, we have a VFIO_DEVICE_GET_INFO ioctl that supports
capability chains, we could add a capability that reports the group ID
for the device.  The hot-reset info ioctl remains as it is today,
reporting group-ids and bdfs.  The hot-reset ioctl itself is modified to
transparently support either group fds or device fds.  The user can now
map cdevs to group-ids and therefore follow the same rules as groups,
providing at least one representative device fd for each group.  We've
essentially already enabled this by allowing the limit of user provided
fds equal to the number of affected devices.

Does that work?  Thanks,

Alex

