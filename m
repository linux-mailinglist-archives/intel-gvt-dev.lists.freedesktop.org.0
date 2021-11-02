Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF16A442783
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Nov 2021 08:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387816FAB6;
	Tue,  2 Nov 2021 07:06:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152696FAB5;
 Tue,  2 Nov 2021 07:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=pzXJtYJF8kU7tW8+Q5PuIu5OuLzOiaBMTNaEqGd52Gs=; b=aTWDp50XZeNTu83GO61I5WXanl
 J3Lym0Pz3SqnejOiePXrs/YlEeQ1Wvi9dUis3rjcwFGptD6Tw1oHPR70Y5Z54ZWL++ECHP1UK+dq2
 R8nF8f/gCQVHAvYhIW6oqxmlEXA3poJ7gZNcRWRXY8WgonVNyZOOGPX8TEsXREA4aR1dlEx+HJltF
 4Zp4aGJugsWs84BUHv/DUn+zmywsOT5MkB0A5wUbDtZV7GZ7IiK5FcLVX24P18G9Oe1oBIO7yZiYK
 KZZalj8XcRxhh8hlvjCBsc2ZEugafUk2NN/cW+/y5BfL6FAtudpmHhHM4SrfzxPsD3JMe1sHOxGVr
 DTQEFmuA==;
Received: from 213-225-15-89.nat.highway.a1.net ([213.225.15.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhnsM-000i21-7t; Tue, 02 Nov 2021 07:06:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 04/29] drm/i915/gvt: remove enum hypervisor_type
Date: Tue,  2 Nov 2021 08:05:36 +0100
Message-Id: <20211102070601.155501-5-hch@lst.de>
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

The only supported hypervisor is KVM, so don't bother with dead code
enumerating hypervisors.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/gvt.c       |  17 +--
 drivers/gpu/drm/i915/gvt/gvt.h       |   1 -
 drivers/gpu/drm/i915/gvt/hypercall.h |   6 --
 drivers/gpu/drm/i915/gvt/kvmgt.c     |   1 -
 drivers/gpu/drm/i915/gvt/opregion.c  | 150 ++++++---------------------
 5 files changed, 34 insertions(+), 141 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index 6d7938aacca4d..ee09bba970af6 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -41,11 +41,6 @@
 
 struct intel_gvt_host intel_gvt_host;
 
-static const char * const supported_hypervisors[] = {
-	[INTEL_GVT_HYPERVISOR_XEN] = "XEN",
-	[INTEL_GVT_HYPERVISOR_KVM] = "KVM",
-};
-
 static const struct intel_gvt_ops intel_gvt_ops = {
 	.emulate_cfg_read = intel_vgpu_emulate_cfg_read,
 	.emulate_cfg_write = intel_vgpu_emulate_cfg_write,
@@ -304,23 +299,13 @@ intel_gvt_register_hypervisor(const struct intel_gvt_mpt *m)
 	if (!intel_gvt_host.initialized)
 		return -ENODEV;
 
-	if (m->type != INTEL_GVT_HYPERVISOR_KVM &&
-	    m->type != INTEL_GVT_HYPERVISOR_XEN)
-		return -EINVAL;
-
 	intel_gvt_host.mpt = m;
-	intel_gvt_host.hypervisor_type = m->type;
 	gvt = (void *)kdev_to_i915(intel_gvt_host.dev)->gvt;
 
 	ret = intel_gvt_hypervisor_host_init(intel_gvt_host.dev, gvt,
 					     &intel_gvt_ops);
-	if (ret < 0) {
-		gvt_err("Failed to init %s hypervisor module\n",
-			supported_hypervisors[intel_gvt_host.hypervisor_type]);
+	if (ret < 0)
 		return -ENODEV;
-	}
-	gvt_dbg_core("Running with hypervisor %s in host mode\n",
-		     supported_hypervisors[intel_gvt_host.hypervisor_type]);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(intel_gvt_register_hypervisor);
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 0c0615602343a..9b9fdbf9df10d 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -59,7 +59,6 @@
 struct intel_gvt_host {
 	struct device *dev;
 	bool initialized;
-	int hypervisor_type;
 	const struct intel_gvt_mpt *mpt;
 };
 
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index f33e3cbd0439d..3179831536458 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -37,17 +37,11 @@
 
 struct device;
 
-enum hypervisor_type {
-	INTEL_GVT_HYPERVISOR_XEN = 0,
-	INTEL_GVT_HYPERVISOR_KVM,
-};
-
 /*
  * Specific GVT-g MPT modules function collections. Currently GVT-g supports
  * both Xen and KVM by providing dedicated hypervisor-related MPT modules.
  */
 struct intel_gvt_mpt {
-	enum hypervisor_type type;
 	int (*host_init)(struct device *dev, void *gvt, const void *ops);
 	void (*host_exit)(struct device *dev, void *gvt);
 	int (*attach_vgpu)(void *vgpu, unsigned long *handle);
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 7efa386449d10..904f9a31bd3a9 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -2204,7 +2204,6 @@ static bool kvmgt_is_valid_gfn(unsigned long handle, unsigned long gfn)
 }
 
 static const struct intel_gvt_mpt kvmgt_mpt = {
-	.type = INTEL_GVT_HYPERVISOR_KVM,
 	.host_init = kvmgt_host_init,
 	.host_exit = kvmgt_host_exit,
 	.attach_vgpu = kvmgt_attach_vgpu,
diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
index 33569b910ed5b..286ac6d7c6ced 100644
--- a/drivers/gpu/drm/i915/gvt/opregion.c
+++ b/drivers/gpu/drm/i915/gvt/opregion.c
@@ -255,33 +255,6 @@ int intel_vgpu_init_opregion(struct intel_vgpu *vgpu)
 	return 0;
 }
 
-static int map_vgpu_opregion(struct intel_vgpu *vgpu, bool map)
-{
-	u64 mfn;
-	int i, ret;
-
-	for (i = 0; i < INTEL_GVT_OPREGION_PAGES; i++) {
-		mfn = intel_gvt_hypervisor_virt_to_mfn(vgpu_opregion(vgpu)->va
-			+ i * PAGE_SIZE);
-		if (mfn == INTEL_GVT_INVALID_ADDR) {
-			gvt_vgpu_err("fail to get MFN from VA\n");
-			return -EINVAL;
-		}
-		ret = intel_gvt_hypervisor_map_gfn_to_mfn(vgpu,
-				vgpu_opregion(vgpu)->gfn[i],
-				mfn, 1, map);
-		if (ret) {
-			gvt_vgpu_err("fail to map GFN to MFN, errno: %d\n",
-				ret);
-			return ret;
-		}
-	}
-
-	vgpu_opregion(vgpu)->mapped = map;
-
-	return 0;
-}
-
 /**
  * intel_vgpu_opregion_base_write_handler - Opregion base register write handler
  *
@@ -294,34 +267,13 @@ static int map_vgpu_opregion(struct intel_vgpu *vgpu, bool map)
 int intel_vgpu_opregion_base_write_handler(struct intel_vgpu *vgpu, u32 gpa)
 {
 
-	int i, ret = 0;
+	int i;
 
 	gvt_dbg_core("emulate opregion from kernel\n");
 
-	switch (intel_gvt_host.hypervisor_type) {
-	case INTEL_GVT_HYPERVISOR_KVM:
-		for (i = 0; i < INTEL_GVT_OPREGION_PAGES; i++)
-			vgpu_opregion(vgpu)->gfn[i] = (gpa >> PAGE_SHIFT) + i;
-		break;
-	case INTEL_GVT_HYPERVISOR_XEN:
-		/**
-		 * Wins guest on Xengt will write this register twice: xen
-		 * hvmloader and windows graphic driver.
-		 */
-		if (vgpu_opregion(vgpu)->mapped)
-			map_vgpu_opregion(vgpu, false);
-
-		for (i = 0; i < INTEL_GVT_OPREGION_PAGES; i++)
-			vgpu_opregion(vgpu)->gfn[i] = (gpa >> PAGE_SHIFT) + i;
-
-		ret = map_vgpu_opregion(vgpu, true);
-		break;
-	default:
-		ret = -EINVAL;
-		gvt_vgpu_err("not supported hypervisor\n");
-	}
-
-	return ret;
+	for (i = 0; i < INTEL_GVT_OPREGION_PAGES; i++)
+		vgpu_opregion(vgpu)->gfn[i] = (gpa >> PAGE_SHIFT) + i;
+	return 0;
 }
 
 /**
@@ -336,12 +288,7 @@ void intel_vgpu_clean_opregion(struct intel_vgpu *vgpu)
 	if (!vgpu_opregion(vgpu)->va)
 		return;
 
-	if (intel_gvt_host.hypervisor_type == INTEL_GVT_HYPERVISOR_XEN) {
-		if (vgpu_opregion(vgpu)->mapped)
-			map_vgpu_opregion(vgpu, false);
-	} else if (intel_gvt_host.hypervisor_type == INTEL_GVT_HYPERVISOR_KVM) {
-		/* Guest opregion is released by VFIO */
-	}
+	/* Guest opregion is released by VFIO */
 	free_pages((unsigned long)vgpu_opregion(vgpu)->va,
 		   get_order(INTEL_GVT_OPREGION_SIZE));
 
@@ -470,39 +417,22 @@ int intel_vgpu_emulate_opregion_request(struct intel_vgpu *vgpu, u32 swsci)
 	u64 scic_pa = 0, parm_pa = 0;
 	int ret;
 
-	switch (intel_gvt_host.hypervisor_type) {
-	case INTEL_GVT_HYPERVISOR_XEN:
-		scic = *((u32 *)vgpu_opregion(vgpu)->va +
-					INTEL_GVT_OPREGION_SCIC);
-		parm = *((u32 *)vgpu_opregion(vgpu)->va +
-					INTEL_GVT_OPREGION_PARM);
-		break;
-	case INTEL_GVT_HYPERVISOR_KVM:
-		scic_pa = (vgpu_opregion(vgpu)->gfn[0] << PAGE_SHIFT) +
-					INTEL_GVT_OPREGION_SCIC;
-		parm_pa = (vgpu_opregion(vgpu)->gfn[0] << PAGE_SHIFT) +
-					INTEL_GVT_OPREGION_PARM;
-
-		ret = intel_gvt_hypervisor_read_gpa(vgpu, scic_pa,
-						    &scic, sizeof(scic));
-		if (ret) {
-			gvt_vgpu_err("guest opregion read error %d, gpa 0x%llx, len %lu\n",
-				ret, scic_pa, sizeof(scic));
-			return ret;
-		}
-
-		ret = intel_gvt_hypervisor_read_gpa(vgpu, parm_pa,
-						    &parm, sizeof(parm));
-		if (ret) {
-			gvt_vgpu_err("guest opregion read error %d, gpa 0x%llx, len %lu\n",
-				ret, scic_pa, sizeof(scic));
-			return ret;
-		}
+	scic_pa = (vgpu_opregion(vgpu)->gfn[0] << PAGE_SHIFT) +
+				INTEL_GVT_OPREGION_SCIC;
+	parm_pa = (vgpu_opregion(vgpu)->gfn[0] << PAGE_SHIFT) +
+				INTEL_GVT_OPREGION_PARM;
+	ret = intel_gvt_hypervisor_read_gpa(vgpu, scic_pa, &scic, sizeof(scic));
+	if (ret) {
+		gvt_vgpu_err("guest opregion read error %d, gpa 0x%llx, len %lu\n",
+			ret, scic_pa, sizeof(scic));
+		return ret;
+	}
 
-		break;
-	default:
-		gvt_vgpu_err("not supported hypervisor\n");
-		return -EINVAL;
+	ret = intel_gvt_hypervisor_read_gpa(vgpu, parm_pa, &parm, sizeof(parm));
+	if (ret) {
+		gvt_vgpu_err("guest opregion read error %d, gpa 0x%llx, len %lu\n",
+			ret, scic_pa, sizeof(scic));
+		return ret;
 	}
 
 	if (!(swsci & SWSCI_SCI_SELECT)) {
@@ -535,34 +465,20 @@ int intel_vgpu_emulate_opregion_request(struct intel_vgpu *vgpu, u32 swsci)
 	parm = 0;
 
 out:
-	switch (intel_gvt_host.hypervisor_type) {
-	case INTEL_GVT_HYPERVISOR_XEN:
-		*((u32 *)vgpu_opregion(vgpu)->va +
-					INTEL_GVT_OPREGION_SCIC) = scic;
-		*((u32 *)vgpu_opregion(vgpu)->va +
-					INTEL_GVT_OPREGION_PARM) = parm;
-		break;
-	case INTEL_GVT_HYPERVISOR_KVM:
-		ret = intel_gvt_hypervisor_write_gpa(vgpu, scic_pa,
-						    &scic, sizeof(scic));
-		if (ret) {
-			gvt_vgpu_err("guest opregion write error %d, gpa 0x%llx, len %lu\n",
-				ret, scic_pa, sizeof(scic));
-			return ret;
-		}
-
-		ret = intel_gvt_hypervisor_write_gpa(vgpu, parm_pa,
-						    &parm, sizeof(parm));
-		if (ret) {
-			gvt_vgpu_err("guest opregion write error %d, gpa 0x%llx, len %lu\n",
-				ret, scic_pa, sizeof(scic));
-			return ret;
-		}
+	ret = intel_gvt_hypervisor_write_gpa(vgpu, scic_pa, &scic,
+					     sizeof(scic));
+	if (ret) {
+		gvt_vgpu_err("guest opregion write error %d, gpa 0x%llx, len %lu\n",
+			ret, scic_pa, sizeof(scic));
+		return ret;
+	}
 
-		break;
-	default:
-		gvt_vgpu_err("not supported hypervisor\n");
-		return -EINVAL;
+	ret = intel_gvt_hypervisor_write_gpa(vgpu, parm_pa, &parm,
+					     sizeof(parm));
+	if (ret) {
+		gvt_vgpu_err("guest opregion write error %d, gpa 0x%llx, len %lu\n",
+			ret, scic_pa, sizeof(scic));
+		return ret;
 	}
 
 	return 0;
-- 
2.30.2

