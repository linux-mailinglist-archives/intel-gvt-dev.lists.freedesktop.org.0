Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAA030BE4B
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Feb 2021 13:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767A089F4F;
	Tue,  2 Feb 2021 12:37:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2024089F4F;
 Tue,  2 Feb 2021 12:37:08 +0000 (UTC)
IronPort-SDR: dV0fEynxUnZZdzyfZ83/MABuw8Co/QaidJ+4rV6OgBFXu4YKXZtOmKXG/6aKj3pwoPvj2l2uN9
 Iwf6UmRNgK1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="160012131"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="160012131"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 04:37:07 -0800
IronPort-SDR: QYguasDyknSNSY5elR1d2kUlIiF3lTdIcUJbTfR4SS9WmC21O7rzScNX5P4Og2dW/6QX5djSBP
 VrckRmplKk9Q==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="370637971"
Received: from amishuti-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.249.46.139])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 04:37:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 intel-gvt-dev@lists.freedesktop.org
Subject: [PULL] topic/drm-device-pdev
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 02 Feb 2021 14:37:00 +0200
Message-ID: <87y2g6fxxv.fsf@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


Hi Joonas -

This is Thomas's drm_device.pdev removal for i915, the first three
patches from [1]. Let's merge to both drm-intel-next and
drm-intel-gt-next.

Zhenyu & Zhi, FYI, this touches gvt too, and it was getting a bit too
complicated to handle all the components separately. Hopefully you won't
have too many conflicts when backmerging.


topic/drm-device-pdev-2021-02-02:
Driver Changes:
- drm/i915: Remove references to struct drm_device.pdev

BR,
Jani.

[1] http://lore.kernel.org/r/20210128133127.2311-1-tzimmermann@suse.de


The following changes since commit 4043277ad18fc7cb9a79d0d043063fb5f42a6f06:

  drm/i915/adl_s: Add GT and CTX WAs for ADL-S (2021-02-01 07:59:11 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/topic/drm-device-pdev-2021-02-02

for you to fetch changes up to 9ff06c38530099b197b6389193e8cc34ab60288f:

  drm/i915/gvt: Remove references to struct drm_device.pdev (2021-02-02 13:58:45 +0200)

----------------------------------------------------------------
Driver Changes:
- drm/i915: Remove references to struct drm_device.pdev

----------------------------------------------------------------
Thomas Zimmermann (3):
      drm/i915: Remove references to struct drm_device.pdev
      drm/i915/gt: Remove references to struct drm_device.pdev
      drm/i915/gvt: Remove references to struct drm_device.pdev

 drivers/gpu/drm/i915/display/intel_bios.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c     | 14 +++++++-------
 drivers/gpu/drm/i915/display/intel_csr.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c |  5 +++--
 drivers/gpu/drm/i915/display/intel_opregion.c  |  6 +++---
 drivers/gpu/drm/i915/display/intel_overlay.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_panel.c     |  4 ++--
 drivers/gpu/drm/i915/display/intel_quirks.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_vga.c       |  8 ++++----
 drivers/gpu/drm/i915/gem/i915_gem_phys.c       |  6 +++---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c      |  2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c      |  2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c           | 10 +++++-----
 drivers/gpu/drm/i915/gt/intel_ppgtt.c          |  2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c            |  4 ++--
 drivers/gpu/drm/i915/gt/intel_region_lmem.c    |  8 ++++----
 drivers/gpu/drm/i915/gt/intel_reset.c          |  6 +++---
 drivers/gpu/drm/i915/gvt/cfg_space.c           |  5 +++--
 drivers/gpu/drm/i915/gvt/firmware.c            | 10 +++++-----
 drivers/gpu/drm/i915/gvt/gtt.c                 | 12 ++++++------
 drivers/gpu/drm/i915/gvt/gvt.c                 |  6 +++---
 drivers/gpu/drm/i915/gvt/kvmgt.c               |  4 ++--
 drivers/gpu/drm/i915/i915_debugfs.c            |  2 +-
 drivers/gpu/drm/i915/i915_drv.c                | 19 +++++++++----------
 drivers/gpu/drm/i915/i915_drv.h                |  2 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c            |  5 ++---
 drivers/gpu/drm/i915/i915_getparam.c           |  5 +++--
 drivers/gpu/drm/i915/i915_gpu_error.c          |  2 +-
 drivers/gpu/drm/i915/i915_irq.c                |  6 +++---
 drivers/gpu/drm/i915/i915_pmu.c                |  2 +-
 drivers/gpu/drm/i915/i915_suspend.c            |  4 ++--
 drivers/gpu/drm/i915/i915_switcheroo.c         |  4 ++--
 drivers/gpu/drm/i915/i915_vgpu.c               |  2 +-
 drivers/gpu/drm/i915/intel_device_info.c       |  2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c        |  2 +-
 drivers/gpu/drm/i915/intel_uncore.c            |  4 ++--
 drivers/gpu/drm/i915/selftests/mock_gtt.c      |  2 +-
 41 files changed, 97 insertions(+), 96 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
