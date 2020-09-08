Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7218260BD6
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Sep 2020 09:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848EA6E536;
	Tue,  8 Sep 2020 07:21:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA1A6E4F9;
 Tue,  8 Sep 2020 07:21:24 +0000 (UTC)
IronPort-SDR: yIjY8Og9TkRQeA7EHHOQpL/a1Gly6+7s2QKMZhRautR3go464gVyLo7T+NHsy3hWNmd2z3q/SO
 vMCjz9yog3YQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="222295795"
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; d="scan'208";a="222295795"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 00:21:22 -0700
IronPort-SDR: cnbt8ftqbckeYr10YqiSkvY8z7EHUQhq7Lj2zzFg6Yr9Xx1JftAbXgU/zVrcKZyqBoOQf9EqG7
 HUDwU6MDBrPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; d="scan'208";a="317097114"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by orsmga002.jf.intel.com with ESMTP; 08 Sep 2020 00:21:20 -0700
From: Colin Xu <colin.xu@intel.com>
To: zhenyuw@linux.intel.com, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/2] Enable GVT suspend/resume
Date: Tue,  8 Sep 2020 15:21:16 +0800
Message-Id: <20200908072116.772576-1-colin.xu@intel.com>
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

Colin Xu (2):
  drm/i915/gvt: Save/restore HW status for GVT during suspend/resume
  drm/i915/gvt: Add GVT suspend/resume routine to i915

 drivers/gpu/drm/i915/gvt/gtt.c      | 75 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.h      |  2 +
 drivers/gpu/drm/i915/gvt/gvt.c      | 15 ++++++
 drivers/gpu/drm/i915/gvt/gvt.h      |  8 +++
 drivers/gpu/drm/i915/gvt/handlers.c | 39 +++++++++++++--
 drivers/gpu/drm/i915/gvt/mmio.h     |  3 ++
 drivers/gpu/drm/i915/gvt/vgpu.c     |  1 +
 drivers/gpu/drm/i915/i915_drv.c     |  4 ++
 drivers/gpu/drm/i915/intel_gvt.c    | 29 +++++++++++
 drivers/gpu/drm/i915/intel_gvt.h    | 10 ++++
 10 files changed, 183 insertions(+), 3 deletions(-)

-- 
2.28.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
