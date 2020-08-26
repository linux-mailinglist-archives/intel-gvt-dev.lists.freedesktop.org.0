Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C21F2526E2
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 26 Aug 2020 08:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C60A6E9F1;
	Wed, 26 Aug 2020 06:33:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9646E1CD;
 Wed, 26 Aug 2020 06:33:36 +0000 (UTC)
IronPort-SDR: KDAmUCSy2d/kXfsMAhN4thr9T7miO+WBNbXcJuV33lneUhCKwaa7qiuwOBPqZV4S4+rMaJI5rh
 EWsctWc6f2JQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="156233388"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="156233388"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 23:33:36 -0700
IronPort-SDR: cCEee64HRD5ngdYKUmSth2JTPHHveNZAxVJ2fPPUQr02GFARz+O4aiztjnhTakguiJsboXanYg
 H7BC/mCNzk+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="500140252"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by fmsmga005.fm.intel.com with ESMTP; 25 Aug 2020 23:33:34 -0700
From: Colin Xu <colin.xu@intel.com>
To: zhenyuw@linux.intel.com, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/2] Enable GVT suspend/resume
Date: Wed, 26 Aug 2020 14:33:30 +0800
Message-Id: <20200826063330.680032-1-colin.xu@intel.com>
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

Colin Xu (2):
  drm/i915/gvt: Save/restore HW status for GVT during suspend/resume
  drm/i915/gvt: Add GVT suspend/resume routine to i915

 drivers/gpu/drm/i915/gvt/gtt.c      | 73 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.h      |  2 +
 drivers/gpu/drm/i915/gvt/gvt.c      | 15 ++++++
 drivers/gpu/drm/i915/gvt/gvt.h      |  6 +++
 drivers/gpu/drm/i915/gvt/handlers.c | 20 ++++++++
 drivers/gpu/drm/i915/gvt/mmio.h     |  3 ++
 drivers/gpu/drm/i915/gvt/vgpu.c     |  1 +
 drivers/gpu/drm/i915/i915_drv.c     |  4 ++
 drivers/gpu/drm/i915/intel_gvt.c    | 29 ++++++++++++
 drivers/gpu/drm/i915/intel_gvt.h    | 10 ++++
 10 files changed, 163 insertions(+)

-- 
2.28.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
