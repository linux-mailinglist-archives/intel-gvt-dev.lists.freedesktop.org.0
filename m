Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5271476C0C2
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  2 Aug 2023 01:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD1410E446;
	Tue,  1 Aug 2023 23:20:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A16B10E446
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  1 Aug 2023 23:20:50 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-57320c10635so72235627b3.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 01 Aug 2023 16:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690932049; x=1691536849;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=nv6qBYunsdbsTaY6uXRci7C8TLoIW4Rt5jSeXwXm3B0=;
 b=0WAX2Ee9BLU4qIuUs/nXNN+WnktvhdNXDhANhGIA0E7TCaOO8AUZTaC0pdJuS6oelr
 xxXSUJtlB6LvUqF2xLZSDNFWHzOX2RNU8XlZu7kZytHv4EXt1EjIl4ornACC7j0LhAr9
 FQAMVB2WHFjOxTwfCEFM7vn/aq5msRRiE/kCbbHgrMEJ/SAZ7XcdjQv1EFm+/TbplCGo
 RH5HKanfN8U/6B/KV/F5IAKfyvu0H0PzYOEKg790w7RojxoLSeScG4vT1dgCvPtS1kRj
 jtvvJKb345Z2KWxRDthMpHwI55xP4L8bt97wJ/1hQWP9moVOtMRFTbwjHV1r/sQJ0O2Q
 NIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932049; x=1691536849;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nv6qBYunsdbsTaY6uXRci7C8TLoIW4Rt5jSeXwXm3B0=;
 b=VOafz+1W5BYBRxo2Fsl9Jo3CH6bmaLGeV5NqefOBRkS4/ohdwmWcXL1V1wK9rQ/VaY
 NCi3/b5xjJNC5SVPrLiXvSZuiRq46sSVolOU/mbRLKDHYUKUwngCJCNkfPMsQ5NL1z88
 93mBR+bvuoMbz8vwQcw0QyK/gywwij5iPUNEM2pg65UK2zqohIcM2bmQSzcnY/KJTgYp
 PGbwsRA0s0aPHxSRY5hx707LrTid5eDMWswGe0m2oLe/fAWXHYbwvOGXqFKSXsOwiRyw
 25ApmC8VHbiKliScKeMNK+oLTd56E988JMhYCCdPNl/n+2j39n69K0oW9tSy1y03KFC7
 i8lQ==
X-Gm-Message-State: ABy/qLZEUFddV4XhW/4XtC+HCouxD5vLiFtNmqK3iFIE/eSGpY6hJ2Xg
 LLik6THYIfYFfeXUZ8qmcjOvNBwyzsg=
X-Google-Smtp-Source: APBJJlEiNeh2xNttaLa7aT9PniWfJxmo8CFVd0xxEs+x1xQ7MP5B8c56Ko5NniauI1a16uttVXZVajZwXcQ=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ac07:0:b0:583:5471:1717 with SMTP id
 k7-20020a81ac07000000b0058354711717mr131891ywh.10.1690932049480; Tue, 01 Aug
 2023 16:20:49 -0700 (PDT)
Date: Tue, 1 Aug 2023 16:20:46 -0700
In-Reply-To: <ZMhjYo8bOsmsWcCL@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20230729013535.1070024-1-seanjc@google.com>
 <20230729013535.1070024-7-seanjc@google.com>
 <ZMhjYo8bOsmsWcCL@yzhao56-desk.sh.intel.com>
Message-ID: <ZMmTTlHXnm3ywvvj@google.com>
Subject: Re: [PATCH v4 06/29] drm/i915/gvt: Explicitly check that vGPU is
 attached before shadowing
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
 Yongwei Ma <yongwei.ma@intel.com>, Ben Gardon <bgardon@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Aug 01, 2023, Yan Zhao wrote:
> On Fri, Jul 28, 2023 at 06:35:12PM -0700, Sean Christopherson wrote:
> > Move the check that a vGPU is attacked from is_2MB_gtt_possible() all the
> typo: "attacked" --> "attached"
> 
> > way up to shadow_ppgtt_mm() to avoid unnecessary work, and to make it more
> This commit message does not match to what the patch does.
> The check in the patch is in ppgtt_populate_shadow_entry().
> 
> What you want is like below?

Yeah, I completely botched this and forgot to actually change the code.  I'll send
a replacement patch in-reply (or rather, I already sent it; I missed up again and
forgot to hit send on this one earlier in the day...).

Thanks yet again for the review!
