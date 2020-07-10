Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A540721AF98
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 Jul 2020 08:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A416EB6F;
	Fri, 10 Jul 2020 06:40:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2FC6EB6F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 Jul 2020 06:40:55 +0000 (UTC)
IronPort-SDR: uuhjBjSeX2qko6NLlZqcGVDSHM+ipor6lqQILyFCQUxp2waA/kdgyAJEvnRzTzTM/8MrdU1lPc
 yWzmRcPuVjmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="145653290"
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; d="scan'208";a="145653290"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 23:40:51 -0700
IronPort-SDR: oi2KdGfv4Crpz5dB94Wt/eZfH5hW2ZtpBwtzTldxB+RkwIJFr0zGQAGcsEKiWFmV7/3ELGMnwS
 K93uP0OmC9dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; d="scan'208";a="428478262"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga004.jf.intel.com with ESMTP; 09 Jul 2020 23:40:50 -0700
Date: Fri, 10 Jul 2020 14:29:59 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v3 0/2] VFIO mdev aggregated resources handling
Message-ID: <20200710062958.GB29271@joy-OptiPlex-7040>
References: <20200326054136.2543-1-zhenyuw@linux.intel.com>
 <20200408055824.2378-1-zhenyuw@linux.intel.com>
 <MWHPR11MB1645CC388BF45FD2E6309C3C8C660@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200707190634.4d9055fe@x1.home>
 <MWHPR11MB16454BF5C1BF4D5D22F0B2B38C670@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200708124806.058e33d9@x1.home>
 <MWHPR11MB1645C5033CB813EBD72CE4FD8C640@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200709112810.6085b7f6@x1.home>
 <MWHPR11MB1645D3E53C055461AB5E8E3C8C650@MWHPR11MB1645.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MWHPR11MB1645D3E53C055461AB5E8E3C8C650@MWHPR11MB1645.namprd11.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, Jul 10, 2020 at 02:09:06AM +0000, Tian, Kevin wrote:
<...>
> > > > We also can't even seem to agree that type is a necessary requirement
> > > > for compatibility.  Your discussion below of a type-A, which is
> > > > equivalent to a type-B w/ aggregation set to some value is an example
> > > > of this.  We might also have physical devices with extensions to
> > > > support migration.  These could possibly be compatible with full mdev
> > > > devices.  We have no idea how an administrative tool would discover
> > > > this other than an exhaustive search across every possible target.
> > > > That's ugly but feasible when considering a single target host, but
> > > > completely untenable when considering a datacenter.
> > >
> > > If exhaustive search can be done just one-off to build the compatibility
> > > database for all assignable devices on each node, then it might be
> > > still tenable in datacenter?
> > 
> > 
> > I'm not sure what "one-off" means relative to this discussion.  Is this
> > trying to argue that if it's a disturbingly heavyweight operation, but
> > a management tool only needs to do it once, it's ok?  We should really
> 
> yes
> 
> > be including openstack and ovirt folks in any discussion about what
> > might be acceptable across a datacenter.  I can sometimes get away with
> > representing what might be feasible for libvirt, but this is the sort
> > of knowledge and policy decision that would occur above libvirt.
> 
> Agree. and since this is more about general migration compatibility,
> let's start new thread and involve openstack/ovirt guys. Yan, can you
> initiate this?
>
sure.
hi Alex,
I'm not sure if below mailling lists are enough and accurate,
do you know what extra people and lists I need to involve in?

devel@ovirt.org, openstack-discuss@lists.openstack.org,
libvir-list@redhat.com


BTW, I found a page about live migration of SRIOV devices in openstack.
https://specs.openstack.org/openstack/nova-specs/specs/stein/approved/libvirt-neutron-sriov-livemigration.html

Thanks
Yan

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
