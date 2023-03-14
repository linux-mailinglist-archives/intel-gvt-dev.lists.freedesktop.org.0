Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0CA6B9CB2
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Mar 2023 18:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0963610E182;
	Tue, 14 Mar 2023 17:14:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AAD10E18D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Mar 2023 17:14:00 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-536cad819c7so171243917b3.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Mar 2023 10:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678814040;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=82+4kn0WzOMA+pL+/2ulEiwUoPfQ6iWm426J0EFz0Qk=;
 b=U8QabPjpj3tRB1alKWIulERmrKeo4fPI/DLtEa2FoBKUcXyofw17LgF2Y5SFLCS1GJ
 RhXoBMfkErMQVwBXSxDp2YsbmM+Uis7X/e0lTCv3DqVzG6TEzx35PhKPr27+0oteywq5
 UIJ4JEDcaF2TgxDXuIyx06tB+Hr/FqPC5i6kHRO6208NDHTjNZRSa6RctBiuUa9+3R84
 YrD5bWapXhlHnzQ7ruDUjhDw0qObni4RGId7NFERVEvBCTC1OEoaeNdEvTUtxtovx+2H
 5seJLaAsBy2LVNOXSPuyD4CS9K2lwhOs+Q2wtYDAlnlrg9Xrq5tFWyGJphA77EfAYRyY
 51dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678814040;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=82+4kn0WzOMA+pL+/2ulEiwUoPfQ6iWm426J0EFz0Qk=;
 b=SMINvu43XlAGXSJPpRN11UQPYIKYGEm9yKymopF3e7sZwVLEY2W3Pnfk5esTl/GoRw
 3tdTsXbX8YYh9+X/ZSBBqw+4b8nlk+bQn4zImZxh+s5sXHfZh8/dDym4+HL8TsbOhntE
 jVZ1xZ8SDZZJThAkKOGVWS+/OJ3zoLZNc5vC9ofV5524IKLjYJ/SwQLoml6BR2kJyM2i
 653uGh0lCvRge2fhD6MI2ZPCLxBkB9HKk7wiMW1Otv6LWmYS4oTcAhf2D3K73VGaIfVo
 FilppIh2Ko59qKkla7ddLp+mb8rXDUxHO62WAevr6MTzBfci22cl0Emg/vjbEgVOpcvR
 2q2A==
X-Gm-Message-State: AO0yUKUA/FE8cBns1bOw0CmXCzPmjIEPwvqWeyD3Bpm/oosvg5+jNB3x
 LyMPSOjf/LnuIZQlyrnhVdPYYw8oUmw=
X-Google-Smtp-Source: AK7set8MGdiy3EJyAGeWv8DcIrjpzWmMqnisR9EmRMRknRhqatoCmUkjpg17ULR4ykMvQ1ab8uiWTwZSXa4=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:400c:0:b0:540:62be:42b with SMTP id
 l12-20020a81400c000000b0054062be042bmr8649700ywn.6.1678814039855; Tue, 14 Mar
 2023 10:13:59 -0700 (PDT)
Date: Tue, 14 Mar 2023 10:13:58 -0700
In-Reply-To: <ZA/lYL7dsv7xBA01@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20230311002258.852397-1-seanjc@google.com>
 <20230311002258.852397-5-seanjc@google.com>
 <ZA/lYL7dsv7xBA01@yzhao56-desk.sh.intel.com>
Message-ID: <ZBCrVkDjaFAIP5vc@google.com>
Subject: Re: [PATCH v2 04/27] drm/i915/gvt: Incorporate KVM memslot info into
 check for 2MiB GTT entry
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

On Tue, Mar 14, 2023, Yan Zhao wrote:
> On Fri, Mar 10, 2023 at 04:22:35PM -0800, Sean Christopherson wrote:
> > Honor KVM's max allowed page size when determining whether or not a 2MiB
> > GTT shadow page can be created for the guest.  Querying KVM's max allowed
> > size is somewhat odd as there's no strict requirement that KVM's memslots
> > and VFIO's mappings are configured with the same gfn=>hva mapping, but
> > the check will be accurate if userspace wants to have a functional guest,
> > and at the very least checking KVM's memslots guarantees that the entire
> > 2MiB range has been exposed to the guest.
> >
> hi Sean,
> I remember in our last discussion, the conclusion was that
> we can safely just use VFIO ABI (which is intel_gvt_dma_map_guest_page()
> introduced in patch 7) to check max mapping size. [1][2]

Gah, my apologies.  I completely forgot about dropping KVM's mapping size check.
I was pretty sure I was forgetting something, but couldn't figure out what I was
forgetting.  I'll drop this in the next version.

Thanks!
