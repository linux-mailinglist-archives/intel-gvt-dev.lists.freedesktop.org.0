Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 530A7701342
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 02:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7C110E707;
	Sat, 13 May 2023 00:36:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3594610E6FA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 13 May 2023 00:36:52 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-ba69d93a6b5so6471769276.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 May 2023 17:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683938211; x=1686530211;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=d+sFY9wdlYEr+BsMeb/f8vTRCaTs7vfifkJ4zvl7LGw=;
 b=64N8psPjCU8NCbfgAoPhVHhIo35afPxNCSfUEDPc6JEFhfmjZIqhvtqtCxju3ayooD
 rLtO6OgYd01HPHrZnVMraPg/wvIulWsNrZaYYd3Q2cuVPa4BEcmEV3mEsul3XrhRjsp+
 aJ3JMXVJz3CR+BKQBzSr5PUTPuq5LMv/qpzFT9AXutEQGIhFf59wMsyaAHBpLpysfc/Q
 5h8AgBMeBJE20odwJFjCXSKGq2qIWtRbb+o7daVN32UhhZQwjWvMckTBuPmrfJMgaGYa
 tWHBeWXd1xseZCzWjFZKA19DhbXGNxq1i3PG7V0P1+RQ2Cbwc2JaOc8fDwY7PDd1c0r8
 ZJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683938211; x=1686530211;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d+sFY9wdlYEr+BsMeb/f8vTRCaTs7vfifkJ4zvl7LGw=;
 b=Y8Oz6k4JAPav69KzsF7r/KPEWTCAb4RRkdeueItN8fErzn/Z25WpXguF51ZN7Kp87L
 w3xHsg//LT4MiPpe04zFK6bAecCO2QowXEmFrCknbc726ojEewKWausAkpahAvsSNPN3
 /643OH6Av3FJ/YcvlQNHUoSq89TI9myWJ4xUsCj8WU/8ePlw9rFEJ/2QNA7GgtMnZg8o
 ZgvpCOaGVJnqv8fRRsD4E7uQ/MaaH6d3cmnp2f7zXyVSgHldyMoDelZtcsSDeNBZOYss
 WHadNGZi4Y9qCh60APheq1awAO6xSgMdRsijWD0BM2/UOqFhkL1vSIFpR3rJZ8qt+4/z
 s7+Q==
X-Gm-Message-State: AC+VfDw9Y64TxZ7xfjxTHAF7mKPliPxvFmTKCApEpw2brO39lR0G9pqG
 pQWhwf2hGHIfIlhNtpsyCZYK4L/8z+8=
X-Google-Smtp-Source: ACHHUZ5zdcnj/hq68r0lrjsegbj6c4YZMheMUdNtJ3k1/upYeQmR6HdFpgZIKNg6Oz6JUMAbVtXPBMF+WH4=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:1241:0:b0:ba6:3890:3e55 with SMTP id
 62-20020a251241000000b00ba638903e55mr6939739ybs.2.1683938211420; Fri, 12 May
 2023 17:36:51 -0700 (PDT)
Date: Fri, 12 May 2023 17:35:56 -0700
In-Reply-To: <20230513003600.818142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230513003600.818142-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230513003600.818142-25-seanjc@google.com>
Subject: [PATCH v3 24/28] KVM: x86/mmu: Assert that correct locks are held for
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

Tested-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/page_track.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index b835ba7f325c..29ae61f1e303 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -12,6 +12,7 @@
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/lockdep.h>
 #include <linux/kvm_host.h>
 #include <linux/rculist.h>
 
@@ -77,9 +78,6 @@ static void update_gfn_write_track(struct kvm_memory_slot *slot, gfn_t gfn,
  * add guest page to the tracking pool so that corresponding access on that
  * page will be intercepted.
  *
- * It should be called under the protection both of mmu-lock and kvm->srcu
- * or kvm->slots_lock.
- *
  * @kvm: the guest instance we are interested in.
  * @slot: the @gfn belongs to.
  * @gfn: the guest page.
@@ -87,6 +85,11 @@ static void update_gfn_write_track(struct kvm_memory_slot *slot, gfn_t gfn,
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
 
@@ -107,9 +110,6 @@ EXPORT_SYMBOL_GPL(kvm_write_track_add_gfn);
  * remove the guest page from the tracking pool which stops the interception
  * of corresponding access on that page.
  *
- * It should be called under the protection both of mmu-lock and kvm->srcu
- * or kvm->slots_lock.
- *
  * @kvm: the guest instance we are interested in.
  * @slot: the @gfn belongs to.
  * @gfn: the guest page.
@@ -117,6 +117,11 @@ EXPORT_SYMBOL_GPL(kvm_write_track_add_gfn);
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
2.40.1.606.ga4b1b128d6-goog

