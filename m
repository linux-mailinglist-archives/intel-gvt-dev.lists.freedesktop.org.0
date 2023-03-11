Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0ED6B5686
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 11 Mar 2023 01:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1B710EA62;
	Sat, 11 Mar 2023 00:23:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9364B10EA5B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 11 Mar 2023 00:23:51 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id
 m9-20020a170902db0900b0019ea0e227e4so3593114plx.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 Mar 2023 16:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678494231;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=SrFDAuRQYSdVAaKU/q0bsjDCV6a1lvsfWXmA+4AWzfU=;
 b=e4d4/rxV1Zgd2/D2y/bvvJYmV3VmIQ2B+veoJmhzc1zL/Ok45X7QCHORoet2h5BRER
 OvyYYPlh+KjYyFnv51fNVwfqcSMtD3WCJ3Dqeqpl8zagOMT++Eucp+7VKyux3vDcum/n
 u9VknqIpRRzz39zajw9cxBkBioWmO1SWPo2U1WH/VlF4FCggvbOg5jwd9GdtQN3D8cqC
 W0uG+lHUt7Mn55Zg9Xqf5SpsPLYT4yMyWxbEUOBF9UBxuJPXodDGsYKKGfKZHMDtKzMP
 2bN5l34k5e0hHNkV4u1rXG+4w/2uckITEagP6WXSw7O+XpcZrmBXZmwNn3YKoGEGngXh
 8FUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678494231;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SrFDAuRQYSdVAaKU/q0bsjDCV6a1lvsfWXmA+4AWzfU=;
 b=G1Wb15kKjNQcvJfMWlDrnhmZShaL+NVBlj4X9KspVslkgnoEYm5KCxjQ6rfRyhW+7v
 EW3TXdNusia6BQNfz9hQTCjMRrdlJ0OOqxjXVD8nmC7RV0YAIdixx9z9i0QxIk7UcJU6
 EZsxC/QQeMSg4gTxIdi+HjPSaSD0q6RmdbeuR6DCpFPR0uE0BKb6EZ7+J36DWyPAqjBK
 rwVFdWMQVx1lOLLlbeNqhNkZkicIipp9pJRH379j6gAP33Z4TJ8VJv3ve57vgSTUBH8p
 CJPwhH/be1EzFsHyHn5Y1H9YzaXmKJxGhwFuCZW2QslTBwz2z8uc01hgXF8YPGkmEhgx
 VtnQ==
X-Gm-Message-State: AO0yUKXWD9KQWLi2kzAIfVo0sTPnfLYg20WmZfPgB4OcQIXiG8utcBZT
 q1W1n7kx8WHsz1szTVThKpBHcRJbJ3c=
X-Google-Smtp-Source: AK7set9BOLwk0C6I6vnhUGAunlnaX/wB1YqK0ADUomrGZYyzsFfITpGsZimZf1dbvl+kuQhlqQKywNF53cc=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:334f:b0:19f:22aa:692e with SMTP id
 ka15-20020a170903334f00b0019f22aa692emr312103plb.4.1678494231283; Fri, 10 Mar
 2023 16:23:51 -0800 (PST)
Date: Fri, 10 Mar 2023 16:22:55 -0800
In-Reply-To: <20230311002258.852397-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230311002258.852397-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230311002258.852397-25-seanjc@google.com>
Subject: [PATCH v2 24/27] KVM: x86/mmu: Bug the VM if write-tracking is used
 but not enabled
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

Bug the VM if something attempts to write-track a gfn, but write-tracking
isn't enabled.  The VM is doomed (and KVM has an egregious bug) if KVM or
KVMGT wants to shadow guest page tables but can't because write-tracking
isn't enabled.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/page_track.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index ffcd7ac66f9e..327e73be62d6 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -90,7 +90,7 @@ void kvm_write_track_add_gfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 	lockdep_assert_once(lockdep_is_held(&kvm->slots_lock) ||
 			    srcu_read_lock_held(&kvm->srcu));
 
-	if (WARN_ON(!kvm_page_track_write_tracking_enabled(kvm)))
+	if (KVM_BUG_ON(!kvm_page_track_write_tracking_enabled(kvm), kvm))
 		return;
 
 	update_gfn_write_track(slot, gfn, 1);
@@ -122,7 +122,7 @@ void kvm_write_track_remove_gfn(struct kvm *kvm,
 	lockdep_assert_once(lockdep_is_held(&kvm->slots_lock) ||
 			    srcu_read_lock_held(&kvm->srcu));
 
-	if (WARN_ON(!kvm_page_track_write_tracking_enabled(kvm)))
+	if (KVM_BUG_ON(!kvm_page_track_write_tracking_enabled(kvm), kvm))
 		return;
 
 	update_gfn_write_track(slot, gfn, -1);
-- 
2.40.0.rc1.284.g88254d51c5-goog

