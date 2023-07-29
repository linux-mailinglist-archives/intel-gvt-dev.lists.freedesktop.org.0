Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E53A767ACE
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Jul 2023 03:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FB710E080;
	Sat, 29 Jul 2023 01:35:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0058E10E080
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Jul 2023 01:35:42 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-55c79a5564cso1776192a12.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jul 2023 18:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690594542; x=1691199342;
 h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2aNtPlal9OWN0aZWcZSKjhuqySpulk2z3YwltgdnxOc=;
 b=aD6rvUzeldJIOFqh07JiGAIHUt+37rzVz6FFjf/hxAnL9/T2VR6Og0Qpv9duH4A1lG
 NFqLaerd8sj0nbDa5uPgHg8FSGJThirIo6gOb/pTKK2Gda9QyTg5pTT/RpIcX1OtMeb+
 5myBr1NNYbm0a47mb1ktSU65E9PGRF6KB+VN0yYIn8k2/NdPuLVyv+AFenqYiXDNM9M2
 +0DY29u2qLR2xr94oBe26CDk7yVQ5RN9FKqEVS9JTaPoq0OkK7yVC7gSsrVIOmBHMjc0
 8kPa06i+WGodC4j6u5HCPzw8M9M2w/PnhjW5vP7094usMQi57mzlPltk8nyTutTlx5p5
 5d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690594542; x=1691199342;
 h=cc:to:from:subject:message-id:mime-version:date:reply-to
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2aNtPlal9OWN0aZWcZSKjhuqySpulk2z3YwltgdnxOc=;
 b=gGHEyY3KCZ+8loxSqodMmZPjpC11kGxr+RydaI+uPdByUpUup2jVJBmDuzgASVeAOU
 woXd/cegDxxKUaXJ64GPlJgLBeoieGnw03AW8MkNQiaaF4j8+BbQ5oQ3cymGzqVAep5t
 kL6rN+SghDpWnQiFXRD0X448OdBV0EN7ctr30enpSQ3i11zYRSs00Ium0fB2epv5sTBJ
 CilHdQqtT3xTGv1POgC2CwnFgqayJT2zdSy9AAaEHQjl9j5C1Mc8i4sNsGXkplo9/JpV
 kiU8rlanUIC+VGE25JFKj7tceBTi+dbTXsO6xr2oNhHQLTosYHrOLy5lRU1PNtG5Czb2
 4BLg==
X-Gm-Message-State: ABy/qLZaNjezb9hhLAcui+RWxe9Qg+OGoqbZ/+5w+1h7EznqwThGg1Js
 OkwrJtpd2upbqokdAICqtuD23ahVVJY=
X-Google-Smtp-Source: APBJJlG8zdk0RrB1IoGsURjiKt+Vybh6dGjVm/WOQUsPLn4yrE9jlZwj4MxMRG6tYFXiw8SaB04PyrxSJ+4=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2291:b0:1b5:2b14:5f2c with SMTP id
 b17-20020a170903229100b001b52b145f2cmr14489plh.4.1690594542487; Fri, 28 Jul
 2023 18:35:42 -0700 (PDT)
Date: Fri, 28 Jul 2023 18:35:06 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230729013535.1070024-1-seanjc@google.com>
Subject: [PATCH v4 00/29] drm/i915/gvt: KVM: KVMGT fixes and page-track
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
 Yongwei Ma <yongwei.ma@intel.com>, Ben Gardon <bgardon@google.com>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Fix a handful of minor bugs in KVMGT, and overhaul KVM's page-track APIs
to provide a leaner and cleaner interface.  The motivation for this
series is to (significantly) reduce the number of KVM APIs that KVMGT
uses, with a long-term goal of making all kvm_host.h headers KVM-internal.

If there are no objections or issues, my plan is to take this through the
KVM tree for 6.6 (I had it ready early last week, and then forgot to actually
post v4, /facepalm).

Thanks much for all the help!

v4:
 - Collect tags. [Yongwei, Zhi, Yan]
 - Add a patch to fix a benign (other than a WARN) bug where KVMGT would
   attempt to unpin an empty range. [Yan]
 - Move the check for an attached vGPU all the way up to shadow_ppgtt_mm(). [Zhi]

v3:
 - https://lore.kernel.org/all/20230513003600.818142-1-seanjc@google.com
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

Yan Zhao (5):
  drm/i915/gvt: remove interface intel_gvt_is_valid_gfn
  drm/i915/gvt: Don't try to unpin an empty page range
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
 drivers/gpu/drm/i915/gvt/kvmgt.c      | 120 +++++-------
 drivers/gpu/drm/i915/gvt/page_track.c |  10 +-
 12 files changed, 322 insertions(+), 392 deletions(-)
 create mode 100644 arch/x86/kvm/mmu/page_track.h


base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
-- 
2.41.0.487.g6d72f3e995-goog

