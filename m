Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C78E6B565F
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 11 Mar 2023 01:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C429610EA47;
	Sat, 11 Mar 2023 00:23:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8918910EA43
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 11 Mar 2023 00:23:21 +0000 (UTC)
Received: by mail-pj1-x1049.google.com with SMTP id
 f1-20020a17090aa78100b00239fd9e3e17so3348838pjq.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 Mar 2023 16:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678494201;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=MQo4WmE7f97mSOHZkI3jr5btwmig+br9PEj++8GmA1Y=;
 b=bl3n2+O+/VcIrUul70a5c+psPIylTaKZidknn7ZUMJ1VKDYON2kZjsj+qY8mlUsf3H
 trT5CCOCqbqQzkNkr7qgSz7MW2T5nLyGwtnrq+dTu/4WboCT7gmBjgkcKB2lVQwxHML9
 P62aQv5xuNUt9STojA6Vr1mSxq8grcBmiGzmLRGU6MPnI6sz6t/Qh/JBg6pg+M6dEPLL
 TYko2KDQWHHz3Xs7yTY6tz4i2DxoK+UJdwG1yB6ish/k+gmiYui1QPheJvkZJuOzRuDw
 0h7vffFzjdPTnAg9LysYD0norRIil7HfS/4M4biE3kx7voJQNWrLPNM+Zdxyo5syMIlO
 6fBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678494201;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MQo4WmE7f97mSOHZkI3jr5btwmig+br9PEj++8GmA1Y=;
 b=rkfSrNAkv4OyXEReSkvDcnZKGCvi2kmm6xJ30lBtadP8lxDsvE4fSfMdocibkGQjVd
 SUof/mHUjpgQvcNrZsqmByUzq8XzMiGBZjtvb8tcPjEDLnujNDelYRJWSU0p2NIx0EtR
 7jEbKDdon2GAcPXHWX4NFrbKqzunBH9mMUY2fxoMmNtB0U0XzSuCvmDPkL+TdeK/JSE3
 ssxjgV/ObYu4zlCQvPwqZ56g8gI8XomYGIfTLx/TfTLLQNRaqVxLb2+DriD9Xy/2JTgm
 gD08iADH/J2Ac3+lePpkzADJ/anZhgCs0akoNcUOBaClMAzjXhy+Z2n6yka2CPKPMjSd
 8j5w==
X-Gm-Message-State: AO0yUKU97pUomvMzSEuenfz64Sco6Xwl/+qgvMrOzL0jz8OXAHEXkykl
 IXDuiqhsZ6OunSuEvrKLfymF9hIQHGE=
X-Google-Smtp-Source: AK7set+CIJ9m8jH9oNknQz7rK0QCgrymV+VOsddjSAaAVGPMq+29db0qr1UEOPNYnEU8mkEPVUrV1e/vI+o=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:4e04:b0:239:d0ab:a7c9 with SMTP id
 n4-20020a17090a4e0400b00239d0aba7c9mr9622929pjh.4.1678494201193; Fri, 10 Mar
 2023 16:23:21 -0800 (PST)
Date: Fri, 10 Mar 2023 16:22:39 -0800
In-Reply-To: <20230311002258.852397-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230311002258.852397-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230311002258.852397-9-seanjc@google.com>
Subject: [PATCH v2 08/27] drm/i915/gvt: Use an "unsigned long" to iterate over
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
 Ben Gardon <bgardon@google.com>, intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Use an "unsigned long" instead of an "int" when iterating over the gfns
in a memslot.  The number of pages in the memslot is tracked as an
"unsigned long", e.g. KVMGT could theoretically break if a KVM memslot
larger than 16TiB were deleted (2^32 * 4KiB).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 90997cc385b4..68be66395598 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1634,7 +1634,7 @@ static void kvmgt_page_track_flush_slot(struct kvm *kvm,
 		struct kvm_memory_slot *slot,
 		struct kvm_page_track_notifier_node *node)
 {
-	int i;
+	unsigned long i;
 	gfn_t gfn;
 	struct intel_vgpu *info =
 		container_of(node, struct intel_vgpu, track_node);
-- 
2.40.0.rc1.284.g88254d51c5-goog

