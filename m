Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C71AC6FB236
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  8 May 2023 16:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBFF10E2C3;
	Mon,  8 May 2023 14:05:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C2710E2C3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 May 2023 14:05:40 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-b9a6f15287eso34186047276.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 08 May 2023 07:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683554739; x=1686146739;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=jcl8cYiE8GBONZ/kHylHxTzdCz6iJZwPGQYSWy24JYA=;
 b=o8mfj/R750kMfA2bvKpyJZuf/ZhVeSnXBF4/wapKjmLIWy2rqeeSrAOt5X+YjYxuNh
 OyItG8a6SQBaYR3ol78KhlI6eh/Q0yN90HXJhxbVGAtpEUWsNrYhxsckDEtq7PX0t1EO
 f0JB4uXPde4Ox7tQXsrWT/ya3dTEG/JI0bIE5xqIVrID3KZMsDfqqnqBT9Za2r4APAZX
 B2RpVJzivT+iO2b+LbU+0Zontf8zI/Ed9ngpy3ey89L83c7xn7vHODjkZU8knTdQD3t/
 n78u+Am85L+2PUzMWncpwoOAYV0GlSklrJfhHVJlIR1I82Kkd1Qrpj4q6M6s9sph6PlJ
 aA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683554739; x=1686146739;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jcl8cYiE8GBONZ/kHylHxTzdCz6iJZwPGQYSWy24JYA=;
 b=Ae/ZZv9mjqOp+L2gKxkO/TukNJmqH35MjZ7VHa0CFAQtQ8Pz8ipHn7dsizwWjJlTwi
 zny+G8CyPlstW7o0WNhxf3FSv1g+yQChU8K+7kvt3MMPRhoomREYRkOEx7eMii7+IHKu
 BdVXEqFOdcmhT7gD7uDqdpBwfnihdIsoEHplzKGXOt4yY+wXNNHv+MSmBtXu65Qf3QP+
 8S5l9sLQZYzoQ9fTOZTxy2IefRNhB8Y1LjXEQlKwjGy1F+Nren5y/MWYZ/EVVOUDeTov
 GhuyXVjl/6KAvmh68qUyrzBUUe7VMSMEdlAwdlYDNwQH3rCjPvXC3XiBkGcJJt7rSLW+
 Yatw==
X-Gm-Message-State: AC+VfDw1iE8s58ZFI4ISZCdHnxWWXXEaQDVpdvrA0DVYFINVHb4fwvUE
 jW/z8rf3zaA3OGot0hvDU1GbciHWreE=
X-Google-Smtp-Source: ACHHUZ7FCpMclh8b9aJYyQEcgnuYE0OwetS8XqokoS1TJPz66KwW2xxY/XhdC86wb/WWcOzl5JiJiPlwO6k=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:10c:b0:55c:a5db:869 with SMTP id
 bd12-20020a05690c010c00b0055ca5db0869mr10528119ywb.4.1683554739792; Mon, 08
 May 2023 07:05:39 -0700 (PDT)
Date: Mon, 8 May 2023 07:05:32 -0700
In-Reply-To: <ZFYyt2fF6alyKlzO@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20230311002258.852397-1-seanjc@google.com>
 <20230311002258.852397-6-seanjc@google.com>
 <ZBP7oZ1lkJhlSNpY@yzhao56-desk.sh.intel.com> <ZFQYbHTYgG4HJ+ac@google.com>
 <ZFX1PaKIa44WtSNX@yzhao56-desk.sh.intel.com>
 <ZFYyt2fF6alyKlzO@yzhao56-desk.sh.intel.com>
Message-ID: <ZFkBrLuBY5fOU6qX@google.com>
Subject: Re: [PATCH v2 05/27] drm/i915/gvt: Verify VFIO-pinned page is THP
 when shadowing 2M gtt entry
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

On Sat, May 06, 2023, Yan Zhao wrote:
> On Sat, May 06, 2023 at 02:35:41PM +0800, Yan Zhao wrote:
> > > > Maybe the checking of PageTransHuge(cur_page) and bailing out is not necessary.
> > > > If a page is not transparent huge, but there are 512 contigous 4K
> > > > pages, I think it's still good to map them in IOMMU in 2M.
> > > > See vfio_pin_map_dma() who does similar things.
> > > 
> > > I agree that bailing isn't strictly necessary, and processing "blindly" should
> > > Just Work for HugeTLB and other hugepage types.  I was going to argue that it
> > > would be safer to add this and then drop it at the end, but I think that's a
> > > specious argument.  If not checking the page type is unsafe, then the existing
> > > code is buggy, and this changelog literally states that the check for contiguous
> > > pages guards against any such problems.
> > > 
> > > I do think there's a (very, very theoretical) issue though.  For "CONFIG_SPARSEMEM=y
> > > && CONFIG_SPARSEMEM_VMEMMAP=n", struct pages aren't virtually contiguous with respect
> > > to their pfns, i.e. it's possible (again, very theoretically) that two struct pages
> > > could be virtually contiguous but physically discontiguous.  I suspect I'm being
> > > ridiculously paranoid, but for the efficient cases where pages are guaranteed to
> > > be contiguous, the extra page_to_pfn() checks should be optimized away by the
> > > compiler, i.e. there's no meaningful downside to the paranoia.
> > To make sure I understand it correctly:
> > There are 3 conditions:
> > (1) Two struct pages aren't virtually contiguous, but there PFNs are contiguous.
> > (2) Two struct pages are virtually contiguous but their PFNs aren't contiguous.
> >     (Looks this will not happen?)
> > (3) Two struct pages are virtually contiguous, and their PFNs are contiguous, too.
> >     But they have different backends, e.g.
> >     PFN 1 and PFN 2 are contiguous, while PFN 1 belongs to RAM, and PFN 2
> >     belongs to DEVMEM.
> > 
> > I think you mean condition (3) is problematic, am I right?
> Oh, I got it now.
> You are saying about condition (2), with "CONFIG_SPARSEMEM=y &&
> CONFIG_SPARSEMEM_VMEMMAP=n".
> Two struct pages are contiguous if one is at one section's tail and another at
> another section's head, but the two sections aren't for contiguous PFNs.

Yep, exactly.
