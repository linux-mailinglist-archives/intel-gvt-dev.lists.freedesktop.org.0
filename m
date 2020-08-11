Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0227124155A
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Aug 2020 05:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B40F8986D;
	Tue, 11 Aug 2020 03:35:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28EC8986D;
 Tue, 11 Aug 2020 03:35:56 +0000 (UTC)
IronPort-SDR: DrVC6NqOFfCBQ2zkzj1tu+XI3xtMdQEGjADEAMsuEgZ0u1e3Jp6akokVPkBtQh3iOPVbA54BIu
 1oPqim8GKxkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="141272286"
X-IronPort-AV: E=Sophos;i="5.75,459,1589266800"; d="scan'208";a="141272286"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2020 20:35:54 -0700
IronPort-SDR: W0RSI5kUWbl6cM5nTRNXHAg6wKs4FEqKXRBiatQ0ekCrtbw5yika5J44z1XGBF7sKtoufVFtdK
 JzuhU4nJAzLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,459,1589266800"; d="scan'208";a="324641732"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 10 Aug 2020 20:35:51 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com
Subject: [PATCH] drm/i915/gt:fix raw-wakeref not held calltrace in vGPU
Date: Tue, 11 Aug 2020 11:02:09 +0800
Message-Id: <20200811030209.21058-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 zhenyuw@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UNCORE_HAS_FORCEWAKE is not turned on when intel_vgpu_active() returns
true, so the guest mmio writes go to gen2_write32().

 ------------[ cut here ]------------
 RPM raw-wakeref not held
 WARNING: CPU: 1 PID: 6375 at drivers/gpu/drm/i915/intel_runtime_pm.h:106
 gen2_write32+0x10b/0x140 [i915]
 Modules linked in: intel_rapl_msr intel_rapl_common kvm_intel crct10dif_pclmul
 crc32_pclmul ghash_clmulni_intel aesni_intel crypto_simd cryptd glue_helper
 intel_rapl_perf joydev input_leds qemu_fw_cfg mac_hid serio_raw sch_fq_codel
 parport_pc ppdev lp parport ip_tables x_tables autofs4 vfio_mdev mdev kvm
 hid_generic usbhid hid i915 video i2c_algo_bit drm_kms_helper syscopyarea
 psmouse sysfillrect sysimgblt fb_sys_fops cec rc_core floppy drm e1000
 pata_acpi i2c_piix4
 CPU: 1 PID: 6375 Comm: Xorg.wrap Not tainted 5.7.0-050700-generic
 #202005312130
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
 BIOS rel-1.13.0-0-gf21b5a4 04/01/2014
 RIP: 0010:gen2_write32+0x10b/0x140 [i915]
 Code: 76 f4 f8 0f 0b e9 46 ff ff ff 80 3d 82 18 1a 00 00 0f 85 43 ff ff ff 48
 c7 c7 42 81 4b c0 c6 05 6e 18 1a 00 01 e8 ba 76 f4 f8 <0f> 0b e9 29 ff ff ff
 80 3d 5a 18 1a 00 00 0f 85 26 ff ff ff 48 c7
 RSP: 0018:ffffb67400aef9e8 EFLAGS: 00010282
 RAX: 0000000000000000 RBX: 0000000000078838 RCX: 0000000000000007
 RDX: 0000000000000007 RSI: 0000000000000082 RDI: ffff9ae47bd19c80
 RBP: ffffb67400aefa10 R08: 00000000000002b9 R09: 0000000000000004
 R10: 0000000000000000 R11: 0000000000000001 R12: ffff9ae46e3e07b8
 R13: 0000000000000000 R14: ffff9ae46e3e0000 R15: 0000000035cd5000
 FS:  00007f9ec20c4740(0000) GS:ffff9ae47bd00000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 00007f9ec2125760 CR3: 000000010e120003 CR4: 0000000000360ee0
 DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
 DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
 Call Trace:
  gen8_ppgtt_notify_vgt+0x95/0x190 [i915]
  gen8_ppgtt_create+0x3c7/0x440 [i915]
  i915_ppgtt_create+0x7d/0x90 [i915]
  i915_gem_create_context+0x2c0/0x3a8 [i915]
  i915_gem_context_open+0x59/0xc0 [i915]
  i915_gem_open+0x8b/0xc0 [i915]
  i915_driver_open+0xe/0x10 [i915]
  drm_file_alloc+0x199/0x260 [drm]
  drm_open+0xcf/0x260 [drm]
  drm_stub_open+0xaa/0xe0 [drm]
  chrdev_open+0xd3/0x1c0
  ? cdev_default_release+0x20/0x20
  do_dentry_open+0x143/0x3a0
  vfs_open+0x2d/0x30
  path_openat+0xb1c/0x10f0
  ? filemap_map_pages+0x22f/0x370
  do_filp_open+0x91/0x100
  ? __alloc_fd+0xb8/0x150
  do_sys_openat2+0x210/0x2d0
  do_sys_open+0x46/0x80
  __x64_sys_openat+0x20/0x30
  do_syscall_64+0x57/0x1d0
  entry_SYSCALL_64_after_hwframe+0x44/0xa9
 RIP: 0033:0x7f9ec22cda5b
 Code: 25 00 00 41 00 3d 00 00 41 00 74 4b 64 8b 04 25 18 00 00 00
85 c0 75 67 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0
ff ff 0f 87 91 00 00 00 48 8b 4c 24 28 64 48 33 0c 25
 RSP: 002b:00007ffd2f2a3960 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
 RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f9ec22cda5b
 RDX: 0000000000000002 RSI: 00007ffd2f2a3ae0 RDI: 00000000ffffff9c
 RBP: 00007ffd2f2a3ae0 R08: 0000000000000000 R09: 00007ffd2f2a3870
 R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
 R13: 0000000000000000 R14: 0000000000000000 R15: 00007ffd2f2a3a00
 ---[ end trace 110b629471bd16dd ]---

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 699125928272..3fc3488c127f 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -55,6 +55,7 @@ static void gen8_ppgtt_notify_vgt(struct i915_ppgtt *ppgtt, bool create)
 	struct drm_i915_private *i915 = ppgtt->vm.i915;
 	struct intel_uncore *uncore = ppgtt->vm.gt->uncore;
 	enum vgt_g2v_type msg;
+	intel_wakeref_t wakeref;
 	int i;
 
 	if (create)
@@ -62,6 +63,7 @@ static void gen8_ppgtt_notify_vgt(struct i915_ppgtt *ppgtt, bool create)
 	else
 		atomic_dec(px_used(ppgtt->pd));
 
+	wakeref = intel_runtime_pm_get(uncore->rpm);
 	mutex_lock(&i915->vgpu.lock);
 
 	if (i915_vm_is_4lvl(&ppgtt->vm)) {
@@ -96,6 +98,7 @@ static void gen8_ppgtt_notify_vgt(struct i915_ppgtt *ppgtt, bool create)
 	intel_uncore_write(uncore, vgtif_reg(g2v_notify), msg);
 
 	mutex_unlock(&i915->vgpu.lock);
+	intel_runtime_pm_put(uncore->rpm, wakeref);
 }
 
 /* Index shifts into the pagetable are offset by GEN8_PTE_SHIFT [12] */
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
