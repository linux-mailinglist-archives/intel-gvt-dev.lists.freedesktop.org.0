Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A3A52C0E6
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 May 2022 19:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C857E10EBBC;
	Wed, 18 May 2022 17:15:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2995A10EAF7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 18 May 2022 17:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652894118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FxD9P4XnF1NnW2znaHobWArEduFPf/Vy60CUDQ3Fi/M=;
 b=Hy239H8YjbZDY9JT5s71ktv56q8rJ1V5IfzJJDaXnvSfBNWceDa4l1wHHUKlmYbaFUS2SV
 pSe/I/jMtG8kyDpPOWGbwtVYmjrcdBxQlPpjSoxe60Hxnd2ddazO48qRkL0T4TS/vukzCk
 lylXWfrH5mI/EMd/Y8GISag1xPV2o14=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-UGKIbxl-PHS4oIRfLhl59Q-1; Wed, 18 May 2022 13:15:14 -0400
X-MC-Unique: UGKIbxl-PHS4oIRfLhl59Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 639851801388;
 Wed, 18 May 2022 17:15:13 +0000 (UTC)
Received: from starship (unknown [10.40.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDFC1C202D1;
 Wed, 18 May 2022 17:15:07 +0000 (UTC)
Message-ID: <d009abe5488440e8e7e990a027868f3d29577b44.camel@redhat.com>
Subject: Re: [RFC PATCH v3 02/19] KVM: x86: inhibit APICv/AVIC when the
 guest and/or host changes apic id/base from the defaults.
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Date: Wed, 18 May 2022 20:15:06 +0300
In-Reply-To: <YoUTMsnFS+bSED+5@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-3-mlevitsk@redhat.com>
 <20220518082811.GA8765@gao-cwp>
 <8c78939bf01a98554696add10e17b07631d97a28.camel@redhat.com>
 <YoUTMsnFS+bSED+5@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, "H. Peter
 Anvin" <hpa@zytor.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Chao Gao <chao.gao@intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 2022-05-18 at 15:39 +0000, Sean Christopherson wrote:
> On Wed, May 18, 2022, Maxim Levitsky wrote:
> > On Wed, 2022-05-18 at 16:28 +0800, Chao Gao wrote:
> > > > struct kvm_arch {
> > > > @@ -1258,6 +1260,7 @@ struct kvm_arch {
> > > > 	hpa_t	hv_root_tdp;
> > > > 	spinlock_t hv_root_tdp_lock;
> > > > #endif
> > > > +	bool apic_id_changed;
> > > 
> > > What's the value of this boolean? No one reads it.
> > 
> > I use it in later patches to kill the guest during nested VM entry 
> > if it attempts to use nested AVIC after any vCPU changed APIC ID.
> 
> Then the flag should be introduced in the later patch, because (a) it's dead code
> if that patch is never merged and (b) it's impossible to review this patch for
> correctness without seeing the usage, e.g. setting apic_id_changed isn't guarded
> with a lock and so the usage may or may not be susceptible to races.

I can't disagree with you on this, this was just somewhat a hack I wasn't sure
(and not yet 100% sure I will move forward with) so I cut this corner.

Thanks for the review!

Best regards,
	Maxim Levitsky

> 
> > > > +	apic->vcpu->kvm->arch.apic_id_changed = true;
> > > > +}
> > > > +


