Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 852C9646E04
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  8 Dec 2022 12:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1038110E1BA;
	Thu,  8 Dec 2022 11:06:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6F710E1BA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  8 Dec 2022 11:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670497602; x=1702033602;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uWnAizB3OS2d/mjbLLEd9PSbesIFyhUVUq8in4iVidk=;
 b=n2aK7kS84CtX5H+saq8aazJkVignSb2dE2rj1uczDTRhMIhUV9l30YjJ
 okQ6Iu674ZAK8JmoOijW0GTAhflqyP7+9U5yt6gK1uqCSrQy9dvGi602p
 PpHskKP2Yk8aq5WJdWGMzF05GC5Gca7wQNrVusqhFpSsEjF1Ek6rZeiU8
 8HPkP/IAzoU/Khqta1GF7zQKEsaPMSVJfDza2BvcBSlAaUfIBzRgSvdbP
 +Tmq7m16Qa+esiyCr7XNfQhD22wV4TU0KeM0PunDtSZTlKtVf4BRMyEeb
 JGnxZM2Xf+r857fQK3XFPJec4hOsGgvucDWm3nonq2vIQZyylcS7EfX5f A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="379305011"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="379305011"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 03:06:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="640588711"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="640588711"
Received: from debian-skl.sh.intel.com ([10.239.159.40])
 by orsmga007.jf.intel.com with ESMTP; 08 Dec 2022 03:06:39 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: fix vgpu debugfs clean in remove
Date: Thu,  8 Dec 2022 19:16:34 +0800
Message-Id: <20221208111634.734185-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Alex Williamson <alex.williamson@redhat.com>, He Yu <yu.he@intel.com>,
 Wang Zhi <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Check carefully on root debugfs available when destroying vgpu,
e.g in remove case drm minor's debugfs root might already be destroyed,
which led to kernel oops like below.

Console: switching to colour dummy device 80x25
i915 0000:00:02.0: MDEV: Unregistering
intel_vgpu_mdev b1338b2d-a709-4c23-b766-cc436c36cdf0: Removing from iommu group 14
BUG: kernel NULL pointer dereference, address: 0000000000000150
PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP
CPU: 3 PID: 1046 Comm: driverctl Not tainted 6.1.0-rc2+ #6
Hardware name: HP HP ProDesk 600 G3 MT/829D, BIOS P02 Ver. 02.44 09/13/2022
RIP: 0010:__lock_acquire+0x5e2/0x1f90
Code: 87 ad 09 00 00 39 05 e1 1e cc 02 0f 82 f1 09 00 00 ba 01 00 00 00 48 83 c4 48 89 d0 5b 5d 41 5c 41 5d 41 5e 41 5f c3 45 31 ff <48> 81 3f 60 9e c2 b6 45 0f 45 f8 83 fe 01 0f 87 55 fa ff ff 89 f0
RSP: 0018:ffff9f770274f948 EFLAGS: 00010046
RAX: 0000000000000003 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000150
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: ffff8895d1173300 R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000150 R14: 0000000000000000 R15: 0000000000000000
FS:  00007fc9b2ba0740(0000) GS:ffff889cdfcc0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000150 CR3: 000000010fd93005 CR4: 00000000003706e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 lock_acquire+0xbf/0x2b0
 ? simple_recursive_removal+0xa5/0x2b0
 ? lock_release+0x13d/0x2d0
 down_write+0x2a/0xd0
 ? simple_recursive_removal+0xa5/0x2b0
 simple_recursive_removal+0xa5/0x2b0
 ? start_creating.part.0+0x110/0x110
 ? _raw_spin_unlock+0x29/0x40
 debugfs_remove+0x40/0x60
 intel_gvt_debugfs_remove_vgpu+0x15/0x30 [kvmgt]
 intel_gvt_destroy_vgpu+0x60/0x100 [kvmgt]
 intel_vgpu_release_dev+0xe/0x20 [kvmgt]
 device_release+0x30/0x80
 kobject_put+0x79/0x1b0
 device_release_driver_internal+0x1b8/0x230
 bus_remove_device+0xec/0x160
 device_del+0x189/0x400
 ? up_write+0x9c/0x1b0
 ? mdev_device_remove_common+0x60/0x60 [mdev]
 mdev_device_remove_common+0x22/0x60 [mdev]
 mdev_device_remove_cb+0x17/0x20 [mdev]
 device_for_each_child+0x56/0x80
 mdev_unregister_parent+0x5a/0x81 [mdev]
 intel_gvt_clean_device+0x2d/0xe0 [kvmgt]
 intel_gvt_driver_remove+0x2e/0xb0 [i915]
 i915_driver_remove+0xac/0x100 [i915]
 i915_pci_remove+0x1a/0x30 [i915]
 pci_device_remove+0x31/0xa0
 device_release_driver_internal+0x1b8/0x230
 unbind_store+0xd8/0x100
 kernfs_fop_write_iter+0x156/0x210
 vfs_write+0x236/0x4a0
 ksys_write+0x61/0xd0
 do_syscall_64+0x55/0x80
 ? find_held_lock+0x2b/0x80
 ? lock_release+0x13d/0x2d0
 ? up_read+0x17/0x20
 ? lock_is_held_type+0xe3/0x140
 ? asm_exc_page_fault+0x22/0x30
 ? lockdep_hardirqs_on+0x7d/0x100
 entry_SYSCALL_64_after_hwframe+0x46/0xb0
RIP: 0033:0x7fc9b2c9e0c4
Code: 15 71 7d 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f 1e fa 80 3d 3d 05 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 48 83 ec 28 48 89 54 24 18 48
RSP: 002b:00007ffec29c81c8 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 000000000000000d RCX: 00007fc9b2c9e0c4
RDX: 000000000000000d RSI: 0000559f8b5f48a0 RDI: 0000000000000001
RBP: 0000559f8b5f48a0 R08: 0000559f8b5f3540 R09: 00007fc9b2d76d30
R10: 0000000000000000 R11: 0000000000000202 R12: 000000000000000d
R13: 00007fc9b2d77780 R14: 000000000000000d R15: 00007fc9b2d72a00
 </TASK>
Modules linked in: sunrpc intel_rapl_msr intel_rapl_common intel_pmc_core_pltdrv intel_pmc_core intel_tcc_cooling x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel ee1004 igbvf rapl vfat fat intel_cstate intel_uncore pktcdvd i2c_i801 pcspkr wmi_bmof i2c_smbus acpi_pad vfio_pci vfio_pci_core vfio_virqfd zram fuse dm_multipath kvmgt mdev vfio_iommu_type1 vfio kvm irqbypass i915 nvme e1000e igb nvme_core crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni polyval_generic serio_raw ghash_clmulni_intel sha512_ssse3 dca drm_buddy intel_gtt video wmi drm_display_helper ttm
CR2: 0000000000000150
---[ end trace 0000000000000000 ]---

Cc: Wang Zhi <zhi.a.wang@intel.com>
Cc: He Yu <yu.he@intel.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Fixes: bc7b0be316ae ("drm/i915/gvt: Add basic debugfs infrastructure")
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/debugfs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
index e64d97e44716..0616b73175f3 100644
--- a/drivers/gpu/drm/i915/gvt/debugfs.c
+++ b/drivers/gpu/drm/i915/gvt/debugfs.c
@@ -192,8 +192,13 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
  */
 void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu)
 {
-	debugfs_remove_recursive(vgpu->debugfs);
-	vgpu->debugfs = NULL;
+	struct intel_gvt *gvt = vgpu->gvt;
+	struct drm_minor *minor = gvt->gt->i915->drm.primary;
+
+	if (minor->debugfs_root && gvt->debugfs_root) {
+		debugfs_remove_recursive(vgpu->debugfs);
+		vgpu->debugfs = NULL;
+	}
 }
 
 /**
-- 
2.38.1

