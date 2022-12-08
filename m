Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF152646CAC
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  8 Dec 2022 11:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935C710E488;
	Thu,  8 Dec 2022 10:23:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1771C10E1B8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  8 Dec 2022 10:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670495016; x=1702031016;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y7nGX22PA+rQbHDJYZMRS2/DYN80Rjwv/zXkQ3D09uo=;
 b=J1CvIuWgpr4Qa0vdjBByllJdi6J56fV9Qnu59hMEr1WEtTDWzEMAq2cd
 sas8X3TqdtvO1UTEBVFVnfBAI3o/F7fqBPAPxwkzee1AuUwqz2NUDEStn
 3vLYSWWNSNQf0ic4EfooeXlzLF/fKIal4JCgoTTelChR0s+/irKhQUgGI
 /g61G6taAA2yVm+A/9xm00diZfG10foT9RliJeqOTrhv/jfPcaUkcx5lr
 gL6+5vGhHiGsiD3BvSNXqR4xBRcZKOgvfhMP0Rk9BJCa8FqmtcTw/r+DL
 jBTXGUXFcv1X6VSe76nYeeuHM+a38rtUyThBtaMm4stkfh/kANbMdoP6q g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="300549735"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="300549735"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 02:23:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="597295190"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="597295190"
Received: from debian-skl.sh.intel.com ([10.239.159.40])
 by orsmga003.jf.intel.com with ESMTP; 08 Dec 2022 02:23:33 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: fix gvt debugfs destroy
Date: Thu,  8 Dec 2022 18:33:29 +0800
Message-Id: <20221208103329.733843-1-zhenyuw@linux.intel.com>
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
Cc: Yu <yu.he@intel.com>, Wang@freedesktop.org,
	Zhi <zhi.a.wang@intel.com>, He@freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

When gvt debug fs is destroyed, need to have a sane check if drm
minor's debugfs root is still available or not, otherwise in case like
device remove through unbinding, drm minor's debugfs directory has
already been removed, then intel_gvt_debugfs_clean() would act upon
dangling pointer like below oops.

[   48.067618] i915 0000:00:02.0: Direct firmware load for i915/gvt/vid_0x8086_did_0x1926_rid_0x0a.golden_hw_state failed with error -2
[   48.070156] i915 0000:00:02.0: MDEV: Registered
[   52.966222] Console: switching to colour dummy device 80x25
[   53.403599] i915 0000:00:02.0: MDEV: Unregistering
[   53.403730] BUG: kernel NULL pointer dereference, address: 00000000000000a0
[   53.403735] #PF: supervisor write access in kernel mode
[   53.403738] #PF: error_code(0x0002) - not-present page
[   53.403740] PGD 0 P4D 0
[   53.403744] Oops: 0002 [#1] PREEMPT SMP PTI
[   53.403749] CPU: 2 PID: 2486 Comm: gfx-unbind.sh Tainted: G          I        6.1.0-rc8+ #15
[   53.403754] Hardware name: Dell Inc. XPS 13 9350/0JXC1H, BIOS 1.13.0 02/10/2020
[   53.403756] RIP: 0010:down_write+0x1f/0x90
[   53.403763] Code: 1d ff ff 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 53 48 89 fb e8 62 c0 ff ff bf 01 00 00 00 e8 28 5e 31 ff 31 c0 ba 01 00 00 00 <f0> 48 0f b1 13 75 33 65 48 8b 04 25 c0 bd 01 00 48 89 43 08 bf 01
[   53.403767] RSP: 0018:ffff9eb3036ffcc8 EFLAGS: 00010246
[   53.403771] RAX: 0000000000000000 RBX: 00000000000000a0 RCX: ffffff8100000000
[   53.403774] RDX: 0000000000000001 RSI: 0000000000000064 RDI: ffffffffa48787a8
[   53.403776] RBP: ffff9eb3036ffd30 R08: ffffeb1fc45a0608 R09: ffffeb1fc45a05c0
[   53.403779] R10: 0000000000000002 R11: 0000000000000000 R12: 0000000000000000
[   53.403781] R13: ffff91acc33fa328 R14: ffff91acc033f080 R15: ffff91acced533e0
[   53.403784] FS:  00007f6947bba740(0000) GS:ffff91ae36d00000(0000) knlGS:0000000000000000
[   53.403788] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   53.403791] CR2: 00000000000000a0 CR3: 00000001133a2002 CR4: 00000000003706e0
[   53.403794] Call Trace:
[   53.403797]  <TASK>
[   53.403800]  simple_recursive_removal+0x9f/0x2a0
[   53.403808]  ? start_creating.part.0+0x120/0x120
[   53.403815]  ? _raw_spin_lock+0x13/0x40
[   53.403820]  debugfs_remove+0x40/0x60
[   53.403826]  intel_gvt_debugfs_clean+0x15/0x30 [kvmgt]
[   53.403848]  intel_gvt_clean_device+0x49/0xe0 [kvmgt]
[   53.403871]  intel_gvt_driver_remove+0x2f/0xb0
[   53.403876]  i915_driver_remove+0xa4/0xf0
[   53.403882]  i915_pci_remove+0x1a/0x30
[   53.403886]  pci_device_remove+0x33/0xa0
[   53.403892]  device_release_driver_internal+0x1b2/0x230
[   53.403897]  unbind_store+0xe0/0x110
[   53.403903]  kernfs_fop_write_iter+0x11b/0x1f0
[   53.403909]  vfs_write+0x203/0x3d0
[   53.403917]  ksys_write+0x63/0xe0
[   53.403923]  do_syscall_64+0x37/0x90
[   53.403928]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   53.403933] RIP: 0033:0x7f6947cb5190
[   53.403938] Code: 40 00 48 8b 15 71 9c 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 80 3d 51 24 0e 00 00 74 17 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 58 c3 0f 1f 80 00 00 00 00 48 83 ec 28 48 89
[   53.403942] RSP: 002b:00007ffcbac45a28 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
[   53.403946] RAX: ffffffffffffffda RBX: 000000000000000d RCX: 00007f6947cb5190
[   53.403949] RDX: 000000000000000d RSI: 0000555e35c866a0 RDI: 0000000000000001
[   53.403951] RBP: 0000555e35c866a0 R08: 0000000000000002 R09: 0000555e358cb97c
[   53.403954] R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000001
[   53.403956] R13: 000000000000000d R14: 0000000000000000 R15: 0000555e358cb8e0
[   53.403962]  </TASK>
[   53.403963] Modules linked in: kvmgt
[   53.403968] CR2: 00000000000000a0
[   53.403971] ---[ end trace 0000000000000000 ]---

Cc: Wang, Zhi <zhi.a.wang@intel.com>
Cc: He, Yu <yu.he@intel.com>
Fixes: bc7b0be316ae ("drm/i915/gvt: Add basic debugfs infrastructure")
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/debugfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
index dfef822fdae0..e64d97e44716 100644
--- a/drivers/gpu/drm/i915/gvt/debugfs.c
+++ b/drivers/gpu/drm/i915/gvt/debugfs.c
@@ -216,6 +216,10 @@ void intel_gvt_debugfs_init(struct intel_gvt *gvt)
  */
 void intel_gvt_debugfs_clean(struct intel_gvt *gvt)
 {
-	debugfs_remove_recursive(gvt->debugfs_root);
-	gvt->debugfs_root = NULL;
+	struct drm_minor *minor = gvt->gt->i915->drm.primary;
+
+	if (minor->debugfs_root) {
+		debugfs_remove_recursive(gvt->debugfs_root);
+		gvt->debugfs_root = NULL;
+	}
 }
-- 
2.38.1

