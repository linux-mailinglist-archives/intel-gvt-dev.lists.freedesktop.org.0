Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 966BF21A5D5
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 Jul 2020 19:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464746EAC9;
	Thu,  9 Jul 2020 17:28:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0EE6EAC9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Jul 2020 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594315696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jSrX1B0OOpj0cX0OWLXe077P9qyjpvniht/GklIovCs=;
 b=L5BhPv1UHNYwQyOj4UVhrBJXX11KVfFvmI2Bfwpj5uGP23QXKw+anxxSr50085F4hXES1e
 ADxK3yXDX3prmGrI+gjYThBDKAdjk9isDXgHLpd9JfCUgX+Qc9h4j3bMiWe5C2EeHnSvGT
 EHNLuUvgldrR/9XhKRoR+LGjX1wvuDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-le3gU5w8O0SaEEtIrKc9Dw-1; Thu, 09 Jul 2020 13:28:12 -0400
X-MC-Unique: le3gU5w8O0SaEEtIrKc9Dw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD18C106B243;
 Thu,  9 Jul 2020 17:28:11 +0000 (UTC)
Received: from x1.home (ovpn-112-71.phx2.redhat.com [10.3.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53D8E797E9;
 Thu,  9 Jul 2020 17:28:11 +0000 (UTC)
Date: Thu, 9 Jul 2020 11:28:10 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v3 0/2] VFIO mdev aggregated resources handling
Message-ID: <20200709112810.6085b7f6@x1.home>
In-Reply-To: <MWHPR11MB1645C5033CB813EBD72CE4FD8C640@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20200326054136.2543-1-zhenyuw@linux.intel.com>
 <20200408055824.2378-1-zhenyuw@linux.intel.com>
 <MWHPR11MB1645CC388BF45FD2E6309C3C8C660@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200707190634.4d9055fe@x1.home>
 <MWHPR11MB16454BF5C1BF4D5D22F0B2B38C670@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200708124806.058e33d9@x1.home>
 <MWHPR11MB1645C5033CB813EBD72CE4FD8C640@MWHPR11MB1645.namprd11.prod.outlook.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 9 Jul 2020 02:53:05 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Thursday, July 9, 2020 2:48 AM
> > 
> > On Wed, 8 Jul 2020 06:31:00 +0000
> > "Tian, Kevin" <kevin.tian@intel.com> wrote:
> >   
> > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > Sent: Wednesday, July 8, 2020 9:07 AM
> > > >
> > > > On Tue, 7 Jul 2020 23:28:39 +0000
> > > > "Tian, Kevin" <kevin.tian@intel.com> wrote:
> > > >  
> > > > > Hi, Alex,
> > > > >
> > > > > Gentle ping... Please let us know whether this version looks good.  
> > > >
> > > > I figured this is entangled with the versioning scheme.  There are
> > > > unanswered questions about how something that assumes a device of a
> > > > given type is software compatible to another device of the same type
> > > > handles aggregation and how the type class would indicate compatibility
> > > > with an aggregated instance.  Thanks,
> > > >  
> > >
> > > Yes, this open is an interesting topic. I didn't closely follow the versioning
> > > scheme discussion. Below is some preliminary thought in my mind:
> > >
> > > --
> > > First, let's consider migrating an aggregated instance:
> > >
> > > A conservative policy is to check whether the compatible type is supported
> > > on target device and whether available instances under that type can  
> > afford  
> > > the ask of the aggregated instance. Compatibility check in this scheme is
> > > separated from aggregation check, then no change is required to the  
> > current  
> > > versioning interface.  
> > 
> > How many features, across how many attributes is an administrative tool
> > supposed to check for compatibility?  ie. if we add an 'aggregation'
> > feature now and 'translucency' feature next year, with new sysfs
> > attributes and creation options, won't that break this scheme?  I'm not
> > willing to assume aggregation is the sole new feature we will ever add,
> > therefore we don't get to make it a special case without a plan for how
> > the next special case will be integrated.  
> 
> Got you. I thought aggregation is special since it is purely about linear
> resource adjustment w/o changing the feature set of the instance, thus
> reasonable to get special handling in management stack which needs
> to understand this attribute anyway. But I agree that it's difficult to 
> predict the future and other special cases...
> 
> > 
> > We also can't even seem to agree that type is a necessary requirement
> > for compatibility.  Your discussion below of a type-A, which is
> > equivalent to a type-B w/ aggregation set to some value is an example
> > of this.  We might also have physical devices with extensions to
> > support migration.  These could possibly be compatible with full mdev
> > devices.  We have no idea how an administrative tool would discover
> > this other than an exhaustive search across every possible target.
> > That's ugly but feasible when considering a single target host, but
> > completely untenable when considering a datacenter.  
> 
> If exhaustive search can be done just one-off to build the compatibility
> database for all assignable devices on each node, then it might be
> still tenable in datacenter?


I'm not sure what "one-off" means relative to this discussion.  Is this
trying to argue that if it's a disturbingly heavyweight operation, but
a management tool only needs to do it once, it's ok?  We should really
be including openstack and ovirt folks in any discussion about what
might be acceptable across a datacenter.  I can sometimes get away with
representing what might be feasible for libvirt, but this is the sort
of knowledge and policy decision that would occur above libvirt.


> > > Then there comes a case where the target device doesn't handle  
> > aggregation  
> > > but support a different type which however provides compatible  
> > capabilities  
> > > and same resource size as the aggregated instance expects. I guess this is
> > > one puzzle how to check compatibility between such types. One possible
> > > extension is to introduce a non_aggregated_list  to indicate compatible
> > > non-aggregated types for each aggregated instance. Then mgmt.. stack
> > > just loop the compatible list if the conservative policy fails.  I didn't think
> > > carefully about what format is reasonable here. But if we agree that an
> > > separate interface is required to support such usage, then this may come
> > > later after the basic migration_version interface is completed.  
> > 
> > ...and then a non_translucency_list and then a non_brilliance_list and
> > then a non_whatever_list... no.  Additionally it's been shown difficult
> > to predict the future, if a new device is developed to be compatible
> > with an existing device it would require updates to the existing device
> > to learn about that compatibility.  
> 
> I suppose a compatibility list like this doesn't require the existing device
> to update. It should be new device's compatibility to claim compatibility
> to the types carried in existing list. 


Doesn't the problem go both ways?  If we have an existing
non-aggregated device and a new aggregated device that claims
compatibility, then maybe we can figure out that [existing -> new] might
be a possibility, but we can't figure out [new -> existing].

I'm also a bit concerned about the idea that we can take an opaque
string from one {vendor,device} and try to use it on another.  Ideally
this wouldn't cause problems, but we're essentially making the usage
policy and exercise in fuzzing the interface from other vendors.  Also,
we've defined that the version string is opaque, userspace is not
allowed to interpret it, so why would we then allow another vendor
driver to interpret it?  Does that mean we should consider the vendor
driver as the top-level match rather than the mdev type (where the mdev
type already includes the vendor driver)?  That immediately excludes
[phys <-> mdev] migration though unless the same vendor driver is
wrapping the phys device.  I'm not sure we're making any progress,
perhaps the premise of an opaque version string needs to be revisited.


> > > --
> > >
> > > Another scenario is about migrating a non-aggregated instance to a device
> > > handling aggregation. Then there is an open whether an aggregated type
> > > can be used to back the non-aggregated instance in case of no available
> > > instance under the original type claimed by non-aggregated instance.
> > > This won't happen in KVMGT, because all vGPU types share the same
> > > resource pool. Allocating instance under one type also decrement available
> > > instances under other types. So if we fail to find available instance under
> > > type-A (with 4x resource of type-B), then we will also fail to create an
> > >  aggregated instance (aggregate=4) under type-B. therefore, we just
> > > need stick to basic type compatibility check for non-aggregated instance.
> > > And I feel this assumption can be applied to other devices handling
> > > aggregation. It doesn't make sense for two types to claim compatibility
> > > (only with resource size difference) when their resources are allocated
> > > from different pools (which usually implies different capability or QOS/
> > > SLA difference). With this assumption, we don't need provide another
> > > interface to indicate compatible aggregated types for non-aggregated
> > > interface.
> > > --
> > >
> > > I may definitely overlook something here, but if above analysis sounds
> > > reasonable, then this series could be decoupled from the versioning
> > > scheme discussion based on conservative policy for now. :)  
> > 
> > The only potential I see for decoupling the discussions would be to do
> > aggregation via a vendor attribute.  Those already provide a mechanism
> > to manipulate a device after creation and something that we'll already
> > need to solve in determining migration compatibility.  So in that
> > sense, it seems like it at least doesn't make the problem worse.
> > Thanks,
> >   
> 
> This makes some sense, since anyway 'aggregation' still changes how the
> instance looks like. But let me understand clearly. Are you proposing 
> actually moving 'aggregation' to be a vendor attribute (i.e. removing
> the 'mdev' sub-directy in this patch), or more about a policy of treating
> it as a vendor attribute? If the former, is there any problem of having
> Libvirt manage this attribute given that it becomes vendor specific now?

I expect that libvirt would prefer not to deal with vendor attributes,
but I don't know that they would be opposed to it.  But shouldn't
vendor attributes largely be hidden from libvirt if mdevctl is used to
create the target instance?  For example at the source we'd use 'mdevctl
list' with the --dumpjson option to get the definition of the device.
At the target, something would modify the parent information in that
json definition and use 'mdevctl <start|define>' to create the
instance.  The definition would include any vendor attributes that had
previously been set for the source device using 'mdevctl modify'.
Thanks,

Alex

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
