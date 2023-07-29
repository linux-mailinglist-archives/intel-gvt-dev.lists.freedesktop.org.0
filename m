Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A99BC767B18
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Jul 2023 03:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9125D10E7D5;
	Sat, 29 Jul 2023 01:36:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0B610E7D9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Jul 2023 01:36:40 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-5637a108d02so1778327a12.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jul 2023 18:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690594600; x=1691199400;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=DwvbUo0YFwD2y5U7V+bjb1xFYzZ0nLkltBIeETbMd6E=;
 b=Ge68nujbq9a2/5qupOk7vKqq3XlDn5p8ntiVpmK47hZYN+/QS4qy0wLj6mzi//Ln3N
 bjIWafKzZtkd8LQqhjRdZON3HDXB5fCK9FhlneYcw4v+xtAWX9E4CPS0ddxUxM1BU+ou
 uqsJv3tEk+OkpS9BfP1CupF2QdoKOH02fs1K3Ib89GUvvYmRfPRX9GXq8Qk6hWUr/tNP
 U7vyKG8jPeUgErUAu/w48/FjAGWgL+fFw7j74vkaZbaqjcBqf1vC9GEbvdtcM9pxV6mC
 P1Ioi1DZwQV+4ATKOYarBouEJgAG/V3mHWk+Hvgxt1vW2YDRiU63dl0VSgEIpd2po20a
 NDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690594600; x=1691199400;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DwvbUo0YFwD2y5U7V+bjb1xFYzZ0nLkltBIeETbMd6E=;
 b=TIYu0vjve4XBDa6yNdp9tPKU2CGcH2gX/+biMhG+39iycKz7pce2zy50IaepNQ81fM
 xKcXvH+2e668nT7LqkgcgDbl+QnXMnNx/o76sakOI0678d4+J53ropjV2ItnjK83iJkU
 5Tk6r3+gf9M+2vMuhF5fU3SxLUnVjxVjdY2ZC6odTx9BSmOF/unHjbqVrdlYXlFg40a1
 bMd3nObLTt6pu1idUnIVJOQFLVxPMTF5coxOfXDG4tFpI1F9kmJ5tVJ0zbXJKSr5cI+7
 BsfdLpHPJ0YhZ9sknPjEGWFQYXSDmA7o+yx2W3uq42Hbq1ygb9ZnhQ1ewrTj+82gg5CA
 01Bg==
X-Gm-Message-State: ABy/qLZDg3YqMpwniHFDca1Sn5m8GxU3IbjVVSvMQbOnKjpy3fvIEZP8
 eGd3XNQlUDBMkrMmhH7dq9BCMVwAeEo=
X-Google-Smtp-Source: APBJJlEZ24/UIUc9lE3mpH4b4NTm9trjEBiNa0Xf1jgeOJ+PFmgDRd7JQ2suy7GGPER95kXMryrtDNI0qhM=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:da83:b0:1b3:c62d:71b5 with SMTP id
 j3-20020a170902da8300b001b3c62d71b5mr12428plx.0.1690594599204; Fri, 28 Jul
 2023 18:36:39 -0700 (PDT)
Date: Fri, 28 Jul 2023 18:35:35 -0700
In-Reply-To: <20230729013535.1070024-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230729013535.1070024-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230729013535.1070024-30-seanjc@google.com>
Subject: [PATCH v4 29/29] drm/i915/gvt: Drop final dependencies on KVM
 internal details
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

Open code gpa_to_gfn() in kvmgt_page_track_write() and drop KVMGT's
dependency on kvm_host.h, i.e. include only kvm_page_track.h.  KVMGT
assumes "gfn == gpa >> PAGE_SHIFT" all over the place, including a few
lines below in the same function with the same gpa, i.e. there's no
reason to use KVM's helper for this one case.

No functional change intended.

Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h   | 3 ++-
 drivers/gpu/drm/i915/gvt/kvmgt.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 2d65800d8e93..53a0a42a50db 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -34,10 +34,11 @@
 #define _GVT_H_
 
 #include <uapi/linux/pci_regs.h>
-#include <linux/kvm_host.h>
 #include <linux/vfio.h>
 #include <linux/mdev.h>
 
+#include <asm/kvm_page_track.h>
+
 #include "i915_drv.h"
 #include "intel_gvt.h"
 
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index eb50997dd369..aaed3969f204 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1585,7 +1585,7 @@ static void kvmgt_page_track_write(gpa_t gpa, const u8 *val, int len,
 
 	mutex_lock(&info->vgpu_lock);
 
-	if (kvmgt_gfn_is_write_protected(info, gpa_to_gfn(gpa)))
+	if (kvmgt_gfn_is_write_protected(info, gpa >> PAGE_SHIFT))
 		intel_vgpu_page_track_handler(info, gpa,
 						     (void *)val, len);
 
-- 
2.41.0.487.g6d72f3e995-goog

