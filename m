Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 784E322E6AA
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Jul 2020 09:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D46889CCE;
	Mon, 27 Jul 2020 07:35:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9214489CCE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 Jul 2020 07:35:45 +0000 (UTC)
IronPort-SDR: K9NhK4Utg8O8I28vhooWTiazSDXqjR2e0R028i8nkaeHa+bk9+j8VACnOCuHmVDYiidYZljdeo
 KZWdVaop5eOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9694"; a="139003233"
X-IronPort-AV: E=Sophos;i="5.75,401,1589266800"; d="scan'208";a="139003233"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 00:35:44 -0700
IronPort-SDR: 0ffjI+i+TsbheWV9B1ekyPjpDXDKX5V9QqFeMTIOUgqFnBjB7356oNacj5t1wADBNDmVTD6CU1
 TSX+YyW3cBSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,401,1589266800"; d="scan'208";a="364039470"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga001.jf.intel.com with ESMTP; 27 Jul 2020 00:35:38 -0700
Date: Mon, 27 Jul 2020 15:24:40 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200727072440.GA28676@joy-OptiPlex-7040>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <9bfa8700-91f5-ebb4-3977-6321f0487a63@redhat.com>
 <20200716083230.GA25316@joy-OptiPlex-7040>
 <20200717101258.65555978@x1.home>
 <20200721005113.GA10502@joy-OptiPlex-7040>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721005113.GA10502@joy-OptiPlex-7040>
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

> > As you indicate, the vendor driver is responsible for checking version
> > information embedded within the migration stream.  Therefore a
> > migration should fail early if the devices are incompatible.  Is it
> but as I know, currently in VFIO migration protocol, we have no way to
> get vendor specific compatibility checking string in migration setup stage
> (i.e. .save_setup stage) before the device is set to _SAVING state.
> In this way, for devices who does not save device data in precopy stage,
> the migration compatibility checking is as late as in stop-and-copy
> stage, which is too late.
> do you think we need to add the getting/checking of vendor specific
> compatibility string early in save_setup stage?
>
hi Alex,
after an offline discussion with Kevin, I realized that it may not be a
problem if migration compatibility check in vendor driver occurs late in
stop-and-copy phase for some devices, because if we report device
compatibility attributes clearly in an interface, the chances for
libvirt/openstack to make a wrong decision is little.
so, do you think we are now arriving at an agreement that we'll give up
the read-and-test scheme and start to defining one interface (perhaps in
json format), from which libvirt/openstack is able to parse and find out
compatibility list of a source mdev/physical device?

Thanks
Yan
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
