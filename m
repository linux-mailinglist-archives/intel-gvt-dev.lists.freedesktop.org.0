Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC936F74FE
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  4 May 2023 21:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF8A10E517;
	Thu,  4 May 2023 19:54:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D00B10E518
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  4 May 2023 19:54:42 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-64115e69e1eso10214742b3a.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 04 May 2023 12:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683230082; x=1685822082;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=6d3N2trVvF/0SP9aYKkzozOiaqRgiMUEtCybqqCwYC4=;
 b=QGqN/dIaLx/HiXmQI1kaBztgkpnHbsX3GdB8YDpkN656uyErpM195kRw9ijzz5n8Ob
 g7FwILlufi3YDVv/HVffEt61pUKMIZ5epWv2j+0picIvTp5YK1xjQmiKLaQ9DOSbueRc
 muYL7W8HvTZCPLMgHp45iwNnJUEOpRYA9obGSllcVjACBNPVXo3fUdxZBUj6RUqpkIGx
 k/tkNwyxfM0eldPQlIzKQIHjL7fLm3hiYM4sm8q8TPokxI41tktyZm6xVoxIYytH/KHL
 6sA3Pg/KBCQZmCN/nbQG+RNcuAA3v23ffVXhSL8cstZYjV9Cjztd1oIg5UtE0VXKpf+S
 D7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683230082; x=1685822082;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6d3N2trVvF/0SP9aYKkzozOiaqRgiMUEtCybqqCwYC4=;
 b=NrtRxnv6FLnAiyGmFbQkMNwG+THvI2fjjjC157Z7TqHrPeRq6wK7Q3Jysy2wmGVC81
 hwFwZtGwiP+QdrbmwgKfYQ2PLJ+u8pQsJuyr1SbrqViyU1RBW+KYILdsKn8DKj6r7GoA
 5Vjr3/7YVoTe6fsCt6gRKaRkmVkYI99aP6/6QAO0s5qcfNGpP6FIUsm10GMizkVXMbg3
 6DmZyePVneyE3scNh0ZTpPo7N87yF0aLunPKtP23Yl18MlrUl4pJmtZZQIGV0xOW+Jfg
 MWAxsGtHlb7gHfNPabhgsLr3PaJz9xYGR2BgO+2eJinFp3xcH/tufQ3OXjH996oWhr0u
 DEdw==
X-Gm-Message-State: AC+VfDzBjch+2BMEZ48KmhE3R7/wl4mfHnJy1lsDms608JQxJaRDZwdK
 gJaHa/De7Ir1bogfxVVCPdwYmtM9ejg=
X-Google-Smtp-Source: ACHHUZ6PuvZPi6zDMylo7QfkM96x9IBh58YDyqmz4u9ST0E5CBqQ++ARqtoyXc3r/vmAbveuvG4IuNYS3I8=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:4a52:b0:247:b82f:b42 with SMTP id
 lb18-20020a17090b4a5200b00247b82f0b42mr19846pjb.4.1683230082371; Thu, 04 May
 2023 12:54:42 -0700 (PDT)
Date: Thu, 4 May 2023 12:54:40 -0700
In-Reply-To: <ZBH4RizqdigXeYte@google.com>
Mime-Version: 1.0
References: <20230311002258.852397-1-seanjc@google.com>
 <20230311002258.852397-21-seanjc@google.com>
 <ZBGfmLuORj+ZBziv@yzhao56-desk.sh.intel.com> <ZBH4RizqdigXeYte@google.com>
Message-ID: <ZFQNgKGcexo0nQ4S@google.com>
Subject: Re: [PATCH v2 20/27] KVM: x86/mmu: Use page-track notifiers iff there
 are external users
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: kvm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Ben Gardon <bgardon@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Mar 15, 2023, Sean Christopherson wrote:
> On Wed, Mar 15, 2023, Yan Zhao wrote:
> > On Fri, Mar 10, 2023 at 04:22:51PM -0800, Sean Christopherson wrote:
> > > Disable the page-track notifier code at compile time if there are no
> > > external users, i.e. if CONFIG_KVM_EXTERNAL_WRITE_TRACKING=3Dn.  KVM =
itself
> > > now hooks emulated writes directly instead of relying on the page-tra=
ck
> > > mechanism.
> > >=20
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> > >  arch/x86/include/asm/kvm_host.h       |  2 ++
> > >  arch/x86/include/asm/kvm_page_track.h |  2 ++
> > >  arch/x86/kvm/mmu/page_track.c         |  9 ++++-----
> > >  arch/x86/kvm/mmu/page_track.h         | 29 +++++++++++++++++++++++--=
--
> > >  4 files changed, 33 insertions(+), 9 deletions(-)
> > >=20
> > > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/k=
vm_host.h
> > > index 1a4225237564..a3423711e403 100644
> > > --- a/arch/x86/include/asm/kvm_host.h
> > > +++ b/arch/x86/include/asm/kvm_host.h
> > > @@ -1265,7 +1265,9 @@ struct kvm_arch {
> > >  	 * create an NX huge page (without hanging the guest).
> > >  	 */
> > >  	struct list_head possible_nx_huge_pages;
> > > +#ifdef CONFIG_KVM_EXTERNAL_WRITE_TRACKING
> > >  	struct kvm_page_track_notifier_head track_notifier_head;
> > > +#endif
> > >  	/*
> > >  	 * Protects marking pages unsync during page faults, as TDP MMU pag=
e
> > >  	 * faults only take mmu_lock for read.  For simplicity, the unsync
> > > diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include=
/asm/kvm_page_track.h
> > > index deece45936a5..53c2adb25a07 100644
> > > --- a/arch/x86/include/asm/kvm_page_track.h
> > > +++ b/arch/x86/include/asm/kvm_page_track.h
> > The "#ifdef CONFIG_KVM_EXTERNAL_WRITE_TRACKING" can be moved to the
> > front of this file?
> > All the structures are only exposed for external users now.
>=20
> Huh.  I've no idea why I didn't do that.  IIRC, the entire reason past me=
 wrapped
> track_notifier_head in an #ifdef was to allow this change in kvm_page_tra=
ck.h.
>=20
> I'll do this in the next version unless I discover an edge case I'm overl=
ooking.

Ah, deja vu.  I tried this first time around, and got yelled at by the kern=
el test
robot.  Unsuprisingly, my second attempt yielded the same result :-)

  HDRTEST drivers/gpu/drm/i915/gvt/gvt.h
In file included from <command-line>:
gpu/drivers/gpu/drm/i915/gvt/gvt.h:236:45: error: field =E2=80=98track_node=
=E2=80=99 has incomplete type
  236 |         struct kvm_page_track_notifier_node track_node;
      |                                             ^~~~~~~~~~

The problem is direct header inclusion.  Nothing in the kernel includes gvt=
.h
when CONFIG_DRM_I915_GVT=3Dn, but the header include guard tests include he=
aders
directly on the command line.  I think I'll define a "stub" specifically to=
 play
nice with this sort of testing.  Guarding the guts of gvt.h with CONFIG_DRM=
_I915_GVT
would just propagate the problem, and guarding the node definition in "stru=
ct
intel_vgpu" would be confusing since the guard would be dead code for all i=
ntents
and purposes.

The obvious alternative would be to leave kvm_page_track_notifier_node outs=
ide of
the #ifdef, but I really want to bury kvm_page_track_notifier_head for KVM'=
s sake,
and having "head" buried but not "node" would also be weird and confusing.

diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/k=
vm_page_track.h
index 33f087437209..3d040741044b 100644
--- a/arch/x86/include/asm/kvm_page_track.h
+++ b/arch/x86/include/asm/kvm_page_track.h
@@ -51,6 +51,12 @@ void kvm_page_track_unregister_notifier(struct kvm *kvm,
=20
 int kvm_write_track_add_gfn(struct kvm *kvm, gfn_t gfn);
 int kvm_write_track_remove_gfn(struct kvm *kvm, gfn_t gfn);
+#else
+/*
+ * Allow defining a node in a structure even if page tracking is disabled,=
 e.g.
+ * to play nice with testing headers via direct inclusion from the command=
 line.
+ */
+struct kvm_page_track_notifier_node {};
 #endif /* CONFIG_KVM_EXTERNAL_WRITE_TRACKING */
=20
 #endif

