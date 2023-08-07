Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE4877235A
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Aug 2023 14:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99BB10E28E;
	Mon,  7 Aug 2023 12:02:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC2C10E28E;
 Mon,  7 Aug 2023 12:02:05 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bb893e6365so27632815ad.2; 
 Mon, 07 Aug 2023 05:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691409725; x=1692014525;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GUzrPfmRrMPt+i4UE/lAe9+fC5lOiUGAw2K7J8tfV2c=;
 b=d2GE3aQo5mQfZvlEF7f4oSva4EKJvypvIGy6IuBTAsIUE3RDscNyHs6Em+I3dvnLEN
 Obr3UC2AiaTlHrSkEsJ/2/LFeYfvI1DiNMw5FenkPOHuDossPPZc8ZfeJGsIy+R9emgH
 S+zPKCf80hsaVWKsNUpdmTN80mS2TgCrpRIY5tVhvkJPAPvo5KeS0X2Jwyldn9yI+g6Q
 Z55xF5Wu+GHCqh6GAMq9ECVbnwQqBc3oeadTkaDvDDfs5YsfG/1knWcS8z7eeL+BWZrT
 egWAAOtE1/vlGanMsyRR3IJqlk1YK1GLJmry94YPMykoZPpGbxmbd5/l8MnQYh04wIDr
 yzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691409725; x=1692014525;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GUzrPfmRrMPt+i4UE/lAe9+fC5lOiUGAw2K7J8tfV2c=;
 b=FBKm6RUK2CVB+SdUFwdgrDxV7jMDLZt0FgCj5PYNSIhuxNspBFyY6IJZV7eDhjHBQe
 zjPCoFb/VfBEJzHFzJBQD31zBtTzv3JkX1J6N+yYNRbEsKZsEmqtqQeLk8l2uY+LPuMq
 rUd4x0cDqtJFQgliHGAhL/+1J4OtVUDFL/hSTZrk/sr+s/B1gRWTMSSm4xIwIWi70pl/
 QCw9D0mewSu0JuMVWEKeOUwvipI41I1/h/ioyTP7swHKhHQI2F6Kned1rG9/Jdm81Qxu
 wnAdpiWxJ49PYjyLswnD5yUl7a8ay4nyaH7t8W5XDv2wppDmn5moLPbGDz6nQKbsPY4M
 q5DQ==
X-Gm-Message-State: AOJu0YxNrwkv2vI41LnEFe04xVEIhGUh/DtbYIzEyLbhiQ4KQYwGSCXc
 g9zCEJUYCCt1uNezJA8+9nqnvDBo0GuGgY3y
X-Google-Smtp-Source: AGHT+IHWYNulalQMDqlB0MHADRqG5ScHqlrzXhiB9uHTqVA4K3003dWe9L2ntXhX6qq+PcVohtu+WA==
X-Received: by 2002:a17:902:c101:b0:1b5:edd:e3c7 with SMTP id
 1-20020a170902c10100b001b50edde3c7mr7864273pli.16.1691409724767; 
 Mon, 07 Aug 2023 05:02:04 -0700 (PDT)
Received: from [192.168.255.10] ([103.7.29.32])
 by smtp.gmail.com with ESMTPSA id
 jc15-20020a17090325cf00b001b7ffca7dbcsm6752298plb.148.2023.08.07.05.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Aug 2023 05:02:04 -0700 (PDT)
Message-ID: <5581418b-2e1c-6011-f0a4-580df7e00b44@gmail.com>
Date: Mon, 7 Aug 2023 20:01:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 19/27] KVM: x86/mmu: Use page-track notifiers iff there
 are external users
To: Sean Christopherson <seanjc@google.com>
References: <20221223005739.1295925-1-seanjc@google.com>
 <20221223005739.1295925-20-seanjc@google.com>
Content-Language: en-US
From: Like Xu <like.xu.linux@gmail.com>
In-Reply-To: <20221223005739.1295925-20-seanjc@google.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Ben Gardon <bgardon@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 23/12/2022 8:57 am, Sean Christopherson wrote:
> +static inline void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa,
> +					const u8 *new, int bytes)
> +{
> +	__kvm_page_track_write(vcpu, gpa, new, bytes);
> +
> +	kvm_mmu_track_write(vcpu, gpa, new, bytes);
> +}

The kvm_mmu_track_write() is only used for x86, where the incoming parameter
"u8 *new" has not been required since 0e0fee5c539b ("kvm: mmu: Fix race in
emulated page table writes"), please help confirm if it's still needed ? Thanks.
A minor clean up is proposed.
