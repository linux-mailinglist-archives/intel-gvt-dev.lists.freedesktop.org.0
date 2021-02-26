Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E41325CAA
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 26 Feb 2021 05:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690F66E8E4;
	Fri, 26 Feb 2021 04:45:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB436E8E4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 26 Feb 2021 04:45:43 +0000 (UTC)
IronPort-SDR: ahqHoc4/ROAh6ixVFTpIXoz+X53WJ2cV2GtaVZW5fJbrvoI+Xv8x+MB/TMGFB2k7ruKtXwIsXZ
 PSNMJzHvBi+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9906"; a="182349240"
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; d="scan'208";a="182349240"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2021 20:45:42 -0800
IronPort-SDR: 8QvmS/iua7GAPENLC0AorFT5ZqPGV7EgwW0ny+FuwCFv5LCDswF93mdZLfDj+UaQP3pGy8GjG9
 OVNHpw/O8NyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; d="scan'208";a="434198182"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.51])
 by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2021 20:45:29 -0800
From: Colin Xu <colin.xu@intel.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH v2 0/2] drm/i915/gvt: Refactor to per-vGPU accurate vblank
 emulator
Date: Fri, 26 Feb 2021 12:45:23 +0800
Message-Id: <20210226044523.282950-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.30.1
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
Cc: intel-gvt-dev@lists.freedesktop.org, colin.xu@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

The patch set includes two patches:
Patch 1/2: Get accurate vGPU virtual display refresh rate from vreg
Patch 2/2: Use per-vGPU vblank emulator at dynamic & accurate refresh rate.

The patch set resovles below issues:
- 16ms matches the refresh rate at 62.5Hz (instead of 60Hz) which isn't
  belong to standard timing. This leads to some frame drop or glitch issue
  during video playback. Since SW expect at least 16.667ms period for 60Hz
  or may need higher resolution, however vblank emulator only works at 16.
- Doesn't respect the fact that with current virtual EDID timing set,
  not all resolutions are enabled at 60Hz. For example, current virtual
  EDID actually supports refresh rate like 56Hz, 59.97Hz, 60Hz, 75Hz, etc.
- Current vblank emulator use single hrtimer for all vGPUs. Regardsless
  how guest changing the resolution, all vsync interrupts are injected at
  16ms interval.

With the patch set, the actual refresh rate from guest can now always
match guest OS resolution settings.
To run quick test, launch a web browser and goto URL: www.displayhz.com

V2:
Rebase to 5.11.
Correctly calculate DP link rate for BDW and BXT.
Simplify logic.
Typo fix.

Colin Xu (2):
  drm/i915/gvt: Get accurate vGPU virtual display refresh rate from vreg
  drm/i915/gvt: Refactor GVT vblank emulator for vGPU virtual display

 drivers/gpu/drm/i915/gvt/display.c   | 107 ++++++-----
 drivers/gpu/drm/i915/gvt/display.h   |  14 +-
 drivers/gpu/drm/i915/gvt/gvt.c       |  25 ++-
 drivers/gpu/drm/i915/gvt/gvt.h       |  13 +-
 drivers/gpu/drm/i915/gvt/handlers.c  | 261 ++++++++++++++++++++++++++-
 drivers/gpu/drm/i915/gvt/interrupt.c |  37 ----
 drivers/gpu/drm/i915/gvt/interrupt.h |   7 -
 drivers/gpu/drm/i915/gvt/vgpu.c      |   2 -
 8 files changed, 353 insertions(+), 113 deletions(-)

-- 
2.30.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
