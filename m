Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FB16549FA
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Dec 2022 01:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE00010E5EC;
	Fri, 23 Dec 2022 00:58:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8F310E5EC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Dec 2022 00:58:08 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id
 c9-20020a63da09000000b0047954824506so1894796pgh.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Dec 2022 16:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=nnuDgdp4qEuIP+nl5eVB41E8zn+MCFzhd5zm41ZDAFc=;
 b=YL/Dz6cmVRO/+CzEBXHrCDLQqLAKHeq2+QFU2IONT+tFrm99UB/5FYjjcdkvqq3ewo
 QpxBRBxnwmtL4mBRKzeBJHLRBASTjqHF5AvagoSK6pkoZfgl/pdMQ8v4M9Sfu1gLTfx4
 XgSctJALtSXKQlewtYLNczl+53miK/q/PcvVleLhVFYNrmIr9D9D9BtOsqlDmv0UB5wq
 ZOlFE0cRCYfbe1i7DTTxis9EBnnwdY20o4ay1OAf/8kasmqbRyFeKvxCYj+xPRgP7GSh
 DeMr2HEwCrP9l216wxotZhmPNcMsTqUeS6Ad0RHtllfzAAILGuxSPZ3IxTu0EjqzznZ5
 jD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nnuDgdp4qEuIP+nl5eVB41E8zn+MCFzhd5zm41ZDAFc=;
 b=Q5qufzHp4Kykez5cFzrp1sqpehU0o1tnVfEok63ZWwH6EycpIg1khslaRvqjLwUT3l
 9BCErCESAU+wHC0KQSCLB6ZKkldE3AqgabAGEMbeTqIcp+Ws0VhZGCajK4TdradH+OaN
 jKinKN6pd3YR8tzL1vYI5O6HVrbDKsuhRXY8mG7ajMmIylbFPHl9uldHA6W76c7Ow8hH
 c0XuEqHjf0oqqiMzH+9czixWPgmnf/VjJx0RDhm6r+B15fPFFpt07PSuvvn2WrjeE52a
 WcTTNf9ZfO7J4Xm1PGYyj02QqYzObxOEu1d/kncG1f6aTWiwortyRMlgDVf3Wk0iQ+Ph
 sj8A==
X-Gm-Message-State: AFqh2kpsS9VCP6VyXO4EfOcjmXKnzyQhIrwGM20tXnSOgCxe6rabRKa4
 jKmBpqq8Y6gBHkXr+GEdRPeguvEpLkQ=
X-Google-Smtp-Source: AMrXdXv5BPzxNVgTyJnuA1gVGcmsttgw3dWhco6HdLgdiG3VrS3xp8krh0HZY3Z/zi1ZITbwwOONH9mH6A8=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:7e8b:b0:189:b0a3:cf59 with SMTP id
 z11-20020a1709027e8b00b00189b0a3cf59mr601702pla.42.1671757088348; Thu, 22 Dec
 2022 16:58:08 -0800 (PST)
Date: Fri, 23 Dec 2022 00:57:26 +0000
In-Reply-To: <20221223005739.1295925-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221223005739.1295925-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221223005739.1295925-15-seanjc@google.com>
Subject: [PATCH 14/27] drm/i915/gvt: Don't bother removing write-protection on
 to-be-deleted slot
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

When handling a slot "flush", don't call back into KVM to drop write
protection for gfns in the slot.  Now that KVM rejects attempts to move
memory slots while KVMGT is attached, the only time a slot is "flushed"
is when it's being removed, i.e. the memslot and all its write-tracking
metadata is about to be deleted.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 5ff17a212107..3c59e7cd75d9 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1659,14 +1659,8 @@ static void kvmgt_page_track_flush_slot(struct kvm *kvm,
 	mutex_lock(&info->gfn_lock);
 	for (i = 0; i < slot->npages; i++) {
 		gfn = slot->base_gfn + i;
-		if (kvmgt_gfn_is_write_protected(info, gfn)) {
-			write_lock(&kvm->mmu_lock);
-			kvm_slot_page_track_remove_page(kvm, slot, gfn,
-						KVM_PAGE_TRACK_WRITE);
-			write_unlock(&kvm->mmu_lock);
-
+		if (kvmgt_gfn_is_write_protected(info, gfn))
 			kvmgt_protect_table_del(info, gfn);
-		}
 	}
 	mutex_unlock(&info->gfn_lock);
 }
-- 
2.39.0.314.g84b9a713c41-goog

