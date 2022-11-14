Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A721E62857F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 14 Nov 2022 17:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5026210E2F2;
	Mon, 14 Nov 2022 16:32:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7965810E2F2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Nov 2022 16:32:38 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id q9so11490216pfg.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Nov 2022 08:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fl4vYZukq8gCsaclrBinKemUC9Y9RD4y/Lg/kykiAyY=;
 b=XFGuwBJF6z0EaYkVgH7A1bZ2UQoEDGL3sPwz22b5mFQxOIeujyJE2gfJDMdKfrtpHM
 DuQJSDBoA0+EDkiTUeFS2HSSmU/FgIS/ATGyTSjlTyGL3zxDEldXu0WcH72VAbC8KZAg
 iJ7+P54da1SxIBlHzXmYIKrsBw2BneA+Ie3X4hjtrIhSRVznVHDTmny6TGuow/kk7MhM
 T0dlTil8s7AVow4Sp1tYtU0768iGCC7N4qoQUpWEcqbMRxjUjukCdoenIL4GYo5z/gzF
 jNJP7twdpR9AJiLK01IFbxmWkyHx9fnD3J3K9yhWFxPkxSiIIX7cXG0ohcizBUng9YUQ
 tOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fl4vYZukq8gCsaclrBinKemUC9Y9RD4y/Lg/kykiAyY=;
 b=jY1OxxrtJH+21pJ2qZFYzIAlAG2tG6jQGgvYJe2ZvDF2T5YLlu55qDpglgO6GQFdXw
 SoXVwwlm11E9bA1UTJunaonzTQk5Q67RIW3kZctTcGRakPO278ptlF5WhdGnDKSRFDtu
 u5EvtHM8vENJZz73t76SqZA9/mW9SdC/nGpjLjQNQhHr7d+iKncBJZvfv/GkkdofzDws
 BE+DQxtZS9XZ+/veDPEmkZtvChC+7VRAMNKpEhJV3zwciUuvf7YY1cLhw2Rx61tSWgGd
 xybnAwDR/BwUDYZLhjPEfdQtQMPZbdsxQuIgnRwqKthG1hY8X7iKJ6JNCF8KiU3wPR2Q
 bb1Q==
X-Gm-Message-State: ANoB5plVW9l7o6Mh1xZGTi3pP/cLzJMkUiwimqmv5HDUHqFogfFIH90S
 U7Q9BjBVI0b+9lcGDqgpTWaKWlRhlRU/vw==
X-Google-Smtp-Source: AA0mqf5F2NsLGqG6wSNJ5DDtUghQHmhby8l34F1Ns+grkLUucvyPskfdoa29mstcGu3oXagS03J/Gw==
X-Received: by 2002:a62:403:0:b0:572:5be2:505b with SMTP id
 3-20020a620403000000b005725be2505bmr1140379pfe.52.1668443557888; 
 Mon, 14 Nov 2022 08:32:37 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 l29-20020a63ba5d000000b00438834b14a1sm6064695pgu.80.2022.11.14.08.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 08:32:37 -0800 (PST)
Date: Mon, 14 Nov 2022 16:32:34 +0000
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v2 1/3] KVM: x86: add a new page track hook
 track_remove_slot
Message-ID: <Y3JtonYdDYOhbmfG@google.com>
References: <20221111103247.22275-1-yan.y.zhao@intel.com>
 <20221111103350.22326-1-yan.y.zhao@intel.com>
 <Y26SI3uh8JV0vvO6@google.com>
 <Y27ivXea5SjR5lat@yzhao56-desk.sh.intel.com>
 <Y27sG3AqVX8yLUgR@google.com>
 <Y3GUdqxnPJvc6SPI@yzhao56-desk.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3GUdqxnPJvc6SPI@yzhao56-desk.sh.intel.com>
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

On Mon, Nov 14, 2022, Yan Zhao wrote:
> On Sat, Nov 12, 2022 at 12:43:07AM +0000, Sean Christopherson wrote:
> > On Sat, Nov 12, 2022, Yan Zhao wrote:
> > > And I'm also not sure if a slots_arch_lock is required for
> > > kvm_slot_page_track_add_page() and kvm_slot_page_track_remove_page().
> > 
> > It's not required.  slots_arch_lock protects interaction between memslot updates
> In kvm_slot_page_track_add_page() and kvm_slot_page_track_remove_page(),
> slot->arch.gfn_track[mode][index] is updated in update_gfn_track(),
> do you know which lock is used to protect it?

mmu_lock protects the count, kvm->srcu protects the slot, and shadow_root_allocated
protects that validity of gfn_track, i.e. shadow_root_allocated ensures that KVM
allocates gfn_track for all memslots when shadow paging is activated.

The cleanup series I'm prepping adds lockdep assertions for the relevant paths, e.g. 

$ git grep -B 8 -E "update_gfn_write_track.*;"
arch/x86/kvm/mmu/page_track.c-void __kvm_write_track_add_gfn(struct kvm *kvm, struct kvm_memory_slot *slot,
arch/x86/kvm/mmu/page_track.c-                         gfn_t gfn)
arch/x86/kvm/mmu/page_track.c-{
arch/x86/kvm/mmu/page_track.c-  lockdep_assert_held_write(&kvm->mmu_lock);
arch/x86/kvm/mmu/page_track.c-
arch/x86/kvm/mmu/page_track.c-  if (KVM_BUG_ON(!kvm_page_track_write_tracking_enabled(kvm), kvm))
arch/x86/kvm/mmu/page_track.c-          return;
arch/x86/kvm/mmu/page_track.c-
arch/x86/kvm/mmu/page_track.c:  update_gfn_write_track(slot, gfn, 1);
--
arch/x86/kvm/mmu/page_track.c-void __kvm_write_track_remove_gfn(struct kvm *kvm,
arch/x86/kvm/mmu/page_track.c-                            struct kvm_memory_slot *slot, gfn_t gfn)
arch/x86/kvm/mmu/page_track.c-{
arch/x86/kvm/mmu/page_track.c-  lockdep_assert_held_write(&kvm->mmu_lock);
arch/x86/kvm/mmu/page_track.c-
arch/x86/kvm/mmu/page_track.c-  if (KVM_BUG_ON(!kvm_page_track_write_tracking_enabled(kvm), kvm))
arch/x86/kvm/mmu/page_track.c-          return;
arch/x86/kvm/mmu/page_track.c-
arch/x86/kvm/mmu/page_track.c:  update_gfn_write_track(slot, gfn, -1);

