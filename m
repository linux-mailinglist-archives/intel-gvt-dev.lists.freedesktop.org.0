Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C6152D9DF
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 19 May 2022 18:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7562310F1BF;
	Thu, 19 May 2022 16:10:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C245910E7AE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 19 May 2022 16:10:35 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id 10so1786713plj.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 19 May 2022 09:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6P9aoIvTb4zsFevm1ytMUyd2KQeIyWHKWhq9w1IH5nA=;
 b=T7Cs1ly5aXcrAO13eVgUOej99XV/rj+jKzXmjsIRYzLGL6UcyV5iH3JPyRIq+djBCK
 xZwgz+2YFD4rDJcoJJQnFlzgl5yhdtM+Tl1MfQ7v8Umh9I3PJTj1hLvyRFkABe58SW16
 POlawmUVBZaIVFOqb03EeL2X0QGjr4FKdyMEBqsqx+cCqBgPbQd2WqMFBWGUqptRt32w
 0evGt3E/n5lZ3OVJ02QNqIJ1p70D3x8T91iRJ8RaPT4E00lNzMt5J2CHdvh9fFVGl8jU
 VsdQSylxiBaFG13J+J0ZdQH6LgQUAwamWicXRZXy+pudNkYL6vebjtHQ3YAn0pE3UbJ3
 W1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6P9aoIvTb4zsFevm1ytMUyd2KQeIyWHKWhq9w1IH5nA=;
 b=ruUzKgLxa2y34V0qC+fScc907M/YbLQCGyRE5rB09SrmM1wbmHdE6MZ9E4/CQNbISu
 HtkdTVa0D5KkSYXHmzP1/YBFF1AOwSZEAOZ6WToUm5ZOw2GN65vvQE7lnYeG2fF4ZxzW
 OOUL1omgMcVE0FHH9t2mpQJ6NH0iNAmIQuUxytxk3+Hy8oeyK1CyUJ+WaIxvj//nNbaF
 N+6cjpwubGS0fBZtI6Qd9Q+Rl34KtbVzUYp0iyeO8uFjTBoB7b9j/YnwrvvE5kOA2vUt
 bdKpt9SN0agiIIRruHdDyOjl7yp2AYKMTukFyKZ/IQvO/FVWjULd5C9S/LjRS/Zh2CAu
 f6tw==
X-Gm-Message-State: AOAM532eBo6WY5jX+Qf/CueoW4t7ZBzy4y0/RqPxr+U1SRCHrnFTFj5L
 uB3UqmMMLcgSisgaLRUVWvwIpw==
X-Google-Smtp-Source: ABdhPJxDs1hTxUR5C4EzuM1SwmYr5BCL2DO/nb2Iv0FkQCnGAlR0Mez8mclqXftI71289BB5kbpqHw==
X-Received: by 2002:a17:902:7d89:b0:15e:e999:6b88 with SMTP id
 a9-20020a1709027d8900b0015ee9996b88mr5500329plm.98.1652976635201; 
 Thu, 19 May 2022 09:10:35 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 l17-20020a629111000000b00517d7fb695fsm4178516pfe.200.2022.05.19.09.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:10:34 -0700 (PDT)
Date: Thu, 19 May 2022 16:10:31 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [RFC PATCH v3 03/19] KVM: x86: SVM: remove avic's broken code
 that updated APIC ID
Message-ID: <YoZr9wC2KjTFHrQ7@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-4-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427200314.276673-4-mlevitsk@redhat.com>
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> AVIC is now inhibited if the guest changes apic id, thus remove
> that broken code.

Can you explicitly call out what's broken?  Just something short on the code not
handling the scenario where APIC ID is changed back to vcpu_id to help future
archaeologists.  I forget if there are other bugs...
