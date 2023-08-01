Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD4F76C0A4
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  2 Aug 2023 01:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A50610E01F;
	Tue,  1 Aug 2023 23:05:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B6910E446
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  1 Aug 2023 23:05:34 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d114bc2057fso6384333276.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 01 Aug 2023 16:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690931134; x=1691535934;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=lOE510A+r2SLKIiF63zcAdgP6ekXGYyGQOz9dKOk6xM=;
 b=oykWRz0UvoWkHbMJ4JcV2bJNVGfHj4zIiBnJtx63aKkLAy6kg9qQMbD7+1jLlv7IFd
 VrHAJma/Eq0svEihuDhUE7kQXOCMuCSI0o8tIiWe7B2X0KZsdFU12oq9GJDLBL7PSEN8
 0Z7q6ykZx9xGSShNvxrNhG0j0I/kwdceref5gVQTRrZ9b6vaf9Fg7+blFmDQ4/QY4d9g
 7lVpy1PXiImwfgBxul4u5JylRrPA9bWCmejtPePjWKQN9sl8lt9g6wykdHmyH2lpTqoF
 oxgvXhxnOpsg+TB4fKlBpM7Wk69dkXgj3x9oxH8BmJlHx2QeALFUwF0fAa+Bx4E6ouSb
 eTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690931134; x=1691535934;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lOE510A+r2SLKIiF63zcAdgP6ekXGYyGQOz9dKOk6xM=;
 b=Lqu0gCWsDXaPckXxD8oVTBkG2pX2YHaKmvVU4eG504Ab5KY1oLiqlFwMbRrFSeBMop
 M13+8mCHBQe7XRkO/gK4YdltS0uCoKya22h+QjJ7uWLVXnVjUPvDYQe/5f+sIuJgiTsc
 rBJyXmp2IBlIp8QJi8wJ/18Z/34UoYX41A8UNs/lr1MjR4njp4AIEXB80mfCN2XVZINh
 0uwut/c5DOy+27cu1cEFlsxLE4uZYYU2lyxpohdo75+zV/rnaNM/lNBQ4U4TWFAZ85gm
 OPuYWrZiI74xmqvo4XQiIYIL3QejKG6aUR4b+PKhqdmPnM2adho4obT8F1AieBZmND6X
 R6JQ==
X-Gm-Message-State: ABy/qLaRYPFSnstuWbuqV15tSBg3HYfs3VGLk5n8a541pn8+OvuKy5Jx
 VVDmH9kXceChJI/cff1mAMtPB+A+09U=
X-Google-Smtp-Source: APBJJlHn1e4ri559tI6+3xb+Npi5fhlcyuFCEAVF9xRaO+W0uxQM7JO0odUJ8x7oUL++20OucTcpgdatf0E=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2057:0:b0:c41:4696:e879 with SMTP id
 g84-20020a252057000000b00c414696e879mr85006ybg.7.1690931133875; Tue, 01 Aug
 2023 16:05:33 -0700 (PDT)
Date: Tue,  1 Aug 2023 16:05:21 -0700
In-Reply-To: <20230729013535.1070024-7-seanjc@google.com>
Mime-Version: 1.0
References: <20230729013535.1070024-7-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
Message-ID: <20230801230520.1509954-2-seanjc@google.com>
Subject: [PATCH v4.1] drm/i915/gvt: Explicitly check that vGPU is attached
 before shadowing
From: Sean Christopherson <seanjc@google.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
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
Cc: Sean Christopherson <seanjc@google.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Move the check that a vGPU is attached from is_2MB_gtt_possible() all the
way up to shadow_ppgtt_mm() to avoid unnecessary work, and to make it more
obvious that a future cleanup of is_2MB_gtt_possible() isn't introducing a
bug.

is_2MB_gtt_possible() has only one caller, ppgtt_populate_shadow_entry(),
and all paths in ppgtt_populate_shadow_entry() eventually check for
attachment by way of intel_gvt_dma_map_guest_page().

And of the paths that lead to ppgtt_populate_shadow_entry(),
shadow_ppgtt_mm() is the only one that doesn't already check for
INTEL_VGPU_STATUS_ACTIVE or INTEL_VGPU_STATUS_ATTACHED.

  workload_thread() <= pick_next_workload() => INTEL_VGPU_STATUS_ACTIVE
  |
  -> dispatch_workload()
     |
     |-> prepare_workload()
         |
         -> intel_vgpu_sync_oos_pages()
         |  |
         |  |-> ppgtt_set_guest_page_sync()
         |      |
         |      |-> sync_oos_page()
         |          |
         |          |-> ppgtt_populate_shadow_entry()
         |
         |-> intel_vgpu_flush_post_shadow()
             |
  1:         |-> ppgtt_handle_guest_write_page_table()
                 |
                 |-> ppgtt_handle_guest_entry_add()
                     |
  2:                 | -> ppgtt_populate_spt_by_guest_entry()
                     |    |
                     |    |-> ppgtt_populate_spt()
                     |        |
                     |        |-> ppgtt_populate_shadow_entry()
                     |            |
                     |            |-> ppgtt_populate_spt_by_guest_entry() [see 2]
                     |
                     |-> ppgtt_populate_shadow_entry()

  kvmgt_page_track_write()  <= KVM callback => INTEL_VGPU_STATUS_ATTACHED
  |
  |-> intel_vgpu_page_track_handler()
      |
      |-> ppgtt_write_protection_handler()
          |
          |-> ppgtt_handle_guest_write_page_table_bytes()
              |
              |-> ppgtt_handle_guest_write_page_table() [see 1]

Signed-off-by: Sean Christopherson <seanjc@google.com>
---

v4.1:

 - Actually make the code do what the changelog says. [Yan]
 - Fix a typo in the changelog. [Yan]

 drivers/gpu/drm/i915/gvt/gtt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 5426a27c1b71..de6a484090d7 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1163,8 +1163,6 @@ static int is_2MB_gtt_possible(struct intel_vgpu *vgpu,
 	if (!HAS_PAGE_SIZES(vgpu->gvt->gt->i915, I915_GTT_PAGE_SIZE_2M))
 		return 0;
 
-	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
-		return -EINVAL;
 	pfn = gfn_to_pfn(vgpu->vfio_device.kvm, ops->get_pfn(entry));
 	if (is_error_noslot_pfn(pfn))
 		return -EINVAL;
@@ -1827,6 +1825,9 @@ static int shadow_ppgtt_mm(struct intel_vgpu_mm *mm)
 	if (mm->ppgtt_mm.shadowed)
 		return 0;
 
+	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
+		return -EINVAL;
+
 	mm->ppgtt_mm.shadowed = true;
 
 	for (index = 0; index < ARRAY_SIZE(mm->ppgtt_mm.guest_pdps); index++) {

base-commit: 03e8f77e106ba1d2fd980f8b38339dad33333a07
-- 
2.41.0.585.gd2178a4bd4-goog

