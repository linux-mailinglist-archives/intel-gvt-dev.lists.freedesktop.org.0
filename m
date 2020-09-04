Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A8525F133
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Sep 2020 02:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19FF6E03F;
	Mon,  7 Sep 2020 00:55:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F796E03F;
 Mon,  7 Sep 2020 00:55:00 +0000 (UTC)
IronPort-SDR: 8J9eduruy1f0FiLyU4cCykO9Kaq05MfuhRRtSVVdXqqkY/DzShs5g+KIP4CzsKJwT1Xy46hQJn
 f2rq1mnowTIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="157202184"
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="157202184"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2020 17:54:59 -0700
IronPort-SDR: BDtqnM3d0in1y1U+CKAnJLTFvXd7M1olhSOI0bMUxvLej/hrz5Yq27smlfRM+UJm1igq+IwuWb
 EpV4QnennZuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="479443676"
Received: from xzhan34-mobl2.bj.intel.com ([10.238.154.74])
 by orsmga005.jf.intel.com with ESMTP; 06 Sep 2020 17:54:57 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 00/12] enhanced i915 vgpu with PV feature support
Date: Sat,  5 Sep 2020 00:21:33 +0800
Message-Id: <1599236505-9086-1-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: kevin.tian@intel.com, Xiaolin Zhang <xiaolin.zhang@intel.com>,
 joonas.lahtinen@linux.intel.com, zhenyuw@linux.intel.com,
 chris@chris-wilson.co.uk, zhiyuan.lv@intel.com, zhi.a.wang@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This is new i915 VGPU PV design based on the last year proposal [1].

This is a new series of patch set and discontiued the old series of
patch set due to this new design.

To improve vgpu performance, it could implement some PV optimizations
in different gpu resource domain to reduce the data access overhead
or complexity modeling.

In this patch set, PPGTT and GGTT are identifed as PV optimization from
VGPU memory resource point of view and workloa submisison is identifed
as PV optimization from VGPU compute resource point of view. so 3 PV
features (PV PPGTT, PV GGTT and PV submisison) are designed and implemented
to support VGPU model better. 

To provide the mechanism for PV feature development and implementation,
A simple PV framework is implemented and consisted of 3 sub items:
a. PV capability: it indicateds what kind of PV capability provided by both
guest system and host GVTg subsystem.
b. PV shared memory: this memory is allocated in guest and shared between
guest and host for data exchange, PV command & PV data communication.
c. PV command transport protocol: on top of PV shared memory, it defines
the communication protocol & channel between guest and host to circulate
PV command and PV command data. 

for PV PPGTT, to improve efficiency and reduce the complexity of ppgtt
support, vgpu ppgtt page table operations are implemented in pv fashion
with pv version of bind/unbind for ppgtt vma ops. The pv version of 
ppgtt vma ops use the CTB protocol to communicate pv ppgtt command along 
with data struct pv_vma from guest to GVT and then GVT implement command
handler of PV_CMD_BIND_PPGTT and PV_CMD_UBIND_PPGTT to achieve GVA->HPA
address translation.

for PV GGTT, it is similar with PV PPGGT instead to use PV_CMD_BIND_GGTT
and PV_CMD_UNBIND_GGTT pv command. 

for PV workload submisison, a pv version of workload submission backend
implemented with engine submission data in the shared memory and meanwhile
eliminating execlists csb process and context switch interrupt in
submisision routine to improve efficiency and reduce complexity.

Based on the experiment, small workloads such as glmark2 and Antutu 3D 
benchmark can get benefit for these PV featuers at least 10% performance
gain. for large workload such as media and 3D, it get some benefit,
but not much. 

[1]: https://patchwork.kernel.org/cover/11148059/

Xiaolin Zhang (12):
  drm/i915: introduced vgpu pv capability
  drm/i915: vgpu shared memory setup for pv support
  drm/i915: vgpu pv command buffer transport protocol
  drm/i915: vgpu ppgtt page table pv support
  drm/i915: vgpu ggtt page table pv support
  drm/i915: vgpu workload submisison pv support
  drm/i915/gvt: GVTg expose pv_caps PVINFO register
  drm/i915/gvt: GVTg handle guest shared_page setup
  drm/i915/gvt: GVTg support vgpu pv CTB protocol
  drm/i915/gvt: GVTg support ppgtt pv operations
  drm/i915/gvt: GVTg support ggtt pv operations
  drm/i915/gvt: GVTg support pv workload submssion

 drivers/gpu/drm/i915/Makefile              |   2 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c       |   4 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c        |   2 +
 drivers/gpu/drm/i915/gvt/gtt.c             | 255 ++++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.h             |   4 +
 drivers/gpu/drm/i915/gvt/gvt.h             |  17 +-
 drivers/gpu/drm/i915/gvt/handlers.c        | 274 ++++++++++++++-
 drivers/gpu/drm/i915/gvt/vgpu.c            |  47 +++
 drivers/gpu/drm/i915/i915_debugfs.c        |   3 +
 drivers/gpu/drm/i915/i915_drv.c            |   2 +
 drivers/gpu/drm/i915/i915_drv.h            |   5 +-
 drivers/gpu/drm/i915/i915_gem.c            |   4 +-
 drivers/gpu/drm/i915/i915_pvinfo.h         |   9 +-
 drivers/gpu/drm/i915/i915_vgpu.c           | 533 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/i915/i915_vgpu.h           | 122 +++++++
 drivers/gpu/drm/i915/intel_pv_submission.c | 324 ++++++++++++++++++
 16 files changed, 1599 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/intel_pv_submission.c

-- 
2.7.4

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
