Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 199436BB845
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Mar 2023 16:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBEA10E8C6;
	Wed, 15 Mar 2023 15:43:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6206210E03C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Mar 2023 15:43:56 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 e20-20020a25d314000000b00b33355abd3dso15442959ybf.14
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Mar 2023 08:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678895035;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3yOC9GAxlzabl02b1RPWrLKpddDwW/XjKQVoaxOI5Fs=;
 b=irQd1i8q+ogxqHs1vTXLJdSkvIHIEjzr7qUucu06Sgiu0iqFVDzwkLGWwE/5+BJi3u
 6x81/zfQBxCitIQAf3coqjNffjMF2giXqZqeQ3fUEzvbnC8ZZOaaGRa//Lv7hWE/T0lm
 uXIg/SVhvpzL2sLnGaz9nq/6dVVCLsP/geOkOjiBXmLThQVBDWJZ6kVyOkAy1zxLyrN9
 4BdD7rV4Ga3aqZoQmq41NA9S1kX9L2axC6+613IdBeT6Pu9LjrduwTelFtHof8kLxpU8
 fG/JWVzp6PxwsZA82T79bPMPUjMk8rJPnVs8W+Z3FrrIfL/q8W1VVzIoYtiFjr8k4i8Z
 1UGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678895035;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3yOC9GAxlzabl02b1RPWrLKpddDwW/XjKQVoaxOI5Fs=;
 b=C0cTRILEwLn7vERLJait7MZbN+qDWcdpdJ3AFX9JYgR7N0OkcWgtRE/HcdIaZEMsIQ
 Wiiu/5y3+7meWbSJpYYtNjyQH1l/UZxSz4FOetGzGy8JmRpFpv5kPRqY1jZxnSV1MXsu
 vwyBhilRI+FBjJWVtgirdCQfgFgYFBfZkm9oblQMk7yfYrvPfHKXxUZr51I82YaoWFa2
 2O5w7mTxShk+yT42BGzZHMbpKaJULy9WI/PBBPc+tJ5pIXo0yD/6emwNbt04r1JOtSwo
 VbRoRt1gMjUOV9FRob3dywbAbGpRhOBG9FrZsfqrWePIXlszB8caKDaaG0RKIUfO4e35
 fXKg==
X-Gm-Message-State: AO0yUKVv250FzTSgS2mSyPkYSo25MY9+yuGWYlbx88VzyhTtz/kennul
 PwcNI0M9DTx3orV10kyN+acT/A+9t4o=
X-Google-Smtp-Source: AK7set/m8ThOIuQfxnThk6YIlQaIAC0QfTqKlvtfDwDkFgfpYMWOGBpJSb01Yl38Gvzl13a7oAZAuDELZsQ=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:d302:0:b0:541:359c:103a with SMTP id
 y2-20020a81d302000000b00541359c103amr192124ywi.8.1678895035645; Wed, 15 Mar
 2023 08:43:55 -0700 (PDT)
Date: Wed, 15 Mar 2023 08:43:54 -0700
In-Reply-To: <ZBF72+flVlEbfg70@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20230311002258.852397-1-seanjc@google.com>
 <20230311002258.852397-15-seanjc@google.com>
 <ZBF72+flVlEbfg70@yzhao56-desk.sh.intel.com>
Message-ID: <ZBHnugUe0SSmQKGI@google.com>
Subject: Re: [PATCH v2 14/27] KVM: x86: Reject memslot MOVE operations if
 KVMGT is attached
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="us-ascii"
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

On Wed, Mar 15, 2023, Yan Zhao wrote:
> On Fri, Mar 10, 2023 at 04:22:45PM -0800, Sean Christopherson wrote:
> > Disallow moving memslots if the VM has external page-track users, i.e. if
> > KVMGT is being used to expose a virtual GPU to the guest, as KVM doesn't
> > correctly handle moving memory regions.
> > 
> > Note, this is potential ABI breakage!  E.g. userspace could move regions
> > that aren't shadowed by KVMGT without harming the guest.  However, the
> > only known user of KVMGT is QEMU, and QEMU doesn't move generic memory
> > regions.  KVM's own support for moving memory regions was also broken for
> > multiple years (albeit for an edge case, but arguably moving RAM is
> > itself an edge case), e.g. see commit edd4fa37baa6 ("KVM: x86: Allocate
> > new rmap and large page tracking when moving memslot").
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> ...
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 29dd6c97d145..47ac9291cd43 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -12484,6 +12484,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
> >  				   struct kvm_memory_slot *new,
> >  				   enum kvm_mr_change change)
> >  {
> > +	/*
> > +	 * KVM doesn't support moving memslots when there are external page
> > +	 * trackers attached to the VM, i.e. if KVMGT is in use.
> > +	 */
> > +	if (change == KVM_MR_MOVE && kvm_page_track_has_external_user(kvm))
> > +		return -EINVAL;
> Hmm, will page track work correctly on moving memslots when there's no
> external users?
> 
> in case of KVM_MR_MOVE,
> kvm_prepare_memory_region(kvm, old, new, change)
>   |->kvm_arch_prepare_memory_region(kvm, old, new, change)
>        |->kvm_alloc_memslot_metadata(kvm, new)
>             |->memset(&slot->arch, 0, sizeof(slot->arch));
>             |->kvm_page_track_create_memslot(kvm, slot, npages)
> The new->arch.arch.gfn_write_track will be fresh empty.
> 
> 
> kvm_arch_commit_memory_region(kvm, old, new, change);
>   |->kvm_arch_free_memslot(kvm, old);
>        |->kvm_page_track_free_memslot(slot);
> The old->arch.gfn_write_track is freed afterwards.
> 
> So, in theory, the new GFNs are not write tracked though the old ones are.
> 
> Is that acceptable for the internal page-track user?

It works because KVM zaps all SPTEs when a memslot is moved, i.e. the fact that
KVM loses the write-tracking counts is benign.  I suspect no VMM actually does
does KVM_MR_MOVE in conjunction with shadow paging, but the ongoing maintenance
cost of supporting KVM_MR_MOVE is quite low at this point, so trying to rip it
out isn't worth the pain of having to deal with potential ABI breakage.

Though in hindsight I wish I had tried disallowed moving memslots instead of
fixing the various bugs a few years back. :-(
