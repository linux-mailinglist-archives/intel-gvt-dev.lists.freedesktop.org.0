Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 720346BEDF2
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Mar 2023 17:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F089E10E3CF;
	Fri, 17 Mar 2023 16:21:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D9210E3C6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 17 Mar 2023 16:21:00 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 a6-20020aa795a6000000b006262c174d64so797573pfk.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 17 Mar 2023 09:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679070060;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=7o24l6fiOGywvlphm2ivpMOdYXRizefraPoQnT9L//E=;
 b=Q6gE273gkihi8mp0lUkxiT8ezb4i1bDN5mWojYXiFSbCt1gdV+GSm119e73GRHWveU
 BX7oyl+NnMHXsGN0MoPCc5ADNRD9sMejdGVqQyg1BFFO+uKHTSqgfBCRkwOUFIMy3VRm
 e9vrQ82Ak82Vfdr9u6yGZj6llbXvEMnk70DuJ6YhG9BhuixwafqpMoEX7hMO/92chbuY
 bowzGc908/CczWahD6JUJnaErwDYpFxrNsajMOceS8iF7nwQloz2BK0RucdP6gGBXynX
 TFjqAiKOslA8OqK+bdesF3cFxwkvsaaR83lJqgaTZQjWZJ8ETLkbSOmv3RxQ5lOu3Quv
 FfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679070060;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7o24l6fiOGywvlphm2ivpMOdYXRizefraPoQnT9L//E=;
 b=fN/77cIFbQQIdrSzg8s8l5IWuXt8heXlI4OwwRtm/fN0Ax4agxxd1YAKDY+0i+yHA9
 HnEOgL41XhqgPxMewb2jF1aloxdWPoz/RBy168DKKOdk0QhxUU1YUM6AHQxz3EAzs/Tk
 62zB/rX1u5tGKgaEMbQuywCz4EaJI/CKJtNDYmOrWhreC3Erez380jQ2mvLjvJoxTSlp
 +rsc/pbJ1BTep9HoPTGeEhIc95MknSec1HvD6w688gi7+rK34luu3BJo33w63C/vNoEh
 EzmxBIXR3Qt+s4DIjq7WI6YQWkkOzLbwEorFMOkGfqF8iT8bXsKDRVWWQKcPGBDgaxhJ
 p06A==
X-Gm-Message-State: AO0yUKUIn7yoHydHANhd8/ed88kxSpQcK/EfMICuiq0Yq6+Ym0ovHFUQ
 ofgEQgvsjhminBR5HSi8lzEa6EAqcMI=
X-Google-Smtp-Source: AK7set/8zojERNqCXTgL/pFzMwr+KZPa+uB5aM7ijsiHAnfP0EdMkqyDGbo32YXbT/II5YP93V991/QrGl8=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:17a7:b0:23d:34db:f5be with SMTP id
 q36-20020a17090a17a700b0023d34dbf5bemr2467306pja.4.1679070059931; Fri, 17 Mar
 2023 09:20:59 -0700 (PDT)
Date: Fri, 17 Mar 2023 09:20:58 -0700
In-Reply-To: <ZBQaFRdRawenuEan@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20230311002258.852397-1-seanjc@google.com>
 <20230311002258.852397-17-seanjc@google.com>
 <ZBQaFRdRawenuEan@yzhao56-desk.sh.intel.com>
Message-ID: <ZBSTapUu+VzWmIfQ@google.com>
Subject: Re: [PATCH v2 16/27] KVM: x86: Add a new page-track hook to handle
 memslot deletion
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

On Fri, Mar 17, 2023, Yan Zhao wrote:
> On Fri, Mar 10, 2023 at 04:22:47PM -0800, Sean Christopherson wrote:
> > From: Yan Zhao <yan.y.zhao@intel.com>
> > 
> > Add a new page-track hook, track_remove_region(), that is called when a
> > memslot DELETE operation is about to be committed.  The "remove" hook
> > will be used by KVMGT and will effectively replace the existing
> > track_flush_slot() altogether now that KVM itself doesn't rely on the
> > "flush" hook either.
> > 
> > The "flush" hook is flawed as it's invoked before the memslot operation
> > is guaranteed to succeed, i.e. KVM might ultimately keep the existing
> > memslot without notifying external page track users, a.k.a. KVMGT.  In
> > practice, this can't currently happen on x86, but there are no guarantees
> > that won't change in the future, not to mention that "flush" does a very
> > poor job of describing what is happening.
> > 
> > Pass in the gfn+nr_pages instead of the slot itself so external users,
> > i.e. KVMGT, don't need to exposed to KVM internals (memslots).  This will
> > help set the stage for additional cleanups to the page-track APIs.
> > 
> > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > Co-developed-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> ...
> 
> > +void kvm_page_track_delete_slot(struct kvm *kvm, struct kvm_memory_slot *slot)
> > +{
> > +	struct kvm_page_track_notifier_head *head;
> > +	struct kvm_page_track_notifier_node *n;
> > +	int idx;
> > +
> > +	head = &kvm->arch.track_notifier_head;
> > +
> > +	if (hlist_empty(&head->track_notifier_list))
> > +		return;
> > +
> > +	idx = srcu_read_lock(&head->track_srcu);
> > +	hlist_for_each_entry_srcu(n, &head->track_notifier_list, node,
> > +				srcu_read_lock_held(&head->track_srcu))
> Sorry, not sure why the alignment here is not right.
> Patchwork just sent me a mail to complain about it.
> Would you mind helping fix it in the next version?

Ah, it's off by two spaces, should be 

	hlist_for_each_entry_srcu(n, &head->track_notifier_list, node,
				  srcu_read_lock_held(&head->track_srcu))

I'll get it fixed in the next version.
