Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D181EF537
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  5 Jun 2020 12:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DED26E83A;
	Fri,  5 Jun 2020 10:22:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D3A6E83A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  5 Jun 2020 10:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591352576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tMFYfUb/jYC7nyZ2YJUgbESvFgbKu+icAne7NJy0NhM=;
 b=GcA6U1Ib/ccY0JXNuuxqOIvAFHdEqNlOq9JPwhbdL8EISojo7bByNo4uHQtChcsWSiYOgU
 gT7dzOB8CzZaZMEDFzVh3iQ9csgzo9K/mLKOuH3hNZGflSxXSUL/1EBhsIlj3w7QoVaPu9
 G9UERzTnwvmvAha8U0PDYvgckhGfhdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-9wxmNqNGNeuQZLM3tc2FlQ-1; Fri, 05 Jun 2020 06:22:51 -0400
X-MC-Unique: 9wxmNqNGNeuQZLM3tc2FlQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFC7B107ACCD;
 Fri,  5 Jun 2020 10:22:47 +0000 (UTC)
Received: from work-vm (ovpn-113-211.ams2.redhat.com [10.36.113.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE387891C2;
 Fri,  5 Jun 2020 10:22:26 +0000 (UTC)
Date: Fri, 5 Jun 2020 11:22:24 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v5 0/4] introduction of migration_version attribute for
 VFIO live migration
Message-ID: <20200605102224.GB2936@work-vm>
References: <20200429072616.GL12879@joy-OptiPlex-7040>
 <20200429082201.GA2834@work-vm>
 <20200429093555.GM12879@joy-OptiPlex-7040>
 <20200429094844.GE2834@work-vm>
 <20200430003949.GN12879@joy-OptiPlex-7040>
 <20200602165527.34137955@x1.home>
 <20200603031948.GB12300@joy-OptiPlex-7040>
 <20200602215528.7a1008f0@x1.home>
 <20200603052443.GC12300@joy-OptiPlex-7040>
 <20200603102628.017e2896@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603102628.017e2896@x1.home>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
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
 "Tian, Kevin" <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "dinechin@redhat.com" <dinechin@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "He,
 Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

* Alex Williamson (alex.williamson@redhat.com) wrote:
> On Wed, 3 Jun 2020 01:24:43 -0400
> Yan Zhao <yan.y.zhao@intel.com> wrote:
> 
> > On Tue, Jun 02, 2020 at 09:55:28PM -0600, Alex Williamson wrote:
> > > On Tue, 2 Jun 2020 23:19:48 -0400
> > > Yan Zhao <yan.y.zhao@intel.com> wrote:
> > >   
> > > > On Tue, Jun 02, 2020 at 04:55:27PM -0600, Alex Williamson wrote:  
> > > > > On Wed, 29 Apr 2020 20:39:50 -0400
> > > > > Yan Zhao <yan.y.zhao@intel.com> wrote:
> > > > >     
> > > > > > On Wed, Apr 29, 2020 at 05:48:44PM +0800, Dr. David Alan Gilbert wrote:
> > > > > > <snip>    
> > > > > > > > > > > > > > > > > > > An mdev type is meant to define a software compatible interface, so in
> > > > > > > > > > > > > > > > > > > the case of mdev->mdev migration, doesn't migrating to a different type
> > > > > > > > > > > > > > > > > > > fail the most basic of compatibility tests that we expect userspace to
> > > > > > > > > > > > > > > > > > > perform?  IOW, if two mdev types are migration compatible, it seems a
> > > > > > > > > > > > > > > > > > > prerequisite to that is that they provide the same software interface,
> > > > > > > > > > > > > > > > > > > which means they should be the same mdev type.
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > In the hybrid cases of mdev->phys or phys->mdev, how does a      
> > > > > > > > > > > > > > > > > > management      
> > > > > > > > > > > > > > > > > > > tool begin to even guess what might be compatible?  Are we expecting
> > > > > > > > > > > > > > > > > > > libvirt to probe ever device with this attribute in the system?  Is
> > > > > > > > > > > > > > > > > > > there going to be a new class hierarchy created to enumerate all
> > > > > > > > > > > > > > > > > > > possible migrate-able devices?
> > > > > > > > > > > > > > > > > > >      
> > > > > > > > > > > > > > > > > > yes, management tool needs to guess and test migration compatible
> > > > > > > > > > > > > > > > > > between two devices. But I think it's not the problem only for
> > > > > > > > > > > > > > > > > > mdev->phys or phys->mdev. even for mdev->mdev, management tool needs
> > > > > > > > > > > > > > > > > > to
> > > > > > > > > > > > > > > > > > first assume that the two mdevs have the same type of parent devices
> > > > > > > > > > > > > > > > > > (e.g.their pciids are equal). otherwise, it's still enumerating
> > > > > > > > > > > > > > > > > > possibilities.
> > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > on the other hand, for two mdevs,
> > > > > > > > > > > > > > > > > > mdev1 from pdev1, its mdev_type is 1/2 of pdev1;
> > > > > > > > > > > > > > > > > > mdev2 from pdev2, its mdev_type is 1/4 of pdev2;
> > > > > > > > > > > > > > > > > > if pdev2 is exactly 2 times of pdev1, why not allow migration between
> > > > > > > > > > > > > > > > > > mdev1 <-> mdev2.      
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > How could the manage tool figure out that 1/2 of pdev1 is equivalent 
> > > > > > > > > > > > > > > > > to 1/4 of pdev2? If we really want to allow such thing happen, the best
> > > > > > > > > > > > > > > > > choice is to report the same mdev type on both pdev1 and pdev2.      
> > > > > > > > > > > > > > > > I think that's exactly the value of this migration_version interface.
> > > > > > > > > > > > > > > > the management tool can take advantage of this interface to know if two
> > > > > > > > > > > > > > > > devices are migration compatible, no matter they are mdevs, non-mdevs,
> > > > > > > > > > > > > > > > or mix.
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > as I know, (please correct me if not right), current libvirt still
> > > > > > > > > > > > > > > > requires manually generating mdev devices, and it just duplicates src vm
> > > > > > > > > > > > > > > > configuration to the target vm.
> > > > > > > > > > > > > > > > for libvirt, currently it's always phys->phys and mdev->mdev (and of the
> > > > > > > > > > > > > > > > same mdev type).
> > > > > > > > > > > > > > > > But it does not justify that hybrid cases should not be allowed. otherwise,
> > > > > > > > > > > > > > > > why do we need to introduce this migration_version interface and leave
> > > > > > > > > > > > > > > > the judgement of migration compatibility to vendor driver? why not simply
> > > > > > > > > > > > > > > > set the criteria to something like "pciids of parent devices are equal,
> > > > > > > > > > > > > > > > and mdev types are equal" ?
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > >       
> > > > > > > > > > > > > > > > > btw mdev<->phys just brings trouble to upper stack as Alex pointed out.       
> > > > > > > > > > > > > > > > could you help me understand why it will bring trouble to upper stack?
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > I think it just needs to read src migration_version under src dev node,
> > > > > > > > > > > > > > > > and test it in target migration version under target dev node. 
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > after all, through this interface we just help the upper layer
> > > > > > > > > > > > > > > > knowing available options through reading and testing, and they decide
> > > > > > > > > > > > > > > > to use it or not.
> > > > > > > > > > > > > > > >       
> > > > > > > > > > > > > > > > > Can we simplify the requirement by allowing only mdev<->mdev and 
> > > > > > > > > > > > > > > > > phys<->phys migration? If an customer does want to migrate between a 
> > > > > > > > > > > > > > > > > mdev and phys, he could wrap physical device into a wrapped mdev 
> > > > > > > > > > > > > > > > > instance (with the same type as the source mdev) instead of using vendor 
> > > > > > > > > > > > > > > > > ops. Doing so does add some burden but if mdev<->phys is not dominant 
> > > > > > > > > > > > > > > > > usage then such tradeoff might be worthywhile...
> > > > > > > > > > > > > > > > >      
> > > > > > > > > > > > > > > > If the interfaces for phys<->phys and mdev<->mdev are consistent, it makes no
> > > > > > > > > > > > > > > > difference to phys<->mdev, right?
> > > > > > > > > > > > > > > > I think the vendor string for a mdev device is something like:
> > > > > > > > > > > > > > > > "Parent PCIID + mdev type + software version", and
> > > > > > > > > > > > > > > > that for a phys device is something like:
> > > > > > > > > > > > > > > > "PCIID + software version".
> > > > > > > > > > > > > > > > as long as we don't migrate between devices from different vendors, it's
> > > > > > > > > > > > > > > > easy for vendor driver to tell if a phys device is migration compatible
> > > > > > > > > > > > > > > > to a mdev device according it supports it or not.      
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > It surprises me that the PCIID matching is a requirement; I'd assumed
> > > > > > > > > > > > > > > with this clever mdev name setup that you could migrate between two
> > > > > > > > > > > > > > > different models in a series, or to a newer model, as long as they
> > > > > > > > > > > > > > > both supported the same mdev view.
> > > > > > > > > > > > > > >       
> > > > > > > > > > > > > > hi Dave
> > > > > > > > > > > > > > the migration_version string is transparent to userspace, and is
> > > > > > > > > > > > > > completely defined by vendor driver.
> > > > > > > > > > > > > > I put it there just as an example of how vendor driver may implement it.
> > > > > > > > > > > > > > e.g.
> > > > > > > > > > > > > > the src migration_version string is "src PCIID + src software version", 
> > > > > > > > > > > > > > then when this string is write to target migration_version node,
> > > > > > > > > > > > > > the vendor driver in the target device will compare it with its own
> > > > > > > > > > > > > > device info and software version.
> > > > > > > > > > > > > > If different models are allowed, the write just succeeds even
> > > > > > > > > > > > > > PCIIDs in src and target are different.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > so, it is the vendor driver to define whether two devices are able to
> > > > > > > > > > > > > > migrate, no matter their PCIIDs, mdev types, software versions..., which
> > > > > > > > > > > > > > provides vendor driver full flexibility.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > do you think it's good?      
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Yeh that's OK; I guess it's going to need to have a big table in their
> > > > > > > > > > > > > with all the PCIIDs in.
> > > > > > > > > > > > > The alternative would be to abstract it a little; e.g. to say it's
> > > > > > > > > > > > > an Intel-gpu-core-v4  and then it would be less worried about the exact
> > > > > > > > > > > > > clock speed etc - but yes you might be right htat PCIIDs might be best
> > > > > > > > > > > > > for checking for quirks.
> > > > > > > > > > > > >      
> > > > > > > > > > > > glad that you are agreed with it:)
> > > > > > > > > > > > I think the vendor driver still can choose a way to abstract a little
> > > > > > > > > > > > (e.g. Intel-gpu-core-v4...) if they think it's better. In that case, the
> > > > > > > > > > > > migration_string would be something like "Intel-gpu-core-v4 + instance
> > > > > > > > > > > > number + software version".
> > > > > > > > > > > > IOW, they can choose anything they think appropriate to identify migration
> > > > > > > > > > > > compatibility of a device.
> > > > > > > > > > > > But Alex is right, we have to prevent namespace overlapping. So I think
> > > > > > > > > > > > we need to ensure src and target devices are from the same vendors.
> > > > > > > > > > > > or, any other ideas?      
> > > > > > > > > > > 
> > > > > > > > > > > That's why I kept the 'Intel' in that example; or PCI vendor ID; I was      
> > > > > > > > > > Yes, it's a good idea!
> > > > > > > > > > could we add a line in the doc saying that
> > > > > > > > > > it is the vendor driver to add a unique string to avoid namespace
> > > > > > > > > > collision?      
> > > > > > > > > 
> > > > > > > > > So why don't we split the difference; lets say that it should start with
> > > > > > > > > the hex PCI Vendor ID.
> > > > > > > > >      
> > > > > > > > The problem is for mdev devices, if the parent devices are not PCI devices, 
> > > > > > > > they don't have PCI vendor IDs.      
> > > > > > > 
> > > > > > > Hmm it would be best not to invent a whole new way of giving unique
> > > > > > > idenitifiers for vendors if we can.
> > > > > > >       
> > > > > > what about leveraging the flags in vfio device info ?
> > > > > > 
> > > > > > #define VFIO_DEVICE_FLAGS_RESET (1 << 0)        /* Device supports reset */
> > > > > > #define VFIO_DEVICE_FLAGS_PCI   (1 << 1)        /* vfio-pci device */
> > > > > > #define VFIO_DEVICE_FLAGS_PLATFORM (1 << 2)     /* vfio-platform device */
> > > > > > #define VFIO_DEVICE_FLAGS_AMBA  (1 << 3)        /* vfio-amba device */
> > > > > > #define VFIO_DEVICE_FLAGS_CCW   (1 << 4)        /* vfio-ccw device */
> > > > > > #define VFIO_DEVICE_FLAGS_AP    (1 << 5)        /* vfio-ap device */
> > > > > > 
> > > > > > Then for migration_version string,
> > > > > > The first 64 bits are for device type, the second 64 bits are for device id.
> > > > > > e.g.
> > > > > > for PCI devices, it could be
> > > > > > VFIO_DEVICE_FLAGS_PCI + PCI ID.
> > > > > > 
> > > > > > Currently in the doc, we only define PCI devices to use PCI ID as the second
> > > > > > 64 bits. In future, if other types of devices want to support migration,
> > > > > > they can define their own parts of device id. e.g. use ACPI ID as the
> > > > > > second 64-bit...
> > > > > > 
> > > > > > sounds good?    
> > > > > 
> > > > > [dead thread resurrection alert]
> > > > > 
> > > > > Not really.  We're deep into territory that we were trying to avoid.
> > > > > We had previously defined the version string as opaque (not
> > > > > transparent) specifically because we did not want userspace to make
> > > > > assumptions about compatibility based on the content of the string.  It
> > > > > was 100% left to the vendor driver to determine compatibility.  The
> > > > > mdev type was the full extent of the first level filter that userspace
> > > > > could use to narrow the set of potentially compatible devices.  If we
> > > > > remove that due to physical device migration support, I'm not sure how
> > > > > we simplify the problem for userspace.
> > > > > 
> > > > > We need to step away from PCI IDs and parent devices.  We're not
> > > > > designing a solution that only works for PCI, there's no guarantee that
> > > > > parent devices are similar or even from the same vendor.
> > > > > 
> > > > > Does the mdev type sufficiently solve the problem for mdev devices?  If
> > > > > so, then what can we learn from it and how can we apply an equivalence
> > > > > to physical devices?  For example, should a vfio bus driver (vfio-pci
> > > > > or vfio-mdev) expose vfio_migration_type and vfio_migration_version
> > > > > attributes under the device in sysfs where the _type provides the first
> > > > > level, user transparent, matching string (ex. mdev type for mdev
> > > > > devices) while the _version provides the user opaque, vendor known
> > > > > compatibility test?
> > > > > 
> > > > > This pushes the problem out to the drivers where we can perhaps
> > > > > incorporate the module name to avoid collisions.  For example Yan's
> > > > > vendor extension proposal makes use of vfio-pci with extension modules
> > > > > loaded via an alias incorporating the PCI vendor and device ID.  So
> > > > > vfio-pci might use a type of "vfio-pci:$ALIAS".
> > > > > 
> > > > > It's still a bit messy that someone needs to go evaluate all these
> > > > > types between devices that exist and mdev devices that might exist if
> > > > > created, but I don't have any good ideas to resolve that (maybe a new
> > > > > class hierarchy?).  Thanks,    
> > > > 
> > > > hi Alex
> > > > 
> > > > yes, with the same mdev_type, user still has to enumerate all parent
> > > > devices and test between the supported mdev_types to know whether two mdev
> > > > devices are compatible.
> > > > maybe this is not a problem? in reality, it is the administrator that
> > > > specifies two devices and the management tool feedbacks compatibility
> > > > result. management tool is not required to pre-test and setup the
> > > > compatibility map beforehand.  
> > > 
> > > That's exactly the purpose of this interface though is to give the
> > > management tools some indication that a migration has a chance of
> > > working.
> > >    
> > > > If so, then the only problem left is namespace collision. 
> > > > given that the migration_version nodes is exported by vendor driver,
> > > > maybe it can also embed its module name in the migration version string,
> > > > like "i915" in "i915-GVTg_V5_8", as you suggested above.  
> > > 
> > > No, we've already decided that the version string is opaque, the user
> > > is not to attempt to infer anything from it.  That's why I've suggested
> > > another attribute in sysfs that does present type information that a
> > > user can compare.  Thanks,
> > > 
> > > Alex
> > >  
> > ok. got it.
> > one more thing I want to confirm is that do you think it's a necessary
> > restriction that "The mdev devices are of the same type" ?
> > could mdev and phys devices both expose "vfio_migration_type" and
> > "vfio_migration_version" under device sysfs so that it may not be
> > confined in mdev_type? (e.g. when aggregator is enabled, though two
> > mdevs are of the same mdev_type, they are not actually compatible; and
> > two mdevs are compatible though their mdev_type is not equal.) 
> > 
> > for mdev devices, we could still expose vfio_migration_version
> > attribute under mdev_type for detection before mdev generated.
> 
> I tried to simplify the problem a bit, but we keep going backwards.  If
> the requirement is that potentially any source device can migrate to any
> target device and we cannot provide any means other than writing an
> opaque source string into a version attribute on the target and
> evaluating the result to determine compatibility, then we're requiring
> userspace to do an exhaustive search to find a potential match.  That
> sucks. 

Why is the mechanism a 'write and test' why isn't it a 'write and ask'?
i.e. the destination tells the driver what type it's received from the
source, and the driver replies with a set of compatible configurations
(in some preferred order).

It's also not clear to me why the name has to be that opaque;
I agree it's only got to be understood by the driver but that doesn't
seem to be a reason for the driver to make it purposely obfuscated.
I wouldn't expect a user to be able to parse it necessarily; but would
expect something that would be useful for an error message.

Dave

> We don't have an agreed proposal for aggregation and even this
> exhaustive search mechanism doesn't solve that problem, ex. the target
> type may be able to support a compatible aggregation, but the user
> might find after they've created the device that their aggregation was
> wrong and the resulting device doesn't even match the version
> compatibility of the parent type.  We're arguing our way into an
> unsolvable problem and unless we can simplify it, I'm afraid there's no
> solution, we're just going to have a bad interface for the user to test
> compatibility, which is not really acceptable.  Thanks,
> 
> Alex
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
