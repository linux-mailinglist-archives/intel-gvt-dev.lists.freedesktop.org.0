Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D19701343
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 02:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FCE10E710;
	Sat, 13 May 2023 00:36:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F55E10E70A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 13 May 2023 00:36:53 +0000 (UTC)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-24deb9c5f8dso5553557a91.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 May 2023 17:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683938213; x=1686530213;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=txxFy4l/0CjWXE2Lls1C8TlXhZ8gDD/lHA0CcUxieGg=;
 b=1haVJ2yfzvTDJ7OWiHD70BYBmN550CeOMY4hpPZ+nSFvEJEzGlp9zifp2JC9DTsBnT
 RJZuYPoZBC56u7q5NVSap0DjOvLwxYApwLH9hRiHGYxDoZJvwxzHUiwRC9eia+w/uZP7
 EBybQwdiAWLVgS8BlsYrTOIiunclWLH+LI0gc9Tnj4BM3xt3lZRaMifAigMxY42RgfDp
 cwJG3qN9EWZwmkGrQazhnNhAbchLqLap871kMkvWtbxo/QXAGrSEZskw2tAXxrat7ud/
 D5ZrbarX8RzkvaRosayYzhljq+hKPOqhGf/8xnjwY+T70UILI2/0G0yJJiJRMoQtMPm0
 3+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683938213; x=1686530213;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=txxFy4l/0CjWXE2Lls1C8TlXhZ8gDD/lHA0CcUxieGg=;
 b=S8aUIcd/2OiQtAxPNYUDKjiKhE4TW4FWatwEeJNezTMgoBQgMMi8OUyS2J6G8Y9icf
 bybrEiAEv3dK1zR8vP8wR5/fk9r5eAuqLodCzrwCOF43LaBUuwaN4yNourn4yJkmJ9P0
 +4KxCfDIDnAdOL5eW7no3c3ljKadyDYOufCCZTy3LbRkiEGXxLQAC9N1DmVlxTAh3F5U
 TxI9aAANNweup1aFgsLHJnr/2JuPoqQrY8gYfy05VoC/bAZI1F4EXGGvJKTtV8AqVI6m
 U8cXvD+gtBpsdw3b7UWdeRDPC6GYapdofUkW3IMe2zGwKHS8CP1OwiIWL7lz8JZCNjQC
 uwVA==
X-Gm-Message-State: AC+VfDycCuq1tRjFz1SezPvjeer8S9antC8zWvdbWax4P1k9ATy445GB
 YtvrGetgCzRHSaGYjz+Y5wkPqfa6fuM=
X-Google-Smtp-Source: ACHHUZ43CFxrthXwP0PrBV5od9hQAGg5BAA+rVUflMCCD1sy9tgjBk8pzYcx5eiJpCd5q4pFPenl/fUx+Qk=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:148:b0:246:f99b:fd65 with SMTP id
 em8-20020a17090b014800b00246f99bfd65mr8121515pjb.5.1683938212995; Fri, 12 May
 2023 17:36:52 -0700 (PDT)
Date: Fri, 12 May 2023 17:35:57 -0700
In-Reply-To: <20230513003600.818142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230513003600.818142-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230513003600.818142-26-seanjc@google.com>
Subject: [PATCH v3 25/28] KVM: x86/mmu: Bug the VM if write-tracking is used
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
index 29ae61f1e303..eedb5889d73e 100644
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
2.40.1.606.ga4b1b128d6-goog

