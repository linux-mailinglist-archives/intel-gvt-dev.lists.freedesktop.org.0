Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62511701304
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 02:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6C210E6F8;
	Sat, 13 May 2023 00:36:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1481C10E6F8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 13 May 2023 00:36:08 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-6435432f56bso6663902b3a.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 May 2023 17:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683938167; x=1686530167;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=imcOaGkZAhtv0KvByjHYg/L+5O3EycYmRlnN5iZFB4Y=;
 b=U5+Q5AXJHkAU35wpnGLBPjphoKZTaHkEJDuj5UMIwyqKaq6mJuEU/6neP+0/SWCsb5
 NFesLARPQGcYZENv7TNTcjy4a5Rawvaq1zSQzjqS85yJCnvRPjQNxUoYKjrUwmWdAwRl
 ferixHNQ08N4q/G3XE/ZSOUCDOrmMzXMiJzZDM+uJRNzJMQEjPTlaPWvDzhYvfXzI/FM
 YtLSzbNzKOyKXXtQuh/Ucl+SagOra0HjqcetFJbXHnwTDK4FzH1iQX/RH1iIvX2IqiM+
 9ggCnY4bYnmh0gVz5Qa+0Nmsu8298HQZMepAoUQTXTaxZ/VoMcpUt+FH6CaI+e7WDf7O
 4tuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683938167; x=1686530167;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=imcOaGkZAhtv0KvByjHYg/L+5O3EycYmRlnN5iZFB4Y=;
 b=dK1volykyW/IRW+vicQSiFJO0Hm4E+diUh0aFJ57rsfbfHQzoxcY/51QWrNNJYjhr0
 /hUxozUHo9kvshlc78Q472nn114IuOSqaNk2GQJ9x8GL/NkJZ7qW+SsaERuq3I7WA1UI
 FZW6wyr3NOd6KjY1dMVLQZ8Qyx5eOEwS/9Q2skLH9TFT6lMka1jbEJ1ysNI/t9pw/XFi
 v8n2ViBxJ9iRukPO0UNmVphLXl3giUq7G9n9v5s+NfNGBVMzTWzuyqI8CB2xL+efCMr9
 fxiBI2U4IXJ8yI5NgZI3mSNF1KwDfi9yg+YvJh0Auz1BVy5TwHuaz+N5Peb6UD2B42Xj
 tFag==
X-Gm-Message-State: AC+VfDwyOY89EV9/EHeN5gIeLgKUwfsUlHvHCswrTRL7Npyvqmfj0CtH
 F0GgfGSHgjaT+1yjRhrZhRMKmxcwcEs=
X-Google-Smtp-Source: ACHHUZ4ATdqjI09a0zYXv4vbgfOF3+JF1scamk8//exztPkDhizmSIJXd2nKwBguV5wWxX5iDi6+9Cdy+VM=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:d5a:b0:643:536b:e764 with SMTP id
 n26-20020a056a000d5a00b00643536be764mr7181559pfv.4.1683938167743; Fri, 12 May
 2023 17:36:07 -0700 (PDT)
Date: Fri, 12 May 2023 17:35:33 -0700
In-Reply-To: <20230513003600.818142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230513003600.818142-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230513003600.818142-2-seanjc@google.com>
Subject: [PATCH v3 01/28] drm/i915/gvt: Verify pfn is "valid" before
 dereferencing "struct page"
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

Check that the pfn found by gfn_to_pfn() is actually backed by "struct
page" memory prior to retrieving and dereferencing the page.  KVM
supports backing guest memory with VM_PFNMAP, VM_IO, etc., and so
there is no guarantee the pfn returned by gfn_to_pfn() has an associated
"struct page".

Fixes: b901b252b6cf ("drm/i915/gvt: Add 2M huge gtt support")
Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 4ec85308379a..58b9b316ae46 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1183,6 +1183,10 @@ static int is_2MB_gtt_possible(struct intel_vgpu *vgpu,
 	pfn = gfn_to_pfn(vgpu->vfio_device.kvm, ops->get_pfn(entry));
 	if (is_error_noslot_pfn(pfn))
 		return -EINVAL;
+
+	if (!pfn_valid(pfn))
+		return -EINVAL;
+
 	return PageTransHuge(pfn_to_page(pfn));
 }
 
-- 
2.40.1.606.ga4b1b128d6-goog

