Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D094E628EBE
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 15 Nov 2022 01:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D97D10E354;
	Tue, 15 Nov 2022 00:55:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E7410E357
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 15 Nov 2022 00:55:47 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id 4so11745462pli.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Nov 2022 16:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UDR0+4okRz2ougxrpthuHCLqH7oVh0+moFpWjb6I21A=;
 b=B29X8DwgT55HO7MBAVnJw7YeDANJoVtw30t2AgaH0REUWRhvOkM7omv41vjtw8og5h
 ctJOR38PqhkmnQUWHYSGjBToQzP4DeBFv8jSUqiLx7IqIUxtqldaL2OHI0B9lTAX/C9N
 p2BOYdCPPUsMlxmilyilWHaBRhTqYN+QqYzu1khjNwWM/6a/+o9LpqHwyqkOzO/Jits3
 tX0JIyWfaUA3eEfLABMcadNub2Et6UfkeDZAFVQMbpXBt1HS44Gh/KLEeSrGOFvE7Wke
 GGZ+PPXq6n2o4VF2oN6tXnZg7dCsFsCbMNZUGPq2xmeSy/FvsN5Zp6EmR7wTEfC/EHck
 m2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UDR0+4okRz2ougxrpthuHCLqH7oVh0+moFpWjb6I21A=;
 b=1qGlmi+2n/xks5wwysE3xCDXlIiEyoY5MCO0EigpVjz2x8oW66ecRcRKVBIKl98YiL
 6cDMq/VITIUuG/L44tSL8pTJccgQnX+RZHspYvHBLtiaqKOH90ViCNfPRHk20v3eYpyx
 IYIZFwZzHt5ZdFdj8LEEf8xjhx9C6076gxt6cDVzhY5u+ShPQmIm5ZERWAO8JAyVVJc0
 UYaDbN8wHghMw9K5Jj2B8nnUvnWXFm3i1vGrDUCFLT42F4mHYSbyOmg4yF7/Bib5u/XD
 Sd80sR0XZkzAVfhYeDvvGGtDiHbm81tWK0cblRl8hjbLwpsiURONlgmXpyu8dag2yI1O
 0QLw==
X-Gm-Message-State: ANoB5pmfQdZ2g9HOoHOLl3LcmH4XeZMfcTbk0FG9etjavvZfnKxPEm4L
 YCEkazpgUB9D53pQVLLfQxvfag==
X-Google-Smtp-Source: AA0mqf5kpFFvdWc7T1RhfAi+hiNzZkX+JbAevTu5pitZlRpQo480iN+e9saChzOGSvM+AL8jaVk9dQ==
X-Received: by 2002:a17:90b:3c8f:b0:212:9b3f:dee5 with SMTP id
 pv15-20020a17090b3c8f00b002129b3fdee5mr15814316pjb.62.1668473746755; 
 Mon, 14 Nov 2022 16:55:46 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 z10-20020a170903018a00b00180a7ff78ccsm8262024plg.126.2022.11.14.16.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 16:55:46 -0800 (PST)
Date: Tue, 15 Nov 2022 00:55:42 +0000
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v2 1/3] KVM: x86: add a new page track hook
 track_remove_slot
Message-ID: <Y3Ljjji0Bwt5+WxH@google.com>
References: <20221111103247.22275-1-yan.y.zhao@intel.com>
 <20221111103350.22326-1-yan.y.zhao@intel.com>
 <Y26SI3uh8JV0vvO6@google.com>
 <Y27ivXea5SjR5lat@yzhao56-desk.sh.intel.com>
 <Y27sG3AqVX8yLUgR@google.com>
 <Y3GUdqxnPJvc6SPI@yzhao56-desk.sh.intel.com>
 <Y3JtonYdDYOhbmfG@google.com>
 <Y3LEZXWqk6ztuf7x@yzhao56-desk.sh.intel.com>
 <Y3LOIKueyTUoJ00B@google.com>
 <Y3LNplTrOpJdxyEW@yzhao56-desk.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3LNplTrOpJdxyEW@yzhao56-desk.sh.intel.com>
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
 linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com, pbonzini@redhat.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Nov 15, 2022, Yan Zhao wrote:
> On Mon, Nov 14, 2022 at 11:24:16PM +0000, Sean Christopherson wrote:
> > On Tue, Nov 15, 2022, Yan Zhao wrote:
> > > On Mon, Nov 14, 2022 at 04:32:34PM +0000, Sean Christopherson wrote:
> > > > On Mon, Nov 14, 2022, Yan Zhao wrote:
> > > > > On Sat, Nov 12, 2022 at 12:43:07AM +0000, Sean Christopherson wrote:
> > > > > > On Sat, Nov 12, 2022, Yan Zhao wrote:
> > > > > > > And I'm also not sure if a slots_arch_lock is required for
> > > > > > > kvm_slot_page_track_add_page() and kvm_slot_page_track_remove_page().
> > > > > > 
> > > > > > It's not required.  slots_arch_lock protects interaction between memslot updates
> > > > > In kvm_slot_page_track_add_page() and kvm_slot_page_track_remove_page(),
> > > > > slot->arch.gfn_track[mode][index] is updated in update_gfn_track(),
> > > > > do you know which lock is used to protect it?
> > > > 
> > > > mmu_lock protects the count, kvm->srcu protects the slot, and shadow_root_allocated
> > > > protects that validity of gfn_track, i.e. shadow_root_allocated ensures that KVM
> > > > allocates gfn_track for all memslots when shadow paging is activated.
> > > Hmm, thanks for the reply.
> > > but in direct_page_fault(),
> > > if (page_fault_handle_page_track(vcpu, fault))
> > > 	return RET_PF_EMULATE;
> > > 
> > > slot->arch.gfn_track is read without any mmu_lock is held.
> > 
> > That's a fast path that deliberately reads out of mmu_lock.  A false positive
> > only results in unnecessary emulation, and any false positive is inherently prone
> > to races anyways, e.g. fault racing with zap.
> what about false negative?
> If the fast path read 0 count, no page track write callback will be called and write
> protection will be removed in the slow path.

No.  For a false negative to occur, a different task would have to create a SPTE
and write-protect the GFN _while holding mmu_lock_.  And then after acquiring
mmu_lock, the vCPU that got the false negative would call make_spte(), which would
detect that making the SPTE writable is disallowed due to the GFN being write-protected.

	if (pte_access & ACC_WRITE_MASK) {
		spte |= PT_WRITABLE_MASK | shadow_mmu_writable_mask;

		/*
		 * Optimization: for pte sync, if spte was writable the hash
		 * lookup is unnecessary (and expensive). Write protection
		 * is responsibility of kvm_mmu_get_page / kvm_mmu_sync_roots.
		 * Same reasoning can be applied to dirty page accounting.
		 */
		if (is_writable_pte(old_spte))
			goto out;

		/*
		 * Unsync shadow pages that are reachable by the new, writable
		 * SPTE.  Write-protect the SPTE if the page can't be unsync'd,
		 * e.g. it's write-tracked (upper-level SPs) or has one or more
		 * shadow pages and unsync'ing pages is not allowed.
		 */
		if (mmu_try_to_unsync_pages(vcpu->kvm, slot, gfn, can_unsync, prefetch)) {
			pgprintk("%s: found shadow page for %llx, marking ro\n",
				 __func__, gfn);
			wrprot = true;
			pte_access &= ~ACC_WRITE_MASK;
			spte &= ~(PT_WRITABLE_MASK | shadow_mmu_writable_mask);
		}
	}



int mmu_try_to_unsync_pages(struct kvm *kvm, const struct kvm_memory_slot *slot,
			    gfn_t gfn, bool can_unsync, bool prefetch)
{
	struct kvm_mmu_page *sp;
	bool locked = false;

	/*
	 * Force write-protection if the page is being tracked.  Note, the page
	 * track machinery is used to write-protect upper-level shadow pages,
	 * i.e. this guards the role.level == 4K assertion below!
	 */
	if (kvm_slot_page_track_is_active(kvm, slot, gfn, KVM_PAGE_TRACK_WRITE))
		return -EPERM;

	...
}
