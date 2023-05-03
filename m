Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB566F61EF
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  4 May 2023 01:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1438610E36F;
	Wed,  3 May 2023 23:16:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862DF10E36F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 May 2023 23:16:13 +0000 (UTC)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-1aaf7a766e1so38849305ad.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 03 May 2023 16:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683155772; x=1685747772;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=VcB+Y5fDyixakWTeoinQOVeecLhRUTl+pbViwwNrtuQ=;
 b=sTeZoxVDxdqS3PD2YH+hzY3HPDUPF4CDBpil3ScaC5e3sXkVGT/uJEkeaOrwNg3Zgb
 37BoXrNRmGg/+0SCX9mPdqUq6njuBQHxQ6D9QGXpWlyL6WdcOB8AK+eY8A422ogU7Fup
 Lx9HYoY9kT10KPUZIF0eOJ7o+kZcARHSXpg+uwE+qWc976HUetby61zeLGqtVWlgNCfZ
 W/66w8bglbdx9ioh6DT4mqwxC0A+u1kW5jlQMMLE8PzDfQ5Dsq7GnyOAJPIjYbgNCQTt
 HztMBYNsGySpCSBrDm76lEVZgHCRRphG93ufQqUcEFTAg6jKycPQpkvucn1e8E1JDP7d
 uV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683155772; x=1685747772;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VcB+Y5fDyixakWTeoinQOVeecLhRUTl+pbViwwNrtuQ=;
 b=a7gRpwH8G116+U+mRtcQkHKbFMLuVnF8v5FjjmlU6/LXZ/SlyyyBnsPtYMsT7dNNtt
 ihupi/PYPR5fk0C7ORmoJQD0LiEQy6W9KXK2qMsmG6k10cYHARpPrVskZptMKehy6PwP
 neuJIusuPq7WZ5E4k0itWVOOYL9FeGgOePIwdfwlObDWeuO5ezMX+9tQXnLw90akeGo6
 XiSocmOhat9iDeb3kxJ9ipxJai0lNrYQgwwbxQdx5ej35iQk9jR7/7aa30MCjw4EMauT
 TBw9Z+y3O+rMsDi/HggM1xu7SNyfZITVerfGTTkSyVRobLKIAyBKLbGeyusio0lUwHRO
 8+1g==
X-Gm-Message-State: AC+VfDyoIv5cHCHWxtN2dXgKOcjnvVZn4iYLOu439wXinXMUaGQRqwoz
 woBH2W9oHzETeFFxt15WAgbIGbe+wVs=
X-Google-Smtp-Source: ACHHUZ6g5+RkH9RYY37NzyTJLkYzceQaVVLYFcfwNF/8stvntiOGUw0qCRLeunRzkavyvs4pLnENPx5NNl4=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:234c:b0:1a2:87a2:c932 with SMTP id
 c12-20020a170903234c00b001a287a2c932mr513261plh.10.1683155772723; Wed, 03 May
 2023 16:16:12 -0700 (PDT)
Date: Wed, 3 May 2023 16:16:10 -0700
In-Reply-To: <ZBwS0DNOwMf7OVmV@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20230311002258.852397-1-seanjc@google.com>
 <20230311002258.852397-26-seanjc@google.com>
 <ZBQkyB3KJP34D9/h@yzhao56-desk.sh.intel.com>
 <ZBwS0DNOwMf7OVmV@yzhao56-desk.sh.intel.com>
Message-ID: <ZFLrOgUL4T/lrVLo@google.com>
Subject: Re: [PATCH v2 25/27] KVM: x86/mmu: Drop @slot param from
 exported/external page-track APIs
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

Finally getting back to this series...

On Thu, Mar 23, 2023, Yan Zhao wrote:
> On Fri, Mar 17, 2023 at 04:28:56PM +0800, Yan Zhao wrote:
> > On Fri, Mar 10, 2023 at 04:22:56PM -0800, Sean Christopherson wrote:
> > ...
> > > +int kvm_write_track_add_gfn(struct kvm *kvm, gfn_t gfn)
> > > +{
> > > +	struct kvm_memory_slot *slot;
> > > +	int idx;
> > > +
> > > +	idx = srcu_read_lock(&kvm->srcu);
> > > +
> > > +	slot = gfn_to_memslot(kvm, gfn);
> > > +	if (!slot) {
> > > +		srcu_read_unlock(&kvm->srcu, idx);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > Also fail if slot->flags & KVM_MEMSLOT_INVALID is true?
> > There should exist a window for external users to see an invalid slot
> > when a slot is about to get deleted/moved.
> > (It happens before MOVE is rejected in kvm_arch_prepare_memory_region()).
> 
> Or using
>         if (!kvm_is_visible_memslot(slot)) {
> 		srcu_read_unlock(&kvm->srcu, idx);
> 		return -EINVAL;
> 	}

Hrm.  If the DELETE/MOVE succeeds, then the funky accounting is ok (by the end
of the series) as the tracking disappears on DELETE, KVMGT will reject MOVE, and
KVM proper zaps SPTEs and resets accounting on MOVE (account_shadowed() runs under
mmu_lock and thus ensures all previous SPTEs are zapped before the "flush" from
kvm_arch_flush_shadow_memslot() can run).

If kvm_prepare_memory_region() fails though...

Ah, KVM itself is safe because of the aforementioned kvm_arch_flush_shadow_memslot().
Any accounting done on a temporarily invalid memslot will be unwound when the SPTEs
are zapped.  So for KVM, ignoring invalid memslots is correct _and necessary_.
We could clean that up by having accounted_shadowed() use the @slot from the fault,
which would close the window where the fault starts with a valid memslot but then
sees an invalid memslot when accounting a new shadow page.  But I don't think there
is a bug there.

Right, and DELETE can't actually fail in the current code base, and we've established
that MOVE can't possibly work.  So even if this is problematic in theory, there are
no _unknown_ bugs, and the known bugs are fixed by the end of the series.

And at the end of the series, KVMGT drops its tracking only when the DELETE is
committed.  So I _think_ allowing external trackers to add and remove gfns for
write-tracking in an invalid slot is actually desirable/correct.  I'm pretty sure
removal should be allowed as that can lead to dangling write-protection in a
rollback scenario.   And I can't think of anything that will break (in the kernel)
if write-tracking a gfn in an invalid slot is allowed, so I don't see any harm in
allowing the extremely theoretical case of KVMGT shadowing a gfn in a to-be-deleted
memslot _and_ the deletion being rolled back.
