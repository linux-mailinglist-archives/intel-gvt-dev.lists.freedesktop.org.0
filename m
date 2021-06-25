Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B6E3B3D7E
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 25 Jun 2021 09:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42496ECE0;
	Fri, 25 Jun 2021 07:37:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8686ECE0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 25 Jun 2021 07:37:18 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso5021743pjp.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 25 Jun 2021 00:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=arS0mKVzVlqtqVfiVwhtHqUqhLwMsArq/fcDdatjRgU=;
 b=dHO26QDY5LUMI+Tc2XZzsgpXZDpORNAX7YyZkCQ5xy7oSytr1O3oUF01CG9gH6yL5q
 Y3La01kqEVPP9WWTMrMPMSLK8aydIT/ocZATNuL06J51ec4Okfq4Nv5ekqNB14ZWBhjL
 tL88LfPKWlydh9eprQr48AASmItpc0PiVGEJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=arS0mKVzVlqtqVfiVwhtHqUqhLwMsArq/fcDdatjRgU=;
 b=XOKonCWI9LkqMy8Cskv7vy1U5Aigq7g8YwkwbhxK0NQE4YrH9NyfXDlzSEZpA2RHWG
 qvElSBa4mRmh8Ev1/skfyxboNm9jHu465mgC0G4mjD9V17CYqLwZSXNKrNifL2eExZG+
 4l8uRn/ffyDaeV5mrvK8Rzo53m7ZEazf92T7oYP/ACLSM4haQrvuYqQoR+xyNuC3aW0i
 OWAi/E4yvfX8kv6/kSWRzk10beagXkuFbXEp57JIaHGnyrhhzeyoSBl2xWMS+IEjXU5m
 eNTna90C3ZPZ5KiciZp97W56nePqYLvKUd1jWVYReSHD9XbLquDJXPu9uKTr5HYpddWw
 /e5Q==
X-Gm-Message-State: AOAM531UsD6eBtd1QnPz9VwcvpN/LcUFkFu/vzLlk42r/zX4Q4kzwVc/
 uZJb9CJzdoXn85Wl9NMQsP6C9w==
X-Google-Smtp-Source: ABdhPJzJyYhoE1B9Fk5Wy7zlre5sRlAATH1Tds+i1SalCyUSMMBey0lep4anSoEg3on5gb5KkCMm2Q==
X-Received: by 2002:a17:902:c947:b029:125:34d4:249d with SMTP id
 i7-20020a170902c947b029012534d4249dmr7925026pla.3.1624606637340; 
 Fri, 25 Jun 2021 00:37:17 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:1492:9d4f:19fa:df61])
 by smtp.gmail.com with UTF8SMTPSA id a9sm9986991pjm.51.2021.06.25.00.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 00:37:16 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Nick Piggin <npiggin@gmail.com>
Subject: [PATCH v2 0/5] Remove uses of struct page from x86 and arm64 MMU
Date: Fri, 25 Jun 2021 16:36:11 +0900
Message-Id: <20210625073616.2184426-1-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Alexandru Elisei <alexandru.elisei@arm.com>, Joerg Roedel <joro@8bytes.org>,
 David Stevens <stevensd@google.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, intel-gfx@lists.freedesktop.org,
 kvm-ppc@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 intel-gvt-dev@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Jim Mattson <jmattson@google.com>, Sean Christopherson <seanjc@google.com>,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

KVM supports mapping VM_IO and VM_PFNMAP memory into the guest by using
follow_pte in gfn_to_pfn. However, the resolved pfns may not have
assoicated struct pages, so they should not be passed to pfn_to_page.
This series removes such calls from the x86 and arm64 secondary MMU. To
do this, this series introduces gfn_to_pfn_page functions that parallel
the gfn_to_pfn functions. These functions take an extra out parameter
which  contains the page if the hva was resovled by gup. This allows the
caller to call put_page only when necessated by gup.

The gfn_to_pfn functions are depreciated. For now the functions remain
with identical behavior to before, but callers should be migrated to the
new gfn_to_pfn_page functions. I added new functions instead of simply
adding another parameter to the existing functions to make it easier to
track down users of the deprecated functions.

I have migrated the x86 and arm64 secondary MMUs to the new
gfn_to_pfn_page functions.

This addresses CVE-2021-22543 on x86 and arm64.

v1 -> v2:
 - Introduce new gfn_to_pfn_page functions instead of modifying the
   behavior of existing gfn_to_pfn functions, to make the change less
   invasive.
 - Drop changes to mmu_audit.c
 - Include Nicholas Piggin's patch to avoid corrupting refcount in the
   follow_pte case, and use it in depreciated gfn_to_pfn functions.
 - Rebase on kvm/next

David Stevens (4):
  KVM: mmu: introduce new gfn_to_pfn_page functions
  KVM: x86/mmu: use gfn_to_pfn_page
  KVM: arm64/mmu: use gfn_to_pfn_page
  KVM: mmu: remove over-aggressive warnings

Nicholas Piggin (1):
  KVM: do not allow mapping valid but non-refcounted pages

 arch/arm64/kvm/mmu.c            |  26 +++--
 arch/x86/kvm/mmu/mmu.c          |  50 ++++-----
 arch/x86/kvm/mmu/mmu_internal.h |   3 +-
 arch/x86/kvm/mmu/paging_tmpl.h  |  23 +++--
 arch/x86/kvm/mmu/tdp_mmu.c      |   6 +-
 arch/x86/kvm/mmu/tdp_mmu.h      |   4 +-
 arch/x86/kvm/x86.c              |   6 +-
 include/linux/kvm_host.h        |  17 +++
 virt/kvm/kvm_main.c             | 177 +++++++++++++++++++++++++-------
 9 files changed, 222 insertions(+), 90 deletions(-)

-- 
2.32.0.93.g670b81a890-goog

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
