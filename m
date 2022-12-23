Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5944B6549EC
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Dec 2022 01:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE8110E199;
	Fri, 23 Dec 2022 00:57:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064C210E5F0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Dec 2022 00:57:53 +0000 (UTC)
Received: by mail-pg1-x549.google.com with SMTP id
 a72-20020a63904b000000b00489753edf13so1898237pge.21
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Dec 2022 16:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=d+Q/YQeHZWJ0vREmMTQabuLJv/+4O5g7zAHpbuOFGTs=;
 b=cGB2Kk6wNWNAIq0pn/lG31LZ+jy1BxxG22XBitcS8CWDmp2z4Lhdnef0BGcAm+RvUh
 dJmcq7R+7SuGck4PuyUeyUCJkW65Lvfi9fboC8f7g9EVEpDN857mWJxXqLgFMLrQWGln
 Kjecvsk3TvvJ2gGLKH55SZwSxBxEOcPg0oFfMnU/R5GleViIAv1XjeCPLyU1wTWSJK2S
 +iS3t0vV/qEduOYgT/AES8Jul3ZiXXRXD3dl2cOxJsXpYTudq3EXtRTOFEi2bF+1egWF
 QP48ZSSaeO6lXbbjEfyK0KsD6kqL75R5X9rhhYcXTnDt3mgITCArhWecSITrbyBZ+xt2
 3VTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d+Q/YQeHZWJ0vREmMTQabuLJv/+4O5g7zAHpbuOFGTs=;
 b=cLeEMe6whhESIWMbebGLD9ZHHjaXpVQVgSgMK+aOJA2irqK8dCdKCu8QzVkCGj6WKE
 mal54HfcL2Dyb9z0LSl3CEtCT2IPIBgWfI4zB4j2CGk4bQvJXgc6RNfPpa4ucx6VLZ8V
 iPuCLvoZjaDnzh13RdjJRceITzsgE1lnQ2l6bW3sqcdnAnn8agoS3lMTXenoD+nCjNZz
 UAdWtPRc0G9rudpWXkA+W3jc19aQYioCCC1EGPvLTjvy0TKXAwdpX/oY+vPe0iyovToL
 IKzVtNbaQUB1ZOJyCu+vYro5FOaKmf/HPNr+YAN82HDTQcQ8xHgP3ueFnca1/ul/XSm6
 PIeg==
X-Gm-Message-State: AFqh2krMAIvNPVNgK3AOc7I8DadYkqnwgiRnAx4m4bn5Xu32oUEqnMHz
 uoYehb3mnfdB5qsj8KBPwBrIhgGNX/M=
X-Google-Smtp-Source: AMrXdXs1Xo/ZikoJFeArKRToXLGYmJLPRFbPAWwxlzpvnOIeRODeOddNaO6jwczXdcof/QkZXUFwsMJdkN8=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:701:b0:219:1d0a:34a6 with SMTP id
 s1-20020a17090b070100b002191d0a34a6mr180782pjz.1.1671757072021; Thu, 22 Dec
 2022 16:57:52 -0800 (PST)
Date: Fri, 23 Dec 2022 00:57:16 +0000
In-Reply-To: <20221223005739.1295925-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221223005739.1295925-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221223005739.1295925-5-seanjc@google.com>
Subject: [PATCH 04/27] drm/i915/gvt: Verify VFIO-pinned page is THP when
 shadowing 2M gtt entry
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

When shadowing a GTT entry with a 2M page, explicitly verify that the
first page pinned by VFIO is a transparent hugepage instead of assuming
that page observed by is_2MB_gtt_possible() is the same page pinned by
vfio_pin_pages().  E.g. if userspace is doing something funky with the
guest's memslots, or if the page is demoted between is_2MB_gtt_possible()
and vfio_pin_pages().

This is more of a performance optimization than a bug fix as the check
for contiguous struct pages should guard against incorrect mapping (even
though assuming struct pages are virtually contiguous is wrong).

The real motivation for explicitly checking for a transparent hugepage
after pinning is that it will reduce the risk of introducing a bug in a
future fix for a page refcount leak (KVMGT doesn't put the reference
acquired by gfn_to_pfn()), and eventually will allow KVMGT to stop using
KVM's gfn_to_pfn() altogether.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 714221f9a131..6f358b4fe406 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -159,11 +159,25 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 			goto err;
 		}
 
-		if (npage == 0)
-			base_page = cur_page;
+		if (npage == 0) {
+			/*
+			 * Bail immediately to avoid unnecessary pinning when
+			 * trying to shadow a 2M page and the host page isn't
+			 * a transparent hugepage.
+			 *
+			 * TODO: support other type hugepages, e.g. HugeTLB.
+			 */
+			if (size == I915_GTT_PAGE_SIZE_2M &&
+			    !PageTransHuge(cur_page))
+				ret = -EIO;
+			else
+				base_page = cur_page;
+		}
 		else if (base_page + npage != cur_page) {
 			gvt_vgpu_err("The pages are not continuous\n");
 			ret = -EINVAL;
+		}
+		if (ret < 0) {
 			npage++;
 			goto err;
 		}
-- 
2.39.0.314.g84b9a713c41-goog

