Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 584B74AC470
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Feb 2022 16:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F045910E5DC;
	Mon,  7 Feb 2022 15:55:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD7B10E5DC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  7 Feb 2022 15:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644249303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ckLuH3eXQt4Wu9Nzp1D8ksAkv1tHukiQ+KMKFiTtdwY=;
 b=cIx6hvdW99GeleJU4jRK3RUHgV40wH49QCk2UgtyVVxMq7fkD+K5V9JcxmG1r6jcYVKWXm
 h72qR6Uim788LQWPXDR/cCOy9iohJUdxq1+plDA3TTh1iSQAavw3LnQOSFiocbajLhCulu
 eCqL8sWlE5+biPjldKlyHuETyp9qw7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-3oJzETgWM123BYxoIWYJeQ-1; Mon, 07 Feb 2022 10:55:00 -0500
X-MC-Unique: 3oJzETgWM123BYxoIWYJeQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAE56100C609;
 Mon,  7 Feb 2022 15:54:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 182D87DE5F;
 Mon,  7 Feb 2022 15:54:48 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH RESEND 00/30] My patch queue
Date: Mon,  7 Feb 2022 17:54:17 +0200
Message-Id: <20220207155447.840194-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Wanpeng Li <wanpengli@tencent.com>, David Airlie <airlied@linux.ie>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Kan Liang <kan.liang@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Chang S. Bae" <chang.seok.bae@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tony Luck <tony.luck@intel.com>, Sean Christopherson <seanjc@google.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This is set of various patches that are stuck in my patch queue.=0D
=0D
KVM_REQ_GET_NESTED_STATE_PAGES patch is mostly RFC, but it does seem=0D
to work for me.=0D
=0D
Read-only APIC ID is also somewhat RFC.=0D
=0D
Some of these patches are preparation for support for nested AVIC=0D
which I almost done developing, and will start testing very soon.=0D
=0D
Resend with cleaned up CCs.=0D
=0D
Best regards,=0D
	Maxim Levitsky=0D
=0D
Maxim Levitsky (30):=0D
  KVM: x86: SVM: don't passthrough SMAP/SMEP/PKE bits in !NPT &&=0D
    !gCR0.PG case=0D
  KVM: x86: nSVM: fix potential NULL derefernce on nested migration=0D
  KVM: x86: nSVM: mark vmcb01 as dirty when restoring SMM saved state=0D
  KVM: x86: nSVM/nVMX: set nested_run_pending on VM entry which is a=0D
    result of RSM=0D
  KVM: x86: nSVM: expose clean bit support to the guest=0D
  KVM: x86: mark syntethic SMM vmexit as SVM_EXIT_SW=0D
  KVM: x86: nSVM: deal with L1 hypervisor that intercepts interrupts but=0D
    lets L2 control them=0D
  KVM: x86: lapic: don't touch irr_pending in kvm_apic_update_apicv when=0D
    inhibiting it=0D
  KVM: x86: SVM: move avic definitions from AMD's spec to svm.h=0D
  KVM: x86: SVM: fix race between interrupt delivery and AVIC inhibition=0D
  KVM: x86: SVM: use vmcb01 in avic_init_vmcb=0D
  KVM: x86: SVM: allow AVIC to co-exist with a nested guest running=0D
  KVM: x86: lapic: don't allow to change APIC ID when apic acceleration=0D
    is enabled=0D
  KVM: x86: lapic: don't allow to change local apic id when using older=0D
    x2apic api=0D
  KVM: x86: SVM: remove avic's broken code that updated APIC ID=0D
  KVM: x86: SVM: allow to force AVIC to be enabled=0D
  KVM: x86: mmu: trace kvm_mmu_set_spte after the new SPTE was set=0D
  KVM: x86: mmu: add strict mmu mode=0D
  KVM: x86: mmu: add gfn_in_memslot helper=0D
  KVM: x86: mmu: allow to enable write tracking externally=0D
  x86: KVMGT: use kvm_page_track_write_tracking_enable=0D
  KVM: x86: nSVM: correctly virtualize LBR msrs when L2 is running=0D
  KVM: x86: nSVM: implement nested LBR virtualization=0D
  KVM: x86: nSVM: implement nested VMLOAD/VMSAVE=0D
  KVM: x86: nSVM: support PAUSE filter threshold and count when=0D
    cpu_pm=3Don=0D
  KVM: x86: nSVM: implement nested vGIF=0D
  KVM: x86: add force_intercept_exceptions_mask=0D
  KVM: SVM: implement force_intercept_exceptions_mask=0D
  KVM: VMX: implement force_intercept_exceptions_mask=0D
  KVM: x86: get rid of KVM_REQ_GET_NESTED_STATE_PAGES=0D
=0D
 arch/x86/include/asm/kvm-x86-ops.h    |   1 +=0D
 arch/x86/include/asm/kvm_host.h       |  24 +-=0D
 arch/x86/include/asm/kvm_page_track.h |   1 +=0D
 arch/x86/include/asm/msr-index.h      |   1 +=0D
 arch/x86/include/asm/svm.h            |  36 +++=0D
 arch/x86/include/uapi/asm/kvm.h       |   1 +=0D
 arch/x86/kvm/Kconfig                  |   3 -=0D
 arch/x86/kvm/hyperv.c                 |   4 +=0D
 arch/x86/kvm/lapic.c                  |  53 ++--=0D
 arch/x86/kvm/mmu.h                    |   8 +-=0D
 arch/x86/kvm/mmu/mmu.c                |  31 ++-=0D
 arch/x86/kvm/mmu/page_track.c         |  10 +-=0D
 arch/x86/kvm/svm/avic.c               | 135 +++-------=0D
 arch/x86/kvm/svm/nested.c             | 167 +++++++-----=0D
 arch/x86/kvm/svm/svm.c                | 375 ++++++++++++++++++++++----=0D
 arch/x86/kvm/svm/svm.h                |  60 +++--=0D
 arch/x86/kvm/svm/svm_onhyperv.c       |   1 +=0D
 arch/x86/kvm/vmx/nested.c             | 107 +++-----=0D
 arch/x86/kvm/vmx/vmcs.h               |   6 +=0D
 arch/x86/kvm/vmx/vmx.c                |  48 +++-=0D
 arch/x86/kvm/x86.c                    |  42 ++-=0D
 arch/x86/kvm/x86.h                    |   5 +=0D
 drivers/gpu/drm/i915/Kconfig          |   1 -=0D
 drivers/gpu/drm/i915/gvt/kvmgt.c      |   5 +=0D
 include/linux/kvm_host.h              |  10 +-=0D
 25 files changed, 764 insertions(+), 371 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

