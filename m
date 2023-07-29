Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF7B767AD8
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Jul 2023 03:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A3110E221;
	Sat, 29 Jul 2023 01:35:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA0F10E221
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Jul 2023 01:35:50 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-584139b6b03so27878347b3.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jul 2023 18:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690594550; x=1691199350;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=jEX944Eq3FR7IMm0zyV2J78IA1pYMR7a1LBZmsndkp4=;
 b=yHFb6A/FmJUhjkvJVHVNFENSmnV/XxKeQzVyEJ/bsTc0EgB3t3kLrAAWC4rNX+KVzF
 tE/L26CL/p1zxgyE1dgrLDHCvOKA010KvD1pvz6L2iKkHM7w7a/PI3J5YPXmIXGwHVAj
 86KPlBY8IE6qkjps7JGXSQUbpMBP4YCvHXmCWALdgeNA81MOQyhSyHJjFhqKcJbGKb9q
 Y0Ua72NPldHKvqmilK6m/8KJXxBD1V6JA91PmdB7KfYGCyxQyyy2Kp9ZrHSumMz6fgAk
 gef57fyVuIrhV+fl1bkM9lY6Z4the5vX7Tl7Q0XOh7RbCJx42QazAKXAToKo2wSC4IIX
 yn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690594550; x=1691199350;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jEX944Eq3FR7IMm0zyV2J78IA1pYMR7a1LBZmsndkp4=;
 b=iM3HfEhEFf67U0q+4f14bZ0PG4p7tnK6rnhfuzM5Hj11gXmKc1lZDD7/g0SfG9vr9F
 d6oMntVxe48fJdzV387dKSh3YgbvCjKLwEcnppxiN60MoaikJsngia+3cKwIgY0mp47q
 ttETMB9jmt6l8819INCbVeN0GCOGb/ZZVFY9uYvWU9B0SQeCtHZZTf32hjR+PmMAAl6E
 UNBm2oC9oI4pW4EK8d2YbxolU6hSrM3E/QjCtf6gVyA9uBQ4wG/X3jpThLhALmd3MnUU
 kzdCCz53v8grQArTJegk8d2Dl35MhDGJG9OEpY3T91qqfZtjyr8X7mN3Uf8WquCghFF/
 gP3Q==
X-Gm-Message-State: ABy/qLYIU1F8KEPUtgaoGsOg5zHUxOuCyE3RAx650CorseJzLD6buWld
 0xg87IilgwUCbEyQuBNfe6uesfRpNTE=
X-Google-Smtp-Source: APBJJlHaMJ266s4owvydBsGasNevM0zaMSoOGKTU1pN9RjVzgaKXC6MzhQvAdGBBorhN1PRis7f6VXl7qB0=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:af03:0:b0:583:9db4:6c20 with SMTP id
 n3-20020a81af03000000b005839db46c20mr22745ywh.1.1690594549610; Fri, 28 Jul
 2023 18:35:49 -0700 (PDT)
Date: Fri, 28 Jul 2023 18:35:09 -0700
In-Reply-To: <20230729013535.1070024-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230729013535.1070024-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230729013535.1070024-4-seanjc@google.com>
Subject: [PATCH v4 03/29] drm/i915/gvt: Verify hugepages are contiguous in
 physical address space
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

When shadowing a GTT entry with a 2M page, verify that the pfns are
contiguous, not just that the struct page pointers are contiguous.  The
memory map is virtual contiguous if "CONFIG_FLATMEM=y ||
CONFIG_SPARSEMEM_VMEMMAP=y", but not for "CONFIG_SPARSEMEM=y &&
CONFIG_SPARSEMEM_VMEMMAP=n", so theoretically KVMGT could encounter struct
pages that are virtually contiguous, but not physically contiguous.

In practice, this flaw is likely a non-issue as it would cause functional
problems iff a section isn't 2M aligned _and_ is directly adjacent to
another section with discontiguous pfns.

Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index de675d799c7d..429f0f993a13 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -161,7 +161,7 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 
 		if (npage == 0)
 			base_page = cur_page;
-		else if (base_page + npage != cur_page) {
+		else if (page_to_pfn(base_page) + npage != page_to_pfn(cur_page)) {
 			gvt_vgpu_err("The pages are not continuous\n");
 			ret = -EINVAL;
 			npage++;
-- 
2.41.0.487.g6d72f3e995-goog

