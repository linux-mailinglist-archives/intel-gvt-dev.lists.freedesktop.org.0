Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3816B5660
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 11 Mar 2023 01:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526B510EA46;
	Sat, 11 Mar 2023 00:23:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96CF10EA43
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 11 Mar 2023 00:23:23 +0000 (UTC)
Received: by mail-pj1-x104a.google.com with SMTP id
 l10-20020a17090a598a00b0023b28afea55so470168pji.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 Mar 2023 16:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678494203;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=Dl93qHhMLxKPHFQ6pWyH1Q53L+c+frE+R34SS4aDFMI=;
 b=A5bTxFpKv+szN66TzCvK19Ft/76A37Tb4WVt01WT+cWiPfjrtrU6V1LalIMKYB3vWj
 ahwkahPbFFRuYQ445gPRNRQVd2F+wQjsbyOSuuqsNtmiCkidRkFo5DFY21I9BaQKcean
 RIRti0nwCel+5OGumdPl+/xlnhiYx6omnIN/W6UtHdN4BNfSwvQ008OchTLboAurnPh/
 8pxe+MncULYhV5yvIt0yo+RdceNc/KoEmZbj/GQ7dhEloJRuBk3xjGAKj8+3Sz5SfLoD
 WY0JV5dsRGiY9Kztz2yk+BaVx5kLBKuomQBRTk504BCjSrzFojBQgcdgeD7GMaoJ27I4
 CgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678494203;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dl93qHhMLxKPHFQ6pWyH1Q53L+c+frE+R34SS4aDFMI=;
 b=PwxDRptetVcEPqUpqB8j0AltJ8O9Desdbq4S6ktQ01V0jGULXdEpnzXTAlZPNGBR+R
 Q0qEcr2WZtm5h4SH9nnQC4CCEd9T9ao6ZUgON2CLHLmhftjXnMwLLps3L/hQ/OU54nrx
 omHvG4/oJ5niuqRaziuX3R1LtP/lzX/J7ScHb9a6dthTDfo0e+UskxsSC5iOOusxVHcS
 1RD8AToy11yPkfBUkaABt4FllBkfF6RRMOmkLXBtmpMT6rxyaUD4s0Bvr5fVFOoHwBxI
 hsO0uT1+3ge+y4VPobAOM1G8G/mGdqGuFtr44RufZ0+gIJ0HwrwVOyU9vTyqxOlkIxgP
 WxWA==
X-Gm-Message-State: AO0yUKXDNkFCz/Ft7JPQaGnl8qZ5jtY+niF9SOZr05sHs9QCpv3zPM7C
 MNqd8ruPlA1dvSxk+nxw1RprUTUdBWk=
X-Google-Smtp-Source: AK7set9uc4Nnn+1fAkc9FZ4r8kS5/jc1gb92nDxbeYrH4aHwDZMmi6LsPtfr9YZ5EHgtE1HMCGhKO3AiQbU=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:a3cc:b0:199:4a1b:c5f4 with SMTP id
 q12-20020a170902a3cc00b001994a1bc5f4mr10345631plb.2.1678494203093; Fri, 10
 Mar 2023 16:23:23 -0800 (PST)
Date: Fri, 10 Mar 2023 16:22:40 -0800
In-Reply-To: <20230311002258.852397-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230311002258.852397-1-seanjc@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230311002258.852397-10-seanjc@google.com>
Subject: [PATCH v2 09/27] drm/i915/gvt: Drop unused helper
 intel_vgpu_reset_gtt()
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

Drop intel_vgpu_reset_gtt() as it no longer has any callers.  In addition
to eliminating dead code, this eliminates the last possible scenario where
__kvmgt_protect_table_find() can be reached without holding vgpu_lock.
Requiring vgpu_lock to be held when calling __kvmgt_protect_table_find()
will allow a protecting the gfn hash with vgpu_lock without too much fuss.

No functional change intended.

Fixes: ba25d977571e ("drm/i915/gvt: Do not destroy ppgtt_mm during vGPU D3->D0.")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 18 ------------------
 drivers/gpu/drm/i915/gvt/gtt.h |  1 -
 2 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index e60bcce241f8..293bb2292021 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -2845,24 +2845,6 @@ void intel_vgpu_reset_ggtt(struct intel_vgpu *vgpu, bool invalidate_old)
 	ggtt_invalidate(gvt->gt);
 }
 
-/**
- * intel_vgpu_reset_gtt - reset the all GTT related status
- * @vgpu: a vGPU
- *
- * This function is called from vfio core to reset reset all
- * GTT related status, including GGTT, PPGTT, scratch page.
- *
- */
-void intel_vgpu_reset_gtt(struct intel_vgpu *vgpu)
-{
-	/* Shadow pages are only created when there is no page
-	 * table tracking data, so remove page tracking data after
-	 * removing the shadow pages.
-	 */
-	intel_vgpu_destroy_all_ppgtt_mm(vgpu);
-	intel_vgpu_reset_ggtt(vgpu, true);
-}
-
 /**
  * intel_gvt_restore_ggtt - restore all vGPU's ggtt entries
  * @gvt: intel gvt device
diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gtt.h
index a3b0f59ec8bd..4cb183e06e95 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.h
+++ b/drivers/gpu/drm/i915/gvt/gtt.h
@@ -224,7 +224,6 @@ void intel_vgpu_reset_ggtt(struct intel_vgpu *vgpu, bool invalidate_old);
 void intel_vgpu_invalidate_ppgtt(struct intel_vgpu *vgpu);
 
 int intel_gvt_init_gtt(struct intel_gvt *gvt);
-void intel_vgpu_reset_gtt(struct intel_vgpu *vgpu);
 void intel_gvt_clean_gtt(struct intel_gvt *gvt);
 
 struct intel_vgpu_mm *intel_gvt_find_ppgtt_mm(struct intel_vgpu *vgpu,
-- 
2.40.0.rc1.284.g88254d51c5-goog

