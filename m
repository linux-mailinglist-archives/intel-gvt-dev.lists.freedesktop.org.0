Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA85D654A08
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Dec 2022 01:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C729C10E611;
	Fri, 23 Dec 2022 00:58:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C73B10E605
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Dec 2022 00:58:23 +0000 (UTC)
Received: by mail-pj1-x104a.google.com with SMTP id
 10-20020a17090a19ca00b00223f7d65933so1785176pjj.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Dec 2022 16:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=B3/6HakM8bEsRSpLUSLtN60b55NBVvdxdMcoYovzhTY=;
 b=A58qocwqTx05B2FmPj8edb5Jmqh2KY526wyAjjih8PFgDTeJUoUodgN252cOLS3nXI
 2g5SIoFRZBSR3ULbZM+/hEJBPAZTzB6do/IjoPOTMKPqwzDQsqAef6BRNPdYv7EyEUy5
 GyGJN7L5R5tDhwDSb4b7o65LOH2L914IhnkGhIlWDwPCt1H1SPwD3Po1gc+VNauUEBbE
 DLZv7aX0CyGBqUeVUCyM8GjZE/eEr9qXjKyeFmN/ttMWihF2QuPx7KgDA9uLVtHB7DJP
 AIdSfLY8HT/0Mw4Ia9UGCChjF96hnYTstI2Dxp6P4lORb7XM9+FTAqegNDEtRcCCzK+X
 wnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B3/6HakM8bEsRSpLUSLtN60b55NBVvdxdMcoYovzhTY=;
 b=3tdfSotx87uHz4yG5JlniwdEMEgdcffPZ0ZfrvTaLKlaEyYbPcbMPjAeQDmCN67he7
 wV/7q8lHjxGpvoWgDCR1U5c+GEZ4Jlk9/1BS2vFnHURJCinwPUV2W+PuZF5g5umRQsrl
 jOURNsxQTA/RHnhfw2RZnEIUZgPtXLDOmYgVPXuRURXdvPZx5itATTZpHp3Pl45oOpW6
 tFGZbGvKfBlej0DO81uGHTx96EPut35nd9wjFVU6Ncor2fYAeT0zI3rRGYBod54JGlZz
 yQh4yIXf/zPheE1Si623vlzQwOGjF5ZeAIc0NL/F2QbHZW+T6TJW6uLGlVyIr/yc8Obi
 MkDw==
X-Gm-Message-State: AFqh2kr/OjfUhFrRn+Js7KKVh9MYOpfYFjo+kK/Dhi4W3id1B30FkDwd
 JX740gO7+gFm+rFdJUFNST9Fj02CGxI=
X-Google-Smtp-Source: AMrXdXskxY09HMUv4ylJiwceP/1EuN1X8FenwLyi4ei9/D0xFfMtbr3o/pBLoAlAklnmhUths4WH9DqVUk0=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:164c:b0:575:b4c0:f664 with SMTP id
 m12-20020a056a00164c00b00575b4c0f664mr500069pfc.56.1671757103078; Thu, 22 Dec
 2022 16:58:23 -0800 (PST)
Date: Fri, 23 Dec 2022 00:57:34 +0000
In-Reply-To: <20221223005739.1295925-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221223005739.1295925-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221223005739.1295925-23-seanjc@google.com>
Subject: [PATCH 22/27] KVM: x86/mmu: Assert that correct locks are held for
 page write-tracking
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

When adding/removing gfns to/from write-tracking, assert that mmu_lock
is held for write, and that either slots_lock or kvm->srcu is held.
mmu_lock must be held for write to protect gfn_write_track's refcount,
and SRCU or slots_lock must be held to protect the memslot itself.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/page_track.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index 1eb516119fdb..209f6beba5ac 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -11,6 +11,7 @@
  *   Xiao Guangrong <guangrong.xiao@linux.intel.com>
  */
 
+#include <linux/lockdep.h>
 #include <linux/kvm_host.h>
 #include <linux/rculist.h>
 
@@ -76,9 +77,6 @@ static void update_gfn_write_track(struct kvm_memory_slot *slot, gfn_t gfn,
  * add guest page to the tracking pool so that corresponding access on that
  * page will be intercepted.
  *
- * It should be called under the protection both of mmu-lock and kvm->srcu
- * or kvm->slots_lock.
- *
  * @kvm: the guest instance we are interested in.
  * @slot: the @gfn belongs to.
  * @gfn: the guest page.
@@ -86,6 +84,11 @@ static void update_gfn_write_track(struct kvm_memory_slot *slot, gfn_t gfn,
 void kvm_write_track_add_gfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 			     gfn_t gfn)
 {
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
+	lockdep_assert_once(lockdep_is_held(&kvm->slots_lock) ||
+			    srcu_read_lock_held(&kvm->srcu));
+
 	if (WARN_ON(!kvm_page_track_write_tracking_enabled(kvm)))
 		return;
 
@@ -106,9 +109,6 @@ EXPORT_SYMBOL_GPL(kvm_write_track_add_gfn);
  * remove the guest page from the tracking pool which stops the interception
  * of corresponding access on that page.
  *
- * It should be called under the protection both of mmu-lock and kvm->srcu
- * or kvm->slots_lock.
- *
  * @kvm: the guest instance we are interested in.
  * @slot: the @gfn belongs to.
  * @gfn: the guest page.
@@ -116,6 +116,11 @@ EXPORT_SYMBOL_GPL(kvm_write_track_add_gfn);
 void kvm_write_track_remove_gfn(struct kvm *kvm,
 				struct kvm_memory_slot *slot, gfn_t gfn)
 {
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
+	lockdep_assert_once(lockdep_is_held(&kvm->slots_lock) ||
+			    srcu_read_lock_held(&kvm->srcu));
+
 	if (WARN_ON(!kvm_page_track_write_tracking_enabled(kvm)))
 		return;
 
-- 
2.39.0.314.g84b9a713c41-goog

