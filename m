Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6317752DA65
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 19 May 2022 18:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D1C11A018;
	Thu, 19 May 2022 16:38:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5061610EC90
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 19 May 2022 16:38:33 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so5719437pjf.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 19 May 2022 09:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5R5CIsenxtrkxTKlA3MXRGhcGTe2bd3z24V2JTX79wc=;
 b=qKiBkzaLa8x6UswSmJfUjwYZA/+8KqTAJth5R0NSkIFDS+OYa4KsG2uOIOgIGEQdP4
 F8mf2P2TCB85o7/umxXqrhR9Y71M26PoV9VW5PCToTGFtrBnh84Ox36EcDFBLWVp71jD
 XUqHHJtkU1aIZoAcr/4yG0jh3rkr4iZ6nyVh6EgEC+gAcHqOjsaXpiFmpOLk1JBJsMqF
 Dy47hm/WdCkWyLrEe65dUCuQzyzmf/ZvJxQxRDY8dIqoUHYIFuyJWOvXaxPmG2/nZQaw
 4q2fomKvJhevs2t2VPjRs0pMPgC3OMNtFLTy1febiE8+FpKTb9FgypUFQEX5dL8geTIh
 bWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5R5CIsenxtrkxTKlA3MXRGhcGTe2bd3z24V2JTX79wc=;
 b=2QZyWaV1njk6bJWqSqr34iO1XbrgCHMAVNgwmyUybpKlSFDrafIfenqVeJOu6u+YDz
 tn7cGVzyjyZ52PfZ8M6kRwP2K9NKfCq9lb+VW1mCDHQY5RiY5tmfVzU7Po7XdCAyEJz8
 qONKvhIqMT8huCJI02qKbyMcuAwbiYWSfytINvJNm2VCfU7tKitak2csFlvth1wqDHCQ
 UxaDDEnKgGhXtcifG8EB6JiDp8vIO5W7ZtEiplX5Q7HmF8QbkU64TtILtUB+bVLYunUp
 rHRJlCEPnJ7P5Ae9Kw8O+p8+4Bp+AcIUFh6JaxFDldgMJg0jbPMhihyV+5GnY6rJHjvo
 V0+A==
X-Gm-Message-State: AOAM533HQudBe2K53wJjs9xKs44lscQ3kOnWVcZcTSZaK90ATGIZKWpz
 FsBBCyoBHLxGIcqJqOP3ALLvkg==
X-Google-Smtp-Source: ABdhPJxiRsm84/7Erm3zrVNXQjVrfgfFlxyNelaI6knzQLt/AHi12NfjLuBHc0kegGIYgOlMcbZmkQ==
X-Received: by 2002:a17:902:db11:b0:161:9513:da41 with SMTP id
 m17-20020a170902db1100b001619513da41mr5545300plx.145.1652978312706; 
 Thu, 19 May 2022 09:38:32 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 a32-20020a056a001d2000b0050dc762819bsm4173554pfx.117.2022.05.19.09.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:38:32 -0700 (PDT)
Date: Thu, 19 May 2022 16:38:28 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [RFC PATCH v3 05/19] x86: KVMGT: use
 kvm_page_track_write_tracking_enable
Message-ID: <YoZyhIuvxNZBOdko@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-6-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427200314.276673-6-mlevitsk@redhat.com>
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
> @@ -1948,6 +1949,10 @@ static int kvmgt_guest_init(struct mdev_device *mdev)
>  	if (__kvmgt_vgpu_exist(vgpu, kvm))
>  		return -EEXIST;
>  
> +	ret = kvm_page_track_write_tracking_enable(kvm);
> +	if (ret)
> +		return ret;

If for some reason my idea to enable tracking during kvm_page_track_register_notifier()
doesn't pan out, it's probably worth adding a comment saying that enabling write
tracking can't be undone.

> +
>  	info = vzalloc(sizeof(struct kvmgt_guest_info));
>  	if (!info)
>  		return -ENOMEM;
> -- 
> 2.26.3
> 
