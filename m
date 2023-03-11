Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685596B5655
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 11 Mar 2023 01:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5A010EA2E;
	Sat, 11 Mar 2023 00:23:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C227210EA2E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 11 Mar 2023 00:23:15 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id
 e1-20020a17090301c100b0019cd429f407so3617686plh.17
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 Mar 2023 16:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678494195;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=r49XytvkzC3ENPPvGwyC5xpl4Ljg2/LRKUh4AJANr14=;
 b=Zpt7qqXUP9P3hTZayirZMVkamUEUKqACeon7oYYD97xhyXG29DKFvc2SehXuaMK1eh
 96bAuuC0sdckifi7A5x5BvHjSYp6n5kOQFXB0UoJB1YbHPV06dxE1l1SqnXubOFXmRsK
 Z85nrGTBFlhudy7NMByKLTHcgoIlcwlw77krq/LeeXJrbT4i1RgCaCjiipszhzOC68N1
 Wqgm7NqjACHAxcRBAe/V0X19VDezwBvGmMGY2dfPUEgvNyjcfSdH8o9zcchvrm2jY66q
 QaFVvRsnIfOiGjSgjPR+aPpZh8DNkEiAG84TgnZaQn3CnSP9MOVs0GtZw+JsxOyoPRG9
 pjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678494195;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r49XytvkzC3ENPPvGwyC5xpl4Ljg2/LRKUh4AJANr14=;
 b=CK9N8Lj+VOTBcSPz54NkDdu6iGMsb2YSIq0ZUNEqHOiaUthNe4iTxAldOhoK6Cf7TM
 mOWfZgmPsB8bhl4MTu/gwY6tHvAu1J5EX7SmewVl2zDe1uqy/qL9EKC+saM8lkVjUc3o
 ppEileN6lc5EACq02Sc44jHPpXjQXOs9rL/sXRKJIs9xccVSOkBpztQJxuOVU549StEt
 VS8a/ID0qRYOpvVyj4gnDwQ0fq2IwssYGTn8x9muZmWS02oktFWMMT746aAlDj5X41+g
 YCxBgB1UCIJrncqNPEVJBMM090ffIMvz5QMITQ6G0K50frJu8QeLQLPMPH4kJ4j4JfY/
 QJzw==
X-Gm-Message-State: AO0yUKVsZRPUW6DqEZ2qrpOqAeKjMmwW+krIvzIQbITdM14KkuUAAZ9y
 6MYp3wjfMzLh9uTD1MOcpxhnb4nLRGY=
X-Google-Smtp-Source: AK7set8lYctWIEVQhZKOHEthwTGecs0QEL8AybuNs+im1tcttQnv6WGZC5mS7H7PWE7VWu3+BvN7S4Enjn8=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:7bc6:b0:22c:2048:794e with SMTP id
 d6-20020a17090a7bc600b0022c2048794emr10002028pjl.7.1678494195444; Fri, 10 Mar
 2023 16:23:15 -0800 (PST)
Date: Fri, 10 Mar 2023 16:22:36 -0800
In-Reply-To: <20230311002258.852397-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230311002258.852397-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230311002258.852397-6-seanjc@google.com>
Subject: [PATCH v2 05/27] drm/i915/gvt: Verify VFIO-pinned page is THP when
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
index 8ae7039b3683..90997cc385b4 100644
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
2.40.0.rc1.284.g88254d51c5-goog

