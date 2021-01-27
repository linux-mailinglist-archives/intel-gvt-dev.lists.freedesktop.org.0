Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42581305BB0
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 27 Jan 2021 13:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BAC6E19B;
	Wed, 27 Jan 2021 12:41:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067136E101;
 Wed, 27 Jan 2021 12:41:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92CCBABDA;
 Wed, 27 Jan 2021 12:41:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com
Subject: [PATCH v5 0/5] drm: Move struct drm_device.pdev to legacy
Date: Wed, 27 Jan 2021 13:41:30 +0100
Message-Id: <20210127124135.11750-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
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
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

For v5, I moved the non-assignment of pdev in i915 into a separate
patch as suggested by Chris. Hopefully, this will help with merging the
patches into the rsp i915 trees. The core and vmwgfx changes have been
merged into drm-tip already.

The pdev field in struct drm_device points to a PCI device structure and
goes back to UMS-only days when all DRM drivers were for PCI devices.
Meanwhile we also support USB, SPI and platform devices. Each of those
uses the generic device stored in struct drm_device.dev.

To reduce duplication and remove the special case of PCI, this patchset
converts all modesetting drivers from pdev to dev and makes pdev a field
for legacy UMS drivers.

For PCI devices, the pointer in struct drm_device.dev can be upcasted to
struct pci_device; or tested for PCI with dev_is_pci(). In several places
the code can use the dev field directly.

After converting all drivers and the DRM core, the pdev fields becomes
only relevant for legacy drivers. In a later patchset, we may want to
convert these as well and remove pdev entirely.

v5:
	* remove assignment in later patch (Chris)
v4:
	* merged several patches
	* moved core changes into separate patch
	* vmwgfx build fix
v3:
	* merged several patches
	* fix one pdev reference in nouveau (Jeremy)
	* rebases
v2:
	* move whitespace fixes into separate patches (Alex, Sam)
	* move i915 gt/ and gvt/ changes into separate patches (Joonas)

Thomas Zimmermann (5):
  drm/i915: Remove references to struct drm_device.pdev
  drm/i915/gt: Remove references to struct drm_device.pdev
  drm/i915/gvt: Remove references to struct drm_device.pdev
  drm/i915: Don't assign to struct drm_device.pdev
  drm: Move struct drm_device.pdev to legacy section

 drivers/gpu/drm/i915/display/intel_bios.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 14 ++++++-------
 drivers/gpu/drm/i915/display/intel_csr.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  2 +-
 .../gpu/drm/i915/display/intel_lpe_audio.c    |  5 +++--
 drivers/gpu/drm/i915/display/intel_opregion.c |  6 +++---
 drivers/gpu/drm/i915/display/intel_overlay.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_panel.c    |  4 ++--
 drivers/gpu/drm/i915/display/intel_quirks.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_vga.c      |  8 ++++----
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  6 +++---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 10 +++++-----
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c           |  4 ++--
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  8 ++++----
 drivers/gpu/drm/i915/gt/intel_reset.c         |  6 +++---
 drivers/gpu/drm/i915/gvt/cfg_space.c          |  5 +++--
 drivers/gpu/drm/i915/gvt/firmware.c           | 10 +++++-----
 drivers/gpu/drm/i915/gvt/gtt.c                | 12 +++++------
 drivers/gpu/drm/i915/gvt/gvt.c                |  6 +++---
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  4 ++--
 drivers/gpu/drm/i915/i915_debugfs.c           |  2 +-
 drivers/gpu/drm/i915/i915_drv.c               | 20 +++++++++----------
 drivers/gpu/drm/i915/i915_drv.h               |  2 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c           |  5 ++---
 drivers/gpu/drm/i915/i915_getparam.c          |  5 +++--
 drivers/gpu/drm/i915/i915_gpu_error.c         |  2 +-
 drivers/gpu/drm/i915/i915_irq.c               |  6 +++---
 drivers/gpu/drm/i915/i915_pmu.c               |  2 +-
 drivers/gpu/drm/i915/i915_suspend.c           |  4 ++--
 drivers/gpu/drm/i915/i915_switcheroo.c        |  4 ++--
 drivers/gpu/drm/i915/i915_vgpu.c              |  2 +-
 drivers/gpu/drm/i915/intel_device_info.c      |  2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c       |  2 +-
 drivers/gpu/drm/i915/intel_uncore.c           |  4 ++--
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  1 -
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |  2 +-
 include/drm/drm_device.h                      |  6 +++---
 43 files changed, 100 insertions(+), 101 deletions(-)


base-commit: 3836b7fdfad40e2bac5dc882332f42bed6942cf4
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
--
2.30.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
