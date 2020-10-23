Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E928296B06
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Oct 2020 10:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607396E4D4;
	Fri, 23 Oct 2020 08:17:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B166E4D2;
 Fri, 23 Oct 2020 08:17:09 +0000 (UTC)
IronPort-SDR: 6506rcJg7OzsLnNGw20HdwtVbBrC4lyiJapn88aNRXKnaO9ArAuHBXRugrKPa8rSOdGpZqQBf/
 EFedMeGwR9HQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="146936401"
X-IronPort-AV: E=Sophos;i="5.77,407,1596524400"; d="scan'208";a="146936401"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 01:17:05 -0700
IronPort-SDR: XiNu2FA3YQcV/+puzRd46ENzHxhlYAVV8b21/mct7vaL1DIdNXm5eG+uD8EcU0e3cWaXSOhLzn
 udqRtPZvMDrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,407,1596524400"; d="scan'208";a="321659220"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by orsmga006.jf.intel.com with ESMTP; 23 Oct 2020 01:17:03 -0700
From: Colin Xu <colin.xu@intel.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH v6 0/2] Enable GVT suspend/resume
Date: Fri, 23 Oct 2020 16:17:01 +0800
Message-Id: <20201023081701.772262-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.29.0
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 colin.xu@intel.com
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

V6:
Save host entry to per-vGPU gtt.ggtt_mm on each host_entry update so
that no need to read from HW and save during suspend.

Colin Xu (2):
  drm/i915/gvt: Save/restore HW status to support GVT suspend/resume
  drm/i915/gvt: Add GVT resume routine to i915

 drivers/gpu/drm/i915/gvt/gtt.c      | 75 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.h      |  9 ++++
 drivers/gpu/drm/i915/gvt/gvt.c      |  8 +++
 drivers/gpu/drm/i915/gvt/gvt.h      |  3 ++
 drivers/gpu/drm/i915/gvt/handlers.c | 39 +++++++++++++--
 drivers/gpu/drm/i915/gvt/mmio.h     |  3 ++
 drivers/gpu/drm/i915/i915_drv.c     |  2 +
 drivers/gpu/drm/i915/intel_gvt.c    | 15 ++++++
 drivers/gpu/drm/i915/intel_gvt.h    |  5 ++
 9 files changed, 156 insertions(+), 3 deletions(-)

-- 
2.29.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
