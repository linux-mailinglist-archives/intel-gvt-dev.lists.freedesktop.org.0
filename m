Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C52284AD847
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Feb 2022 13:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6820B10E347;
	Tue,  8 Feb 2022 12:24:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9564710E347
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Feb 2022 12:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644323065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OmNk9x3t77ts5HOhyjEsKGS6qVWrt92aX3uBiIq4k1Y=;
 b=NB6girQ7CODOoany7Zjll+I059oVrlmvvp3XLVQuQ6l94Uk77QIaY++Bmktu79plXex1Gf
 uSwHUTNkp2VPeGNQv/z0aOXbkkfwncWpPUL10F/jNegrgNE70awjYCNu2tVHHQZQDqMN0S
 QeoDSTjfNzQ9ll13P0+bW7vTUm8n/S0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-cl1sK-SEMRGwiMugl2xPOw-1; Tue, 08 Feb 2022 07:24:22 -0500
X-MC-Unique: cl1sK-SEMRGwiMugl2xPOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3B0C19251AB;
 Tue,  8 Feb 2022 12:24:19 +0000 (UTC)
Received: from starship (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EB102B44E;
 Tue,  8 Feb 2022 12:24:09 +0000 (UTC)
Message-ID: <f198aca18f64b2e788ee53d5a03e739abe6a6697.camel@redhat.com>
Subject: Re: [PATCH RESEND 07/30] KVM: x86: nSVM: deal with L1 hypervisor
 that intercepts interrupts but lets L2 control them
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Date: Tue, 08 Feb 2022 14:24:08 +0200
In-Reply-To: <0c20990f2543413f4a087b7918cff14db48bc774.camel@redhat.com>
References: <20220207155447.840194-1-mlevitsk@redhat.com>
 <20220207155447.840194-8-mlevitsk@redhat.com>
 <dd9305d6-1e3a-24f9-1d48-c5dac440112d@redhat.com>
 <0c20990f2543413f4a087b7918cff14db48bc774.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
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
 Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 2022-02-08 at 13:55 +0200, Maxim Levitsky wrote:
> On Tue, 2022-02-08 at 12:33 +0100, Paolo Bonzini wrote:
> > On 2/7/22 16:54, Maxim Levitsky wrote:
> > > Fix a corner case in which the L1 hypervisor intercepts
> > > interrupts (INTERCEPT_INTR) and either doesn't set
> > > virtual interrupt masking (V_INTR_MASKING) or enters a
> > > nested guest with EFLAGS.IF disabled prior to the entry.
> > > 
> > > In this case, despite the fact that L1 intercepts the interrupts,
> > > KVM still needs to set up an interrupt window to wait before
> > > injecting the INTR vmexit.
> > > 
> > > Currently the KVM instead enters an endless loop of 'req_immediate_exit'.
> > > 
> > > Exactly the same issue also happens for SMIs and NMI.
> > > Fix this as well.
> > > 
> > > Note that on VMX, this case is impossible as there is only
> > > 'vmexit on external interrupts' execution control which either set,
> > > in which case both host and guest's EFLAGS.IF
> > > are ignored, or not set, in which case no VMexits are delivered.
> > > 
> > > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > > ---
> > >   arch/x86/kvm/svm/svm.c | 17 +++++++++++++----
> > >   1 file changed, 13 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> > > index 9a4e299ed5673..22e614008cf59 100644
> > > --- a/arch/x86/kvm/svm/svm.c
> > > +++ b/arch/x86/kvm/svm/svm.c
> > > @@ -3372,11 +3372,13 @@ static int svm_nmi_allowed(struct kvm_vcpu *vcpu, bool for_injection)
> > >   	if (svm->nested.nested_run_pending)
> > >   		return -EBUSY;
> > >   
> > > +	if (svm_nmi_blocked(vcpu))
> > > +		return 0;
> > > +
> > >   	/* An NMI must not be injected into L2 if it's supposed to VM-Exit.  */
> > >   	if (for_injection && is_guest_mode(vcpu) && nested_exit_on_nmi(svm))
> > >   		return -EBUSY;
> > > -
> > > -	return !svm_nmi_blocked(vcpu);
> > > +	return 1;
> > >   }
> > >   
> > >   static bool svm_get_nmi_mask(struct kvm_vcpu *vcpu)
> > > @@ -3428,9 +3430,13 @@ bool svm_interrupt_blocked(struct kvm_vcpu *vcpu)
> > >   static int svm_interrupt_allowed(struct kvm_vcpu *vcpu, bool for_injection)
> > >   {
> > >   	struct vcpu_svm *svm = to_svm(vcpu);
> > > +
> > >   	if (svm->nested.nested_run_pending)
> > >   		return -EBUSY;
> > >   
> > > +	if (svm_interrupt_blocked(vcpu))
> > > +		return 0;
> > > +
> > >   	/*
> > >   	 * An IRQ must not be injected into L2 if it's supposed to VM-Exit,
> > >   	 * e.g. if the IRQ arrived asynchronously after checking nested events.
> > > @@ -3438,7 +3444,7 @@ static int svm_interrupt_allowed(struct kvm_vcpu *vcpu, bool for_injection)
> > >   	if (for_injection && is_guest_mode(vcpu) && nested_exit_on_intr(svm))
> > >   		return -EBUSY;
> > >   
> > > -	return !svm_interrupt_blocked(vcpu);
> > > +	return 1;
> > >   }
> > >   
> > >   static void svm_enable_irq_window(struct kvm_vcpu *vcpu)
> > > @@ -4169,11 +4175,14 @@ static int svm_smi_allowed(struct kvm_vcpu *vcpu, bool for_injection)
> > >   	if (svm->nested.nested_run_pending)
> > >   		return -EBUSY;
> > >   
> > > +	if (svm_smi_blocked(vcpu))
> > > +		return 0;
> > > +
> > >   	/* An SMI must not be injected into L2 if it's supposed to VM-Exit.  */
> > >   	if (for_injection && is_guest_mode(vcpu) && nested_exit_on_smi(svm))
> > >   		return -EBUSY;
> > >   
> > > -	return !svm_smi_blocked(vcpu);
> > > +	return 1;
> > >   }
> > >   
> > >   static int svm_enter_smm(struct kvm_vcpu *vcpu, char *smstate)
> > 
> > Can you prepare a testcase for at least the interrupt case?
> 
> Yep, I already wrote a kvm unit tests for all the cases, and I will send them very soon.

Done.

I also included tests for LBR virtualization which I think I already posted but I am not sure.

Best regards,
	Maxim Levitsky
> 
> Best regards,
> 	Maxim Levitsky
> > Thanks,
> > 
> > Paolo
> > 


