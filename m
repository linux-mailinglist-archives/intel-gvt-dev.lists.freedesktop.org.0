Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503193130F5
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  8 Feb 2021 12:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86ED06E8A0;
	Mon,  8 Feb 2021 11:34:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4B36E89E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Feb 2021 11:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612784083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=bJzjfpKQDXUTrhd/jJ7jwPu/B+J6oLNodRb+ffVR+9o=;
 b=GaPRBh+LmNI4+cEXi2hoSZs9g+A8lmxArx/weNJK5Fp4wrYa0CmKBIrZMpKPIjBWsFpE1W
 XNiLCdEtIdvVd/vUQKQFf5PKLxaiWO1T3bC4QGE/zXN0wY1u8kkxgXVWM/7pqMh3aIyhpJ
 /EJ9IGvqv/2NTgaIMCW7u7Csa45n5gs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-5S6thMDWOIORihOXxYxBhg-1; Mon, 08 Feb 2021 06:34:40 -0500
X-MC-Unique: 5S6thMDWOIORihOXxYxBhg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B54551005501;
 Mon,  8 Feb 2021 11:34:38 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E0A619C71;
 Mon,  8 Feb 2021 11:34:38 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	intel-gvt-dev@lists.freedesktop.org
Subject: [FYI PATCH] i915: kvmgt: the KVM mmu_lock is now an rwlock
Date: Mon,  8 Feb 2021 06:34:37 -0500
Message-Id: <20210208113437.94661-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Adjust the KVMGT page tracking callbacks.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 60f1a386dd06..b4348256ae95 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1703,7 +1703,7 @@ static int kvmgt_page_track_add(unsigned long handle, u64 gfn)
 		return -EINVAL;
 	}
 
-	spin_lock(&kvm->mmu_lock);
+	write_lock(&kvm->mmu_lock);
 
 	if (kvmgt_gfn_is_write_protected(info, gfn))
 		goto out;
@@ -1712,7 +1712,7 @@ static int kvmgt_page_track_add(unsigned long handle, u64 gfn)
 	kvmgt_protect_table_add(info, gfn);
 
 out:
-	spin_unlock(&kvm->mmu_lock);
+	write_unlock(&kvm->mmu_lock);
 	srcu_read_unlock(&kvm->srcu, idx);
 	return 0;
 }
@@ -1737,7 +1737,7 @@ static int kvmgt_page_track_remove(unsigned long handle, u64 gfn)
 		return -EINVAL;
 	}
 
-	spin_lock(&kvm->mmu_lock);
+	write_lock(&kvm->mmu_lock);
 
 	if (!kvmgt_gfn_is_write_protected(info, gfn))
 		goto out;
@@ -1746,7 +1746,7 @@ static int kvmgt_page_track_remove(unsigned long handle, u64 gfn)
 	kvmgt_protect_table_del(info, gfn);
 
 out:
-	spin_unlock(&kvm->mmu_lock);
+	write_unlock(&kvm->mmu_lock);
 	srcu_read_unlock(&kvm->srcu, idx);
 	return 0;
 }
@@ -1772,7 +1772,7 @@ static void kvmgt_page_track_flush_slot(struct kvm *kvm,
 	struct kvmgt_guest_info *info = container_of(node,
 					struct kvmgt_guest_info, track_node);
 
-	spin_lock(&kvm->mmu_lock);
+	write_lock(&kvm->mmu_lock);
 	for (i = 0; i < slot->npages; i++) {
 		gfn = slot->base_gfn + i;
 		if (kvmgt_gfn_is_write_protected(info, gfn)) {
@@ -1781,7 +1781,7 @@ static void kvmgt_page_track_flush_slot(struct kvm *kvm,
 			kvmgt_protect_table_del(info, gfn);
 		}
 	}
-	spin_unlock(&kvm->mmu_lock);
+	write_unlock(&kvm->mmu_lock);
 }
 
 static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu, struct kvm *kvm)
-- 
2.26.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
