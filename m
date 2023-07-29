Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09884767AED
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Jul 2023 03:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A681210E7C6;
	Sat, 29 Jul 2023 01:36:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4648C10E7C6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Jul 2023 01:36:02 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-583a89cccf6so26981897b3.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jul 2023 18:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690594561; x=1691199361;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=/2DXbiQb11naI17RMd9UQ+SDW96I3DO0Ug1YMgWLfXI=;
 b=N/Xuo31FD/HpJ/r+aiswhIOdyyLh/aqswWM/9gDeiWpXkOdw/BybOvDSugphjjH8vY
 czkCQ+tWVfw/K0ROTwpFPjyoZ51Hk33bVR6kSeUS5Q07NBHU+9puAFJWpliJC7Kcnsgw
 DFvz5oS/ppK6Pc7hv2pMJ+KN22NAhA7ZjuxoVq5Zi9bmUdnU0M+QCo2g8xsLagNC4PKy
 saSZeaXWNfeMQ5IHCoKm13WWjRyS4qfzbr2FQrD2W4y2GkvB0Xbs2lZZrrJ+f/6Os44D
 CcefGXGMTcsMhro4vMfe22toBHH+4FqzhGk8KS/5pO5Cd3dH/EcnHrsxFwYJ1GujncZ1
 /cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690594561; x=1691199361;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/2DXbiQb11naI17RMd9UQ+SDW96I3DO0Ug1YMgWLfXI=;
 b=aFc5B0RyQMpScNPtz7b7uv4WSl8vNb4Zwqqt8s2EbvvnQ4remKZW6OoU07jbYAFUcd
 dRkTqAXNCnBpvQcojoQ+ntzTHAaHwEsRufRp22L1HqVVNHzV9zPtb8Gb+Kurgg73I085
 sAyXi9pGs80BV/b+s0OS8zITiYDpc5Bgy/ZLvvTfxqSug20p9n8qHCqoZdlRmd8dxMmV
 QM4rNCJ6rmd6Cp9cFVHbGxEsAXzL5xwkE2zKDpLR1Bdunpwls3kVCPTLnCcH6zDg31Uk
 f2DnIm2AJqFBr57Sdv6CKChiswJoDXoJWzKf6cb3W14Dcrlv7FVJddi69J78B5Vw+dSO
 xtqQ==
X-Gm-Message-State: ABy/qLZeSBD3gaZHHxY/qyoZ7ytS46dCZ3qkbEfiak12AOVRw+1Js5Pv
 h/u8lklB56SH6hoCUzvSEnC54h02Nr4=
X-Google-Smtp-Source: APBJJlHjJijCc55w0wljCYyBWJLS5e6GQQI49bMEWRqbhx7NrZHhLmDEmMDXWNJlzx+OwSHEGbtvbQN0Kcs=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ae13:0:b0:576:9519:7085 with SMTP id
 m19-20020a81ae13000000b0057695197085mr24135ywh.7.1690594561504; Fri, 28 Jul
 2023 18:36:01 -0700 (PDT)
Date: Fri, 28 Jul 2023 18:35:15 -0700
In-Reply-To: <20230729013535.1070024-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230729013535.1070024-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230729013535.1070024-10-seanjc@google.com>
Subject: [PATCH v4 09/29] drm/i915/gvt: Use an "unsigned long" to iterate over
 memslot gfns
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

Use an "unsigned long" instead of an "int" when iterating over the gfns
in a memslot.  The number of pages in the memslot is tracked as an
"unsigned long", e.g. KVMGT could theoretically break if a KVM memslot
larger than 16TiB were deleted (2^32 * 4KiB).

Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 97c6d3c53710..6f52886c4051 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1620,7 +1620,7 @@ static void kvmgt_page_track_flush_slot(struct kvm *kvm,
 		struct kvm_memory_slot *slot,
 		struct kvm_page_track_notifier_node *node)
 {
-	int i;
+	unsigned long i;
 	gfn_t gfn;
 	struct intel_vgpu *info =
 		container_of(node, struct intel_vgpu, track_node);
-- 
2.41.0.487.g6d72f3e995-goog

