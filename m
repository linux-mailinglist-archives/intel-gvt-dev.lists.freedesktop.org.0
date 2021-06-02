Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E630839934B
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  2 Jun 2021 21:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E406EDF4;
	Wed,  2 Jun 2021 19:12:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1616EDFF;
 Wed,  2 Jun 2021 19:12:18 +0000 (UTC)
IronPort-SDR: inf32cM67J2S+asKWRfRgbSabEuRmB5KKCLN/IMLQCHLMnXh8LhRS7mi0piu0KI6hysSEzjJ4P
 oKPt0BUKd0WQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="203901851"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="203901851"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 12:12:01 -0700
IronPort-SDR: d63yxymjE7bbpGVsqi6AD1FmXtu0XAG/KdCab/W9hRseD3Trf8nvtN1/BorVsB5vBngUNfU3fN
 VXXTBNlRcx9Q==
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="479828611"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 12:12:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/7] Finish conversion to GRAPHICS_VER
Date: Wed,  2 Jun 2021 12:11:41 -0700
Message-Id: <20210602191148.3344574-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: intel-gvt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Latest version of previous series "drm/i915: Extend GEN renames to the
rest of the driver" (https://patchwork.freedesktop.org/series/88825/)
dropped one patch converting all the instances of IS_GEN() and
INTEL_GEN() to GRAPHICS_VER() due to the patches changing the
meaning of the macros IS_GRAPHICS_VER/GRAPHICS_VER and removal of
IS_GRAPHICS_RANGE().

I couldn't find a way to convince coccinelle to fix all places, so I
just did it manually in separate commits the places that were not
updated.

Finish the conversion splitting the changes so it can go to the
different branches (drm-intel-gt-next and drm-intel-next). I also split
the gvt changes, but I think it would be easeir to take this directly on
drm-intel-next.

Also, please do not apply this series as I have other series I'd like to
rebase on top before landing it.

v2: update commit messages with the proper semantic patch (Matt Roper) and
regenerate the patches to also convert changes that got added in between.

Cc: intel-gvt-dev@lists.freedesktop.org
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>

Lucas De Marchi (7):
  drm/i915/gt: replace IS_GEN and friends with GRAPHICS_VER
  drm/i915/gt: Add remaining conversions to GRAPHICS_VER
  drm/i915/gem: replace IS_GEN and friends with GRAPHICS_VER
  drm/i915/gvt: replace IS_GEN and friends with GRAPHICS_VER
  drm/i915: replace IS_GEN and friends with GRAPHICS_VER
  drm/i915: Add remaining conversions to GRAPHICS_VER
  drm/i915/display: replace IS_GEN() in commented code

 drivers/gpu/drm/i915/display/intel_tv.c       |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  6 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 10 +--
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
 .../gpu/drm/i915/gem/i915_gem_object_blt.c    |  8 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    | 16 ++--
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c    | 12 +--
 .../i915/gem/selftests/i915_gem_client_blt.c  | 10 +--
 .../i915/gem/selftests/i915_gem_coherency.c   |  4 +-
 .../drm/i915/gem/selftests/i915_gem_context.c | 16 ++--
 .../drm/i915/gem/selftests/i915_gem_mman.c    | 14 ++--
 .../drm/i915/gem/selftests/igt_gem_utils.c    | 10 +--
 drivers/gpu/drm/i915/gt/debugfs_gt_pm.c       | 40 +++++-----
 drivers/gpu/drm/i915/gt/gen2_engine_cs.c      |  2 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |  2 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  2 +-
 drivers/gpu/drm/i915/gt/intel_context_sseu.c  |  2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 54 ++++++-------
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  4 +-
 .../drm/i915/gt/intel_execlists_submission.c  | 18 ++---
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 18 ++---
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  | 34 ++++----
 drivers/gpu/drm/i915/gt/intel_gt.c            | 27 ++++---
 .../gpu/drm/i915/gt/intel_gt_clock_utils.c    | 12 +--
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  6 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c     | 10 +--
 drivers/gpu/drm/i915/gt/intel_gtt.c           | 14 ++--
 drivers/gpu/drm/i915/gt/intel_llc.c           |  6 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c           | 46 +++++------
 drivers/gpu/drm/i915/gt/intel_mocs.c          |  8 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  6 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c           | 16 ++--
 drivers/gpu/drm/i915/gt/intel_renderstate.c   |  2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         | 14 ++--
 .../gpu/drm/i915/gt/intel_ring_submission.c   | 64 +++++++--------
 drivers/gpu/drm/i915/gt/intel_rps.c           | 60 +++++++-------
 drivers/gpu/drm/i915/gt/intel_sseu.c          | 14 ++--
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c  |  6 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 66 +++++++--------
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c  |  6 +-
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c  |  2 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  4 +-
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c      |  8 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  8 +-
 drivers/gpu/drm/i915/gt/selftest_llc.c        |  4 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  8 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c       |  2 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c        |  4 +-
 .../drm/i915/gt/selftest_ring_submission.c    |  6 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c        | 16 ++--
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |  6 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 10 +--
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  4 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c         |  8 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c             |  2 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c         | 10 +--
 drivers/gpu/drm/i915/gvt/gtt.c                |  4 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |  6 +-
 drivers/gpu/drm/i915/gvt/interrupt.c          |  2 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c       | 10 +--
 drivers/gpu/drm/i915/gvt/scheduler.c          |  4 +-
 drivers/gpu/drm/i915/gvt/vgpu.c               |  4 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c        | 10 +--
 drivers/gpu/drm/i915/i915_debugfs.c           | 32 ++++----
 drivers/gpu/drm/i915/i915_drv.c               | 20 ++---
 drivers/gpu/drm/i915/i915_drv.h               | 35 ++++----
 drivers/gpu/drm/i915/i915_gem.c               |  4 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         | 80 +++++++++----------
 drivers/gpu/drm/i915/i915_irq.c               | 34 ++++----
 drivers/gpu/drm/i915/i915_perf.c              | 44 +++++-----
 drivers/gpu/drm/i915/i915_pmu.c               |  8 +-
 drivers/gpu/drm/i915/i915_reg.h               | 26 +++---
 drivers/gpu/drm/i915/i915_request.c           |  4 +-
 drivers/gpu/drm/i915/i915_suspend.c           | 16 ++--
 drivers/gpu/drm/i915/i915_sysfs.c             |  2 +-
 drivers/gpu/drm/i915/i915_vgpu.c              |  2 +-
 drivers/gpu/drm/i915/intel_device_info.c      | 22 ++---
 drivers/gpu/drm/i915/intel_dram.c             | 14 ++--
 drivers/gpu/drm/i915/intel_pch.c              | 10 +--
 drivers/gpu/drm/i915/intel_pm.c               | 14 ++--
 drivers/gpu/drm/i915/intel_sideband.c         |  2 +-
 drivers/gpu/drm/i915/intel_uncore.c           | 26 +++---
 drivers/gpu/drm/i915/intel_wopcm.c            | 10 +--
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  4 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c    |  6 +-
 drivers/gpu/drm/i915/selftests/i915_request.c |  8 +-
 drivers/gpu/drm/i915/selftests/igt_spinner.c  | 12 +--
 drivers/gpu/drm/i915/selftests/intel_uncore.c |  2 +-
 93 files changed, 633 insertions(+), 633 deletions(-)

-- 
2.31.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
