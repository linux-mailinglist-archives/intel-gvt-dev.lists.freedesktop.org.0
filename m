Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD8D21A8D7
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 Jul 2020 22:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D865F6EB2F;
	Thu,  9 Jul 2020 20:22:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA526EB2F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Jul 2020 20:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594326152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KnFi1o8AWX256++h4j5ELnYi6yvqduzOUVJzYLgG2/k=;
 b=T4Qz7/GNE9QFnstQXLmNfV4B3mhZShI17fVD9bfXqU2AlpisFSR1C/9jBAKbfuZ0Bdv+U0
 W9dak5mlsLX1+60rF81asChCwOW3lhkZ9EbIPIrilgadCRM1t/7barArfsyVrTqKqss3lE
 YJuVcnhCiP2OHXuuV1aMJtNPzTBzPIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-xZcntKzSM6KukCK4WT8jcg-1; Thu, 09 Jul 2020 16:22:30 -0400
X-MC-Unique: xZcntKzSM6KukCK4WT8jcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E05B59A0F9;
 Thu,  9 Jul 2020 20:22:27 +0000 (UTC)
Received: from x1.home (ovpn-112-71.phx2.redhat.com [10.3.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82CB719D7C;
 Thu,  9 Jul 2020 20:22:27 +0000 (UTC)
Date: Thu, 9 Jul 2020 14:22:26 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v3 0/2] VFIO mdev aggregated resources handling
Message-ID: <20200709142226.5194a4f4@x1.home>
In-Reply-To: <20200709072334.GA26155@joy-OptiPlex-7040>
References: <20200326054136.2543-1-zhenyuw@linux.intel.com>
 <20200408055824.2378-1-zhenyuw@linux.intel.com>
 <MWHPR11MB1645CC388BF45FD2E6309C3C8C660@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200707190634.4d9055fe@x1.home>
 <MWHPR11MB16454BF5C1BF4D5D22F0B2B38C670@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200708124806.058e33d9@x1.home>
 <MWHPR11MB1645C5033CB813EBD72CE4FD8C640@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200709072334.GA26155@joy-OptiPlex-7040>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On Thu, 9 Jul 2020 15:23:34 +0800
Yan Zhao <yan.y.zhao@intel.com> wrote:

> On Thu, Jul 09, 2020 at 02:53:05AM +0000, Tian, Kevin wrote:
> 
> <...>
> > > We also can't even seem to agree that type is a necessary requirement
> > > for compatibility.  Your discussion below of a type-A, which is
> > > equivalent to a type-B w/ aggregation set to some value is an example
> > > of this.  We might also have physical devices with extensions to
> > > support migration.  These could possibly be compatible with full mdev
> > > devices.  We have no idea how an administrative tool would discover
> > > this other than an exhaustive search across every possible target.
> > > That's ugly but feasible when considering a single target host, but
> > > completely untenable when considering a datacenter.  
> > 
> > If exhaustive search can be done just one-off to build the compatibility
> > database for all assignable devices on each node, then it might be
> > still tenable in datacenter?  
> yes, Alex, do you think below behavior to build compatibility database is
> acceptable?
> 
> management stack could do the exhaustive search in one shot to build the
> compatibility database for all devices in every node. Meanwhile, it caches
> migration version strings for all tested devices.
> when there's a newly created/attached device, management stack could write
> every cached strings to migration version attribute of the newly
> created/attached device in order to update the migration compatibility
> database. Then it caches the migration version string of the newly
> created/attached device as well.
> once a device attribute is modified, e.g. after changing its aggregation
> count or updating its parent driver, update its cached migration version
> string and update the compatibility database by testing against migration
> version attribute of this device.

This is exactly the scenario that I think is untenable.  You're asking
a management application to keep a live database of the opaque version
string of every device type and likely every instance of a device,
which it's not allowed to compare on its own, it can only pipe them
through to every other device across the datacenter to determine which
are comparable.  It would need to respond to not only devices being
added and removed, but bound and unbound from drivers, and entire nodes
being added and removed.  That seems like a lot of overhead, in
addition to the effect of essentially fuzzing the version interface
across all vendors and types.  We need a better solution or we need
someone from openstack and ovirt to agree that this is more viable than
I suspect. Thanks,

Alex

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
