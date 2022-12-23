Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75976549F2
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Dec 2022 01:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A1210E5FC;
	Fri, 23 Dec 2022 00:58:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA11210E613
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 23 Dec 2022 00:57:59 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-46658ec0cfcso29326897b3.19
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 22 Dec 2022 16:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=Wv7Sq7HoBVZLuoe15+dVfh7DmwmErtwyqBsV25zTBHk=;
 b=dwSVlAZgWxSlftsojKgyDx43KpFpCJGRtc3IRFu3GmjsFZNeXwP+0HlSGWWwzg1wic
 Mm8K8eEYW2H1yntodiOGHv7lvnOm/1z24jmE/DoOEat/BXnpKDQetjSQ2e/jlISDndzn
 1nmJlnErn6cTNVPegHjYDWQB84MK9ay6ny7wDMYHPF2bxt/IRS4V3CpBw0hHNVnqSIPI
 AOuSn1InRMkW0W/W4Y6bnc9MzsuXj7+c1GJLKaVvotPIuTliO7YbpvONhosQQihMYApz
 5tjeLw12T/6UEC7CuL4oYzssc0CPUs+/hEDmPefuDbcWkak3eQWMtCmICA4OJuf63YKd
 I+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wv7Sq7HoBVZLuoe15+dVfh7DmwmErtwyqBsV25zTBHk=;
 b=NekHgeEcckDlDqOzcmlMTCevucMRo/dSHUXqY1RNm9sDENFdVWteM03uGirM2Gr6Gb
 tsRyCT+eK3pGOVzManUrGTahrPk1ymd8sHpf5yhIWZQ0J/a0ypWr+dXAm/kZwYRnio8i
 sQE2vgnXOIeNkP5UyKmjWU1+tVFbLCip1LjxN3Yw5QqyrvHDnsCyLbtLZhU6zTIAamzf
 QLb5q2dxK9sqoH5DwTZbqMb5pPb5Grz21fvkrO2H/79RtuhN4fMR2IvN6LWqdNz/wQBp
 96iHyCnFWbpbM7phxivStThBq+F15CZmc5bxS1vIeAOSj57SAXcPJECOTjLM840YVFFj
 zrTQ==
X-Gm-Message-State: AFqh2koRRIMH0Ts4WSzT0pA5gwcGwP50vYtZ9fiv3Pq+UqbSKhmqSsvP
 O4pqpoNKmyvxj1bc/ZmwPezNgp0W6J4=
X-Google-Smtp-Source: AMrXdXstOrx3bUm5K/7Br+kFYpSxsgyLT1oZYQfRteln3A58NAAOzxF3mVNqbUjLF/5Fsax8WFKaA37+ZY8=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:9209:0:b0:756:3e38:765f with SMTP id
 b9-20020a259209000000b007563e38765fmr658755ybo.428.1671757078643; Thu, 22 Dec
 2022 16:57:58 -0800 (PST)
Date: Fri, 23 Dec 2022 00:57:20 +0000
In-Reply-To: <20221223005739.1295925-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221223005739.1295925-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221223005739.1295925-9-seanjc@google.com>
Subject: [PATCH 08/27] drm/i915/gvt: Hoist acquisition of vgpu_lock out to
 kvmgt_page_track_write()
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

Host the acquisition of vgpu_lock from intel_vgpu_page_track_handler() out
to its sole caller, kvmgt_page_track_write().  An upcoming fix will add a
mutex to protect the gfn hash table that referenced by
kvmgt_gfn_is_write_protected(), i.e. kvmgt_page_track_write() will need to
acquire another lock.  Conceptually, the to-be-introduced gfn_lock has
finer granularity than vgpu_lock and so the lock order should ideally be
vgpu_lock => gfn_lock, e.g. to avoid potential lock inversion elsewhere in
KVMGT.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c      |  4 ++++
 drivers/gpu/drm/i915/gvt/page_track.c | 10 ++--------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 5d0e029d60d7..ca9926061cd8 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1626,9 +1626,13 @@ static void kvmgt_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa,
 	struct intel_vgpu *info =
 		container_of(node, struct intel_vgpu, track_node);
 
+	mutex_lock(&info->vgpu_lock);
+
 	if (kvmgt_gfn_is_write_protected(info, gpa_to_gfn(gpa)))
 		intel_vgpu_page_track_handler(info, gpa,
 						     (void *)val, len);
+
+	mutex_unlock(&info->vgpu_lock);
 }
 
 static void kvmgt_page_track_flush_slot(struct kvm *kvm,
diff --git a/drivers/gpu/drm/i915/gvt/page_track.c b/drivers/gpu/drm/i915/gvt/page_track.c
index 3375b51c75f1..6d72d11914a5 100644
--- a/drivers/gpu/drm/i915/gvt/page_track.c
+++ b/drivers/gpu/drm/i915/gvt/page_track.c
@@ -162,13 +162,9 @@ int intel_vgpu_page_track_handler(struct intel_vgpu *vgpu, u64 gpa,
 	struct intel_vgpu_page_track *page_track;
 	int ret = 0;
 
-	mutex_lock(&vgpu->vgpu_lock);
-
 	page_track = intel_vgpu_find_page_track(vgpu, gpa >> PAGE_SHIFT);
-	if (!page_track) {
-		ret = -ENXIO;
-		goto out;
-	}
+	if (!page_track)
+		return -ENXIO;
 
 	if (unlikely(vgpu->failsafe)) {
 		/* Remove write protection to prevent furture traps. */
@@ -179,7 +175,5 @@ int intel_vgpu_page_track_handler(struct intel_vgpu *vgpu, u64 gpa,
 			gvt_err("guest page write error, gpa %llx\n", gpa);
 	}
 
-out:
-	mutex_unlock(&vgpu->vgpu_lock);
 	return ret;
 }
-- 
2.39.0.314.g84b9a713c41-goog

