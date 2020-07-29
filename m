Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC1823250C
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 29 Jul 2020 21:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9CA6E7D0;
	Wed, 29 Jul 2020 19:06:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDFA6E5D5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 29 Jul 2020 19:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596049562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ca9dscgcddexdObJpd5QQhSPQ+WwpPoZ2RB8A6YFvAY=;
 b=dxEWRLfk/28zHNGbxp8XYziwsFJftNYz7qVDM5/fU59G4qSjz1qfrL/1MOuC6pQpQH5evS
 mB1XZ5o3YiQdkL+DxC1FmCPIrmbbemSy+tyQMOL31fC8kwzdYFZayQEmsXXfmOo+yR/Hg/
 uCF+/FlXxEe4UQZW/Wjwnr8/y9xeAeo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-D4Lhtv2aOSKh8ZWF8OM4VQ-1; Wed, 29 Jul 2020 15:06:00 -0400
X-MC-Unique: D4Lhtv2aOSKh8ZWF8OM4VQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15A0959;
 Wed, 29 Jul 2020 19:05:58 +0000 (UTC)
Received: from work-vm (ovpn-112-51.ams2.redhat.com [10.36.112.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93AFD8A177;
 Wed, 29 Jul 2020 19:05:43 +0000 (UTC)
Date: Wed, 29 Jul 2020 20:05:41 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200729190540.GK2795@work-vm>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <9bfa8700-91f5-ebb4-3977-6321f0487a63@redhat.com>
 <20200716083230.GA25316@joy-OptiPlex-7040>
 <20200717101258.65555978@x1.home>
 <20200721005113.GA10502@joy-OptiPlex-7040>
 <20200727072440.GA28676@joy-OptiPlex-7040>
 <20200727162321.7097070e@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727162321.7097070e@x1.home>
User-Agent: Mutt/1.14.5 (2020-06-23)
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>, eskultet@redhat.com,
 jian-feng.ding@intel.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 berrange@redhat.com, cohuck@redhat.com, dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

* Alex Williamson (alex.williamson@redhat.com) wrote:
> On Mon, 27 Jul 2020 15:24:40 +0800
> Yan Zhao <yan.y.zhao@intel.com> wrote:
> 
> > > > As you indicate, the vendor driver is responsible for checking version
> > > > information embedded within the migration stream.  Therefore a
> > > > migration should fail early if the devices are incompatible.  Is it  
> > > but as I know, currently in VFIO migration protocol, we have no way to
> > > get vendor specific compatibility checking string in migration setup stage
> > > (i.e. .save_setup stage) before the device is set to _SAVING state.
> > > In this way, for devices who does not save device data in precopy stage,
> > > the migration compatibility checking is as late as in stop-and-copy
> > > stage, which is too late.
> > > do you think we need to add the getting/checking of vendor specific
> > > compatibility string early in save_setup stage?
> > >  
> > hi Alex,
> > after an offline discussion with Kevin, I realized that it may not be a
> > problem if migration compatibility check in vendor driver occurs late in
> > stop-and-copy phase for some devices, because if we report device
> > compatibility attributes clearly in an interface, the chances for
> > libvirt/openstack to make a wrong decision is little.
> 
> I think it would be wise for a vendor driver to implement a pre-copy
> phase, even if only to send version information and verify it at the
> target.  Deciding you have no device state to send during pre-copy does
> not mean your vendor driver needs to opt-out of the pre-copy phase
> entirely.  Please also note that pre-copy is at the user's discretion,
> we've defined that we can enter stop-and-copy at any point, including
> without a pre-copy phase, so I would recommend that vendor drivers
> validate compatibility at the start of both the pre-copy and the
> stop-and-copy phases.

That's quite curious; from a migration point of view I'd expect if you
did want to skip pre-copy, that you'd go through the motions of entering
it and then not saving any data and then going to stop-and-copy,
rather than having two flows.

Note that failing at a late stage of stop-and-copy is a pain; if you've
just spent an hour migrating your huge busy VM over, you're going to be
pretty annoyed when it goes pop near the end.

Dave

> > so, do you think we are now arriving at an agreement that we'll give up
> > the read-and-test scheme and start to defining one interface (perhaps in
> > json format), from which libvirt/openstack is able to parse and find out
> > compatibility list of a source mdev/physical device?
> 
> Based on the feedback we've received, the previously proposed interface
> is not viable.  I think there's agreement that the user needs to be
> able to parse and interpret the version information.  Using json seems
> viable, but I don't know if it's the best option.  Is there any
> precedent of markup strings returned via sysfs we could follow?
> 
> Your idea of having both a "self" object and an array of "compatible"
> objects is perhaps something we can build on, but we must not assume
> PCI devices at the root level of the object.  Providing both the
> mdev-type and the driver is a bit redundant, since the former includes
> the latter.  We can't have vendor specific versioning schemes though,
> ie. gvt-version. We need to agree on a common scheme and decide which
> fields the version is relative to, ex. just the mdev type?
> 
> I had also proposed fields that provide information to create a
> compatible type, for example to create a type_x2 device from a type_x1
> mdev type, they need to know to apply an aggregation attribute.  If we
> need to explicitly list every aggregation value and the resulting type,
> I think we run aground of what aggregation was trying to avoid anyway,
> so we might need to pick a language that defines variable substitution
> or some kind of tagging.  For example if we could define ${aggr} as an
> integer within a specified range, then we might be able to define a type
> relative to that value (type_x${aggr}) which requires an aggregation
> attribute using the same value.  I dunno, just spit balling.  Thanks,
> 
> Alex
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
