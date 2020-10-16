Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A481B28FFC6
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Oct 2020 10:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6029D6EA8E;
	Fri, 16 Oct 2020 08:11:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3506EA8E;
 Fri, 16 Oct 2020 08:11:23 +0000 (UTC)
IronPort-SDR: t1An0X7TspAotbzghAVLX+CoufWkFWJNyFV1oKUhDokOMCOcFWeBh+sI8g8TfP8qnBlqiJFuLB
 Cej8YQVyUOHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="163085766"
X-IronPort-AV: E=Sophos;i="5.77,382,1596524400"; d="scan'208";a="163085766"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 01:11:21 -0700
IronPort-SDR: vVb15y3+CC64JtBvsVKYjotMj/HhXH/LqrdKmp4dS1DbQBks2HX2mg/ztEkrjvevlC0Iyy8P9+
 6P4L/F1NqpAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,382,1596524400"; d="scan'208";a="522157510"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.24])
 by fmsmga005.fm.intel.com with ESMTP; 16 Oct 2020 01:11:20 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 zhenyuw@linux.intel.com
Subject: [PATCH v5 0/2] Enable GVT suspend/resume
Date: Fri, 16 Oct 2020 16:11:18 +0800
Message-Id: <20201016081118.375301-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.28.0
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This patchset enables GVT suspend/resume so that GVT enabled VM can
continue running after host resuming from suspend state.

V2:
- Change kzalloc/kfree to vzalloc/vfree since the space allocated
from kmalloc may not enough for all saved GGTT entries.
- Keep gvt suspend/resume wrapper in intel_gvt.h/intel_gvt.c and
move the actual implementation to gvt.h/gvt.c. (zhenyu)
- Check gvt config on and active with intel_gvt_active(). (zhenyu)

V3: (zhenyu)
- Incorrect copy length. Should be num entries * entry size.
- Use memcpy_toio()/memcpy_fromio() instead of memcpy for iomem.
- Add F_PM_SAVE flags to indicate which MMIOs to save/restore for PM.

V4:
Rebase.

V5:
Fail intel_gvt_pm_suspend if fail to save ggtt.

Colin Xu (2):
  drm/i915/gvt: Save/restore HW status for GVT during suspend/resume
  drm/i915/gvt: Add GVT suspend/resume routine to i915

 drivers/gpu/drm/i915/gvt/gtt.c      | 88 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.h      |  2 +
 drivers/gpu/drm/i915/gvt/gvt.c      | 14 +++++
 drivers/gpu/drm/i915/gvt/gvt.h      |  7 +++
 drivers/gpu/drm/i915/gvt/handlers.c | 39 ++++++++++++-
 drivers/gpu/drm/i915/gvt/mmio.h     |  3 +
 drivers/gpu/drm/i915/gvt/vgpu.c     |  1 +
 drivers/gpu/drm/i915/i915_drv.c     |  5 ++
 drivers/gpu/drm/i915/intel_gvt.c    | 30 ++++++++++
 drivers/gpu/drm/i915/intel_gvt.h    | 10 ++++
 10 files changed, 196 insertions(+), 3 deletions(-)

-- 
2.28.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
