Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C76767AE8
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Jul 2023 03:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1538410E227;
	Sat, 29 Jul 2023 01:36:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D53410E222
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Jul 2023 01:36:00 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-1bbf8cb6250so2497455ad.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jul 2023 18:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690594559; x=1691199359;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=yKFNVWvZd8ycnHIIUhm7WcUF006NBJ3bRU9zYbxCvZs=;
 b=kMH1cT4bUctLtbih7U6lNmQ7TMWE1ptjjULHApVJ+5eO1/rUv3egzhxIOAbEGAUS+z
 aR27dZMS5oxxbo5wkujg4HYN0l3vETV/JtE856K4OH2L0ML0JLAC8HEtNy4v85zhkXsk
 V72HPPAqxBOQ5/60jQ0SkxybXk02iF49rK6lo7boMPZ3sPotQpNbscJGbpExHWEMRCia
 YhRJDjeid0xCqdFVlAE2GYpoX5xZdQJXHeIvwomjCws7Nmh1DwO+gp6F9NxDpD7L8Z5a
 jvqi//4ebv1Nb/3GDojKqBA21sWbeVsbf9R7dXFJjzjVhPkFzw8z6nIOYyRBoc09y38g
 Swrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690594559; x=1691199359;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yKFNVWvZd8ycnHIIUhm7WcUF006NBJ3bRU9zYbxCvZs=;
 b=HL4+LHVgTyuPIFtXN10mCjjd3DEyBeiVy+rHFwLeX9qInwVc1XQYtiHrB+8JEHsX9P
 +zsJw3A1YT+JpIQ3NU9W7MOtUfH0nCbEkC5/wn/JLm7xwc9bUXM3t4aEk15NTx5f/H0L
 tLZY0wbatQwAYbTvmRaxSm3i8lWDQUMqNi/IDr3gBYZs4RsFde6z+NaLJDGXV4fU8cBt
 3BtzkbaVUCl1EPIA8q0ySsIKO+N1c20qzEkZU5eIyYbUkXdWAbnmTzOlreNUAk6lomBz
 3gAnDmm/2AX/aps23m8ncvgUyurSZVjxcuvwx2WX1/O5hA1OZs8M5KNEASatBv6XAiyt
 Ckig==
X-Gm-Message-State: ABy/qLb+pFvLFVMiptmfjVeJjtlWE1fe2ga95ZZNoaxcDhoqHf5sdcwK
 48cWAbVkZl4G/GHdXFTseB5qEA+cdjk=
X-Google-Smtp-Source: APBJJlFWen3lQ3cmRaZrUyyIaurSrlZuOlAtXBPQLhFof4MhjdOJgNDIYw2Tdp2naKk9drdI6A5UkEV18ww=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d511:b0:1b9:ce2c:3bb0 with SMTP id
 b17-20020a170902d51100b001b9ce2c3bb0mr12784plg.3.1690594559715; Fri, 28 Jul
 2023 18:35:59 -0700 (PDT)
Date: Fri, 28 Jul 2023 18:35:14 -0700
In-Reply-To: <20230729013535.1070024-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230729013535.1070024-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230729013535.1070024-9-seanjc@google.com>
Subject: [PATCH v4 08/29] drm/i915/gvt: Don't rely on KVM's gfn_to_pfn() to
 query possible 2M GTT
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
 Yongwei Ma <yongwei.ma@intel.com>, Ben Gardon <bgardon@google.com>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Now that gvt_pin_guest_page() explicitly verifies the pinned PFN is a
transparent hugepage page, don't use KVM's gfn_to_pfn() to pre-check if a
2MiB GTT entry is possible and instead just try to map the GFN with a 2MiB
entry.  Using KVM to query pfn that is ultimately managed through VFIO is
odd, and KVM's gfn_to_pfn() is not intended for non-KVM consumption; it's
exported only because of KVM vendor modules (x86 and PPC).

Open code the check on 2MiB support instead of keeping
is_2MB_gtt_possible() around for a single line of code.

Move the call to intel_gvt_dma_map_guest_page() for a 4KiB entry into its
case statement, i.e. fork the common path into the 4KiB and 2MiB "direct"
shadow paths.  Keeping the call in the "common" path is arguably more in
the spirit of "one change per patch", but retaining the local "page_size"
variable is silly, i.e. the call site will be changed either way, and
jumping around the no-longer-common code is more subtle and rather odd,
i.e. would just need to be immediately cleaned up.

Drop the error message from gvt_pin_guest_page() when KVMGT attempts to
shadow a 2MiB guest page that isn't backed by a compatible hugepage in the
host.  Dropping the pre-check on a THP makes it much more likely that the
"error" will be encountered in normal operation.

Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Tested-by: Yan Zhao <yan.y.zhao@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c   | 49 ++++++--------------------------
 drivers/gpu/drm/i915/gvt/kvmgt.c |  1 -
 2 files changed, 8 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 61e38acee2d5..f505be9e647a 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1145,36 +1145,6 @@ static inline void ppgtt_generate_shadow_entry(struct intel_gvt_gtt_entry *se,
 	ops->set_pfn(se, s->shadow_page.mfn);
 }
 
-/*
- * Check if can do 2M page
- * @vgpu: target vgpu
- * @entry: target pfn's gtt entry
- *
- * Return 1 if 2MB huge gtt shadowing is possible, 0 if miscondition,
- * negative if found err.
- */
-static int is_2MB_gtt_possible(struct intel_vgpu *vgpu,
-	struct intel_gvt_gtt_entry *entry)
-{
-	const struct intel_gvt_gtt_pte_ops *ops = vgpu->gvt->gtt.pte_ops;
-	kvm_pfn_t pfn;
-	int ret;
-
-	if (!HAS_PAGE_SIZES(vgpu->gvt->gt->i915, I915_GTT_PAGE_SIZE_2M))
-		return 0;
-
-	pfn = gfn_to_pfn(vgpu->vfio_device.kvm, ops->get_pfn(entry));
-	if (is_error_noslot_pfn(pfn))
-		return -EINVAL;
-
-	if (!pfn_valid(pfn))
-		return -EINVAL;
-
-	ret = PageTransHuge(pfn_to_page(pfn));
-	kvm_release_pfn_clean(pfn);
-	return ret;
-}
-
 static int split_2MB_gtt_entry(struct intel_vgpu *vgpu,
 	struct intel_vgpu_ppgtt_spt *spt, unsigned long index,
 	struct intel_gvt_gtt_entry *se)
@@ -1268,7 +1238,7 @@ static int ppgtt_populate_shadow_entry(struct intel_vgpu *vgpu,
 {
 	const struct intel_gvt_gtt_pte_ops *pte_ops = vgpu->gvt->gtt.pte_ops;
 	struct intel_gvt_gtt_entry se = *ge;
-	unsigned long gfn, page_size = PAGE_SIZE;
+	unsigned long gfn;
 	dma_addr_t dma_addr;
 	int ret;
 
@@ -1283,6 +1253,9 @@ static int ppgtt_populate_shadow_entry(struct intel_vgpu *vgpu,
 	switch (ge->type) {
 	case GTT_TYPE_PPGTT_PTE_4K_ENTRY:
 		gvt_vdbg_mm("shadow 4K gtt entry\n");
+		ret = intel_gvt_dma_map_guest_page(vgpu, gfn, PAGE_SIZE, &dma_addr);
+		if (ret)
+			return -ENXIO;
 		break;
 	case GTT_TYPE_PPGTT_PTE_64K_ENTRY:
 		gvt_vdbg_mm("shadow 64K gtt entry\n");
@@ -1294,12 +1267,10 @@ static int ppgtt_populate_shadow_entry(struct intel_vgpu *vgpu,
 		return split_64KB_gtt_entry(vgpu, spt, index, &se);
 	case GTT_TYPE_PPGTT_PTE_2M_ENTRY:
 		gvt_vdbg_mm("shadow 2M gtt entry\n");
-		ret = is_2MB_gtt_possible(vgpu, ge);
-		if (ret == 0)
+		if (!HAS_PAGE_SIZES(vgpu->gvt->gt->i915, I915_GTT_PAGE_SIZE_2M) ||
+		    intel_gvt_dma_map_guest_page(vgpu, gfn,
+						 I915_GTT_PAGE_SIZE_2M, &dma_addr))
 			return split_2MB_gtt_entry(vgpu, spt, index, &se);
-		else if (ret < 0)
-			return ret;
-		page_size = I915_GTT_PAGE_SIZE_2M;
 		break;
 	case GTT_TYPE_PPGTT_PTE_1G_ENTRY:
 		gvt_vgpu_err("GVT doesn't support 1GB entry\n");
@@ -1309,11 +1280,7 @@ static int ppgtt_populate_shadow_entry(struct intel_vgpu *vgpu,
 		return -EINVAL;
 	}
 
-	/* direct shadow */
-	ret = intel_gvt_dma_map_guest_page(vgpu, gfn, page_size, &dma_addr);
-	if (ret)
-		return -ENXIO;
-
+	/* Successfully shadowed a 4K or 2M page (without splitting). */
 	pte_ops->set_pfn(&se, dma_addr >> PAGE_SHIFT);
 	ppgtt_set_shadow_entry(spt, &se, index);
 	return 0;
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 0366a699baf5..97c6d3c53710 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -162,7 +162,6 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		if (npage == 0)
 			base_page = cur_page;
 		else if (page_to_pfn(base_page) + npage != page_to_pfn(cur_page)) {
-			gvt_vgpu_err("The pages are not continuous\n");
 			ret = -EINVAL;
 			npage++;
 			goto err;
-- 
2.41.0.487.g6d72f3e995-goog

