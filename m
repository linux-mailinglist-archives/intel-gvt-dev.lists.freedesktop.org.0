Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94216D9F48
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  6 Apr 2023 19:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C3A10EC7F;
	Thu,  6 Apr 2023 17:53:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031E310EC7E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  6 Apr 2023 17:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680803633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7432+6OEWamz5qY/mgHPY11Z1KTJKe8+IEhwreLZ3sM=;
 b=ZbLemHJ8cs5J1PqoLotGILxqKyf4b3jShOSJad7a523y09is50QDHtzL2lTuHFPjqD5qf5
 z/9gaO/FL8H3LKrgEu+YRmHk/B8y2xpJec4UzDRrvaCxpHRoDqmGKWMGLUOBmQABmJhsSV
 XnKa11fQN/z1O1YvUucZiTBWWGHRjG4=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-qUvJY-dbNVqaUA8vVSVmcw-1; Thu, 06 Apr 2023 13:53:50 -0400
X-MC-Unique: qUvJY-dbNVqaUA8vVSVmcw-1
Received: by mail-il1-f200.google.com with SMTP id
 g12-20020a056e021e0c00b00327c0e193b1so3580395ila.21
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 06 Apr 2023 10:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680803630; x=1683395630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7432+6OEWamz5qY/mgHPY11Z1KTJKe8+IEhwreLZ3sM=;
 b=z/TgrI5CM9lh6CPuH68y2/U5kqpM3uXNt5yxBsrb/71OCpxPnEg1VTHRTostD3jJ+o
 4xWszQWyo81dHw/eLM7wkMldGO075tFihjesxTO7MLdpI49RVnl4YbfqghOzQleT6i1X
 cN0mMhmu5XFKf3RJs7DL1ScMLSVrgGQaEBcBxur51bnMTncQ8XKN4UlEe8PmL+L/8MII
 E8bIo7eFT3f2p8qvfsTQoVbKsMrXI6+70heNxjykFrZnEEpTUV0FCCKppcQHOT3aPHBA
 4YEZkVUoG39WrzDqVH35ji4QQI7EMlWGeOtIsrK8bCPitrnyChaT12g/y1cdaWG1k87O
 n4nA==
X-Gm-Message-State: AAQBX9cEdIJ6kOiBT6VwlwAj/rfwbLXRAf4jhGsTIG8Px4i0Uqswzs9y
 XeWPfvmDc1lmBgYBRJKkrzw/6mXgeWr8D0ZvW33Zk+30veXSLgZ6TSTF6A2pzYXRSL0uZNwRFZh
 Hp00E22wwhpJgfOx4G6CosPmXTB4IgSA8Rw==
X-Received: by 2002:a05:6e02:1449:b0:325:ede7:b166 with SMTP id
 p9-20020a056e02144900b00325ede7b166mr4688226ilo.3.1680803629732; 
 Thu, 06 Apr 2023 10:53:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350a4MFsLMs30oCa+LYnnAaACb5bDlBMgSky/nYRVNUtYLOEQcrEn7bi092ewGn4aMFuU6a9oqg==
X-Received: by 2002:a05:6e02:1449:b0:325:ede7:b166 with SMTP id
 p9-20020a056e02144900b00325ede7b166mr4688190ilo.3.1680803629360; 
 Thu, 06 Apr 2023 10:53:49 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 cd9-20020a0566381a0900b00408c3aa8f4dsm528131jab.63.2023.04.06.10.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 10:53:48 -0700 (PDT)
Date: Thu, 6 Apr 2023 11:53:47 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230406115347.7af28448.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB75292DA91ED15AE94A85EB3DC3919@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230401144429.88673-13-yi.l.liu@intel.com>
 <a937e622-ce32-6dda-d77c-7d8d76474ee0@redhat.com>
 <DS0PR11MB7529D4E354C3B85D7698017DC3909@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230405102545.41a61424.alex.williamson@redhat.com>
 <ZC2jsQuWiMYM6JZb@nvidia.com>
 <20230405105215.428fa9f5.alex.williamson@redhat.com>
 <ZC2un1LaTUR1OrrJ@nvidia.com>
 <20230405125621.4627ca19.alex.williamson@redhat.com>
 <ZC3KJUxJa0O0M+9O@nvidia.com>
 <20230405134945.29e967be.alex.williamson@redhat.com>
 <ZC4CwH2ouTfZ9DNN@nvidia.com>
 <DS0PR11MB75292DA91ED15AE94A85EB3DC3919@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Thu, 6 Apr 2023 10:02:10 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Thursday, April 6, 2023 7:23 AM
> > 
> > On Wed, Apr 05, 2023 at 01:49:45PM -0600, Alex Williamson wrote:
> >   
> > > > > QEMU can make a policy decision today because the kernel provides a
> > > > > sufficiently reliable interface, ie. based on the set of owned groups, a
> > > > > hot-reset is all but guaranteed to work.  
> > > >
> > > > And we don't change that with cdev. If qemu wants to make the policy
> > > > decision it keeps using the exact same _INFO interface to make that
> > > > decision same it has always made.
> > > >
> > > > We weaken the actual reset action to only consider the security side.
> > > >
> > > > Applications that want this exclusive reset group policy simply must
> > > > check it on their own. It is a reasonable API design.  
> > >
> > > I disagree, as I've argued before, the info ioctl becomes so weak and
> > > effectively arbitrary from a user perspective at being able to predict
> > > whether the hot-reset ioctl works that it becomes useless, diminishing
> > > the entire hot-reset info/execute API.  
> > 
> > reset should be strictly more permissive than INFO. If INFO predicts
> > reset is permitted then reset should succeed.
> > 
> > We don't change INFO so it cannot "becomes so weak"  ??
> > 
> > We don't care about the cases where INFO says it will not succeed but
> > reset does (temporarily) succeed.
> > 
> > I don't get what argument you are trying to make or what you think is
> > diminished..
> > 
> > Again, userspace calls INFO, if info says yes then reset *always
> > works*, exactly just like today.
> >
> > Userspace will call reset with a 0 length FD list and it uses a
> > security only check that is strictly more permissive than what
> > get_info will return. So the new check is simple in the kernel and
> > always works in the cases we need it to work.
> > 
> > What is getting things into trouble is insisting that RESET have
> > additional restrictions beyond the minimum checks required for
> > security.
> >   
> > > > I don't view it as a loophole, it is flexability to use the API in a
> > > > way that is different from what qemu wants - eg an app like dpdk may
> > > > be willing to tolerate a reset group that becomes unavailable after
> > > > startup. Who knows, why should we force this in the kernel?  
> > >
> > > Because look at all the problems it's causing to try to introduce these
> > > loopholes without also introducing subtle bugs.  
> > 
> > These problems are coming from tring to do this integrated version,
> > not from my approach!
> > 
> > AFAICT there was nothing wrong with my original plan of using the
> > empty fd list for reset. What Yi has here is some mashup of what you
> > and I both suggested.  
> 
> Hi Alex, Jason,
> 
> could be this reason. So let me try to gather the changes of this series
> does and the impact as far as I know.
> 
> 1) only check the ownership of opened devices in the dev_set
>      in HOT_RESET ioctl.
>      - Impact: it changes the relationship between _INFO  and HOT_RESET.
>        As " Each group must have IOMMU protection established for the
>        ioctl to succeed." in [1], existing design actually means userspace
>        should own all the affected groups before heading to do HOT_RESET.
>        With the change here, the user does not need to ensure all affected
>        groups are opened and it can do hot-reset successfully as long as the
>        devices in the affected group are just un-opened and can be reset.
>     
>        [1] https://patchwork.kernel.org/project/linux-pci/patch/20130814200845.21923.64284.stgit@bling.home/

Where whether a device is opened is subject to change outside of the
user's control.  This essentially allows the user to perform hot-resets
of devices outside of their ownership so long as the device is not
used elsewhere, versus the current requirement that the user own all the
affected groups, which implies device ownership.  It's not been
justified why this feature needs to exist, imo.
 
> 2) Allow passing zero-length fd array to do hot reset
>     - Impact: this uses the iommufd as ownership check in the kernel side.
>       It is only supposed to be used by the users that open cdev instead of
>       users that open group. The drawback is that it cannot cover the noiommu
>       devices as noiommu does not use iommufd at all. But it works well for
>       most cases.

The "only supposed to be used" is problematic here, we're extending all
the interfaces to transparently accept group and device fds, but here
we need to make a distinction because the ioctl needs to perform one
way for groups and another way for devices, which it currently doesn't
do.  As above, I've not seen sufficient justification for this other
than references to reducing complexity, but the only userspace expected
to make use of this interface already has equivalent complexity.
 
> 3) Allow hot reset be successful when the dev_set is singleton
>      - Impact: this makes sense but it seems to mess up the boundary between
>      the group path and cdev path w.r.t. the usage of zero-length fd approach.
>      The group path can succeed to do hot reset even if it is passing an empty
>      fd array if the dev_set happens to be singleton.

Again, what is the justification for requiring this, it seems to be
only a hack towards no-iommu support with cdev, which we can achieve by
other means.  Why have we not needed this in the group model?  It
introduces subtle loopholes, so while maybe we could, I don't see why we
should, therefore I cannot agree with "this makes sense".

> 4) Allow passing device fd to do hot reset
>     - Impact: this is a new way for hot reset. should have no impact.
> 
> 5) Extend the _INFO to report devid
>     - Impact: this changes the way user to decode the info reported back.
>     devid and groupid are returned per the way the queried device is opened.
>     Since it was suggested to support the scenario in which some devices
>     are opened via cdev while some devices are opened via group. This makes
>     us to return invalid_devid for the device that is opened via group if
>     it is affected by the hot reset of a device that is opened via cdev.
>     
>     This was proposed to support the future device fd passing usage which is
>     only available in cdev path.

I think this is fundamentally flawed because of the scope of the
dev-id.  We can only provide dev-ids for devices which belong to the
same iommufd of the calling device, thus there are multiple instances
where no dev-id can be provided.  The group-id and bdf are static
properties of the devices, regardless of their ownership.  The bdf
provides the specific device level association while the group-id
indicates implied, static ownership.

> To me the major confusion is from 1) and 3). 1) changes the meaning of
> _INFO and HOT_RESET, while 3) messes up the boundary.

As above, I think 2) is also an issue.

> Here is my thought:
> 
> For 1), it was proposed due to below reason[2]. We'd like to make a scenario
> that works in the group path be workable in cdev path as well. But IMHO, we
> may just accept that cdev path cannot work for such scenario to avoid sublte
> change to uapi. Otherwise, we need to have another HOT_RESET ioctl or a
> hint in HOT_RESET ioctl to tell the kernel  whether relaxed ownership check
> is expected. Maybe this is awkward. But if we want to keep it, we'd do it
> with the awareness by user.
> 
> [2] https://lore.kernel.org/kvm/Y%2FdobS6gdSkxnPH7@nvidia.com/

The group association is that relaxed ownership test.  Yes, there are
corner cases where we have a dual function card with separate IOMMU
groups, where a user owning function 0 could do a bus reset because
function 1 is temporarily unused, but so what, what good is that, have
we ever had an issue raised because of this?  The user can't rely on
the unopened state of the other function.  It's an entirely
opportunistic optimization.

The much more typical scenario is that a multi-function device does not
provide isolation, all the functions are in the same group and because
of the association of the group the user has implied ownership of the
other devices for the purpose of a reset.

> For 3), it was proposed when discussing the hot reset for noiommu[3]. But
> it does not make hot reset always workable for noiommu in cdev, just in
> case dev_set is singleton. So it is more of a general optimization that can
> make the kernel skip the ownership check. But to make use of it, we may
> need to test it before sanitizing the group fds from user or the iommufd
> check. Maybe the dev_set singleton test in this series is not well placed.
> If so, I can further modify it.
> 
> [3] https://lore.kernel.org/kvm/ZACX+Np%2FIY7ygqL5@nvidia.com/

As above, this seems to be some optimization related to no-iommu for
cdev because we don't have an iommufd association for the device in
no-iommu mode.  Note however that the current group interface doesn't
care about the IOMMU context of the devices.  We only need proof that
the user owns the affected groups.  So why are we bringing iommufd
context anywhere into this interface, here or the null-array interface?

It seems like the minor difference with cdev is that a) we're passing
device fds rather than group fds, and b) those device fds need to be
validated as having device access to complete the proof of ownership
relative to the group.  Otherwise we add capabilities to
DEVICE_GET_INFO to support the device fd passing model where the user
doesn't know the device group or bdf and allow the reset ioctl itself
to accept device fds (extracting the group relationship for those which
the user has configured for access).  Thanks,

Alex

