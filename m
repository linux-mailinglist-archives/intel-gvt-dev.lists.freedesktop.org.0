Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E12B4AD815
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Feb 2022 13:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6CB10E459;
	Tue,  8 Feb 2022 12:02:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBBC10E459
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Feb 2022 12:02:47 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id p15so51586092ejc.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 08 Feb 2022 04:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d8Mwo7JcHs/wX7xi36MAMo625linEGbluO6vnnk1iro=;
 b=RvkQ1iTnjOrBg7vdOhC4yM87M1Fp34phG3HzQ9I4VaZGlzSIAUcmlO84g9hEpgzjGQ
 3SuCMgBm1MVYtrHL+arHmbIDVWLVKq6VTraB6h0ERLR8Uj+XYdiRJ07XjXu46/ynz7nQ
 6R3erY+mvsnF2z3iKt7jvGAsZt41DAjslU7al1878FsWDg/xq86vgN8907LIFrNkkWRs
 qG2GqZSs/KODmKA5kBg6x+2YR6RSN2/AyrFa0PGxoDDa69jf2elJF1LfX2iG8+l96sfl
 ij6H01jmLbdtXxvlXMF1zjze/bnwXv+gXKJlRWQosa2KzWx4T2kxbqYFdiZ4fpVjdodG
 7Q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d8Mwo7JcHs/wX7xi36MAMo625linEGbluO6vnnk1iro=;
 b=S8+VryQC1Pl9Zq4B+1K/Ox9Xz2xWMTxoJGUIT2VQ2VbeqA+z77YQjHSgH+RPUJmKR+
 2NEJl63pB6NfoPLt+3Yi70C7YD1oF+vXZnhznQQnL+ZDczMRJLb2pSyUUWp5Dyp8+vcy
 rOLNcpozCxCS57nhxlkujuhM8u2RcrAlpE5inNZg5vcL80iAX6E8JWYYhlcckICV/4g7
 YM/ypOYtlQKuHb2lYtsAY1rxzdIDceeECU+vrjww+GlyxX7A7CLppKsgoaV21k6Z9z9H
 YAyg9QHQmpE7qcKzO4uUHHti/SK9Q7z3TfWxm27x3/98BFYlBmJir1xon2jXmjkvymAw
 uRNQ==
X-Gm-Message-State: AOAM532gaVjQgOPlsMtodBvoGB6tFhcsPuqQhke4CWCMHt5ki2bfHgt3
 wRdcsdv8Zg1A48yTQDFafoo=
X-Google-Smtp-Source: ABdhPJxtI78Az8LQBoK78nSzfP62yfqSFerWFtypvbBZInDZIcG92vJYBss/dkF80ZGfvgtZFDVaUg==
X-Received: by 2002:a17:906:58d0:: with SMTP id
 e16mr3357767ejs.454.1644321766016; 
 Tue, 08 Feb 2022 04:02:46 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id l2sm6513889eds.28.2022.02.08.04.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 04:02:45 -0800 (PST)
Message-ID: <f48b498a-879d-6698-6217-971f71211389@redhat.com>
Date: Tue, 8 Feb 2022 13:02:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RESEND 00/30] My patch queue
Content-Language: en-US
To: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
References: <20220207155447.840194-1-mlevitsk@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220207155447.840194-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Wanpeng Li <wanpengli@tencent.com>, David Airlie <airlied@linux.ie>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Kan Liang <kan.liang@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Chang S. Bae" <chang.seok.bae@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tony Luck <tony.luck@intel.com>, Sean Christopherson <seanjc@google.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 2/7/22 16:54, Maxim Levitsky wrote:
> This is set of various patches that are stuck in my patch queue.
> 
> KVM_REQ_GET_NESTED_STATE_PAGES patch is mostly RFC, but it does seem
> to work for me.
> 
> Read-only APIC ID is also somewhat RFC.
> 
> Some of these patches are preparation for support for nested AVIC
> which I almost done developing, and will start testing very soon.
> 
> Resend with cleaned up CCs.

1-9 are all bugfixes and pretty small, so I queued them.

10 is also a bugfix but I think it should be split up further, so I'll 
resend it.

For 11-30 I'll start reviewing them, but most of them are independent 
series.

Paolo
