Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB801AD8D9
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Apr 2020 10:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A077E6E107;
	Fri, 17 Apr 2020 08:45:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55476E106
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 17 Apr 2020 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587113120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jlSmzPpbvnqZnwcalXuvPkUwVQHZbnaF9jJhRsTm+Sg=;
 b=N+6/AedWxsnIiuuOxT7vN3os6szv+C3+cbG5doJaAvso43vv5IVf5cYSLKBqizWBQrRtnf
 sbkSxMS7Izt8k6uFQWX5AGXBM6+SRHAR96XM9envO7l3hBmCdkFoQoGt4VnjBrh0H//FLy
 qXIwVt+62E9KDJMYJpOwwUuBViYx15Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-UJZeq6-DPWex82UXcQVOOA-1; Fri, 17 Apr 2020 04:45:13 -0400
X-MC-Unique: UJZeq6-DPWex82UXcQVOOA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 615DC85EE6B;
 Fri, 17 Apr 2020 08:45:10 +0000 (UTC)
Received: from gondolin (ovpn-112-200.ams2.redhat.com [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 303765C296;
 Fri, 17 Apr 2020 08:44:53 +0000 (UTC)
Date: Fri, 17 Apr 2020 10:44:50 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v5 0/4] introduction of migration_version attribute for
 VFIO live migration
Message-ID: <20200417104450.2d2f2fa9.cohuck@redhat.com>
In-Reply-To: <20200413055201.27053-1-yan.y.zhao@intel.com>
References: <20200413055201.27053-1-yan.y.zhao@intel.com>
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
Cc: cjia@nvidia.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 libvir-list@redhat.com, Zhengxiao.zx@alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, yi.l.liu@intel.com, eskultet@redhat.com,
 ziye.yang@intel.com, mlevitsk@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru,
 felipe@nutanix.com, Ken.Xue@amd.com, kevin.tian@intel.com, xin.zeng@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, dinechin@redhat.com,
 alex.williamson@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 changpeng.liu@intel.com, berrange@redhat.com, corbet@lwn.net,
 linux-kernel@vger.kernel.org, zhi.a.wang@intel.com,
 jonathan.davies@nutanix.com, shaopeng.he@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, 13 Apr 2020 01:52:01 -0400
Yan Zhao <yan.y.zhao@intel.com> wrote:

> This patchset introduces a migration_version attribute under sysfs of VFIO
> Mediated devices.
> 
> This migration_version attribute is used to check migration compatibility
> between two mdev devices.
> 
> Currently, it has two locations:
> (1) under mdev_type node,
>     which can be used even before device creation, but only for mdev
>     devices of the same mdev type.
> (2) under mdev device node,
>     which can only be used after the mdev devices are created, but the src
>     and target mdev devices are not necessarily be of the same mdev type
> (The second location is newly added in v5, in order to keep consistent
> with the migration_version node for migratable pass-though devices)

What is the relationship between those two attributes?

Is existence (and compatibility) of (1) a pre-req for possible
existence (and compatibility) of (2)?

Does userspace need to check (1) or can it completely rely on (2), if
it so chooses?

If devices with a different mdev type are indeed compatible, it seems
userspace can only find out after the devices have actually been
created, as (1) does not apply?

One of my worries is that the existence of an attribute with the same
name in two similar locations might lead to confusion. But maybe it
isn't a problem.

> 
> Patch 1 defines migration_version attribute for the first location in
> Documentation/vfio-mediated-device.txt
> 
> Patch 2 uses GVT as an example for patch 1 to show how to expose
> migration_version attribute and check migration compatibility in vendor
> driver.
> 
> Patch 3 defines migration_version attribute for the second location in
> Documentation/vfio-mediated-device.txt
> 
> Patch 4 uses GVT as an example for patch 3 to show how to expose
> migration_version attribute and check migration compatibility in vendor
> driver.
> 
> (The previous "Reviewed-by" and "Acked-by" for patch 1 and patch 2 are
> kept in v5, as there are only small changes to commit messages of the two
> patches.)
> 
> v5:
> added patch 2 and 4 for mdev device part of migration_version attribute.
> 
> v4:
> 1. fixed indentation/spell errors, reworded several error messages
> 2. added a missing memory free for error handling in patch 2
> 
> v3:
> 1. renamed version to migration_version
> 2. let errno to be freely defined by vendor driver
> 3. let checking mdev_type be prerequisite of migration compatibility check
> 4. reworded most part of patch 1
> 5. print detailed error log in patch 2 and generate migration_version
> string at init time
> 
> v2:
> 1. renamed patched 1
> 2. made definition of device version string completely private to vendor
> driver
> 3. reverted changes to sample mdev drivers
> 4. described intent and usage of version attribute more clearly.
> 
> 
> Yan Zhao (4):
>   vfio/mdev: add migration_version attribute for mdev (under mdev_type
>     node)
>   drm/i915/gvt: export migration_version to mdev sysfs (under mdev_type
>     node)
>   vfio/mdev: add migration_version attribute for mdev (under mdev device
>     node)
>   drm/i915/gvt: export migration_version to mdev sysfs (under mdev
>     device node)
> 
>  .../driver-api/vfio-mediated-device.rst       | 183 ++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/Makefile             |   2 +-
>  drivers/gpu/drm/i915/gvt/gvt.c                |  39 ++++
>  drivers/gpu/drm/i915/gvt/gvt.h                |   7 +
>  drivers/gpu/drm/i915/gvt/kvmgt.c              |  55 ++++++
>  drivers/gpu/drm/i915/gvt/migration_version.c  | 170 ++++++++++++++++
>  drivers/gpu/drm/i915/gvt/vgpu.c               |  13 +-
>  7 files changed, 466 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/gvt/migration_version.c
> 

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
