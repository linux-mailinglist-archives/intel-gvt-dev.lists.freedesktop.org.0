Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C26621CCBF
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 Jul 2020 03:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BBA6E03E;
	Mon, 13 Jul 2020 01:10:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0818A6E03E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 Jul 2020 01:10:09 +0000 (UTC)
IronPort-SDR: fQM1DIP5JotBkUS8SvD8udKCjRbzYbnTs7PRddY/0J3DjTTgr+kszD8wr6N6ZKCwG/aNjggBrp
 dUCTabLEIIqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9680"; a="146580127"
X-IronPort-AV: E=Sophos;i="5.75,345,1589266800"; d="scan'208";a="146580127"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2020 18:10:08 -0700
IronPort-SDR: W/Se3255SBiAVnL35p6Dwk9EsIEr+3CtD7PfFvKN9Hy8+QdatUXewLWLXb9oV28zUpLWFeh+uE
 y0YkXJgf5qmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,345,1589266800"; d="scan'208";a="299036193"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga002.jf.intel.com with ESMTP; 12 Jul 2020 18:10:06 -0700
Date: Mon, 13 Jul 2020 08:59:14 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v3 0/2] VFIO mdev aggregated resources handling
Message-ID: <20200713005914.GA5955@joy-OptiPlex-7040>
References: <20200408055824.2378-1-zhenyuw@linux.intel.com>
 <MWHPR11MB1645CC388BF45FD2E6309C3C8C660@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200707190634.4d9055fe@x1.home>
 <MWHPR11MB16454BF5C1BF4D5D22F0B2B38C670@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200708124806.058e33d9@x1.home>
 <MWHPR11MB1645C5033CB813EBD72CE4FD8C640@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200709112810.6085b7f6@x1.home>
 <MWHPR11MB1645D3E53C055461AB5E8E3C8C650@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200710062958.GB29271@joy-OptiPlex-7040>
 <20200710091217.7a62b4cc@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200710091217.7a62b4cc@x1.home>
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, Jul 10, 2020 at 09:12:17AM -0600, Alex Williamson wrote:
> On Fri, 10 Jul 2020 14:29:59 +0800
> Yan Zhao <yan.y.zhao@intel.com> wrote:
> =

> > On Fri, Jul 10, 2020 at 02:09:06AM +0000, Tian, Kevin wrote:
> > <...>
> > > > > > We also can't even seem to agree that type is a necessary requi=
rement
> > > > > > for compatibility.  Your discussion below of a type-A, which is
> > > > > > equivalent to a type-B w/ aggregation set to some value is an e=
xample
> > > > > > of this.  We might also have physical devices with extensions to
> > > > > > support migration.  These could possibly be compatible with ful=
l mdev
> > > > > > devices.  We have no idea how an administrative tool would disc=
over
> > > > > > this other than an exhaustive search across every possible targ=
et.
> > > > > > That's ugly but feasible when considering a single target host,=
 but
> > > > > > completely untenable when considering a datacenter.  =

> > > > >
> > > > > If exhaustive search can be done just one-off to build the compat=
ibility
> > > > > database for all assignable devices on each node, then it might be
> > > > > still tenable in datacenter?  =

> > > > =

> > > > =

> > > > I'm not sure what "one-off" means relative to this discussion.  Is =
this
> > > > trying to argue that if it's a disturbingly heavyweight operation, =
but
> > > > a management tool only needs to do it once, it's ok?  We should rea=
lly  =

> > > =

> > > yes
> > >   =

> > > > be including openstack and ovirt folks in any discussion about what
> > > > might be acceptable across a datacenter.  I can sometimes get away =
with
> > > > representing what might be feasible for libvirt, but this is the so=
rt
> > > > of knowledge and policy decision that would occur above libvirt.  =

> > > =

> > > Agree. and since this is more about general migration compatibility,
> > > let's start new thread and involve openstack/ovirt guys. Yan, can you
> > > initiate this?
> > >  =

> > sure.
> > hi Alex,
> > I'm not sure if below mailling lists are enough and accurate,
> > do you know what extra people and lists I need to involve in?
> > =

> > devel@ovirt.org, openstack-discuss@lists.openstack.org,
> > libvir-list@redhat.com
> =

> You could also include
> =

> Daniel P. Berrang=E9 <berrange@redhat.com>
> Sean Mooney <smooney@redhat.com>
> =

>  =

> > BTW, I found a page about live migration of SRIOV devices in openstack.
> > https://specs.openstack.org/openstack/nova-specs/specs/stein/approved/l=
ibvirt-neutron-sriov-livemigration.html
> =

> Sean, above, is involved with that specification.  AFAIK the only
> current live migration of SR-IOV devices involve failover and hotplug
> trickery.  Thanks,
> =

got it!

Thanks
Yan
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
