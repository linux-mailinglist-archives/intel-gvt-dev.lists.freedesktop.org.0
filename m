Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE45767AFD
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Jul 2023 03:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8412D10E220;
	Sat, 29 Jul 2023 01:36:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78DD10E220
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Jul 2023 01:36:17 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-d1c693a29a0so2549065276.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jul 2023 18:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690594577; x=1691199377;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=NKdCtniWiAg1ywOiZ6YDPXm5HtZo7eRagpKdBNR7xpg=;
 b=5Uv4EcFsDMD9NsYdJZO7/8bilal5ddhv5oXjy9nAKQerIStaoVew/onb+SGkfBqNof
 2A3L/r6MHTGAjoy91PbYkNyIZqhSj+Rg5jo5GTtNjedp97sPqdaRQOHc7gwlvo5jU8vA
 kxfdHRIh4lvv6FD1geSFpk4NwkD+WEEwwGy3B85/dF9ect82C0iAl04aq+Y6Af05FV+X
 eXrW2treDagoJmIR73mRzrOOWVmuG7OOwd2Ma2xFq/LHuAyy666HGuXj9cqbQY3SU40h
 VSBG/8KN0SLJPWJ5J61UOibT5kgPqqUSxMYjl2PUOWixvTmfEoaYCwnesh8KVRoki6BH
 JQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690594577; x=1691199377;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NKdCtniWiAg1ywOiZ6YDPXm5HtZo7eRagpKdBNR7xpg=;
 b=feOEDvZguD+lGYadzwtneY1Y5eA8SlAkbruWpJxPS/dbdlBUVPH7VY2CH2H92Bvk0/
 9gqSA+zCGq7etr7n1w7CD+mK2m6a6B7PQ1FjH1Ez9fHYaLA4ocENfHI9tDQg3V3BUeQA
 e3TMNSSQ/km2ikjXOf0mCsARTThJqm1WrMomQwz6Rpn9JZk0Q+1C30dsHywQZD4JuMpg
 KYQoAKfOD0DMFJltTgPjMZJm7MygxgvQXW6e9cJ28FduZKTGlu907N2mh+WmHBvFBwzC
 4D007+IfGLxiA4hocX5V4NvbaNEGa9LeN34N8pR2NYL9HeK7oK9ZhryvUSnGwH/9gXsp
 MbDQ==
X-Gm-Message-State: ABy/qLbv4Ublm1kTsRM2m5TeLGZJmppZKAJxJoZ/gC2Sqj/mofSozu+3
 HlCtKEzIWcGJ3rhSy3IcLfkRWOJeTRk=
X-Google-Smtp-Source: APBJJlF751SnqTSnU6vTW0Y18Fw9691eJmjowXxwgAdnr7jOeokEcu/hShizd7Z5E3jpc33zhy+X2tt4XMM=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2086:0:b0:d07:a03b:38a2 with SMTP id
 g128-20020a252086000000b00d07a03b38a2mr19106ybg.10.1690594576926; Fri, 28 Jul
 2023 18:36:16 -0700 (PDT)
Date: Fri, 28 Jul 2023 18:35:23 -0700
In-Reply-To: <20230729013535.1070024-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230729013535.1070024-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230729013535.1070024-18-seanjc@google.com>
Subject: [PATCH v4 17/29] drm/i915/gvt: Don't bother removing write-protection
 on to-be-deleted slot
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

When handling a slot "flush", don't call back into KVM to drop write
protection for gfns in the slot.  Now that KVM rejects attempts to move
memory slots while KVMGT is attached, the only time a slot is "flushed"
is when it's being removed, i.e. the memslot and all its write-tracking
metadata is about to be deleted.

Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index e9276500435d..3ea3cb9eb599 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1630,14 +1630,8 @@ static void kvmgt_page_track_flush_slot(struct kvm *kvm,
 
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
 	mutex_unlock(&info->vgpu_lock);
 }
-- 
2.41.0.487.g6d72f3e995-goog

