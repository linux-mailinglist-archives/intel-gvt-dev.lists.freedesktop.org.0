Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC414654A0C
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Dec 2022 01:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB5D10E606;
	Fri, 23 Dec 2022 00:58:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463FF10E60D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Dec 2022 00:58:25 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id
 x79-20020a633152000000b004785d1cf6bbso1887442pgx.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Dec 2022 16:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=Mjx7GRlicgajrB6SmeczbpFw70qPj26DS1mbjQ07FZc=;
 b=mRJ+7lpjW/92UAtWhU6FDkGto+uOUnmfSzy5jPfawwuU/F4nqZqRlRMCU74qEPj9Mb
 CdAaIXysmX7kk4CHGyfZxd5JQnG+ZCL24IJeY+z751dN9xS9z2fpULQeiKxEgoDCtOId
 TmBFxLNIjiP0AR2oqnH6WWuSs/9ijuJ8t+Qx2CBcvKEjJ3TsqJpIQjhj6uQjDbHEvMOd
 3YF9UZ1sB0jZijAgR6k9nUryyTWfEmarYoHND1SDv0JjOcBFOcDV/v48qhlbXnHvgIcL
 l59C9L5Nrp/Z9ySpcP8XnzBq9MXiXywcAXIdSM3MMeaTo1Lbw09pY3Z7FdZr4asQg5r9
 hbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mjx7GRlicgajrB6SmeczbpFw70qPj26DS1mbjQ07FZc=;
 b=8MDpQv0sq2Z90euKEEjTOkSuorHCW8gOCVwnnuAoQKJTBIPco/gaY5yYiLX0a6Ixgj
 TWnASEXQzYlohDshf3d8H/uvG/Nodnc3uy42dnMvScAeniLK4uexzgYU8YfVT27kFufx
 s8uiaVQ7Jkxcy++G8WaBsY4MiBa4hvY6Ju4TLHPpifOQMprk1pzl2Ner4MGqTJ0fe9hd
 Ly9MwP/Erutlng4rkN/mgKw4u+SM7bQ4HM5bdeDU6junMi43PY6O1krFH0XNoKT5ttO/
 bZCVYuBKz25XnH2Wc2RK6608kBnOTbCy7+BBWFW4zSWbu8m4ekQcC+xpHQIPy5K6vEDz
 oQLw==
X-Gm-Message-State: AFqh2kp9vWamBjw1CW+nwNvyHXftuHQFUEUrbPEHv5mhfoMkxmfhsjY5
 IXXhFQyRvspIE1/YUUMaB/PudSCfSKk=
X-Google-Smtp-Source: AMrXdXtXxdm8nZXuMMBo2QspLCSPRiBAN19+E0Wj2xhvcNkERfbAIsx/WwCVUN1WA4sKXACeZ4+eKJfad3s=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:bc84:b0:191:2b76:49e8 with SMTP id
 bb4-20020a170902bc8400b001912b7649e8mr408691plb.46.1671757104914; Thu, 22 Dec
 2022 16:58:24 -0800 (PST)
Date: Fri, 23 Dec 2022 00:57:35 +0000
In-Reply-To: <20221223005739.1295925-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221223005739.1295925-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221223005739.1295925-24-seanjc@google.com>
Subject: [PATCH 23/27] KVM: x86/mmu: Bug the VM if write-tracking is used but
 not enabled
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
index 209f6beba5ac..d4c3bd6642b3 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -89,7 +89,7 @@ void kvm_write_track_add_gfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 	lockdep_assert_once(lockdep_is_held(&kvm->slots_lock) ||
 			    srcu_read_lock_held(&kvm->srcu));
 
-	if (WARN_ON(!kvm_page_track_write_tracking_enabled(kvm)))
+	if (KVM_BUG_ON(!kvm_page_track_write_tracking_enabled(kvm), kvm))
 		return;
 
 	update_gfn_write_track(slot, gfn, 1);
@@ -121,7 +121,7 @@ void kvm_write_track_remove_gfn(struct kvm *kvm,
 	lockdep_assert_once(lockdep_is_held(&kvm->slots_lock) ||
 			    srcu_read_lock_held(&kvm->srcu));
 
-	if (WARN_ON(!kvm_page_track_write_tracking_enabled(kvm)))
+	if (KVM_BUG_ON(!kvm_page_track_write_tracking_enabled(kvm), kvm))
 		return;
 
 	update_gfn_write_track(slot, gfn, -1);
-- 
2.39.0.314.g84b9a713c41-goog

