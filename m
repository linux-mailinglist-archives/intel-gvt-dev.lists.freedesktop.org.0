Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B8919040D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 Mar 2020 05:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD5B6E0A6;
	Tue, 24 Mar 2020 04:02:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641F26E0A6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 24 Mar 2020 04:02:53 +0000 (UTC)
IronPort-SDR: wz8ZizherGKOp7HXoqzbWWM2ChU3rJhq7ZsSA3C0kqUntMwSz6GX6lLqv0nVKN7tffAEnrGtm7
 7JP+uSq5e+Hw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 21:02:53 -0700
IronPort-SDR: kzxEdVbZ71eXSrjlJ8yNGgcTVbuZPa9d8tSEMpmg03XekNOteZGYqmOVi7jOblmjQtkeC5/V+V
 ZEnDQtFr4RPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,298,1580803200"; d="scan'208";a="270204608"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by fmsmga004.fm.intel.com with ESMTP; 23 Mar 2020 21:02:47 -0700
Date: Mon, 23 Mar 2020 23:53:16 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v4 0/2] introduction of migration_version attribute for
 VFIO live migration
Message-ID: <20200324035316.GE5456@joy-OptiPlex-7040>
References: <20190531004438.24528-1-yan.y.zhao@intel.com>
 <20190603132932.1b5dc7fe@x1.home>
 <20190604003422.GA30229@joy-OptiPlex-7040>
 <20200323152959.1c39e9a7@w520.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200323152959.1c39e9a7@w520.home>
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "Yang, Ziye" <ziye.yang@intel.com>,
 "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "dinechin@redhat.com" <dinechin@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "He,
 Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 05:29:59AM +0800, Alex Williamson wrote:
> On Mon, 3 Jun 2019 20:34:22 -0400
> Yan Zhao <yan.y.zhao@intel.com> wrote:
> 
> > On Tue, Jun 04, 2019 at 03:29:32AM +0800, Alex Williamson wrote:
> > > On Thu, 30 May 2019 20:44:38 -0400
> > > Yan Zhao <yan.y.zhao@intel.com> wrote:
> > >   
> > > > This patchset introduces a migration_version attribute under sysfs of VFIO
> > > > Mediated devices.
> > > > 
> > > > This migration_version attribute is used to check migration compatibility
> > > > between two mdev devices of the same mdev type.
> > > > 
> > > > Patch 1 defines migration_version attribute in
> > > > Documentation/vfio-mediated-device.txt
> > > > 
> > > > Patch 2 uses GVT as an example to show how to expose migration_version
> > > > attribute and check migration compatibility in vendor driver.  
> > > 
> > > Thanks for iterating through this, it looks like we've settled on
> > > something reasonable, but now what?  This is one piece of the puzzle to
> > > supporting mdev migration, but I don't think it makes sense to commit
> > > this upstream on its own without also defining the remainder of how we
> > > actually do migration, preferably with more than one working
> > > implementation and at least prototyped, if not final, QEMU support.  I
> > > hope that was the intent, and maybe it's now time to look at the next
> > > piece of the puzzle.  Thanks,
> > > 
> > > Alex  
> > 
> > Got it. 
> > Also thank you and all for discussing and guiding all along:)
> > We'll move to the next episode now.
> 
> Hi Yan,
> 
> As we're hopefully moving towards a migration API, would it make sense
> to refresh this series at the same time?  I think we're still expecting
> a vendor driver implementing Kirti's migration API to also implement
> this sysfs interface for compatibility verification.  Thanks,
>
Hi Alex
Got it!
Thanks for reminding of this. And as now we have vfio-pci implementing
vendor ops to allow live migration of pass-through devices, is it
necessary to implement similar sysfs node for those devices?
or do you think just PCI IDs of those devices are enough for libvirt to
know device compatibility ?

Thanks
Yan


_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
