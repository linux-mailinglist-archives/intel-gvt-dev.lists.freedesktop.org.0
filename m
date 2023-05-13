Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B1B701317
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 02:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003E310E6FA;
	Sat, 13 May 2023 00:36:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D17210E6FF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 13 May 2023 00:36:22 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-64386573ba8so6306963b3a.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 May 2023 17:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683938182; x=1686530182;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=xOh8270aHmhQkt9lEUjS49SPgiz7MiCgITarxX9E6A4=;
 b=0jqUD1zjEi55ZfhAIwMWNWENT9MRrpNqKPwfQ1O+9RvhBF4O2kdCyXExTphM2+/m9k
 /jnyyeFCDa3H2au4xyKDmwQ25q0BQadY/AQ5keaYUsgrQKFeyRVTbA64tAv2mHUVd79F
 MA1woP6wnOSriWMc3ixbrjlmsjIvDoDt2FMBhOh/vWdW0IYpXN+YySWq8QleQOn1OCNY
 zaA45ZWqVu8O+rYagST5vwdnd2n7ifjmb0xsLWIRl0HT3SzfiTn9LZMpvRUt0vUY023R
 scxbCiPEhmmQYIdSQSSJVaEk7yZ8fAWjNetppIAeHmtlBBJ2ncdcrr67LCrk49c7ptKV
 AVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683938182; x=1686530182;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xOh8270aHmhQkt9lEUjS49SPgiz7MiCgITarxX9E6A4=;
 b=JWhs9FgcufeTFaZ9ta81dlxfPmuvbsRMCFzqZ5njI3Nndhjr31VB7DPxxEblb+mnVE
 IjkzWnUug//iIP9dlgGPQTgSRnYLXWoYkALizdW0bjz2G5tqIEAh2w2rKDN090toMCzn
 iAssAHMJEI8pOm1zXk94w1DjuBpi/gwAYezTrRyFQsBhP+iu9zKLobESe6dK8hQ8DNgr
 QRbyZYITgKA04KNQvh36CnBGt4p4Pg4oOH5sxp2kc91Bd2AlXF9qXINckEsBeYhznLLr
 QUJESTi8UYn32SnS2+4tYWwYYhep40VTOHsGwkgH5imjDKaJmJd+ufgin13rP8pYhwPn
 54TA==
X-Gm-Message-State: AC+VfDyNaGzBOyL4m8fHhfqXRYs80DC4LO4DpUxxyYTDjYj+7LJFUVD0
 fUe5xqxh8QMUIqBnmV5zV452ubbjC1U=
X-Google-Smtp-Source: ACHHUZ4jgx7mBorgy6buawkOwqeHbNOdHMLcx00pmvGCjodnLruorEbphmkbg9mH6m6+8x0sTFFO0bzj3qo=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1790:b0:64a:f4ac:3433 with SMTP id
 s16-20020a056a00179000b0064af4ac3433mr565273pfg.6.1683938181992; Fri, 12 May
 2023 17:36:21 -0700 (PDT)
Date: Fri, 12 May 2023 17:35:40 -0700
In-Reply-To: <20230513003600.818142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230513003600.818142-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230513003600.818142-9-seanjc@google.com>
Subject: [PATCH v3 08/28] drm/i915/gvt: Use an "unsigned long" to iterate over
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

Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 92ceefe1e6fb..117bac85ac2c 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1619,7 +1619,7 @@ static void kvmgt_page_track_flush_slot(struct kvm *kvm,
 		struct kvm_memory_slot *slot,
 		struct kvm_page_track_notifier_node *node)
 {
-	int i;
+	unsigned long i;
 	gfn_t gfn;
 	struct intel_vgpu *info =
 		container_of(node, struct intel_vgpu, track_node);
-- 
2.40.1.606.ga4b1b128d6-goog

