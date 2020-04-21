Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C381B2599
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 Apr 2020 14:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023116E927;
	Tue, 21 Apr 2020 12:10:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088E86E927
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 21 Apr 2020 12:10:10 +0000 (UTC)
IronPort-SDR: xkoiEYqeYKNBwkRtf7MshrzZWFylAOo9Um3U/uZ5X9vPGesa6zTmKqWmtttQEmYCFWzN59Wl10
 P5UuuPFehNcA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 05:10:09 -0700
IronPort-SDR: 8VxAIGwySK5prjvHeIPeC8fZRtUkDn5qBKFzwHsR72++3pK9BIM1nETFu7DTcPjbGlQJJnkkMy
 eruHb2hIDYBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,410,1580803200"; d="scan'208";a="429510291"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga005.jf.intel.com with ESMTP; 21 Apr 2020 05:10:08 -0700
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 21 Apr 2020 05:08:53 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 21 Apr 2020 05:08:53 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.209]) with mapi id 14.03.0439.000;
 Tue, 21 Apr 2020 20:08:49 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Zhao, Yan Y" <yan.y.zhao@intel.com>, Alex Williamson
 <alex.williamson@redhat.com>
Subject: RE: [PATCH v5 0/4] introduction of migration_version attribute for
 VFIO live migration
Thread-Topic: [PATCH v5 0/4] introduction of migration_version attribute for
 VFIO live migration
Thread-Index: AQHWEVkQX2D3KsUjJk2k1DZCtXaM5qh8gBsAgAASxgCAABn2gIAED1uAgAFotwCAAD3VAIABIlKw
Date: Tue, 21 Apr 2020 12:08:49 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D86DF06@SHSMSX104.ccr.corp.intel.com>
References: <20200413055201.27053-1-yan.y.zhao@intel.com>
 <20200417104450.2d2f2fa9.cohuck@redhat.com>
 <20200417095202.GD16688@joy-OptiPlex-7040>
 <20200417132457.45d91fe3.cohuck@redhat.com>
 <20200420012457.GE16688@joy-OptiPlex-7040>
 <20200420165600.4951ae82@w520.home>
 <20200421023718.GA12111@joy-OptiPlex-7040>
In-Reply-To: <20200421023718.GA12111@joy-OptiPlex-7040>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
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
Cc: Cornelia Huck <cohuck@redhat.com>, "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "Yang, Ziye" <ziye.yang@intel.com>,
 "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Zeng, Xin" <xin.zeng@intel.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "dinechin@redhat.com" <dinechin@redhat.com>,
 "He, Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Yan Zhao
> Sent: Tuesday, April 21, 2020 10:37 AM
> 
> On Tue, Apr 21, 2020 at 06:56:00AM +0800, Alex Williamson wrote:
> > On Sun, 19 Apr 2020 21:24:57 -0400
> > Yan Zhao <yan.y.zhao@intel.com> wrote:
> >
> > > On Fri, Apr 17, 2020 at 07:24:57PM +0800, Cornelia Huck wrote:
> > > > On Fri, 17 Apr 2020 05:52:02 -0400
> > > > Yan Zhao <yan.y.zhao@intel.com> wrote:
> > > >
> > > > > On Fri, Apr 17, 2020 at 04:44:50PM +0800, Cornelia Huck wrote:
> > > > > > On Mon, 13 Apr 2020 01:52:01 -0400
> > > > > > Yan Zhao <yan.y.zhao@intel.com> wrote:
> > > > > >
> > > > > > > This patchset introduces a migration_version attribute under sysfs
> of VFIO
> > > > > > > Mediated devices.
> > > > > > >
> > > > > > > This migration_version attribute is used to check migration
> compatibility
> > > > > > > between two mdev devices.
> > > > > > >
> > > > > > > Currently, it has two locations:
> > > > > > > (1) under mdev_type node,
> > > > > > >     which can be used even before device creation, but only for
> mdev
> > > > > > >     devices of the same mdev type.
> > > > > > > (2) under mdev device node,
> > > > > > >     which can only be used after the mdev devices are created, but
> the src
> > > > > > >     and target mdev devices are not necessarily be of the same
> mdev type
> > > > > > > (The second location is newly added in v5, in order to keep
> consistent
> > > > > > > with the migration_version node for migratable pass-though
> devices)
> > > > > >
> > > > > > What is the relationship between those two attributes?
> > > > > >
> > > > > (1) is for mdev devices specifically, and (2) is provided to keep the
> same
> > > > > sysfs interface as with non-mdev cases. so (2) is for both mdev
> devices and
> > > > > non-mdev devices.
> > > > >
> > > > > in future, if we enable vfio-pci vendor ops, (i.e. a non-mdev device
> > > > > is binding to vfio-pci, but is able to register migration region and do
> > > > > migration transactions from a vendor provided affiliate driver),
> > > > > the vendor driver would export (2) directly, under device node.
> > > > > It is not able to provide (1) as there're no mdev devices involved.
> > > >
> > > > Ok, creating an alternate attribute for non-mdev devices makes sense.
> > > > However, wouldn't that rather be a case (3)? The change here only
> > > > refers to mdev devices.
> > > >
> > > as you pointed below, (3) and (2) serve the same purpose.
> > > and I think a possible usage is to migrate between a non-mdev device and
> > > an mdev device. so I think it's better for them both to use (2) rather
> > > than creating (3).
> >
> > An mdev type is meant to define a software compatible interface, so in
> > the case of mdev->mdev migration, doesn't migrating to a different type
> > fail the most basic of compatibility tests that we expect userspace to
> > perform?  IOW, if two mdev types are migration compatible, it seems a
> > prerequisite to that is that they provide the same software interface,
> > which means they should be the same mdev type.
> >
> > In the hybrid cases of mdev->phys or phys->mdev, how does a
> management
> > tool begin to even guess what might be compatible?  Are we expecting
> > libvirt to probe ever device with this attribute in the system?  Is
> > there going to be a new class hierarchy created to enumerate all
> > possible migrate-able devices?
> >
> yes, management tool needs to guess and test migration compatible
> between two devices. But I think it's not the problem only for
> mdev->phys or phys->mdev. even for mdev->mdev, management tool needs
> to
> first assume that the two mdevs have the same type of parent devices
> (e.g.their pciids are equal). otherwise, it's still enumerating
> possibilities.
> 
> on the other hand, for two mdevs,
> mdev1 from pdev1, its mdev_type is 1/2 of pdev1;
> mdev2 from pdev2, its mdev_type is 1/4 of pdev2;
> if pdev2 is exactly 2 times of pdev1, why not allow migration between
> mdev1 <-> mdev2.

How could the manage tool figure out that 1/2 of pdev1 is equivalent 
to 1/4 of pdev2? If we really want to allow such thing happen, the best
choice is to report the same mdev type on both pdev1 and pdev2.

btw mdev<->phys just brings trouble to upper stack as Alex pointed out. 
Can we simplify the requirement by allowing only mdev<->mdev and 
phys<->phys migration? If an customer does want to migrate between a 
mdev and phys, he could wrap physical device into a wrapped mdev 
instance (with the same type as the source mdev) instead of using vendor 
ops. Doing so does add some burden but if mdev<->phys is not dominant 
usage then such tradeoff might be worthywhile...

Thanks
Kevin

> 
> 
> > I agree that there was a gap in the previous proposal for non-mdev
> > devices, but I think this bring a lot of questions that we need to
> > puzzle through and libvirt will need to re-evaluate how they might
> > decide to pick a migration target device.  For example, I'm sure
> > libvirt would reject any policy decisions regarding picking a physical
> > device versus an mdev device.  Had we previously left it that only a
> > layer above libvirt would select a target device and libvirt only tests
> > compatibility to that target device?
> I'm not sure if there's a layer above libvirt would select a target
> device. but if there is such a layer (even it's human), we need to
> provide an interface for them to know whether their decision is suitable
> for migration. The migration_version interface provides a potential to
> allow mdev->phys migration, even libvirt may currently reject it.
> 
> 
> > We also need to consider that this expands the namespace.  If we no
> > longer require matching types as the first level of comparison, then
> > vendor migration strings can theoretically collide.  How do we
> > coordinate that can't happen?  Thanks,
> yes, it's indeed a problem.
> could only allowing migration beteen devices from the same vendor be a
> good
> prerequisite?
> 
> Thanks
> Yan
> >
> > > > > > Is existence (and compatibility) of (1) a pre-req for possible
> > > > > > existence (and compatibility) of (2)?
> > > > > >
> > > > > no. (2) does not reply on (1).
> > > >
> > > > Hm. Non-existence of (1) seems to imply "this type does not support
> > > > migration". If an mdev created for such a type suddenly does support
> > > > migration, it feels a bit odd.
> > > >
> > > yes. but I think if the condition happens, it should be reported a bug
> > > to vendor driver.
> > > should I add a line in the doc like "vendor driver should ensure that the
> > > migration compatibility from migration_version under mdev_type should
> be
> > > consistent with that from migration_version under device node" ?
> > >
> > > > (It obviously cannot be a prereq for what I called (3) above.)
> > > >
> > > > >
> > > > > > Does userspace need to check (1) or can it completely rely on (2), if
> > > > > > it so chooses?
> > > > > >
> > > > > I think it can completely reply on (2) if compatibility check before
> > > > > mdev creation is not required.
> > > > >
> > > > > > If devices with a different mdev type are indeed compatible, it
> seems
> > > > > > userspace can only find out after the devices have actually been
> > > > > > created, as (1) does not apply?
> > > > > yes, I think so.
> > > >
> > > > How useful would it be for userspace to even look at (1) in that case?
> > > > It only knows if things have a chance of working if it actually goes
> > > > ahead and creates devices.
> > > >
> > > hmm, is it useful for userspace to test the migration_version under mdev
> > > type before it knows what mdev device to generate ?
> > > like when the userspace wants to migrate an mdev device in src vm,
> > > but it has not created target vm and the target mdev device.
> > >
> > > > >
> > > > > > One of my worries is that the existence of an attribute with the
> same
> > > > > > name in two similar locations might lead to confusion. But maybe it
> > > > > > isn't a problem.
> > > > > >
> > > > > Yes, I have the same feeling. but as (2) is for sysfs interface
> > > > > consistency, to make it transparent to userspace tools like libvirt,
> > > > > I guess the same name is necessary?
> > > >
> > > > What do we actually need here, I wonder? (1) and (2) seem to serve
> > > > slightly different purposes, while (2) and what I called (3) have the
> > > > same purpose. Is it important to userspace that (1) and (2) have the
> > > > same name?
> > > so change (1) to migration_type_version and (2) to
> > > migration_instance_version?
> > > But as they are under different locations, could that location imply
> > > enough information?
> > >
> > >
> > > Thanks
> > > Yan
> > >
> > >
> >
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
