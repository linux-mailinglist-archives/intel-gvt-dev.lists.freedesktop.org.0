Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8264E201E21
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 20 Jun 2020 00:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056706ECC5;
	Fri, 19 Jun 2020 22:41:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18B76ECC5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 Jun 2020 22:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592606464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UMsOgxP9lGGOhQCGlKHx/69wCyoXIvsdOFNr+Mexqs0=;
 b=HCTC6C+0eLRT7w3E7L3PbwmtbPDv1REM8uAmQVfPfexpiKJh6M1UuSYBiDVsZhF28C5/Vl
 nadOghy1USjlrAkZ4xgXT2VhXo2MOMMBAGacx0UB7/S+zCfsltVQvEAdBPjZ7Y3yn2msbN
 GeDr6dgZ4Dzn2xc7rRZqLW+SyWzcT64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-FATCeYgYPKi-9wPQ7Ay1mA-1; Fri, 19 Jun 2020 18:41:01 -0400
X-MC-Unique: FATCeYgYPKi-9wPQ7Ay1mA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A86B0107ACCA;
 Fri, 19 Jun 2020 22:40:57 +0000 (UTC)
Received: from w520.home (ovpn-112-195.phx2.redhat.com [10.3.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C625A1001E91;
 Fri, 19 Jun 2020 22:40:46 +0000 (UTC)
Date: Fri, 19 Jun 2020 16:40:46 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v5 0/4] introduction of migration_version attribute for
 VFIO live migration
Message-ID: <20200619164046.2bdc2f67@w520.home>
In-Reply-To: <20200610003731.GA13961@joy-OptiPlex-7040>
References: <20200429094844.GE2834@work-vm>
 <20200430003949.GN12879@joy-OptiPlex-7040>
 <20200602165527.34137955@x1.home>
 <20200603031948.GB12300@joy-OptiPlex-7040>
 <20200602215528.7a1008f0@x1.home>
 <20200603052443.GC12300@joy-OptiPlex-7040>
 <20200603102628.017e2896@x1.home> <20200605102224.GB2936@work-vm>
 <20200605083149.1809e783@x1.home> <20200605143950.GG2897@work-vm>
 <20200610003731.GA13961@joy-OptiPlex-7040>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Cornelia Huck <cohuck@redhat.com>, "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi
 L" <yi.l.liu@intel.com>, "corbet@lwn.net" <corbet@lwn.net>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "dinechin@redhat.com" <dinechin@redhat.com>,
 "He, Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 9 Jun 2020 20:37:31 -0400
Yan Zhao <yan.y.zhao@intel.com> wrote:

> On Fri, Jun 05, 2020 at 03:39:50PM +0100, Dr. David Alan Gilbert wrote:
> > > > > I tried to simplify the problem a bit, but we keep going backwards.  If
> > > > > the requirement is that potentially any source device can migrate to any
> > > > > target device and we cannot provide any means other than writing an
> > > > > opaque source string into a version attribute on the target and
> > > > > evaluating the result to determine compatibility, then we're requiring
> > > > > userspace to do an exhaustive search to find a potential match.  That
> > > > > sucks.     
> > > >  
> hi Alex and Dave,
> do you think it's good for us to put aside physical devices and mdev aggregation
> for the moment, and use Alex's original idea that
> 
> +  Userspace should regard two mdev devices compatible when ALL of below
> +  conditions are met:
> +  (0) The mdev devices are of the same type
> +  (1) success when reading from migration_version attribute of one mdev device.
> +  (2) success when writing migration_version string of one mdev device to
> +  migration_version attribute of the other mdev device.

I think Pandora's box is already opened, if we can't articulate how
this solution would evolve to support features that we know are coming,
why should we proceed with this approach?  We've already seen interest
in breaking rule (0) in this thread, so we can't focus the solution on
mdev devices.

Maybe the best we can do is to compare one instance of a device to
another instance of a device, without any capability to predict
compatibility prior to creating devices, in the case on mdev.  The
string would need to include not only the device and vendor driver
compatibility, but also anything that has modified the state of the
device, such as creation time or post-creation time configuration.  The
user is left on their own for creating a compatible device, or
filtering devices to determine which might be, or which might generate,
compatible devices.  It's not much of a solution, I wonder if anyone
would even use it.

> and what about adding another sysfs attribute for vendors to put
> recommended migration compatible device type. e.g.
> #cat /sys/bus/pci/devices/0000:00:02.0/mdev_supported_types/i915-GVTg_V5_8/migration_compatible_devices
> parent id: 8086 591d
> mdev_type: i915-GVTg_V5_8
> 
> vendors are free to define the format and conent of this migration_compatible_devices
> and it's even not to be a full list.
> 
> before libvirt or user to do live migration, they have to read and test
> migration_version attributes of src/target devices to check migration compatibility.

AFAICT, free-form, vendor defined attributes are useless to libvirt.
Vendors could already put this information in the description attribute
and have it ignored by userspace tools due to the lack of defined
format.  It's also not clear what value this provides when it's
necessarily incomplete, a driver written today cannot know what future
drivers might be compatible with its migration data.  Thanks,

Alex

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
