Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE60621BE57
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 Jul 2020 22:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC0F6EC3B;
	Fri, 10 Jul 2020 20:15:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4527C6EC3B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 Jul 2020 20:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594412151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4wfn0tm0IDlZz60ENLYWcBAI86An2ZdvtpLb/DniZ8=;
 b=V8ZGo14MgnPHkHwc2ZwgAXYf2kRhyzzCvSEpLMBEg2WrOwLSQSZE0fst5uNnbdRPvBH+rS
 H1xQIaF5LlmZd7tJC0UIoMZ84sQvVMQdpWF2uEUJXre/GBnyek3qKMX/UDBhRhSGNTLKda
 41lDC079RuxprrPyRehtysnXCnj13rg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-D2NN172XP7-EJ9e5M_fNcQ-1; Fri, 10 Jul 2020 16:15:49 -0400
X-MC-Unique: D2NN172XP7-EJ9e5M_fNcQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A98A8014D7;
 Fri, 10 Jul 2020 20:15:48 +0000 (UTC)
Received: from x1.home (ovpn-112-71.phx2.redhat.com [10.3.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FB7610016E8;
 Fri, 10 Jul 2020 20:15:47 +0000 (UTC)
Date: Fri, 10 Jul 2020 14:15:46 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 0/2] VFIO mdev aggregated resources handling
Message-ID: <20200710141546.5854edc7@x1.home>
In-Reply-To: <20200710122436.56a05216.cohuck@redhat.com>
References: <20200326054136.2543-1-zhenyuw@linux.intel.com>
 <20200408055824.2378-1-zhenyuw@linux.intel.com>
 <MWHPR11MB1645CC388BF45FD2E6309C3C8C660@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200707190634.4d9055fe@x1.home>
 <MWHPR11MB16454BF5C1BF4D5D22F0B2B38C670@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200708124806.058e33d9@x1.home>
 <MWHPR11MB1645C5033CB813EBD72CE4FD8C640@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200709072334.GA26155@joy-OptiPlex-7040>
 <20200709142226.5194a4f4@x1.home>
 <20200710015849.GA29271@joy-OptiPlex-7040>
 <20200710122436.56a05216.cohuck@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: "intel-gvt-dev@lists.freedesktop.org\"          <intel-gvt-dev@lists.freedesktop.org>, "@freedesktop.org,
	kvm@vger.kernel.org, "Tian,  Kevin" <kevin.tian@intel.com>,
	Yan Zhao <yan.y.zhao@intel.com>, <kvm@vger.kernel.org>,
	Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 10 Jul 2020 12:24:36 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Fri, 10 Jul 2020 09:58:49 +0800
> Yan Zhao <yan.y.zhao@intel.com> wrote:
> 
> > On Thu, Jul 09, 2020 at 02:22:26PM -0600, Alex Williamson wrote:  
> > > On Thu, 9 Jul 2020 15:23:34 +0800
> > > Yan Zhao <yan.y.zhao@intel.com> wrote:
> > >     
> > > > On Thu, Jul 09, 2020 at 02:53:05AM +0000, Tian, Kevin wrote:
> > > > 
> > > > <...>    
> > > > > > We also can't even seem to agree that type is a necessary requirement
> > > > > > for compatibility.  Your discussion below of a type-A, which is
> > > > > > equivalent to a type-B w/ aggregation set to some value is an example
> > > > > > of this.  We might also have physical devices with extensions to
> > > > > > support migration.  These could possibly be compatible with full mdev
> > > > > > devices.  We have no idea how an administrative tool would discover
> > > > > > this other than an exhaustive search across every possible target.
> > > > > > That's ugly but feasible when considering a single target host, but
> > > > > > completely untenable when considering a datacenter.      
> > > > > 
> > > > > If exhaustive search can be done just one-off to build the compatibility
> > > > > database for all assignable devices on each node, then it might be
> > > > > still tenable in datacenter?      
> > > > yes, Alex, do you think below behavior to build compatibility database is
> > > > acceptable?
> > > > 
> > > > management stack could do the exhaustive search in one shot to build the
> > > > compatibility database for all devices in every node. Meanwhile, it caches
> > > > migration version strings for all tested devices.
> > > > when there's a newly created/attached device, management stack could write
> > > > every cached strings to migration version attribute of the newly
> > > > created/attached device in order to update the migration compatibility
> > > > database. Then it caches the migration version string of the newly
> > > > created/attached device as well.
> > > > once a device attribute is modified, e.g. after changing its aggregation
> > > > count or updating its parent driver, update its cached migration version
> > > > string and update the compatibility database by testing against migration
> > > > version attribute of this device.    
> > > 
> > > This is exactly the scenario that I think is untenable.  You're asking
> > > a management application to keep a live database of the opaque version
> > > string of every device type and likely every instance of a device,
> > > which it's not allowed to compare on its own, it can only pipe them    
> > if management stack is allowed to compare on its own, then the migration
> > version strings have to be standardized.
> > 
> > But it's a little hard to do it.
> > e.g. 
> > for GVT, string format can be
> > "parent device PCI ID" + "version of gvt driver" + "mdev type" +
> > "aggregator count".
> > 
> > for an NVMe VF connecting to a remote storage. it is
> > "PCI ID" + "driver version" + "configured remote storage URL"
> > 
> > for a QAT VF, it's
> > "PCI ID" + "driver version" + "supported encryption set".
> > 
> > The management stack also needs to understand how to compare those
> > strings, which is also hard. e.g.
> > two device with different PCI IDs are incompatible initially, but later
> > because of software upgrade, they are compatible again.  
> 
> One thing that is bothering me here is the amount of information that
> is supposed to be available to whomever is checking the compatibility.
> 
> This seems to differ a lot between different classes of devices. The
> examples you cited assume that a lot of information is available that
> can be exposed somewhere. Now, when I look at vfio-ccw, there's hardly
> any information available at the subchannel level. We do not know if we
> migrate a disk to another matching disk (or the same one), or whether
> we're trying to migrate a disk to a tape device. Any management
> application trying to migrate vfio-ccw devices has to trust information
> provided by the admin, and we only know that something's wrong if the
> guest gets confused about the device.
> 
> So, I'm wondering if we're not overengineering here. Management
> applications would have to support a wide range of information that is
> available or not, and would still have to trust the admin for some
> cases. It seems hard to fit all of that under the same umbrella.
> 
> We also cannot rely on the vendor driver to exhaustively determine
> compatibility, as it may not have that information available, either.
> We could still try to migrate to an incompatible device because we
> simply do not know about that beforehand.

None of the interfaces we're discussing actually prevent an admin from
attempting a migration, nor do they guarantee that a migration will
succeed.  The "no-interface" solution that we currently have relies on
the admin, or management tool, to create a compatible device target,
with the expectation that the vendor driver will generate a failure if
the byte stream is not recognized or incompatible.  If the vendor
driver can't do that and the guest ends up with a different type of
device on the other end, then I sort of wonder what was actually
migrated.

The version interface, AIUI, is only supposed to help provide the admin
some degree of confidence in the compatibility of a target device, and
since we're dealing with devices that are dynamically created, which
parent devices and types can host a compatible device.  It's not meant
to be a required step in the migration process, so if it becomes too
heavyweight to bother with or doesn't do any better than an educated
guess, then it's not adding value.  It certainly does not and must not
replace the vendor driver including and validating verification data
within their own migration data stream.

The original plan was that we'd expect a management tool to first look
for a matching mdev type, that would provide a first pass of
potentially compatible targets.  From that reduced set of targets,
perhaps further reduced to those with available instances in the
creation case, compatibility could be further checked with this
migration interface, with the assumption that it could be a lightweight
indicator of likely success.  But now if we consider that any device is
potentially compatible with any other device and elaborate matrices of
target and source devices being maintained dynamically to make it
useful, I'm afraid it might have a pretty poor value proposition.

"Leave it to the admin" is the status quo.  Per the original series
here, even if we abandon a version interface, I'm concerned that
creation parameters beyond a UUID are a rather fundamental change that
ripples out through any sort of device creation and subjects us to
future extensions of device creation, whereas we already have a
mechanism for vendor attributes and some classes of mdev devices make
extensive use of those to effectively assemble an mdev device
post-creation.  If aggregation is logically a linear extension of some
feature of an mdev, then it seems like this is something that could be
exposed as a vendor attribute, especially since the vendor is defining
which feature of the device is being extended.  The "aggregation" of a
device really depends on what capacity of the device is being measured.
For instance NVIDIA vGPUs include a frame rate limiter that can be
adjusted via vendor attributes.  If my metric is fps, and perhaps by
extension the portion of the GPU compute resources consumed, then isn't
this already a vendor specific aggregation attribute?  Specifying
aggregation at creation time might be a simplification for the vendor
driver, but we can fail changes to a vendor attribute if the device is
not closed and idle, or if the vendor driver doesn't have contiguous
slots (if that's required), and available_instances is already defined
as volatile, so userspace shouldn't be surprised if interaction with a
vendor attribute changes the value.  Plus, vendor attributes already
work with mdevctl :) (sorry, probably rambled on more than necessary
here).  Thanks,

Alex

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
