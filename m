Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D61219A11
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 Jul 2020 09:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BC26E9AE;
	Thu,  9 Jul 2020 07:34:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE0F6E9AE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Jul 2020 07:34:36 +0000 (UTC)
IronPort-SDR: c2jI6TUgwaX/NSDX26feN9fgXkoToG+pAGOrUEDrxaqKgfcryJyEKmJMsCCyo4cluWRd6K5Cz4
 FCfV0ozJR27w==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="135407170"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="135407170"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 00:34:27 -0700
IronPort-SDR: f/eYnhavZCn1yjv9xOCAJdG710/TGGtn9AGr/1GgIHabbiv1OTckeOG6XwvFLd9Z1w+XpwSLFX
 6zMECFhaP12g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="483699986"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by fmsmga006.fm.intel.com with ESMTP; 09 Jul 2020 00:34:25 -0700
Date: Thu, 9 Jul 2020 15:23:34 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v3 0/2] VFIO mdev aggregated resources handling
Message-ID: <20200709072334.GA26155@joy-OptiPlex-7040>
References: <20200326054136.2543-1-zhenyuw@linux.intel.com>
 <20200408055824.2378-1-zhenyuw@linux.intel.com>
 <MWHPR11MB1645CC388BF45FD2E6309C3C8C660@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200707190634.4d9055fe@x1.home>
 <MWHPR11MB16454BF5C1BF4D5D22F0B2B38C670@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200708124806.058e33d9@x1.home>
 <MWHPR11MB1645C5033CB813EBD72CE4FD8C640@MWHPR11MB1645.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MWHPR11MB1645C5033CB813EBD72CE4FD8C640@MWHPR11MB1645.namprd11.prod.outlook.com>
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

On Thu, Jul 09, 2020 at 02:53:05AM +0000, Tian, Kevin wrote:

<...>
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
yes, Alex, do you think below behavior to build compatibility database is
acceptable?

management stack could do the exhaustive search in one shot to build the
compatibility database for all devices in every node. Meanwhile, it caches
migration version strings for all tested devices.
when there's a newly created/attached device, management stack could write
every cached strings to migration version attribute of the newly
created/attached device in order to update the migration compatibility
database. Then it caches the migration version string of the newly
created/attached device as well.
once a device attribute is modified, e.g. after changing its aggregation
count or updating its parent driver, update its cached migration version
string and update the compatibility database by testing against migration
version attribute of this device.


Thanks
Yan
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
