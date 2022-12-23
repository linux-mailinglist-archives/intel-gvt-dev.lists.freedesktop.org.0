Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B7F6549ED
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Dec 2022 01:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1961F10E5F0;
	Fri, 23 Dec 2022 00:57:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4486510E5F0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Dec 2022 00:57:54 +0000 (UTC)
Received: by mail-pj1-x1049.google.com with SMTP id
 o18-20020a17090aac1200b00219ca917708so3996686pjq.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Dec 2022 16:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=NBTVXhB5C1LBSgUVZgx9DDnSqNxpCLvQp+2Tt7daAzY=;
 b=PlfdJuINIz79VbNXj96aWe6+xyqOcNWgoFfBKXO69TEmccmX1942p1Kyzpar864asr
 XDLlrV4h/z3yt7ub3l4JawTQViMgB+vso07ZoO5qPG8HZ8ZwZ79n9sNsdI9q2RoIwbeG
 AbHqwyDWwx9IAhFNAoqcInUGxLMtyU01VX9lvM0rmbSOQgWKiNnfERh1rh/elzAovs+8
 3y70iyzOvz/NxL9S/TaVq/aBs6+nmTg/gOUzTp23eWU84817bdw4cPSr/sXHXzdSEx8S
 P4Mp5+sUcRqXpTl/uiqPGeug+OSUTglz8ISXwjwtbnXBQir9/d83nYa1sF0t6p/+TDh4
 ciOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NBTVXhB5C1LBSgUVZgx9DDnSqNxpCLvQp+2Tt7daAzY=;
 b=ZHTgnTdPS1MKT9p94A+hwOH1lwdiKT0BXNlRgn6mUqauFimKqyCMsmjthqJqYUMC+y
 +o/YlGhc0CIM5TJqakTJiW6XXJO3e7BmkmK2xKNu/EyX2My/sV3RgiZPvhhJLKP6gCvY
 v52IaGe3641YyP66mZXQQUqc01vUFQr+n/HqQVzCfcGlAa+WZPQ/TLkl2rx9te0EWXMO
 GN1qfMczfQ3sRmVmuQjTefGh+Py40sxmAR8xnvOcP/qCCS5i7t4ybcqcYDVD7wJ+Ia7Q
 nteqL6D7/wIK0VEQnJ2tFrKQwKmoWzm0aPOtokipRPOvuRCrRF8Hb/NDQR8IVCgmgbjh
 ip8A==
X-Gm-Message-State: AFqh2kpPp9ghFWsx2y7p+52eb6+6caVPjlYQQtXKhizjB6i9l05imdJG
 553GU4XJbAsRLNaa6YhTPNnBuzDNcgQ=
X-Google-Smtp-Source: AMrXdXtuJpzQAA6YsAARKoo86Ndko68Bw/8PzP0Po4HgPrkiwdi87VkArdRLlydeD02n3c8sF2p0uUxApik=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c155:b0:189:9a71:109b with SMTP id
 21-20020a170902c15500b001899a71109bmr561626plj.171.1671757073922; Thu, 22 Dec
 2022 16:57:53 -0800 (PST)
Date: Fri, 23 Dec 2022 00:57:17 +0000
In-Reply-To: <20221223005739.1295925-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221223005739.1295925-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221223005739.1295925-6-seanjc@google.com>
Subject: [PATCH 05/27] drm/i915/gvt: Put the page reference obtained by KVM's
 gfn_to_pfn()
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
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 6736d7bd94ea..9936f8bd19af 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1181,6 +1181,7 @@ static int is_2MB_gtt_possible(struct intel_vgpu *vgpu,
 	unsigned long gfn = ops->get_pfn(entry);
 	kvm_pfn_t pfn;
 	int max_level;
+	int ret;
 
 	if (!HAS_PAGE_SIZES(vgpu->gvt->gt->i915, I915_GTT_PAGE_SIZE_2M))
 		return 0;
@@ -1200,7 +1201,9 @@ static int is_2MB_gtt_possible(struct intel_vgpu *vgpu,
 	if (!pfn_valid(pfn))
 		return -EINVAL;
 
-	return PageTransHuge(pfn_to_page(pfn));
+	ret = PageTransHuge(pfn_to_page(pfn));
+	kvm_release_pfn_clean(pfn);
+	return ret;
 }
 
 static int split_2MB_gtt_entry(struct intel_vgpu *vgpu,
-- 
2.39.0.314.g84b9a713c41-goog

