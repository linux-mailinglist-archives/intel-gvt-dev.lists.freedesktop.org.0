Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6204AD86C
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Feb 2022 13:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C96D10E13E;
	Tue,  8 Feb 2022 12:45:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF81110E13E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Feb 2022 12:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644324338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SmULaSJ9/41bYKgiVa0NC3LLzANiIdl0eYGwm0duLms=;
 b=LCltS71TT8KDRyfp2d7DzXquGIu0PEq3Bc3c+yTOQu/uQmxx/99Yk7mBkIdVGjRPdEyO4o
 ze2pGAlZJqBQCXq90q/JtqW9m99HN6SGe4fZqtFAYa30SkxCfWJh4F9V+Z9X/6nfrIaRGz
 tHKHjxL0dqg8rmeJK54AFnt2yWXrhrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-p85c9BeWM2GIiz6pCOO-4g-1; Tue, 08 Feb 2022 07:45:35 -0500
X-MC-Unique: p85c9BeWM2GIiz6pCOO-4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B52571054F90;
 Tue,  8 Feb 2022 12:45:31 +0000 (UTC)
Received: from starship (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FE5F1059A4E;
 Tue,  8 Feb 2022 12:45:20 +0000 (UTC)
Message-ID: <d8dffd4267002465d15ea6b6fea1db80b8d84ef1.camel@redhat.com>
Subject: Re: [PATCH RESEND 00/30] My patch queue
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Date: Tue, 08 Feb 2022 14:45:19 +0200
In-Reply-To: <f48b498a-879d-6698-6217-971f71211389@redhat.com>
References: <20220207155447.840194-1-mlevitsk@redhat.com>
 <f48b498a-879d-6698-6217-971f71211389@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

On Tue, 2022-02-08 at 13:02 +0100, Paolo Bonzini wrote:
> On 2/7/22 16:54, Maxim Levitsky wrote:
> > This is set of various patches that are stuck in my patch queue.
> > 
> > KVM_REQ_GET_NESTED_STATE_PAGES patch is mostly RFC, but it does seem
> > to work for me.
> > 
> > Read-only APIC ID is also somewhat RFC.
> > 
> > Some of these patches are preparation for support for nested AVIC
> > which I almost done developing, and will start testing very soon.
> > 
> > Resend with cleaned up CCs.
> 
> 1-9 are all bugfixes and pretty small, so I queued them.
> 
> 10 is also a bugfix but I think it should be split up further, so I'll 
> resend it.

> 
> For 11-30 I'll start reviewing them, but most of them are independent 
> series.

Thank you very much!
 
I must again say sorry that I posted the whole thing as a one patch series,
next time I'll post each series separately, and I also try to post
the patches as soon as I write them.
 
 I didn't post them because I felt that the whole thing needs good testing 
and I only recently gotten to somewhat automate my nested migration tests 
which I usually use to test this kind of work.
 
 

Best regards,
	Maxim Levitsky
 
PS: the strict_mmu option does have quite an effect on nested migration with npt=0/ept=0.
In my testing such migration crashes with pagefault in L2 kernel after around 50-100
iterations, while with this options, on survived ~1000 iterations and around the same on intel,
and on both machines L1 eventually crashed with a page fault instead.
 
Could be that it just throws timing off, or maybe we still do have some form of bug
in shadow paging after all, maybe even 2 bugs.
Hmmm....
 
I automated these tests so I can run them for days until I have more confidence
in what is going on.



Best regards,
	Maxim Levitsky

> 
> Paolo
> 


