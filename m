Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595C9477D96
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Dec 2021 21:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2AC10EE1D;
	Thu, 16 Dec 2021 20:29:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB23210EE1D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 16 Dec 2021 20:29:07 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id d10so308142lfg.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 16 Dec 2021 12:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=4OcUmHI+oHxdqmOfJo5AEnLgfzH0c7c4yHeoO87Dctw=;
 b=jIVKTVhBlPmt8gDIvFYv6xcIF109cLmhOEr5nXUyfcnf0WN89LSn9NmKDe9pGa71Bl
 /0174XOWr3aa/GEecTAhz/yBC1yzC77e7N4JwwQivBa/7WOP4YiMoBFyP0XIJsP7+fuK
 0uSSKvmGuBQezr1bDHloP7FOdb/qMdI56yQw9vOvvohhn+6iFfydoqS+ImVrk6Y7UOyr
 ahPSr/7T6ubipsr3GZGbqZNjNsmH6g3uJrDS+wLQYRmOfsf3Od3JBYximlZW+jPnsV+5
 MwFFufDGJQbEc4/6BeXkZtQHFEq4AUyTkQXJHuJLRrmiKjLwuPFhKsKZqX3sH5XlL3EK
 wirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=4OcUmHI+oHxdqmOfJo5AEnLgfzH0c7c4yHeoO87Dctw=;
 b=S+EwaNl66tcPDXWWsb8RNnwV95Yus2ZPRzih/NVgWmfHyHee3SP4vCTtiJfdNuCxGV
 TlBgM/g1flGsaO1oPpWAiFOxz61V0e31l3QfNwSP16350zvQQSX22pilfpUL/R4Uecgt
 +coCWuWXweaC3mfurBuvHyWEYax1ze3giDLrLKONd/aTUh/d1X0w5fQWE5mSEPru9vva
 +V2alZ+zIAfIQpddJsfGSHZwU4jThr9XmRtRr1tQQ2Bxj70qPaR1Qed/Ew94ZNC62+qz
 acuop9xfmHZB0Vq1iVSgZI+axekAz4TtbDw0v3Ns41s6703ckhEz7dA7l6VtEebUmB3D
 8kpQ==
X-Gm-Message-State: AOAM531RQ56y8QlbL22+uJIz7r1yoKBI9RF4V5/915465VnVvIhV31NR
 y0voNATR7a7rutKN5jiRSlr/wSs4HscS9g==
X-Google-Smtp-Source: ABdhPJxxI1u+Pj+kOiV32+0lqjx72b4XbTrw4FNrcmLAjxvFrYdpcE0xRj9+JvuC/JLA5j9UfJct4A==
X-Received: by 2002:a05:6512:3290:: with SMTP id
 p16mr783618lfe.507.1639686546186; 
 Thu, 16 Dec 2021 12:29:06 -0800 (PST)
Received: from zhiwang1-mobl.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74])
 by smtp.gmail.com with ESMTPSA id d4sm1032355lfg.82.2021.12.16.12.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 12:29:05 -0800 (PST)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: zhenyuw@linux.intel.com, zhi.a.wang@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] i915/gvt: Stop tracking the pages of page table when failing
 to do shadow.
Date: Thu, 16 Dec 2021 15:29:00 -0500
Message-Id: <20211216202900.1111-1-zhi.a.wang@intel.com>
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

The PPGTT page table inside a VM will be tracked when created. When a
tracked page is modified, GVT-g will update the shadow page table
accordingly.

Sometimes, the guest will free a page belongs to a PPGTT page table, but
doesn't unbind the page from its upper level. So the page is still
tracked. Later that page might be allocated to other clients, which causes
a flood of garbage traps. As the page has been used for other purpose,
doing the shadow on this page will always fail, which causes the error
"guest page write error".

The patch will identify this case by counting the times of failure of
doing shadow on a tracked page. If the times of failure is larger than
3, GVT-g will stop tracking the page and release the sub level of the
shadow pages accordingly.

Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 62 ++++++++++++++++++++++------------
 drivers/gpu/drm/i915/gvt/gtt.h |  1 +
 2 files changed, 41 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index d7054bfb3e7d..fbfa5b8f1544 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -778,6 +778,21 @@ static void ppgtt_free_all_spt(struct intel_vgpu *vgpu)
 		ppgtt_free_spt(spt);
 }
 
+static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, bool force);
+
+static void ppgtt_handle_invalid_spt(struct intel_vgpu_ppgtt_spt *spt)
+{
+	if (spt->fail_cnt > 3) {
+		ppgtt_invalidate_spt(spt, true);
+	} else
+		spt->fail_cnt++;
+}
+
+static void ppgtt_set_spt_valid(struct intel_vgpu_ppgtt_spt *spt)
+{
+	spt->fail_cnt = 0;
+}
+
 static int ppgtt_handle_guest_write_page_table_bytes(
 		struct intel_vgpu_ppgtt_spt *spt,
 		u64 pa, void *p_data, int bytes);
@@ -791,12 +806,18 @@ static int ppgtt_write_protection_handler(
 	int ret;
 
 	if (bytes != 4 && bytes != 8)
-		return -EINVAL;
+		goto invalid_spt;
 
 	ret = ppgtt_handle_guest_write_page_table_bytes(spt, gpa, data, bytes);
 	if (ret)
-		return ret;
-	return ret;
+		goto invalid_spt;
+
+	ppgtt_set_spt_valid(spt);
+	return 0;
+
+invalid_spt:
+	ppgtt_handle_invalid_spt(spt);
+	return 0;
 }
 
 /* Find a spt by guest gfn. */
@@ -941,10 +962,8 @@ static inline int ppgtt_put_spt(struct intel_vgpu_ppgtt_spt *spt)
 	return atomic_dec_return(&spt->refcount);
 }
 
-static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);
-
 static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
-		struct intel_gvt_gtt_entry *e)
+		struct intel_gvt_gtt_entry *e, bool force)
 {
 	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
 	const struct intel_gvt_gtt_pte_ops *ops = vgpu->gvt->gtt.pte_ops;
@@ -973,11 +992,11 @@ static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
 	}
 	s = intel_vgpu_find_spt_by_mfn(vgpu, ops->get_pfn(e));
 	if (!s) {
-		gvt_vgpu_err("fail to find shadow page: mfn: 0x%lx\n",
+		gvt_dbg_mm("fail to find shadow page: mfn: 0x%lx\n",
 				ops->get_pfn(e));
-		return -ENXIO;
+		return 0;
 	}
-	return ppgtt_invalidate_spt(s);
+	return ppgtt_invalidate_spt(s, force);
 }
 
 static inline void ppgtt_invalidate_pte(struct intel_vgpu_ppgtt_spt *spt,
@@ -998,9 +1017,8 @@ static inline void ppgtt_invalidate_pte(struct intel_vgpu_ppgtt_spt *spt,
 	intel_gvt_hypervisor_dma_unmap_guest_page(vgpu, pfn << PAGE_SHIFT);
 }
 
-static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
+static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, bool force)
 {
-	struct intel_vgpu *vgpu = spt->vgpu;
 	struct intel_gvt_gtt_entry e;
 	unsigned long index;
 	int ret;
@@ -1008,7 +1026,7 @@ static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
 	trace_spt_change(spt->vgpu->id, "die", spt,
 			spt->guest_page.gfn, spt->shadow_page.type);
 
-	if (ppgtt_put_spt(spt) > 0)
+	if (!force && ppgtt_put_spt(spt) > 0)
 		return 0;
 
 	for_each_present_shadow_entry(spt, &e, index) {
@@ -1032,7 +1050,7 @@ static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
 		case GTT_TYPE_PPGTT_PDE_ENTRY:
 			gvt_vdbg_mm("invalidate PMUL4/PDP/PDE entry\n");
 			ret = ppgtt_invalidate_spt_by_shadow_entry(
-					spt->vgpu, &e);
+					spt->vgpu, &e, force);
 			if (ret)
 				goto fail;
 			break;
@@ -1046,7 +1064,7 @@ static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
 	ppgtt_free_spt(spt);
 	return 0;
 fail:
-	gvt_vgpu_err("fail: shadow page %p shadow entry 0x%llx type %d\n",
+	gvt_dbg_mm("fail: shadow page %p shadow entry 0x%llx type %d\n",
 			spt, e.val64, e.type);
 	return ret;
 }
@@ -1196,7 +1214,7 @@ static int split_2MB_gtt_entry(struct intel_vgpu *vgpu,
 		ret = intel_gvt_hypervisor_dma_map_guest_page(vgpu,
 				start_gfn + sub_index, PAGE_SIZE, &dma_addr);
 		if (ret) {
-			ppgtt_invalidate_spt(spt);
+			ppgtt_invalidate_spt(spt, false);
 			return ret;
 		}
 		sub_se.val64 = se->val64;
@@ -1371,11 +1389,11 @@ static int ppgtt_handle_guest_entry_removal(struct intel_vgpu_ppgtt_spt *spt,
 		struct intel_vgpu_ppgtt_spt *s =
 			intel_vgpu_find_spt_by_mfn(vgpu, ops->get_pfn(se));
 		if (!s) {
-			gvt_vgpu_err("fail to find guest page\n");
-			ret = -ENXIO;
+			gvt_dbg_mm("fail to find guest page\n");
+			ret = 0;
 			goto fail;
 		}
-		ret = ppgtt_invalidate_spt(s);
+		ret = ppgtt_invalidate_spt(s, false);
 		if (ret)
 			goto fail;
 	} else {
@@ -1387,7 +1405,7 @@ static int ppgtt_handle_guest_entry_removal(struct intel_vgpu_ppgtt_spt *spt,
 
 	return 0;
 fail:
-	gvt_vgpu_err("fail: shadow page %p guest entry 0x%llx type %d\n",
+	gvt_dbg_mm("fail: shadow page %p guest entry 0x%llx type %d\n",
 			spt, se->val64, se->type);
 	return ret;
 }
@@ -1422,7 +1440,7 @@ static int ppgtt_handle_guest_entry_add(struct intel_vgpu_ppgtt_spt *spt,
 	}
 	return 0;
 fail:
-	gvt_vgpu_err("fail: spt %p guest entry 0x%llx type %d\n",
+	gvt_dbg_mm("fail: spt %p guest entry 0x%llx type %d\n",
 		spt, we->val64, we->type);
 	return ret;
 }
@@ -1653,7 +1671,7 @@ static int ppgtt_handle_guest_write_page_table(
 
 	return 0;
 fail:
-	gvt_vgpu_err("fail: shadow page %p guest entry 0x%llx type %d.\n",
+	gvt_dbg_mm("fail: shadow page %p guest entry 0x%llx type %d.\n",
 			spt, we->val64, we->type);
 	return ret;
 }
@@ -1798,7 +1816,7 @@ static void invalidate_ppgtt_mm(struct intel_vgpu_mm *mm)
 		if (!ops->test_present(&se))
 			continue;
 
-		ppgtt_invalidate_spt_by_shadow_entry(vgpu, &se);
+		ppgtt_invalidate_spt_by_shadow_entry(vgpu, &se, false);
 		se.val64 = 0;
 		ppgtt_set_shadow_root_entry(mm, &se, index);
 
diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gtt.h
index a3b0f59ec8bd..8b02ff5d9651 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.h
+++ b/drivers/gpu/drm/i915/gvt/gtt.h
@@ -263,6 +263,7 @@ struct intel_vgpu_ppgtt_spt {
 	} guest_page;
 
 	DECLARE_BITMAP(post_shadow_bitmap, GTT_ENTRY_NUM_IN_ONE_PAGE);
+	unsigned long fail_cnt;
 	struct list_head post_shadow_list;
 };
 
-- 
2.17.1

