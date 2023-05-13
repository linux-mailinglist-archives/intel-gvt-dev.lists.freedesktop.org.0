Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7032A70130B
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 02:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BD010E6F8;
	Sat, 13 May 2023 00:36:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0072B10E6FA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 13 May 2023 00:36:12 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-55a37bf6fd0so173033527b3.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 May 2023 17:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683938171; x=1686530171;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=XwIKHmmTJOUjvBBd2bP49EQ+CK24vBc6gAU6yUFfBBk=;
 b=IWvS7YHz5rmBbZ87EXsze85WRKsVI10IsyQ7JYdQXOzJhyy8qqCn3wse0CPqqOXIBX
 aqU7JitkpcoRfcEZY2JJNf8S8d/tnnkgje+Fb4zLrrKWNaMFAyOX/CLFfbtG/eSWp/qD
 5x9EqS0ian2MiBrDyRlPSTrcvLs4DL5O2LEPim+W/E/mF3yzmJmrq/CsiPCw5q8Wx9oP
 c0nbU7OgipPHjbcUxB3T/ZIW9THv5V8Gflz8/Q2xYarvFCVHcDsYYIrGq0/4NiZsi4AE
 e7SDmRDh/ac2cSIflttoJ8v7fnAtl8LfqwSunApvH8au0zJUJ/WWoenJobAWpbFDXWBB
 ue+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683938171; x=1686530171;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XwIKHmmTJOUjvBBd2bP49EQ+CK24vBc6gAU6yUFfBBk=;
 b=P1RTbXh/dRjg5/P6uJbTQPpXIR6c7CV6ke6u0loIVjRrDnWqhMfFLEb+28KBO9b7lb
 6pjO3usJhpylDkj5TtG2xtXoYTVIx37B3ypdR2R18qptP3wooJsKvAJ1cyAhLSi/pdvv
 x1J9UzE4Y2CrkmjxhZ3EJrs77fPyh8w/42V8VBggE/MiU3w+ohBJZMQbndyTBJrbB8hM
 CuZJE1PWntk7ajEM0dIM8AwNeXe+Vx/GN+MlYpDIZlFaxeekoRAcS9GUAn5eO2C/0aE/
 zteCcKWfkKI8XNcQAGVcGPMMmFPjCc/zWoNmdsYInlg5+2kQRXXBmf8JQErXr4LciVmr
 diGg==
X-Gm-Message-State: AC+VfDy5eFNxwVRJN1brCtg4BzWEJErNisI1zHe60GTI0xhVUjdsC3bO
 eKhxqQ3r4Yd7BRe8MQCrZg4ssIHw4N4=
X-Google-Smtp-Source: ACHHUZ6ory0k/qFNjJuvZa2lN6LXysci1uDwM6JYHBj9iXnwBOWmSbi9qEBm6YL7pzYtMD+CEsW4NisJ8+M=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:af0e:0:b0:55a:5641:54be with SMTP id
 n14-20020a81af0e000000b0055a564154bemr16292331ywh.6.1683938171803; Fri, 12
 May 2023 17:36:11 -0700 (PDT)
Date: Fri, 12 May 2023 17:35:35 -0700
In-Reply-To: <20230513003600.818142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230513003600.818142-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230513003600.818142-4-seanjc@google.com>
Subject: [PATCH v3 03/28] drm/i915/gvt: Verify hugepages are contiguous in
 physical address space
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

When shadowing a GTT entry with a 2M page, verify that the pfns are
contiguous, not just that the struct page pointers are contiguous.  The
memory map is virtual contiguous if "CONFIG_FLATMEM=y ||
CONFIG_SPARSEMEM_VMEMMAP=y", but not for "CONFIG_SPARSEMEM=y &&
CONFIG_SPARSEMEM_VMEMMAP=n", so theoretically KVMGT could encounter struct
pages that are virtually contiguous, but not physically contiguous.

In practice, this flaw is likely a non-issue as it would cause functional
problems iff a section isn't 2M aligned _and_ is directly adjacent to
another section with discontiguous pfns.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index de675d799c7d..429f0f993a13 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -161,7 +161,7 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 
 		if (npage == 0)
 			base_page = cur_page;
-		else if (base_page + npage != cur_page) {
+		else if (page_to_pfn(base_page) + npage != page_to_pfn(cur_page)) {
 			gvt_vgpu_err("The pages are not continuous\n");
 			ret = -EINVAL;
 			npage++;
-- 
2.40.1.606.ga4b1b128d6-goog

