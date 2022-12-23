Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD8A654A0E
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Dec 2022 01:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086B410E601;
	Fri, 23 Dec 2022 00:57:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C92410E5F1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Dec 2022 00:57:56 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 y6-20020a25b9c6000000b006c1c6161716so3624859ybj.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Dec 2022 16:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=bmfAlTw7KPee5BT5ARosoNOxp58PoziaZSGblHMcfn4=;
 b=amS6AkiqMBz2E56adUfZiZ0qlzFza/fJe6yjksEjN98poxV1G9yKoHPq4XyIgUDl6W
 b0j6KpXbhKHQIta4bAmN85o52XADQ8scOEOZSLR5KbrWNt/rUmlxexxrVEftn9sSpavR
 D/DVLsAt87QaZI94sXNT6csbY/FBT+eVhyy3di1Vx8TMTAiJc1tP+z0E7pDkuhB2ozgN
 PpCTfzSt+VrBnQFSog2A7devVxciaxdcDmjgsHqiNCufShQRC4ex5XadOqvSOrUJCwA0
 +AJG0WHNAN/z7DeX5h4b84L91y+VXfruFFfgNxuCH7pE6WWTh8H8aE2+WdP6oyi1ga2f
 FmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bmfAlTw7KPee5BT5ARosoNOxp58PoziaZSGblHMcfn4=;
 b=5iCuTb2cujvsIUACUaDBqPce+4bdTIrNNvKxMgv21svrG1OS8w+UBdN1af9cBFCqUg
 iNP6HSWP1A8qcuZNV2pB4oZ2OOamuC3hwBWp60uwcg7Xmf2v4MQJoQ/jEbWWPa1t9ZsW
 ymdMz0gR5LQGvjSs4MpZYpK7lLe4a/UVExANNPnrF6ZLkYmuV6cfR26eKXbAH3QQqUDs
 IFPAySj2OxKlYjd17vO0TeDj6OusSBCpJlVpNua0OwcpXqjj7oyK+fONwK8sQNcIgJMO
 NuH4SO0nj/A/I++xuw3nMzmYOdKGMMOAGW3tzhYDVIwK/snMwWrOjKJjUwbbE4jIC0Si
 J7BQ==
X-Gm-Message-State: AFqh2krG1cJ1rw47rWqsPSwQicCjUnGsb3ge50uhRfWEmNikwxpd7Mz6
 8DD+ahQwAwcwiAu5GV12l5pKm0GBl5M=
X-Google-Smtp-Source: AMrXdXuelVqYRvBCw91exHE5VvR3XEOzgowyFkxm9PKa7uAoxnrWKeIzL7byPsTWp4O1/ngYmKJObusY+/c=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:582:b0:466:a29c:3cf7 with SMTP id
 bo2-20020a05690c058200b00466a29c3cf7mr450161ywb.270.1671757075486; Thu, 22
 Dec 2022 16:57:55 -0800 (PST)
Date: Fri, 23 Dec 2022 00:57:18 +0000
In-Reply-To: <20221223005739.1295925-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221223005739.1295925-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221223005739.1295925-7-seanjc@google.com>
Subject: [PATCH 06/27] drm/i915/gvt: Don't rely on KVM's gfn_to_pfn() to query
 possible 2M GTT
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ben Gardon <bgardon@google.com>, intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Now that gvt_pin_guest_page() explicitly verifies the pinned PFN is a
transparent hugepage page, don't use KVM's gfn_to_pfn() to pre-check if a
2M GTT entry is possible and instead just try to map the GFN with a 2MB
entry.  Using KVM to query pfn that is ultimately managed through VFIO is
odd, and KVM's gfn_to_pfn() is not intended for non-KVM consumption; it's
exported only because of KVM vendor modules (x86 and PPC).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 9936f8bd19af..59ba6639e622 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1167,21 +1167,19 @@ static inline void ppgtt_generate_shadow_entry(struct intel_gvt_gtt_entry *se,
 }
 
 /*
- * Check if can do 2M page
+ * Try to map a 2M gtt entry.
  * @vgpu: target vgpu
  * @entry: target pfn's gtt entry
  *
- * Return 1 if 2MB huge gtt shadowing is possible, 0 if miscondition,
- * negative if found err.
+ * Return 1 if 2MB huge gtt shadow was creation, 0 if the entry needs to be
+ * split, negative if found err.
  */
-static int is_2MB_gtt_possible(struct intel_vgpu *vgpu,
-	struct intel_gvt_gtt_entry *entry)
+static int try_map_2MB_gtt_entry(struct intel_vgpu *vgpu,
+	struct intel_gvt_gtt_entry *entry, dma_addr_t *dma_addr)
 {
 	const struct intel_gvt_gtt_pte_ops *ops = vgpu->gvt->gtt.pte_ops;
 	unsigned long gfn = ops->get_pfn(entry);
-	kvm_pfn_t pfn;
 	int max_level;
-	int ret;
 
 	if (!HAS_PAGE_SIZES(vgpu->gvt->gt->i915, I915_GTT_PAGE_SIZE_2M))
 		return 0;
@@ -1194,16 +1192,7 @@ static int is_2MB_gtt_possible(struct intel_vgpu *vgpu,
 	if (max_level < PG_LEVEL_2M)
 		return 0;
 
-	pfn = gfn_to_pfn(vgpu->vfio_device.kvm, gfn);
-	if (is_error_noslot_pfn(pfn))
-		return -EINVAL;
-
-	if (!pfn_valid(pfn))
-		return -EINVAL;
-
-	ret = PageTransHuge(pfn_to_page(pfn));
-	kvm_release_pfn_clean(pfn);
-	return ret;
+	return intel_gvt_dma_map_guest_page(vgpu, gfn, I915_GTT_PAGE_SIZE_2M, dma_addr);
 }
 
 static int split_2MB_gtt_entry(struct intel_vgpu *vgpu,
@@ -1290,7 +1279,7 @@ static int ppgtt_populate_shadow_entry(struct intel_vgpu *vgpu,
 {
 	const struct intel_gvt_gtt_pte_ops *pte_ops = vgpu->gvt->gtt.pte_ops;
 	struct intel_gvt_gtt_entry se = *ge;
-	unsigned long gfn, page_size = PAGE_SIZE;
+	unsigned long gfn;
 	dma_addr_t dma_addr;
 	int ret;
 
@@ -1313,13 +1302,12 @@ static int ppgtt_populate_shadow_entry(struct intel_vgpu *vgpu,
 		return split_64KB_gtt_entry(vgpu, spt, index, &se);
 	case GTT_TYPE_PPGTT_PTE_2M_ENTRY:
 		gvt_vdbg_mm("shadow 2M gtt entry\n");
-		ret = is_2MB_gtt_possible(vgpu, ge);
+		ret = try_map_2MB_gtt_entry(vgpu, ge, &dma_addr);
 		if (ret == 0)
 			return split_2MB_gtt_entry(vgpu, spt, index, &se);
 		else if (ret < 0)
 			return ret;
-		page_size = I915_GTT_PAGE_SIZE_2M;
-		break;
+		goto set_shadow_entry;
 	case GTT_TYPE_PPGTT_PTE_1G_ENTRY:
 		gvt_vgpu_err("GVT doesn't support 1GB entry\n");
 		return -EINVAL;
@@ -1328,10 +1316,11 @@ static int ppgtt_populate_shadow_entry(struct intel_vgpu *vgpu,
 	}
 
 	/* direct shadow */
-	ret = intel_gvt_dma_map_guest_page(vgpu, gfn, page_size, &dma_addr);
+	ret = intel_gvt_dma_map_guest_page(vgpu, gfn, PAGE_SIZE, &dma_addr);
 	if (ret)
 		return -ENXIO;
 
+set_shadow_entry:
 	pte_ops->set_pfn(&se, dma_addr >> PAGE_SHIFT);
 	ppgtt_set_shadow_entry(spt, &se, index);
 	return 0;
-- 
2.39.0.314.g84b9a713c41-goog

