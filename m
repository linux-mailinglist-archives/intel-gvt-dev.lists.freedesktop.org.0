Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF8F23BE42
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Aug 2020 18:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21B06E484;
	Tue,  4 Aug 2020 16:41:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5827E6E484
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Aug 2020 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596559316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CVKPZjD+nqawWUht3msA2tjd8QOSfxMbQgsYbiHL9vc=;
 b=bmEki7ePIEzBhOPtalq5wmQ9DZD5OJvqDwMI6gmwjZnbXMzqXhoHCC6CvWu+Bkk5FhMvbf
 F9QHIr+E1iaMt2WLBe6kFQu8m03N71QLK+t/On4l8d3iXa33+2SVLJGjaG7H9i3Aw6qnqp
 faS6HxqyWqIUFBnSumEhxU4bk2Nghb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-ylVZJniGNg6PzblW4k6ERA-1; Tue, 04 Aug 2020 12:41:54 -0400
X-MC-Unique: ylVZJniGNg6PzblW4k6ERA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F1D61DE0;
 Tue,  4 Aug 2020 16:41:52 +0000 (UTC)
Received: from gondolin (ovpn-112-169.ams2.redhat.com [10.36.112.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EB445FC36;
 Tue,  4 Aug 2020 16:41:38 +0000 (UTC)
Date: Tue, 4 Aug 2020 18:35:03 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200804183503.39f56516.cohuck@redhat.com>
In-Reply-To: <20200729080503.GB28676@joy-OptiPlex-7040>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <9bfa8700-91f5-ebb4-3977-6321f0487a63@redhat.com>
 <20200716083230.GA25316@joy-OptiPlex-7040>
 <20200717101258.65555978@x1.home>
 <20200721005113.GA10502@joy-OptiPlex-7040>
 <20200727072440.GA28676@joy-OptiPlex-7040>
 <20200727162321.7097070e@x1.home>
 <20200729080503.GB28676@joy-OptiPlex-7040>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, jian-feng.ding@intel.com, dgilbert@redhat.com,
 zhenyuw@linux.intel.com, hejie.xu@intel.com, bao.yumeng@zte.com.cn,
 Alex Williamson <alex.williamson@redhat.com>, smooney@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, berrange@redhat.com, eskultet@redhat.com,
 dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

[sorry about not chiming in earlier]

On Wed, 29 Jul 2020 16:05:03 +0800
Yan Zhao <yan.y.zhao@intel.com> wrote:

> On Mon, Jul 27, 2020 at 04:23:21PM -0600, Alex Williamson wrote:

(...)

> > Based on the feedback we've received, the previously proposed interface
> > is not viable.  I think there's agreement that the user needs to be
> > able to parse and interpret the version information.  Using json seems
> > viable, but I don't know if it's the best option.  Is there any
> > precedent of markup strings returned via sysfs we could follow?  

I don't think encoding complex information in a sysfs file is a viable
approach. Quoting Documentation/filesystems/sysfs.rst:

"Attributes should be ASCII text files, preferably with only one value            
per file. It is noted that it may not be efficient to contain only one           
value per file, so it is socially acceptable to express an array of              
values of the same type.                                                         
                                                                                 
Mixing types, expressing multiple lines of data, and doing fancy                 
formatting of data is heavily frowned upon."

Even though this is an older file, I think these restrictions still
apply.

> I found some examples of using formatted string under /sys, mostly under
> tracing. maybe we can do a similar implementation.
> 
> #cat /sys/kernel/debug/tracing/events/kvm/kvm_mmio/format

Note that this is *not* sysfs (anything under debug/ follows different
rules anyway!)

> 
> name: kvm_mmio
> ID: 32
> format:
>         field:unsigned short common_type;       offset:0;       size:2; signed:0;
>         field:unsigned char common_flags;       offset:2;       size:1; signed:0;
>         field:unsigned char common_preempt_count;       offset:3;       size:1; signed:0;
>         field:int common_pid;   offset:4;       size:4; signed:1;
> 
>         field:u32 type; offset:8;       size:4; signed:0;
>         field:u32 len;  offset:12;      size:4; signed:0;
>         field:u64 gpa;  offset:16;      size:8; signed:0;
>         field:u64 val;  offset:24;      size:8; signed:0;
> 
> print fmt: "mmio %s len %u gpa 0x%llx val 0x%llx", __print_symbolic(REC->type, { 0, "unsatisfied-read" }, { 1, "read" }, { 2, "write" }), REC->len, REC->gpa, REC->val
> 
> 
> #cat /sys/devices/pci0000:00/0000:00:02.0/uevent

'uevent' can probably be considered a special case, I would not really
want to copy it.

> DRIVER=vfio-pci
> PCI_CLASS=30000
> PCI_ID=8086:591D
> PCI_SUBSYS_ID=8086:2212
> PCI_SLOT_NAME=0000:00:02.0
> MODALIAS=pci:v00008086d0000591Dsv00008086sd00002212bc03sc00i00
> 

(...)

> what about a migration_compatible attribute under device node like
> below?
> 
> #cat /sys/bus/pci/devices/0000\:00\:02.0/UUID1/migration_compatible
> SELF:
> 	device_type=pci
> 	device_id=8086591d
> 	mdev_type=i915-GVTg_V5_2
> 	aggregator=1
> 	pv_mode="none+ppgtt+context"
> 	interface_version=3
> COMPATIBLE:
> 	device_type=pci
> 	device_id=8086591d
> 	mdev_type=i915-GVTg_V5_{val1:int:1,2,4,8}
> 	aggregator={val1}/2
> 	pv_mode={val2:string:"none+ppgtt","none+context","none+ppgtt+context"} 
> 	interface_version={val3:int:2,3}
> COMPATIBLE:
> 	device_type=pci
> 	device_id=8086591d
> 	mdev_type=i915-GVTg_V5_{val1:int:1,2,4,8}
> 	aggregator={val1}/2
> 	pv_mode=""  #"" meaning empty, could be absent in a compatible device
> 	interface_version=1

I'd consider anything of a comparable complexity to be a big no-no. If
anything, this needs to be split into individual files (with many of
them being vendor driver specific anyway.)

I think we can list compatible versions in a range/list format, though.
Something like

cat interface_version 
2.1.3

cat interface_version_compatible
2.0.2-2.0.4,2.1.0-

(indicating that versions 2.0.{2,3,4} and all versions after 2.1.0 are
compatible, considering versions <2 and >2 incompatible by default)

Possible compatibility between different mdev types feels a bit odd to
me, and should not be included by default (only if it makes sense for a
particular vendor driver.)

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
