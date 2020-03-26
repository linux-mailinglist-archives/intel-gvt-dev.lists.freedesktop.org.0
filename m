Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCF01937F4
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 26 Mar 2020 06:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4391B6E264;
	Thu, 26 Mar 2020 05:41:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5946D6E264
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 26 Mar 2020 05:41:39 +0000 (UTC)
IronPort-SDR: zcxWi9FPvIUQioRcg3otmdDbFey8e+YzAJsgkiBOX84iuvsk7OfqJrn+cAncXtCB4Bz/3Qa/4j
 V5YK5L8AzSFA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 22:41:38 -0700
IronPort-SDR: wlkSnlxSudaj/8BAa5WVuoRT5YAw4yX+qM4Qc4Rki61dQfKy2m6Fp3S+2CCwZEt9nEh80jYizl
 ImBFeDDycoew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; d="scan'208";a="393862301"
Received: from zhaji-mobl3.ccr.corp.intel.com (HELO
 dell-xps.ccr.corp.intel.com) ([10.249.174.174])
 by orsmga004.jf.intel.com with ESMTP; 25 Mar 2020 22:41:37 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: alex.williamson@redhat.com
Subject: [PATCH v2 0/2] VFIO mdev aggregated resources handling
Date: Thu, 26 Mar 2020 13:41:34 +0800
Message-Id: <20200326054136.2543-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: kevin.tian@intel.com, intel-gvt-dev@lists.freedesktop.org,
 kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi,

This is a refresh on previous series: https://patchwork.kernel.org/cover/11208279/
and https://patchwork.freedesktop.org/series/70425/

Current mdev device create interface depends on fixed mdev type, which
get uuid from user to create instance of mdev device. If user wants to
use customized number of resource for mdev device, then only can
create new mdev type for that which may not be flexible. This
requirement comes not only from to be able to allocate flexible
resources for KVMGT, but also from Intel scalable IO virtualization
which would use vfio/mdev to be able to allocate arbitrary resources
on mdev instance. More info on [1] [2] [3].

As we agreed that for current opaque mdev device type, we'd still
explore management interface based on mdev sysfs definition. And this
one tries to follow Alex's previous suggestion to create generic
parameters under 'mdev' directory for each device, so vendor driver
could provide support like as other defined mdev sysfs entries.

For mdev type with aggregation support, files as "aggregated_instances"
and "max_aggregation" should be created under 'mdev' directory. E.g

/sys/devices/pci0000:00/0000:00:02.0/<UUID>/mdev/
   |-- aggregated_instances
   |-- max_aggregation

"aggregated_instances" is used to set or return current number of
instances for aggregation, which can not be larger than "max_aggregation".

The first patch is to update the document for new mdev parameter directory.
The second one is to add aggregation support in GVT driver.

References:
[1] https://software.intel.com/en-us/download/intel-virtualization-technology-for-directed-io-architecture-specification
[2] https://software.intel.com/en-us/download/intel-scalable-io-virtualization-technical-specification
[3] https://schd.ws/hosted_files/lc32018/00/LC3-SIOV-final.pdf

Zhenyu Wang (2):
  Documentation/driver-api/vfio-mediated-device.rst: update for
    aggregation support
  drm/i915/gvt: mdev aggregation type

 .../driver-api/vfio-mediated-device.rst       |  19 ++
 drivers/gpu/drm/i915/gvt/aperture_gm.c        |  44 +++--
 drivers/gpu/drm/i915/gvt/gtt.c                |   9 +-
 drivers/gpu/drm/i915/gvt/gvt.c                |   7 +-
 drivers/gpu/drm/i915/gvt/gvt.h                |  42 +++--
 drivers/gpu/drm/i915/gvt/kvmgt.c              | 115 +++++++++++-
 drivers/gpu/drm/i915/gvt/vgpu.c               | 172 ++++++++++++------
 7 files changed, 314 insertions(+), 94 deletions(-)

-- 
2.25.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
