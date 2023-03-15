Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADFB6BBD27
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Mar 2023 20:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE5310E319;
	Wed, 15 Mar 2023 19:23:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF39F10E319
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Mar 2023 19:23:21 +0000 (UTC)
Received: by mail-pj1-x1049.google.com with SMTP id
 pa10-20020a17090b264a00b0023b4d15f656so2347441pjb.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Mar 2023 12:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678908201;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=CO8t+zxtFwLc3yJ6bJQPj8GStgQChto9AhidRXWbvKE=;
 b=AFfpyBBgddR4r+3JtnHbvcqmXuTkhpDMyp586u8nVhbO1w8OEZcY5uo/OF9V598ZLI
 4rHyH46ovKyA7lnhJHFG6xBBVxETLjL+X9IjtJQHUydXqo4ZUQ7Y5WwNClIPQ1Eh5lQZ
 zA5Knux19o9U5vhp9sOPU9amPjsWqVXPs766BYzKn+IlghB7VhRAkzLGqDz4B65bhhoA
 YNqCkknXtoi31iyHYeoVPj0mO+0gmInMgO4IEC2gwezvk4+y57uPy1bVDX0g88G2Wp9I
 7MVEgckhtqsD0i2BAz6dAWMWBZXBSPIf8Br/5Y4kjpfV2xKcxN6RAqv5yqcr4S5tRhFQ
 fCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678908201;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CO8t+zxtFwLc3yJ6bJQPj8GStgQChto9AhidRXWbvKE=;
 b=I+z9+0GEO29KfDbNE+DGLSNVIyW9mZsreGiu6MUfBnR2RUIhO9WXkDi66z9gDh7S/U
 NwDZlsCyOBSPuMMi6bg3mqsUU8tKJeGBD+Hy/7YYe82y0h0ep7rcUdwKT90SFTvnBF20
 jmbfNBiWty8/f3vEjXButJ2KGKSNKAI00t4rQMD5lG/8VfGfBWwE+pqD7e+K57nZQ9xr
 jxmc5eih2RtoZsUFyQ33tDXce/c2Rp2qIbQ1W2olWr45awO9l/0C1Gom9U9zp5nrwsu3
 aiur6CylsAmA6tKxfyAYa+LJ43ewj66wDTjOZmxf6TLxZSlh60o4S1Jmc57U+JC4aYTu
 sf5w==
X-Gm-Message-State: AO0yUKVPZ0jLbNG7aIJM/Lq6a9tPWulwoSLy2lEaUd/VPrRsUgiPoXop
 wpA9++sKKJ8x62Du/1CS1LTNHY17f/0=
X-Google-Smtp-Source: AK7set/JY+rzlbShnVBele6OwSOSpHpEbwghpOgoGyd4CaLNRbbg6Pm7bxlVeohGsEhXPHXSQ02jqVfN9X8=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f547:b0:19f:2164:9b3b with SMTP id
 h7-20020a170902f54700b0019f21649b3bmr261241plf.13.1678908201457; Wed, 15 Mar
 2023 12:23:21 -0700 (PDT)
Date: Wed, 15 Mar 2023 12:23:20 -0700
In-Reply-To: <871f7c8b-0f54-7e9c-4253-b3878b010bbf@intel.com>
Mime-Version: 1.0
References: <20230311002258.852397-1-seanjc@google.com>
 <20230311002258.852397-2-seanjc@google.com>
 <DS0PR11MB63733BCF5AEBBF5F38FD2C01DCB99@DS0PR11MB6373.namprd11.prod.outlook.com>
 <871f7c8b-0f54-7e9c-4253-b3878b010bbf@intel.com>
Message-ID: <ZBIQ1vxLs10UFi3R@google.com>
Subject: Re: [Intel-gfx] [PATCH v2 01/27] drm/i915/gvt: Verify pfn is "valid"
 before dereferencing "struct page"
From: Sean Christopherson <seanjc@google.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Wei Wang <wei.w.wang@intel.com>,
 Ben Gardon <bgardon@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Mar 15, 2023, Andrzej Hajda wrote:
> On 13.03.2023 16:37, Wang, Wei W wrote:
> > On Saturday, March 11, 2023 8:23 AM, Sean Christopherson wrote:
> > > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
> > > index 4ec85308379a..58b9b316ae46 100644
> > > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > > @@ -1183,6 +1183,10 @@ static int is_2MB_gtt_possible(struct intel_vgpu
> > > *vgpu,
> > >   	pfn = gfn_to_pfn(vgpu->vfio_device.kvm, ops->get_pfn(entry));
> > >   	if (is_error_noslot_pfn(pfn))
> > >   		return -EINVAL;
> > > +
> > > +	if (!pfn_valid(pfn))
> > > +		return -EINVAL;
> > > +
> > 
> > Merge the two errors in one "if" to have less LOC?
> > i.e.
> > if (is_error_noslot_pfn(pfn) || !pfn_valid(pfn))
> >      return -EINVAL;
> 
> you can just replace "if (is_error_noslot_pfn(pfn))" with "if
> (!pfn_valid(pfn))", it covers both cases.

Technically, yes, but the two checks are for very different things.  Practically
speaking, there can never be false negatives without KVM breaking horribly as
overlap between struct page pfns and KVM's error/noslot would prevent mapping
legal memory into a KVM guest.  But I'd rather not hide the "did KVM find a valid
mapping" in the "is this pfn backed by struct page" check, especially since this
code goes away entirely by the end of the series.
