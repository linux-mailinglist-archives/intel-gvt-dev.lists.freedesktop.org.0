Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BE421B902
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 Jul 2020 17:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DB16EC6E;
	Fri, 10 Jul 2020 15:00:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FB16EC6E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 Jul 2020 15:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594393212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YJfhn9B1bYFnC3Y/JSBqdnMPJGOHPhcn5xhBwk9IA0E=;
 b=RebzwylgkI/XXLWvR0ZdL/R4uFM28QqRyu2mI7vmdDz9uZp/03OKRXNu/MRSF4QEQSX6J8
 dRzNEiGGIZc+6Bo209deDv3ou+y79qpawN+dGn7EScFJ0FNtzbnE2QBIi0lYlvodfnnmwh
 Z7QM8w6UEyDUCA5filvC0m+u5xrQ8Kg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-3LDdNsVvPVGZh6lOL4gMYg-1; Fri, 10 Jul 2020 11:00:07 -0400
X-MC-Unique: 3LDdNsVvPVGZh6lOL4gMYg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 899F9800597;
 Fri, 10 Jul 2020 15:00:06 +0000 (UTC)
Received: from x1.home (ovpn-112-71.phx2.redhat.com [10.3.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 100AF74F59;
 Fri, 10 Jul 2020 15:00:05 +0000 (UTC)
Date: Fri, 10 Jul 2020 09:00:03 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v3 0/2] VFIO mdev aggregated resources handling
Message-ID: <20200710090003.32dd24cb@x1.home>
In-Reply-To: <20200710015849.GA29271@joy-OptiPlex-7040>
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
Organization: Red Hat
MIME-Version: 1.0
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 10 Jul 2020 09:58:49 +0800
Yan Zhao <yan.y.zhao@intel.com> wrote:

> On Thu, Jul 09, 2020 at 02:22:26PM -0600, Alex Williamson wrote:
> > On Thu, 9 Jul 2020 15:23:34 +0800
> > Yan Zhao <yan.y.zhao@intel.com> wrote:
> >   
> > > On Thu, Jul 09, 2020 at 02:53:05AM +0000, Tian, Kevin wrote:
> > > 
> > > <...>  
> > > > > We also can't even seem to agree that type is a necessary requirement
> > > > > for compatibility.  Your discussion below of a type-A, which is
> > > > > equivalent to a type-B w/ aggregation set to some value is an example
> > > > > of this.  We might also have physical devices with extensions to
> > > > > support migration.  These could possibly be compatible with full mdev
> > > > > devices.  We have no idea how an administrative tool would discover
> > > > > this other than an exhaustive search across every possible target.
> > > > > That's ugly but feasible when considering a single target host, but
> > > > > completely untenable when considering a datacenter.    
> > > > 
> > > > If exhaustive search can be done just one-off to build the compatibility
> > > > database for all assignable devices on each node, then it might be
> > > > still tenable in datacenter?    
> > > yes, Alex, do you think below behavior to build compatibility database is
> > > acceptable?
> > > 
> > > management stack could do the exhaustive search in one shot to build the
> > > compatibility database for all devices in every node. Meanwhile, it caches
> > > migration version strings for all tested devices.
> > > when there's a newly created/attached device, management stack could write
> > > every cached strings to migration version attribute of the newly
> > > created/attached device in order to update the migration compatibility
> > > database. Then it caches the migration version string of the newly
> > > created/attached device as well.
> > > once a device attribute is modified, e.g. after changing its aggregation
> > > count or updating its parent driver, update its cached migration version
> > > string and update the compatibility database by testing against migration
> > > version attribute of this device.  
> > 
> > This is exactly the scenario that I think is untenable.  You're asking
> > a management application to keep a live database of the opaque version
> > string of every device type and likely every instance of a device,
> > which it's not allowed to compare on its own, it can only pipe them  
> if management stack is allowed to compare on its own, then the migration
> version strings have to be standardized.
> 
> But it's a little hard to do it.
> e.g. 
> for GVT, string format can be
> "parent device PCI ID" + "version of gvt driver" + "mdev type" +
> "aggregator count".
> 
> for an NVMe VF connecting to a remote storage. it is
> "PCI ID" + "driver version" + "configured remote storage URL"
> 
> for a QAT VF, it's
> "PCI ID" + "driver version" + "supported encryption set".
> 
> The management stack also needs to understand how to compare those
> strings, which is also hard. e.g.
> two device with different PCI IDs are incompatible initially, but later
> because of software upgrade, they are compatible again.

You're rehashing all the reasons we decided to make the string opaque.
Your examples include driver version information, but different driver
versions don't necessarily imply incompatibility.  Therefore the only
means that a consumer of the version string really has for determining
compatibility is to push that version string back into the driver and
ask whether it it's compatible.  The absolute only test that a
management tool could do on its own would be a simple strcmp(), but
clearly that can't support different driver versions or parent device
IDs, or any other field of the proposed version string.  These examples
are also extremely PCI biased, we need a solution that supports any
type of device.

> > through to every other device across the datacenter to determine which
> > are comparable.  It would need to respond to not only devices being
> > added and removed, but bound and unbound from drivers, and entire nodes
> > being added and removed.  That seems like a lot of overhead, in  
> those responses are also required if the management stack wants to
> compare on its own, right?

I think there needs to be an efficient mechanism to ask, given this
source device, does a target system have a compatible device, or
resources and capacity to create one.  The proposals we're discussing
fail that efficiency qualification in my mind.
 
> > addition to the effect of essentially fuzzing the version interface
> > across all vendors and types.  We need a better solution or we need
> > someone from openstack and ovirt to agree that this is more viable than
> > I suspect. Thanks  
> before we have a better solution, do you think it's good to ask people
> from openstack and ovirt first? what if the problem is not as complicated
> as we thought?

That's exactly what I just suggested here and in the other fork of this
thread.  Thanks,

Alex

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
