Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CDA767AEF
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Jul 2023 03:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B8110E7C1;
	Sat, 29 Jul 2023 01:36:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF1810E220
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Jul 2023 01:36:04 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-56cf9a86277so27080457b3.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jul 2023 18:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690594563; x=1691199363;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=jR7BnC969pgKWTx9m4VJ/Tnc3fh3TNhcM8FugjFDG5s=;
 b=385x4LkyYI25EL7vCk2Hi0KW9gS9gZvHL1JnHgzpOaJ1tKPMfr8p5TgIS1XSZ0EIi/
 Aky/mkbZy8RLTulRx+02iS/8dJ+/xsaWtEJKweohfsksGnr770bM4aVkxQdDBuBFmVbU
 p9dq6by8p2R9euXFCDuw2gvAPb1ox98+4vf+gFE9pQftYwNKCt2ZOH+06vvIO4dNxRWI
 XufM85Q91AQO0WpZEabccAIBG4mYmAvdDcb/7WHQOWYNNTTbzbUtFQa5xgHCeNRJd+4N
 /ybMSE01dZuDtCAL9r1Vu8lPfEOcqBW8GoeqKarhcfigHu93zQ4DTdRKYe7UCEbOHa4j
 mGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690594563; x=1691199363;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jR7BnC969pgKWTx9m4VJ/Tnc3fh3TNhcM8FugjFDG5s=;
 b=WHwW8xZxc4QiFnjS75WfXcGGZGhjfeemrBSvrZWNuR+zZCGsEhODDhYDr5QosmsbLF
 EFvg1B3KA9vT7b3SA4oqs2UTQPVZC1/u2bL52rxWNUHdIJbuvNcI3g1UOl0vkp9HA5+d
 uSBjGLV/Wp9B3tcaUWWlYPltBHWinNHTmeVjGFjYfh6rDVg0yZU8eJh3n26r3Wz4yvOx
 +oZKa2S8eIZVXwRpi3DOF0P2M9q0o04wvf8OYP9n+aARhbKlDIVnmaWopX2rTBecIeap
 h33iAVLHx77Ye7CuWB2AiJiv7+sNm5nXoJSu3DQgcWQEUQOVXvzy3ysRTEemTNqZCDoZ
 KE4g==
X-Gm-Message-State: ABy/qLYApqodi8WSuUoOm0iumERDT0aXMJD93srE7P+Yh4MiPImuFEI2
 rqCchEGz5GauiedcGCyaDQ7hyhc9akE=
X-Google-Smtp-Source: APBJJlHuL5HoUfm5LXE7SMQsfKhRwqR0mem8RaxeeurcfkCJ1l29F9xSAlCa5e4S9A9R15uUFeuoWP9Mdi8=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:4007:0:b0:583:4551:858d with SMTP id
 l7-20020a814007000000b005834551858dmr25400ywn.9.1690594563303; Fri, 28 Jul
 2023 18:36:03 -0700 (PDT)
Date: Fri, 28 Jul 2023 18:35:16 -0700
In-Reply-To: <20230729013535.1070024-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230729013535.1070024-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230729013535.1070024-11-seanjc@google.com>
Subject: [PATCH v4 10/29] drm/i915/gvt: Drop unused helper
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
 Yongwei Ma <yongwei.ma@intel.com>, Ben Gardon <bgardon@google.com>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Drop intel_vgpu_reset_gtt() as it no longer has any callers.  In addition
to eliminating dead code, this eliminates the last possible scenario where
__kvmgt_protect_table_find() can be reached without holding vgpu_lock.
Requiring vgpu_lock to be held when calling __kvmgt_protect_table_find()
will allow a protecting the gfn hash with vgpu_lock without too much fuss.

No functional change intended.

Fixes: ba25d977571e ("drm/i915/gvt: Do not destroy ppgtt_mm during vGPU D3->D0.")
Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 18 ------------------
 drivers/gpu/drm/i915/gvt/gtt.h |  1 -
 2 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index f505be9e647a..c3c623b929ce 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -2817,24 +2817,6 @@ void intel_vgpu_reset_ggtt(struct intel_vgpu *vgpu, bool invalidate_old)
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
2.41.0.487.g6d72f3e995-goog

