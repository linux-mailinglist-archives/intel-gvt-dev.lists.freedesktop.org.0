Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FC525278D
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 26 Aug 2020 08:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF82A6E9F1;
	Wed, 26 Aug 2020 06:42:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39ACD6E9F1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 26 Aug 2020 06:42:17 +0000 (UTC)
IronPort-SDR: EbNfD/j6D4rxMvGoiet/GJVhzm+ySepVj1OAgo5g6XjV8aIXSKGnIY0RgpzUvI9TLnIjmqzO1I
 2ZOPNWQF+LdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="217791740"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="217791740"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 23:42:15 -0700
IronPort-SDR: 9HZ8FwCzB5Y9XCTO3PAbkdbuTxhtxX9FV8y59Qjh/8B7YakVeZGCd6Si8JfUYycA34ckU0HKFR
 TRIWjEQXU1Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="329122213"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 25 Aug 2020 23:42:09 -0700
Date: Wed, 26 Aug 2020 14:41:17 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200826064117.GA22243@joy-OptiPlex-7040>
References: <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <20200820003922.GE21172@joy-OptiPlex-7040>
 <20200819212234.223667b3@x1.home>
 <20200820031621.GA24997@joy-OptiPlex-7040>
 <20200825163925.1c19b0f0.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825163925.1c19b0f0.cohuck@redhat.com>
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
 kevin.tian@intel.com, Parav Pandit <parav@mellanox.com>,
 jian-feng.ding@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 hejie.xu@intel.com, bao.yumeng@zte.com.cn,
 Alex Williamson <alex.williamson@redhat.com>, smooney@redhat.com,
 intel-gvt-dev@lists.freedesktop.org,
 Daniel =?iso-8859-1?Q?P=2EBerrang=E9?= <berrange@redhat.com>,
 eskultet@redhat.com, Jiri Pirko <jiri@mellanox.com>, dinechin@redhat.com,
 devel@ovirt.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Aug 25, 2020 at 04:39:25PM +0200, Cornelia Huck wrote:
<...>
> > do you think the bin_attribute I proposed yesterday good?
> > Then we can have a single compatible with a variable in the mdev_type and
> > aggregator.
> > 
> >    mdev_type=i915-GVTg_V5_{val1:int:2,4,8}
> >    aggregator={val1}/2
> 
> I'm not really a fan of binary attributes other than in cases where we
> have some kind of binary format to begin with.
> 
> IIUC, we basically have:
> - different partitioning (expressed in the mdev_type)
> - different number of partitions (expressed via the aggregator)
> - devices being compatible if the partitioning:aggregator ratio is the
>   same
> 
> (The multiple mdev_type variants seem to come from avoiding extra
> creation parameters, IIRC?)
> 
> Would it be enough to export
> base_type=i915-GVTg_V5
> aggregation_ratio=<integer>
> 
> to express the various combinations that are compatible without the
> need for multiple sets of attributes?

yes. I agree we need to decouple the mdev type name and aggregator for
compatibility detection purpose.

please allow me to put some words to describe the history and
motivation of introducing aggregator.

initially, we have fixed mdev_type
i915-GVTg_V5_1,
i915-GVTg_V5_2,
i915-GVTg_V5_4,
i915-GVTg_V5_8,
the digital after i915-GVTg_V5 representing the max number of instances
allowed to be created for this type. They also identify how many
resources are to be allocated for each type.

They are so far so good for current intel vgpus, i.e., cutting the
physical GPU into several virtual pieces and sharing them among several
VMs in pure mediation way.
fixed types are provided in advance as we thought it can meet needs from
most users and users can know the hardware capability they acquired
from the type name. the bigger in number, the smaller piece of physical
hardware.

Then, when it comes to scalable IOV in near future, one physical hardware
is able to be cut into a large number of units in hardware layer
The single unit to be assigned into guest can be very small while one to
several units are grouped into an mdev.

The fixed type scheme is then cumbersome. 
Therefore, a new attribute aggregator is introduced to specify the number
of resources to be assigned based on the base resource specified in type
name. e.g.
if type name is dsa-1dwq, and aggregator is 30, then the assignable
resources to guest is 30 wqs in a single created mdev.
if type name is dsa-2dwq, and aggregator is 15, then the assignable
resources to guest is also 30wqs in a single created mdev.
(in this example, the rule to define type name is different to the case
in GVT. here 1 wq means wq number is 1. yes, they are current reality.
:) )


previously, we want to regard the two mdevs created with dsa-1dwq x 30 and
dsa-2dwq x 15 as compatible, because the two mdevs consist equal resources.

But, as it's a burden to upper layer, we agree that if this condition
happens, we still treat the two as incompatible.

To fix it, either the driver should expose dsa-1dwq only, or the target
dsa-2dwq needs to be destroyed and reallocated via dsa-1dwq x 30.

Does it make sense?

Thanks
Yan





_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
