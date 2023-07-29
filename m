Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F06767ADC
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Jul 2023 03:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D70F10E221;
	Sat, 29 Jul 2023 01:35:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DCD10E7C6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Jul 2023 01:35:56 +0000 (UTC)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-1bba7a32a40so20538115ad.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jul 2023 18:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690594556; x=1691199356;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=xRti94I88xI36VdJ1C9pM+DO3reoJ85WhIcKAlj3P2A=;
 b=JzVeSbakvBsITk4WCc6SvXMXZXpKg1sKgNCLCg329z4+CwqicRWa18ItETELkleHut
 Yv4X8wRd3Le9uqQGPUWs5BUQkj7TQJDt9Eb5fhMjb23YSABFTjI2bzN/glzKpBumIzEs
 fTGh7mmm0I6apNNmDAUz1eyleS73AlS2QlY8+8eRKCJtqc/P/YOG5SqsNHXCud5EkzFP
 jE1ZE8Vnryd4Dn0nEp5qJTOVH3Wyqn42CpQxKf2W0v6q+EQhwJBTSDxzWFjjb+QZElus
 ssNGr64x9a3IHDfdFolrvWOyeULaX7kmUyN6RPwtI37uS4WYyBbIw//m00wT14Fxuhox
 HQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690594556; x=1691199356;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xRti94I88xI36VdJ1C9pM+DO3reoJ85WhIcKAlj3P2A=;
 b=P49nYCOGkWUqCuHk/HMEoZFYwfOAWMZJ/ByKtzqF5kYhuACTlAYFI2kct3J/Zo2uWJ
 SlQjktgq1MiswIRUtodH1ZyZxtoZJNFE6v0nsYlfRIIvquFflKKjs2XuwGjUj83XsEhf
 7kwG05lw0kz3MFYQf9mCLCGjIgLHpaRm/BQskAVIroYHcxkp7/bi53wKIzn2CwbEpJIN
 Ny/c0QLue9KXP+XsmvYl9gfs9ai85pDK0srmNnyHYAj85XuKuwmS6H1MndjK7H0T/eL3
 mX3LvCR60WeFVkIBdbrjg2D9jRzwPcpWpLY5V8nRVtmSLysVF+yyk1P5RWsVtZodEf2Z
 Cppg==
X-Gm-Message-State: ABy/qLYXXmsdz5bWM6wrBG4+TKX6G4vpXNPRHgNAxJi2ey/6Aiifa/MZ
 sVr36VJigFu/G2Zl6NiuxzLVqracHG8=
X-Google-Smtp-Source: APBJJlGLaYng3bx/UmtgPECyQBQ2iUlUJH1kZl0/YE/Hn7IX+/6SrxIFl/3qUim+xESr+hSwSKOan6hQzyM=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:230b:b0:1b9:e338:a8b7 with SMTP id
 d11-20020a170903230b00b001b9e338a8b7mr13091plh.5.1690594556187; Fri, 28 Jul
 2023 18:35:56 -0700 (PDT)
Date: Fri, 28 Jul 2023 18:35:12 -0700
In-Reply-To: <20230729013535.1070024-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230729013535.1070024-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230729013535.1070024-7-seanjc@google.com>
Subject: [PATCH v4 06/29] drm/i915/gvt: Explicitly check that vGPU is attached
 before shadowing
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

Move the check that a vGPU is attacked from is_2MB_gtt_possible() all the
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
 drivers/gpu/drm/i915/gvt/gtt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 5426a27c1b71..2aed31b497c9 100644
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
@@ -1277,6 +1275,9 @@ static int ppgtt_populate_shadow_entry(struct intel_vgpu *vgpu,
 	if (!pte_ops->test_present(ge))
 		return 0;
 
+	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
+		return -EINVAL;
+
 	gfn = pte_ops->get_pfn(ge);
 
 	switch (ge->type) {
-- 
2.41.0.487.g6d72f3e995-goog

