Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C621190057
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 23 Mar 2020 22:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D9A89E0D;
	Mon, 23 Mar 2020 21:30:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9758989E0D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 23 Mar 2020 21:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584999022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVsEY6cNKMHIU4w2rXsM2TCIqoA6fSVNDl3M8SH4l6g=;
 b=gX7ixzAxRxbCD6d4SoTCAh4G0c86OHRT8ELbJoL9wAD3qM4fK+8QY8F/CdNE6wlU4Curie
 qZ95iSRuG5/2vforiS/btPYIC49jnVM9A2oCELBNkDwpysTm6sOVIRdxPh8LTkHFdJ3TsW
 M5WzQTuZORiwublVIS3TklRZd8sjy34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-suLvxhWCM16kHxyllzdYtw-1; Mon, 23 Mar 2020 17:30:15 -0400
X-MC-Unique: suLvxhWCM16kHxyllzdYtw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E714A10CE782;
 Mon, 23 Mar 2020 21:30:12 +0000 (UTC)
Received: from w520.home (ovpn-112-162.phx2.redhat.com [10.3.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21B2F60BF3;
 Mon, 23 Mar 2020 21:30:00 +0000 (UTC)
Date: Mon, 23 Mar 2020 15:29:59 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v4 0/2] introduction of migration_version attribute for
 VFIO live migration
Message-ID: <20200323152959.1c39e9a7@w520.home>
In-Reply-To: <20190604003422.GA30229@joy-OptiPlex-7040>
References: <20190531004438.24528-1-yan.y.zhao@intel.com>
 <20190603132932.1b5dc7fe@x1.home>
 <20190604003422.GA30229@joy-OptiPlex-7040>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Mon, 3 Jun 2019 20:34:22 -0400
Yan Zhao <yan.y.zhao@intel.com> wrote:

> On Tue, Jun 04, 2019 at 03:29:32AM +0800, Alex Williamson wrote:
> > On Thu, 30 May 2019 20:44:38 -0400
> > Yan Zhao <yan.y.zhao@intel.com> wrote:
> >   
> > > This patchset introduces a migration_version attribute under sysfs of VFIO
> > > Mediated devices.
> > > 
> > > This migration_version attribute is used to check migration compatibility
> > > between two mdev devices of the same mdev type.
> > > 
> > > Patch 1 defines migration_version attribute in
> > > Documentation/vfio-mediated-device.txt
> > > 
> > > Patch 2 uses GVT as an example to show how to expose migration_version
> > > attribute and check migration compatibility in vendor driver.  
> > 
> > Thanks for iterating through this, it looks like we've settled on
> > something reasonable, but now what?  This is one piece of the puzzle to
> > supporting mdev migration, but I don't think it makes sense to commit
> > this upstream on its own without also defining the remainder of how we
> > actually do migration, preferably with more than one working
> > implementation and at least prototyped, if not final, QEMU support.  I
> > hope that was the intent, and maybe it's now time to look at the next
> > piece of the puzzle.  Thanks,
> > 
> > Alex  
> 
> Got it. 
> Also thank you and all for discussing and guiding all along:)
> We'll move to the next episode now.

Hi Yan,

As we're hopefully moving towards a migration API, would it make sense
to refresh this series at the same time?  I think we're still expecting
a vendor driver implementing Kirti's migration API to also implement
this sysfs interface for compatibility verification.  Thanks,

Alex

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
