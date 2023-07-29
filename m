Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB70C767AE3
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Jul 2023 03:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8B510E220;
	Sat, 29 Jul 2023 01:36:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09D610E222
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Jul 2023 01:35:58 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d1ef70d6a02so2524613276.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jul 2023 18:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690594558; x=1691199358;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=+XjAGHd/pRUURJC5c+iD/2xPUGDJjhirgzMYmue5Z/k=;
 b=CKHIraU33muydXY8T11nRNSenZqtYLuDp2ZQytPMAEgN8FpFJtvv8c6QRBQGgm/m28
 5/Ef0IINErZFczYeoHyi2UfkWYU12OwKkPvWHaSFJrjUPZqGfUYERJutLB1aMadZV1Zn
 SbQEj3XAgke61HqppvVm0rMriHUMBVoTNCE2nLD2YyhY5gcfR1Rhx1wnLXfG2afabSK2
 pRkPRHhkAdYbj9t7TkumNFQMi0Xc34gB7AEzsmQRuKqF6zeV/+K8B4Kwdh97aMLi9utI
 7XQaYcFW2xHNzFDjGpWhfz4/Z7F4dsBgodxWkzRezSqVS7FOSN25NA1qNujI/xI62XWI
 jSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690594558; x=1691199358;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+XjAGHd/pRUURJC5c+iD/2xPUGDJjhirgzMYmue5Z/k=;
 b=YGwDL2cXkytNoXvdE7yzg3bPq5Xnyjnjh4BcsEF26LvzBOVza/dlaGaVse66zxRZQO
 2jVxJAJTaq33U6IZtBOzvEOwBYqz9MYyd0Lr4j0C3hcmto+OllwAKedV7fRJ4Hpzf690
 1s2U00Fm9U8KH4eU7MXNMv3G1qyipc0acSrSQdGNtc27ICqScXHVIqO6pdM0CcHk0H9Q
 mwTXOdfm4tkba4bq+X0KfvCrB3lRmSXiW9E4qPoxPkmdAB1U/YC/s06qd//md/Sz5FUF
 XLbMpH9bKc+JgigqorbA/yWf8AAdA899C15usaTf6BqMepf1rScuZJ5FMR9h1Wh41gbB
 oITQ==
X-Gm-Message-State: ABy/qLYKKfU4+MgfVFLpMZlYj6Qxi1crRrxjKF/01lUuaQfMRYCjyONx
 cgUkpnmqCh/b4Fm910NX8jMggoUee0w=
X-Google-Smtp-Source: APBJJlFT9Nke5NL62NRh+Q2yKpoZkg5zH69bxdcqRsIUxtenGQRHYqPeN341DwjUJ6XKSWDHD2CKgLcKfrk=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:e7c8:0:b0:c67:975c:74ab with SMTP id
 e191-20020a25e7c8000000b00c67975c74abmr19106ybh.4.1690594558122; Fri, 28 Jul
 2023 18:35:58 -0700 (PDT)
Date: Fri, 28 Jul 2023 18:35:13 -0700
In-Reply-To: <20230729013535.1070024-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230729013535.1070024-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230729013535.1070024-8-seanjc@google.com>
Subject: [PATCH v4 07/29] drm/i915/gvt: Error out on an attempt to shadowing
 an unknown GTT entry type
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

Bail from ppgtt_populate_shadow_entry() if an unexpected GTT entry type
is encountered instead of subtly falling through to the common "direct
shadow" path.  Eliminating the default/error path's reliance on the common
handling will allow hoisting intel_gvt_dma_map_guest_page() into the case
statements so that the 2MiB case can try intel_gvt_dma_map_guest_page()
and fallback to splitting the entry on failure.

Reviewed-by: Zhi Wang <zhi.a.wang@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 2aed31b497c9..61e38acee2d5 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1306,6 +1306,7 @@ static int ppgtt_populate_shadow_entry(struct intel_vgpu *vgpu,
 		return -EINVAL;
 	default:
 		GEM_BUG_ON(1);
+		return -EINVAL;
 	}
 
 	/* direct shadow */
-- 
2.41.0.487.g6d72f3e995-goog

