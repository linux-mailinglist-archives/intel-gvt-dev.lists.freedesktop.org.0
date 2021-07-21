Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E553D12F9
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 17:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962656E97A;
	Wed, 21 Jul 2021 15:56:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7A86E97A;
 Wed, 21 Jul 2021 15:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=PnGazbkMILDlY2dmvVf2Dbu68RGpRc1d01GKi5SAMKQ=; b=IHVxAnFWEJ9b8dCqx26Op5JJdW
 Gkwf3wQaqyN0HrexW31oD/Puv7vwatNvUPIEdQjjviEvWM8n6IaRfBfypGwa0Izog9LQoDwOlNWIC
 JrDRym4ahvcLNFy832Pe2FPdJ4/nWjl4R8089gl2aHMy12A+X6y61enOkK8n1prDTfW3p3eVbZsf7
 CiEytjOVIuXMCQZkVTDTYMQNRPOHJ+Qp/B/AWNtriX7fFCIxxhNDYza06nErwjoPEFbfq1aYpC+kC
 cfOIEn1YHa/fl/hnVVnx74xl1xSwbKs4z3/3lAOHnF+NjExAejfnvAmduiJr2TL4bBiMLtVgks/IR
 RVYdKjyg==;
Received: from [2001:4bb8:193:7660:d6d5:72f4:23f7:1898] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6EZq-009MMc-J3; Wed, 21 Jul 2021 15:56:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 07/21] drm/i915/gvt: remove the unused from_virt_to_mfn op
Date: Wed, 21 Jul 2021 17:53:41 +0200
Message-Id: <20210721155355.173183-8-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210721155355.173183-1-hch@lst.de>
References: <20210721155355.173183-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/hypercall.h |  1 -
 drivers/gpu/drm/i915/gvt/kvmgt.c     |  6 ------
 drivers/gpu/drm/i915/gvt/mpt.h       | 12 ------------
 3 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index f1a4926f6f1b..27890a5e2d82 100644
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
index 935d1c8287a4..d1f3f1253306 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -2173,11 +2173,6 @@ static int kvmgt_write_gpa(unsigned long handle, unsigned long gpa,
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
@@ -2204,7 +2199,6 @@ static const struct intel_gvt_mpt kvmgt_mpt = {
 	.attach_vgpu = kvmgt_attach_vgpu,
 	.detach_vgpu = kvmgt_detach_vgpu,
 	.inject_msi = kvmgt_inject_msi,
-	.from_virt_to_mfn = kvmgt_virt_to_pfn,
 	.enable_page_track = kvmgt_page_track_add,
 	.disable_page_track = kvmgt_page_track_remove,
 	.read_gpa = kvmgt_read_gpa,
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index bb0e9e71d13e..6d062cf71de9 100644
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

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
