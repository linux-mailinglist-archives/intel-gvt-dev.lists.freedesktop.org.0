Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22E5191E63
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 25 Mar 2020 02:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FF98826D;
	Wed, 25 Mar 2020 01:06:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9726E0DE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 25 Mar 2020 01:06:10 +0000 (UTC)
IronPort-SDR: nCimVbYDTjT8DHFxIKxcDOSGj/baNytuUk0an/Ol8sJLLisMCVur8loFeU5Vv3olkchXNocYLO
 0og6d/2aD+yQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 18:06:09 -0700
IronPort-SDR: z5R6lpjG8+2Oc1MM89RRMHOBYnTW4DVLrjfbD/wS/e2JrgHpwwTPP0nHfUphaKQqI2BmxmGIG/
 bf8OkxO1AWWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,302,1580803200"; d="scan'208";a="246951513"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga003.jf.intel.com with ESMTP; 24 Mar 2020 18:06:03 -0700
Date: Tue, 24 Mar 2020 20:56:32 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v4 0/2] introduction of migration_version attribute for
 VFIO live migration
Message-ID: <20200325005631.GA20109@joy-OptiPlex-7040>
References: <20190531004438.24528-1-yan.y.zhao@intel.com>
 <20190603132932.1b5dc7fe@x1.home>
 <20190604003422.GA30229@joy-OptiPlex-7040>
 <20200323152959.1c39e9a7@w520.home>
 <20200324035316.GE5456@joy-OptiPlex-7040>
 <20200324092331.GA2645@work-vm> <20200324084954.0dd835e2@w520.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324084954.0dd835e2@w520.home>
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "dinechin@redhat.com" <dinechin@redhat.com>,
 "He, Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 10:49:54PM +0800, Alex Williamson wrote:
> On Tue, 24 Mar 2020 09:23:31 +0000
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Yan Zhao (yan.y.zhao@intel.com) wrote:
> > > On Tue, Mar 24, 2020 at 05:29:59AM +0800, Alex Williamson wrote:  
> > > > On Mon, 3 Jun 2019 20:34:22 -0400
> > > > Yan Zhao <yan.y.zhao@intel.com> wrote:
> > > >   
> > > > > On Tue, Jun 04, 2019 at 03:29:32AM +0800, Alex Williamson wrote:  
> > > > > > On Thu, 30 May 2019 20:44:38 -0400
> > > > > > Yan Zhao <yan.y.zhao@intel.com> wrote:
> > > > > >     
> > > > > > > This patchset introduces a migration_version attribute under sysfs of VFIO
> > > > > > > Mediated devices.
> > > > > > > 
> > > > > > > This migration_version attribute is used to check migration compatibility
> > > > > > > between two mdev devices of the same mdev type.
> > > > > > > 
> > > > > > > Patch 1 defines migration_version attribute in
> > > > > > > Documentation/vfio-mediated-device.txt
> > > > > > > 
> > > > > > > Patch 2 uses GVT as an example to show how to expose migration_version
> > > > > > > attribute and check migration compatibility in vendor driver.    
> > > > > > 
> > > > > > Thanks for iterating through this, it looks like we've settled on
> > > > > > something reasonable, but now what?  This is one piece of the puzzle to
> > > > > > supporting mdev migration, but I don't think it makes sense to commit
> > > > > > this upstream on its own without also defining the remainder of how we
> > > > > > actually do migration, preferably with more than one working
> > > > > > implementation and at least prototyped, if not final, QEMU support.  I
> > > > > > hope that was the intent, and maybe it's now time to look at the next
> > > > > > piece of the puzzle.  Thanks,
> > > > > > 
> > > > > > Alex    
> > > > > 
> > > > > Got it. 
> > > > > Also thank you and all for discussing and guiding all along:)
> > > > > We'll move to the next episode now.  
> > > > 
> > > > Hi Yan,
> > > > 
> > > > As we're hopefully moving towards a migration API, would it make sense
> > > > to refresh this series at the same time?  I think we're still expecting
> > > > a vendor driver implementing Kirti's migration API to also implement
> > > > this sysfs interface for compatibility verification.  Thanks,
> > > >  
> > > Hi Alex
> > > Got it!
> > > Thanks for reminding of this. And as now we have vfio-pci implementing
> > > vendor ops to allow live migration of pass-through devices, is it
> > > necessary to implement similar sysfs node for those devices?
> > > or do you think just PCI IDs of those devices are enough for libvirt to
> > > know device compatibility ?  
> > 
> > Wasn't the problem that we'd have to know how to check for things like:
> >   a) Whether different firmware versions in the device were actually
> > compatible
> >   b) Whether minor hardware differences were compatible - e.g. some
> > hardware might let you migrate to the next version of hardware up.
> 
> Yes, minor changes in hardware or firmware that may not be represented
> in the device ID or hardware revision.  Also the version is as much for
> indicating the compatibility of the vendor defined migration protocol
> as it is for the hardware itself.  I certainly wouldn't be so bold as
> to create a protocol that is guaranteed compatible forever.  We'll need
> to expose the same sysfs attribute in some standard location for
> non-mdev devices.  I assume vfio-pci would provide the vendor ops some
> mechanism to expose these in a standard namespace of sysfs attributes
> under the device itself.  Perhaps that indicates we need to link the
> mdev type version under the mdev device as well to make this
> transparent to userspace tools like libvirt.  Thanks,
>
Got it. will do it.
Thanks!

Yan
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
