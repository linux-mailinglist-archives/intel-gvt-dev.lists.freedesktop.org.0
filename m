Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF9A442792
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Nov 2021 08:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92086FAAC;
	Tue,  2 Nov 2021 07:07:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B7B6FAC0;
 Tue,  2 Nov 2021 07:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=EGS7dNldLDWNgkpklkyRhcSP+iPv8aSC+ihc+bbvJeQ=; b=jM2mBFMWl5eVjWGu6yfopBlwMb
 99YbMy2lJyJ4Zo/Z7X3FIwDNK+pNC9M2bQVkXw4VowjeDbRxXJ6YT0jcEMwHak5Cut/NoPt6k/1Pd
 bfJ6DeM+rIMqWbzfEDcY24lW0f3Izk+HKkTpFXUz9WVLLdEsMyrIjMnwV1xIDT8CdUz9MGLFy1U4Y
 aRmro7cwKUhBA0ELwtr4UGT+4SXlY5b++pn47tGB2fZ/lazCiuvyCEi7bMu/+Kn2OT7x9eadtp4vQ
 9xkfqOLdCOPKeJi+veDR/ZwGg+YsS8IG7s8EuvUVPHOiB9BGLC4gYKtaHErV0mtLWESqjJBz/qsgp
 TKY5Ku1Q==;
Received: from 213-225-15-89.nat.highway.a1.net ([213.225.15.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhnso-000i7e-Ha; Tue, 02 Nov 2021 07:06:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 09/29] drm/i915/gvt: remove the unused from_virt_to_mfn op
Date: Tue,  2 Nov 2021 08:05:41 +0100
Message-Id: <20211102070601.155501-10-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211102070601.155501-1-hch@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/hypercall.h |  1 -
 drivers/gpu/drm/i915/gvt/kvmgt.c     |  6 ------
 drivers/gpu/drm/i915/gvt/mpt.h       | 12 ------------
 3 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index f1a4926f6f1be..27890a5e2d828 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -47,7 +47,6 @@ struct intel_gvt_mpt {
 	int (*attach_vgpu)(void *vgpu, unsigned long *handle);
 	void (*detach_vgpu)(void *vgpu);
 	int (*inject_msi)(unsigned long handle, u32 addr, u16 data);
-	unsigned long (*from_virt_to_mfn)(void *p);
 	int (*enable_page_track)(unsigned long handle, u64 gfn);
 	int (*disable_page_track)(unsigned long handle, u64 gfn);
 	int (*read_gpa)(unsigned long handle, unsigned long gpa, void *buf,
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 8e06f3eecc440..61a107aeeb502 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -2174,11 +2174,6 @@ static int kvmgt_write_gpa(unsigned long handle, unsigned long gpa,
 	return kvmgt_rw_gpa(handle, gpa, buf, len, true);
 }
 
-static unsigned long kvmgt_virt_to_pfn(void *addr)
-{
-	return PFN_DOWN(__pa(addr));
-}
-
 static bool kvmgt_is_valid_gfn(unsigned long handle, unsigned long gfn)
 {
 	struct kvmgt_guest_info *info;
@@ -2205,7 +2200,6 @@ static const struct intel_gvt_mpt kvmgt_mpt = {
 	.attach_vgpu = kvmgt_attach_vgpu,
 	.detach_vgpu = kvmgt_detach_vgpu,
 	.inject_msi = kvmgt_inject_msi,
-	.from_virt_to_mfn = kvmgt_virt_to_pfn,
 	.enable_page_track = kvmgt_page_track_add,
 	.disable_page_track = kvmgt_page_track_remove,
 	.read_gpa = kvmgt_read_gpa,
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index bb0e9e71d13e2..6d062cf71de92 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -140,18 +140,6 @@ static inline int intel_gvt_hypervisor_inject_msi(struct intel_vgpu *vgpu)
 	return 0;
 }
 
-/**
- * intel_gvt_hypervisor_set_wp_page - translate a host VA into MFN
- * @p: host kernel virtual address
- *
- * Returns:
- * MFN on success, INTEL_GVT_INVALID_ADDR if failed.
- */
-static inline unsigned long intel_gvt_hypervisor_virt_to_mfn(void *p)
-{
-	return intel_gvt_host.mpt->from_virt_to_mfn(p);
-}
-
 /**
  * intel_gvt_hypervisor_enable_page_track - track a guest page
  * @vgpu: a vGPU
-- 
2.30.2

