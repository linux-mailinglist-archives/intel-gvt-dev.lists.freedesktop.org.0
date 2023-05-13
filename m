Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FE1701303
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 13 May 2023 02:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A4D10E039;
	Sat, 13 May 2023 00:36:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEDC10E039
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 13 May 2023 00:36:06 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-643a294825dso5984938b3a.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 May 2023 17:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683938166; x=1686530166;
 h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U1Ge3/d9lA0wDaa4KjBcDxtmuRNcZOWTUCAWw0gE6gI=;
 b=oetF2r1M5UiBxGIcL8zFJt3KZzPc4fIcwMDdhX/l57bLLJh7cM3X4mNNADBirTiMsw
 tno7AR+Dvgh3Vw4uuqw6BiGqojcKm9HdP5GJEjmyW5fgNQ3uH9GfWcik8X9l8Il8yj/F
 JDSdCnCk453r2ImEA+XEqnVZNEGK62kt196UdpjOQTLp5m6ljRH7LbmbsKQcW1JkZLWL
 eTI/tPiSeCVE0Ra8n1OkKzP9IuDY0/KphXTBaOaj5Ytdy2EoJjClJKVr2vKk22PnetQj
 TQ1WL518q999Tr/FzyV0uLw0cE55dRKp34tT4WPlBaPORkpnV8W5J1MOW7nmEVxQABm9
 gj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683938166; x=1686530166;
 h=cc:to:from:subject:message-id:mime-version:date:reply-to
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U1Ge3/d9lA0wDaa4KjBcDxtmuRNcZOWTUCAWw0gE6gI=;
 b=VGA/AkhErCfRjMYZaWIoWObyxpBxhnTs5y/WneHBh/ndqdoCJWlkomuLoYfSgRYPEE
 RC6nUPsGm/d7nKSz/5aSRXbw60fj+9QMcNNbmHC9csyyxNJycK6rawGcOMesQhgNnhhP
 U9VYTV0nTssqdTvcEfHAzL+oMzAWbc1fIGMQr9lVtCGOm0YvVETN0gvZjl+Fj0w1Ukij
 uzUHdOYNsUZU4D/NFBKKZJwI4Npe3GCk8ZO7vZUB4jkzYCirsmA70/XH4cFeBz4TqgDg
 KrjW/kJ/+ry3GGL/ZjE864x8My+LvFetbBs+NLfpV30qe31zZjmUG7ZnD0sDF8WVcS6C
 BcWw==
X-Gm-Message-State: AC+VfDx2IVUsQL1mNGlgq0hmgQo3/aHX/woVgVdB/NYXT7T6+6M33LLQ
 cpp81CW/b3BJMnPSTMALy1jcTF1+mUs=
X-Google-Smtp-Source: ACHHUZ6XSa3OoCY9QC+biOTjnUfwxLBt3mtAiLJDXi5Zo5Z6h8DJwGXJ7iRHgf0PShhQobJeUJ93cGlbS9k=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:d5a:b0:643:536b:e764 with SMTP id
 n26-20020a056a000d5a00b00643536be764mr7181548pfv.4.1683938166027; Fri, 12 May
 2023 17:36:06 -0700 (PDT)
Date: Fri, 12 May 2023 17:35:32 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230513003600.818142-1-seanjc@google.com>
Subject: [PATCH v3 00/28] drm/i915/gvt: KVM: KVMGT fixes and page-track
 cleanups
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

Fix a variety of found-by-inspection bugs in KVMGT, and overhaul KVM's
page-track APIs to provide a leaner and cleaner interface.  The motivation
for this series is to (significantly) reduce the number of KVM APIs that
KVMGT uses, with a long-term goal of making all kvm_host.h headers
KVM-internal.

As always for this series, the KVMGT changes are compile tested only.

Based on "git://git.kernel.org/pub/scm/virt/kvm/kvm.git tags/kvm-6.4-1".

v3:
 - Collect reviewed/tested tags (I apologize if I missed any, I manually
   gathered them this time due to a goof in my workflow). [Yan]
 - Drop check on max KVM paging size from KVMGT. [Yan]
 - Drop the explicit change on THP pages, and instead validate that the
   pfns (not struct page pointers) are contiguous. [Yan]
 - Fix buggy intel_gvt_dma_map_guest_page() usage by eliminating a helper
   for shadowing 2MiB GTT entries. [Yan]
 - Move kvm_arch_flush_shadow_{all,memslot}() to mmu.c instead of exposing
   kvm_mmu_zap_all_fast() outside of mmu.c. [Yan]
 - Fix an alignment goof in hlist_for_each_entry_srcu() usage. [Yan]
 - Wrap full definition of external page track structures with
   CONFIG_KVM_EXTERNAL_WRITE_TRACKING. [Yan]

v2:
 - https://lore.kernel.org/all/20230311002258.852397-1-seanjc@google.com
 - Reuse vgpu_lock to protect gfn hash instead of introducing a new (and
   buggy) mutext. [Yan]
 - Remove a spurious return from kvm_page_track_init(). [Yan]
 - Take @kvm directly in the inner __kvm_page_track_write(). [Yan]
 - Delete the gfn sanity check that relies on kvm_is_visible_gfn() instead
   of providing a dedicated interface. [Yan]

v1: https://lore.kernel.org/lkml/20221223005739.1295925-1-seanjc@google.com

Sean Christopherson (24):
  drm/i915/gvt: Verify pfn is "valid" before dereferencing "struct page"
  drm/i915/gvt: Verify hugepages are contiguous in physical address
    space
  drm/i915/gvt: Put the page reference obtained by KVM's gfn_to_pfn()
  drm/i915/gvt: Explicitly check that vGPU is attached before shadowing
  drm/i915/gvt: Error out on an attempt to shadowing an unknown GTT
    entry type
  drm/i915/gvt: Don't rely on KVM's gfn_to_pfn() to query possible 2M
    GTT
  drm/i915/gvt: Use an "unsigned long" to iterate over memslot gfns
  drm/i915/gvt: Drop unused helper intel_vgpu_reset_gtt()
  drm/i915/gvt: Protect gfn hash table with vgpu_lock
  KVM: x86/mmu: Move kvm_arch_flush_shadow_{all,memslot}() to mmu.c
  KVM: x86/mmu: Don't rely on page-track mechanism to flush on memslot
    change
  KVM: x86/mmu: Don't bounce through page-track mechanism for guest PTEs
  KVM: drm/i915/gvt: Drop @vcpu from KVM's ->track_write() hook
  KVM: x86: Reject memslot MOVE operations if KVMGT is attached
  drm/i915/gvt: Don't bother removing write-protection on to-be-deleted
    slot
  KVM: x86/mmu: Move KVM-only page-track declarations to internal header
  KVM: x86/mmu: Use page-track notifiers iff there are external users
  KVM: x86/mmu: Drop infrastructure for multiple page-track modes
  KVM: x86/mmu: Rename page-track APIs to reflect the new reality
  KVM: x86/mmu: Assert that correct locks are held for page
    write-tracking
  KVM: x86/mmu: Bug the VM if write-tracking is used but not enabled
  KVM: x86/mmu: Drop @slot param from exported/external page-track APIs
  KVM: x86/mmu: Handle KVM bookkeeping in page-track APIs, not callers
  drm/i915/gvt: Drop final dependencies on KVM internal details

Yan Zhao (4):
  drm/i915/gvt: remove interface intel_gvt_is_valid_gfn
  KVM: x86: Add a new page-track hook to handle memslot deletion
  drm/i915/gvt: switch from ->track_flush_slot() to
    ->track_remove_region()
  KVM: x86: Remove the unused page-track hook track_flush_slot()

 arch/x86/include/asm/kvm_host.h       |  16 +-
 arch/x86/include/asm/kvm_page_track.h |  73 +++-----
 arch/x86/kvm/mmu.h                    |   2 +
 arch/x86/kvm/mmu/mmu.c                |  51 +++--
 arch/x86/kvm/mmu/page_track.c         | 256 +++++++++++++-------------
 arch/x86/kvm/mmu/page_track.h         |  58 ++++++
 arch/x86/kvm/x86.c                    |  22 +--
 drivers/gpu/drm/i915/gvt/gtt.c        | 102 ++--------
 drivers/gpu/drm/i915/gvt/gtt.h        |   1 -
 drivers/gpu/drm/i915/gvt/gvt.h        |   3 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c      | 117 +++++-------
 drivers/gpu/drm/i915/gvt/page_track.c |  10 +-
 12 files changed, 320 insertions(+), 391 deletions(-)
 create mode 100644 arch/x86/kvm/mmu/page_track.h


base-commit: b3c98052d46948a8d65d2778c7f306ff38366aac
-- 
2.40.1.606.ga4b1b128d6-goog

