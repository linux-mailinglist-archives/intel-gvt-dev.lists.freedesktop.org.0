Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A146549EF
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Dec 2022 01:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDD910E61B;
	Fri, 23 Dec 2022 00:58:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABC810E5F1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Dec 2022 00:57:57 +0000 (UTC)
Received: by mail-pl1-x64a.google.com with SMTP id
 u6-20020a170903124600b00188cd4769bcso2410481plh.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Dec 2022 16:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=8k64KFPY2FFl58dlOKiSt/6ffoasCJxRfQQP/flk2s8=;
 b=ADGdSRhE19CpKn3Mx8Gw1o4OLrTbUVUIoTOjSZyGWqJNQL1SN7v8qQsh4q5cXqj6ZL
 hD6fxxwCTl4y/NNCwu4uuodODhWf/UAdCQYUzyxbDjQPykN+rUTv5icpILVoRgxBnOw/
 yeOcWPtNLNwR3Y/uk6j76NAwfZg7MRzWvFz7ko8kkCzO6CB+8LvhG1Xfv7qgN06BwTPR
 tE+2BbMHDSCHA/Y16iC2bZMsqqlYWqoBvXSOH7eVW1O1/dc8s+Fc+brkRiaAncEhUjUu
 kRfRqXhHbJkZXcp9gW5MeZZhEQ+HG6DbvBb/0kC1i/PgW4/d5vbzVWUhK143REl6RJgm
 KT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8k64KFPY2FFl58dlOKiSt/6ffoasCJxRfQQP/flk2s8=;
 b=OBp2bpN9WnfqGoVGL+xNrBIYZm54jrgWi6IiFoZaaam9OoYZudxMZC7OaloQ9TkBFf
 +Z8KSclGeGZ5qAmOAUs+brb8Z2/JgdODthpaUI6j3A84MnRoInx28y4bF0KJeQ5NwDAk
 Ffuclle0RvU2cOGcxpd1s3dpbohKjeDlSVMoadL/YnOOeYtq82i5nfyLuC9R7kmi8WaH
 X07YZYMxXwx3j8FEzTdl4eHnizscCk/pW0TL1lifNcUQO/rK6z4B7ARm7j5yKY7zQ466
 yJzNEw1wJDg8LgL+Py5jByNfudEwFQd3NxtdlxA4FGA7aEG6hOL1Urc5nnAJ34FkKzpB
 rkYw==
X-Gm-Message-State: AFqh2kp8PuzvoZq58JDOtekuR2T0f4xcAZb+kwfxy76G1TbIZCNIeNcw
 378Kk4CeUOA35wpelgapetoRFsvHgLY=
X-Google-Smtp-Source: AMrXdXtZzqXSfhAfIWlCK+WT2T5JZRV5LJOH9tPTZxKT6bo1HSjiqq3ll6wCTHVFE26Ee59g4OXn+ZR2sNc=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:7794:b0:189:6936:7031 with SMTP id
 o20-20020a170902779400b0018969367031mr457317pll.31.1671757077092; Thu, 22 Dec
 2022 16:57:57 -0800 (PST)
Date: Fri, 23 Dec 2022 00:57:19 +0000
In-Reply-To: <20221223005739.1295925-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221223005739.1295925-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221223005739.1295925-8-seanjc@google.com>
Subject: [PATCH 07/27] drm/i915/gvt: Use an "unsigned long" to iterate over
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
index 6f358b4fe406..5d0e029d60d7 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1635,7 +1635,7 @@ static void kvmgt_page_track_flush_slot(struct kvm *kvm,
 		struct kvm_memory_slot *slot,
 		struct kvm_page_track_notifier_node *node)
 {
-	int i;
+	unsigned long i;
 	gfn_t gfn;
 	struct intel_vgpu *info =
 		container_of(node, struct intel_vgpu, track_node);
-- 
2.39.0.314.g84b9a713c41-goog

