Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87300227454
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 Jul 2020 03:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC8589BA9;
	Tue, 21 Jul 2020 01:02:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBF389BA9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 21 Jul 2020 01:02:14 +0000 (UTC)
IronPort-SDR: VsCeaSEw9j+a+gw4ohRhEyg0e9paJtkiX9USPVK85FvCmH+l4vmr1YXyJ9+3ggG4pjpH7gGeOI
 7iuuufroD/1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="130116859"
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="130116859"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 18:02:14 -0700
IronPort-SDR: Hi0Ier/KvzEzjHeSvJlfOUyWhGaXqFZ3+zz2qvL2a3c30d2ssVeCpeyzIyinF7dy1V9Y1U8uZ8
 CpOPxy1z/ErA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="283698887"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga003.jf.intel.com with ESMTP; 20 Jul 2020 18:02:08 -0700
Date: Tue, 21 Jul 2020 08:51:13 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200721005113.GA10502@joy-OptiPlex-7040>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <9bfa8700-91f5-ebb4-3977-6321f0487a63@redhat.com>
 <20200716083230.GA25316@joy-OptiPlex-7040>
 <20200717101258.65555978@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717101258.65555978@x1.home>
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, eskultet@redhat.com, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 berrange@redhat.com, cohuck@redhat.com, dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, Jul 17, 2020 at 10:12:58AM -0600, Alex Williamson wrote:
<...>
> > yes, in another reply, Alex proposed to use an interface in json format.
> > I guess we can define something like
> > 
> > { "self" :
> >   [
> >     { "pciid" : "8086591d",
> >       "driver" : "i915",
> >       "gvt-version" : "v1",
> >       "mdev_type"   : "i915-GVTg_V5_2",
> >       "aggregator"  : "1",
> >       "pv-mode"     : "none",
> >     }
> >   ],
> >   "compatible" :
> >   [
> >     { "pciid" : "8086591d",
> >       "driver" : "i915",
> >       "gvt-version" : "v1",
> >       "mdev_type"   : "i915-GVTg_V5_2",
> >       "aggregator"  : "1"
> >       "pv-mode"     : "none",
> >     },
> >     { "pciid" : "8086591d",
> >       "driver" : "i915",
> >       "gvt-version" : "v1",
> >       "mdev_type"   : "i915-GVTg_V5_4",
> >       "aggregator"  : "2"
> >       "pv-mode"     : "none",
> >     },
> >     { "pciid" : "8086591d",
> >       "driver" : "i915",
> >       "gvt-version" : "v2",
> >       "mdev_type"   : "i915-GVTg_V5_4",
> >       "aggregator"  : "2"
> >       "pv-mode"     : "none, ppgtt, context",
> >     }
> >     ...
> >   ]
> > }
> > 
> > But as those fields are mostly vendor specific, the userspace can
> > only do simple string comparing, I guess the list would be very long as
> > it needs to enumerate all possible targets.
> 
> 
> This ignores so much of what I tried to achieve in my example :(
> 
sorry, I just was eager to show and confirm the way to list all compatible
combination of mdev_type and mdev attributes.

> 
> > also, in some fileds like "gvt-version", is there a simple way to express
> > things like v2+?
> 
> 
> That's not a reasonable thing to express anyway, how can you be certain
> that v3 won't break compatibility with v2?  Sean proposed a versioning
> scheme that accounts for this, using an x.y.z version expressing the
> major, minor, and bugfix versions, where there is no compatibility
> across major versions, minor versions have forward compatibility (ex. 1
> -> 2 is ok, 2 -> 1 is not) and bugfix version number indicates some
> degree of internal improvement that is not visible to the user in terms
> of features or compatibility, but provides a basis for preferring
> equally compatible candidates.
>
right. if self version is v1, it can't know its compatible version is
v2. it can only be done in reverse. i.e.
when self version is v2, it can list its compatible version is v1 and
v2.
and maybe later when self version is v3, there's no v1 in its compatible
list.

In this way, do you think we still need the complex x.y.z versioning scheme?

>  
> > If the userspace can read this interface both in src and target and
> > check whether both src and target are in corresponding compatible list, I
> > think it will work for us.
> > 
> > But still, kernel should not rely on userspace's choice, the opaque
> > compatibility string is still required in kernel. No matter whether
> > it would be exposed to userspace as an compatibility checking interface,
> > vendor driver would keep this part of code and embed the string into the
> > migration stream. so exposing it as an interface to be used by libvirt to
> > do a safety check before a real live migration is only about enabling
> > the kernel part of check to happen ahead.
> 
> As you indicate, the vendor driver is responsible for checking version
> information embedded within the migration stream.  Therefore a
> migration should fail early if the devices are incompatible.  Is it
but as I know, currently in VFIO migration protocol, we have no way to
get vendor specific compatibility checking string in migration setup stage
(i.e. .save_setup stage) before the device is set to _SAVING state.
In this way, for devices who does not save device data in precopy stage,
the migration compatibility checking is as late as in stop-and-copy
stage, which is too late.
do you think we need to add the getting/checking of vendor specific
compatibility string early in save_setup stage?

> really libvirt's place to second guess what it has been directed to do?
if libvirt uses the scheme of reading compatibility string at source and
writing for checking at the target, it can not be called "a second guess".
It's not a guess, but a confirmation.

> Why would we even proceed to design a user parse-able version interface
> if we still have a dependency on an opaque interface?  Thanks,
one reason is that libvirt can't trust the parsing result from
openstack.
Another reason is that libvirt can use this opaque interface easier than
another parsing by itself, in the fact that it would not introduce more
burden to kernel who would write this part of code anyway, no matter
libvirt uses it or not.
 
Thanks
Yan
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
