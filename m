Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E7352BECB
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 May 2022 17:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB4310F152;
	Wed, 18 May 2022 15:39:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CD910F381
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 18 May 2022 15:39:35 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso2481902pjg.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 18 May 2022 08:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Z/HMrrvCFWNmAHmvXNwS49dfDiOpl1n+gYXOKnIc4zI=;
 b=dar/R+iwJh6De/GxHOwX6pHMbcfNFw2VosEiMVS9rUR0uhV04veQWjUvNn1Um9Mals
 wRoCyapdixfM61qMc2HADICJWAjNnbA0wtGr+uJWt1QyWrw8PNXt7Yv4NGDLvF2Gd909
 XcWfnB1NhBE0JV5FT3WZn8Q7ynTgoH7QPo1cYLo2usyEG3DmpqGOF4Wvrv4j9nv286VG
 lcdB7BWKcl6xOcJUlig3kblVxHP0L0b6ubldhuv/9M5eUxiQc66zPE9PTz5a6oeBRpRm
 cN/wh3MpbOvQlWkpL/q6/zoIwYwptqGj6VxyDCscWcLs6MIpRyajD/xgVpEZAEStq968
 ahlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z/HMrrvCFWNmAHmvXNwS49dfDiOpl1n+gYXOKnIc4zI=;
 b=aBCfs35yZKvVPsPEsOQZvgi3A6wUF3HB2/lFvEx8XYuliM6NGnyE34q+vTdDC7SY+0
 J/fBqxoRTdo4liXif80KyDT2Af3CJglFn6hnqUtSx65g+c53Rm2ugeoy2fu1sUJRbsuv
 Uwz4dOO3dMgBMUu9VlKCLRzrc00DFD/12+uv9zA6IqpO/pqPVE93F4/yFiv1ewMz/AuU
 P8gW+bdbM3EfbBQRX6UbzzVdJIlUTtMLAjXINhrsPm8CpC3NTKpnz24pZ8adRlVq/rQP
 rr8XOtGwKI1zAHZb3td8PuRqVxIEiJJJKu3R35y5puUKIPNC26O40vnb1lcG+VzSrqx9
 RSRQ==
X-Gm-Message-State: AOAM53257Wuk4qa4gR2TmDnBR6AmILNELYhQm3fszEClTZuSEZpalRnp
 Z9KXZmoltivtqhEDzdgtmOolFQ==
X-Google-Smtp-Source: ABdhPJy4YDsen62GVqvNQ0gvtfR6xnGo8BpbBvHMqJCocqqqkTLqWVsTvmo43FO52CB7x/t5SXQ/jg==
X-Received: by 2002:a17:902:f814:b0:161:505d:a4f4 with SMTP id
 ix20-20020a170902f81400b00161505da4f4mr318446plb.6.1652888374834; 
 Wed, 18 May 2022 08:39:34 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 gv3-20020a17090b11c300b001da160621d1sm1671704pjb.45.2022.05.18.08.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 08:39:34 -0700 (PDT)
Date: Wed, 18 May 2022 15:39:30 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [RFC PATCH v3 02/19] KVM: x86: inhibit APICv/AVIC when the guest
 and/or host changes apic id/base from the defaults.
Message-ID: <YoUTMsnFS+bSED+5@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-3-mlevitsk@redhat.com>
 <20220518082811.GA8765@gao-cwp>
 <8c78939bf01a98554696add10e17b07631d97a28.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c78939bf01a98554696add10e17b07631d97a28.camel@redhat.com>
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
 Zhi Wang <zhi.a.wang@intel.com>, Chao Gao <chao.gao@intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
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

On Wed, May 18, 2022, Maxim Levitsky wrote:
> On Wed, 2022-05-18 at 16:28 +0800, Chao Gao wrote:
> > > struct kvm_arch {
> > > @@ -1258,6 +1260,7 @@ struct kvm_arch {
> > > 	hpa_t	hv_root_tdp;
> > > 	spinlock_t hv_root_tdp_lock;
> > > #endif
> > > +	bool apic_id_changed;
> > 
> > What's the value of this boolean? No one reads it.
> 
> I use it in later patches to kill the guest during nested VM entry 
> if it attempts to use nested AVIC after any vCPU changed APIC ID.

Then the flag should be introduced in the later patch, because (a) it's dead code
if that patch is never merged and (b) it's impossible to review this patch for
correctness without seeing the usage, e.g. setting apic_id_changed isn't guarded
with a lock and so the usage may or may not be susceptible to races.

> > > +	apic->vcpu->kvm->arch.apic_id_changed = true;
> > > +}
> > > +
