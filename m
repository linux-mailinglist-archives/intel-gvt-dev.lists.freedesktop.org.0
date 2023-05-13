Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18923701310
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 02:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9302A10E6FE;
	Sat, 13 May 2023 00:36:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD7910E6F8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 13 May 2023 00:36:14 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-b9a776a5eb2so23525449276.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 May 2023 17:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683938173; x=1686530173;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=yTF+WvdTXOp88OUwMxHsF/SYvL5GAznXpvvOJVXr590=;
 b=6clpcNXwWNgtNSBv1Zuk/HmYC1Ks8Z/956BRzb0731I1kGR3sHKzRDOs8rAs55Rngl
 YjLuzIFPVOaWwOFhxj00mGWX5v6Y5zmAsUVKlXW9dSMnUWfihfWcGbsxx/I2Mc2dFlCS
 J+3sFb2ZQuySk4Nr8M3GUZT5mX/9hDwI6MGTbwWBC9pmh8tpW0cK1X1J7mShS6THXi8A
 gBFUR3R4cpv0GkJSakzcRj3FUOW+uJnd5/aAId1JxY0rey3Jwz0QtMgu91VHfSOlNnIq
 HDHMzpGoJrm3I37RuzzTHm+5Y46vQHC2/CO+XFbFRbayyHmQIA4qNF6KOlI4W61gzbsK
 1aVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683938173; x=1686530173;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yTF+WvdTXOp88OUwMxHsF/SYvL5GAznXpvvOJVXr590=;
 b=WCgL1l+jcvM8TYDMqG8U1KFWqVPJ2Rjyi1wDCbojdTsKfJJuW8kaMKQeUGEHnQ7ho4
 rL/iU8jR0bGwOg/G4iohF1nUDPymf4NqOtK0Xxrx6SY2KmKMuYuKkvdGMA+yt7iira0m
 Bf94/M1JjhYcOVMh+spr1V1cQIu/pxmQExMpfBnPyXFLy5fXaBW3quX0tqoOAkQI1sR4
 yUhR2C9TMB/HVeRHI1k4cM+q/Fhp34XrLkU1+oOQkjPCRp9ONyi02R/y6dq4C5HWg9qf
 IKC7YPz5MnzOrIVKmgMgyeK5EHZk8Ex5Q1ZQrEzYPgM/tnix9j0FYT8wjFrM32DHkr5B
 nVsA==
X-Gm-Message-State: AC+VfDwWIi7WQmhfJhX+Bh+Swkt1NlYU+5nAm2l35Aldc+6jkQBWRmVB
 islj7k+BXc5W7AmcvYO4G/4BXv1UGr8=
X-Google-Smtp-Source: ACHHUZ6sCXV5bYrQMueEEkeXbkChM3ieDdBL6hB5rVuoYaO/GqHC/qHdq6D5z3cP7chOjEQvwTelozt9YWI=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:824f:0:b0:b92:25bf:a6ba with SMTP id
 d15-20020a25824f000000b00b9225bfa6bamr12046826ybn.6.1683938173689; Fri, 12
 May 2023 17:36:13 -0700 (PDT)
Date: Fri, 12 May 2023 17:35:36 -0700
In-Reply-To: <20230513003600.818142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230513003600.818142-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230513003600.818142-5-seanjc@google.com>
Subject: [PATCH v3 04/28] drm/i915/gvt: Put the page reference obtained by
 KVM's gfn_to_pfn()
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

Put the struct page reference acquired by gfn_to_pfn(), KVM's API is that
the caller is ultimately responsible for dropping any reference.

Note, kvm_release_pfn_clean() ensures the pfn is actually a refcounted
struct page before trying to put any references.

Fixes: b901b252b6cf ("drm/i915/gvt: Add 2M huge gtt support")
Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index f30922c55a0c..5426a27c1b71 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1158,6 +1158,7 @@ static int is_2MB_gtt_possible(struct intel_vgpu *vgpu,
 {
 	const struct intel_gvt_gtt_pte_ops *ops = vgpu->gvt->gtt.pte_ops;
 	kvm_pfn_t pfn;
+	int ret;
 
 	if (!HAS_PAGE_SIZES(vgpu->gvt->gt->i915, I915_GTT_PAGE_SIZE_2M))
 		return 0;
@@ -1171,7 +1172,9 @@ static int is_2MB_gtt_possible(struct intel_vgpu *vgpu,
 	if (!pfn_valid(pfn))
 		return -EINVAL;
 
-	return PageTransHuge(pfn_to_page(pfn));
+	ret = PageTransHuge(pfn_to_page(pfn));
+	kvm_release_pfn_clean(pfn);
+	return ret;
 }
 
 static int split_2MB_gtt_entry(struct intel_vgpu *vgpu,
-- 
2.40.1.606.ga4b1b128d6-goog

