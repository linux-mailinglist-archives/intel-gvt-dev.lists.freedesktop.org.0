Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B3C257325
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 31 Aug 2020 06:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B4489FA0;
	Mon, 31 Aug 2020 04:49:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB19989FA0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 31 Aug 2020 04:49:45 +0000 (UTC)
IronPort-SDR: kqaX3F1YIjkqWPw50ZkTG6azJdchCs80mwzFM6/mwdjeSJBtV9eUEgEIDgMJwOiJ6ZFlkJEYu6
 8S7HUYBJ1tKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="154316820"
X-IronPort-AV: E=Sophos;i="5.76,374,1592895600"; d="scan'208";a="154316820"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2020 21:49:45 -0700
IronPort-SDR: 4EKnzwOHrZwcMbMsLUlSKU97umJjpcJzBXQW+qUBlgjOCIDNTaDVZgGabTGaKEUlnWGgYxJ7bx
 gCyAQZB24rTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,374,1592895600"; d="scan'208";a="330579032"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 30 Aug 2020 21:49:38 -0700
Date: Mon, 31 Aug 2020 12:43:44 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Mooney <smooney@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200831044344.GB13784@joy-OptiPlex-7040>
References: <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <20200820003922.GE21172@joy-OptiPlex-7040>
 <20200819212234.223667b3@x1.home>
 <20200820031621.GA24997@joy-OptiPlex-7040>
 <20200825163925.1c19b0f0.cohuck@redhat.com>
 <20200826064117.GA22243@joy-OptiPlex-7040>
 <20200828154741.30cfc1a3.cohuck@redhat.com>
 <8f5345be73ebf4f8f7f51d6cdc9c2a0d8e0aa45e.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f5345be73ebf4f8f7f51d6cdc9c2a0d8e0aa45e.camel@redhat.com>
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
 Alex Williamson <alex.williamson@redhat.com>, eskultet@redhat.com,
 intel-gvt-dev@lists.freedesktop.org,
 Daniel =?iso-8859-1?Q?P=2EBerrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, Aug 28, 2020 at 03:04:12PM +0100, Sean Mooney wrote:
> On Fri, 2020-08-28 at 15:47 +0200, Cornelia Huck wrote:
> > On Wed, 26 Aug 2020 14:41:17 +0800
> > Yan Zhao <yan.y.zhao@intel.com> wrote:
> > 
> > > previously, we want to regard the two mdevs created with dsa-1dwq x 30 and
> > > dsa-2dwq x 15 as compatible, because the two mdevs consist equal resources.
> > > 
> > > But, as it's a burden to upper layer, we agree that if this condition
> > > happens, we still treat the two as incompatible.
> > > 
> > > To fix it, either the driver should expose dsa-1dwq only, or the target
> > > dsa-2dwq needs to be destroyed and reallocated via dsa-1dwq x 30.
> > 
> > AFAIU, these are mdev types, aren't they? So, basically, any management
> > software needs to take care to use the matching mdev type on the target
> > system for device creation?
> 
> or just do the simple thing of use the same mdev type on the source and dest.
> matching mdevtypes is not nessiarly trivial. we could do that but we woudl have
> to do that in python rather then sql so it would be slower to do at least today.
> 
> we dont currently have the ablity to say the resouce provider must have 1 of these
> set of traits. just that we must have a specific trait. this is a feature we have
> disucssed a couple of times and delayed untill we really really need it but its not out
> of the question that we could add it for this usecase. i suspect however we would do exact
> match first and explore this later after the inital mdev migration works.

Yes, I think it's good.

still, I'd like to put it more explicitly to make ensure it's not missed:
the reason we want to specify compatible_type as a trait and check
whether target compatible_type is the superset of source
compatible_type is for the consideration of backward compatibility.
e.g.
an old generation device may have a mdev type xxx-v4-yyy, while a newer
generation  device may be of mdev type xxx-v5-yyy.
with the compatible_type traits, the old generation device is still
able to be regarded as compatible to newer generation device even their
mdev types are not equal.

Thanks
Yan
> by the way i was looking at some vdpa reslated matiail today and noticed vdpa devices are nolonger
> usign mdevs and and now use a vhost chardev so i guess we will need a completely seperate mechanioum
> for vdpa vs mdev migration as a result. that is rather unfortunet but i guess that is life.
> > 
> 
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
