Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA945978F6
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 17 Aug 2022 23:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3021CAB2E6;
	Wed, 17 Aug 2022 21:35:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB82FAB264;
 Wed, 17 Aug 2022 21:35:02 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h24so3533486wrb.8;
 Wed, 17 Aug 2022 14:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=lLz+PkpfK1No4UuxxDYnz3nE+HaVRSnA1ZRqiNo95Uk=;
 b=ZHOaP1cUxxkAOuOaEZ0neBVGUJA5wLt6Gelg8p1e098+e+zuLxzd7GPOhdjdxvN3Z+
 JYtjm8NMDNfHx7haSPr1a6HxZSjPFvWOb3353VqXQhpiJ6hZZzHmZxx1jvFZxX1FgfQs
 TbkL0Tl8aoqAheo6V88CMhq3hTcN0eG76ojCqJjgKZrginU1aRUvB9BG8s/wmIN7Of/r
 j7f0hi1iOHx3U/VWEmB6xJQTW10Z1Ptl2ooWCcdcoNET685QVpEYSJ+2fBMdQ98S8a+8
 cnjkrpeazEPMwXLaTtDzyqZ2jzKuSjVTayHSqLf8/YpgQpu+BNioh3odI/RYvyh1szWb
 V3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=lLz+PkpfK1No4UuxxDYnz3nE+HaVRSnA1ZRqiNo95Uk=;
 b=aRxI62mxrm+HrOlouPllb4zHSSW/yGDiRzWAgP1dKFxWurOsjCSFiwpt0TyEXnmD2K
 2qwRmrJcnSelwL5UPIybqx7XLH+zkirBhe+A8NoRIohP6vBNX5J0jp1mRzsaVCoaKKsq
 sUWp2Z8uqFmqRc4/PL1hQmJ+qa4SX+qHtDfMWUuOMERRbulaxeQyl3O3EE9Tk7coc8qC
 zgoBtvjCubAx7nAb0KHgvXraHwBx4S5zPlO1KosmiXYSNmXpog+jrxEyiWFdZ+zF0xQu
 cEY6zidK4ZkaOzVn2aDkGumhhF/4aJqh0uRUx0q3dak51EjTeGBDPFmaJ9QNucnAxUXu
 FGJg==
X-Gm-Message-State: ACgBeo3u1SH8wEHUI1csIWqnv3frkfgCnhnjG+LC7P7osQmMPNPy4c29
 6m6FO0/RycWBpuH8mzs7bGisDeFyRFqkhw==
X-Google-Smtp-Source: AA6agR6Drb+IpKQszYX3AW2pSqmEO6ZD5T4XS0nPVovcPmwX8p5M1vlyCTBkfMct9rPRKfrYqTmTMw==
X-Received: by 2002:a5d:6acb:0:b0:21e:efd7:c7be with SMTP id
 u11-20020a5d6acb000000b0021eefd7c7bemr1774wrw.293.1660772101329; 
 Wed, 17 Aug 2022 14:35:01 -0700 (PDT)
Received: from [192.168.0.209]
 (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
 by smtp.googlemail.com with ESMTPSA id
 p6-20020a05600c05c600b003a604a29a34sm2874612wmd.35.2022.08.17.14.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 14:35:00 -0700 (PDT)
Message-ID: <9f6e3433-5748-b7e4-bbc6-b0e47cb9d1c5@gmail.com>
Date: Wed, 17 Aug 2022 22:34:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL] gvt-fixes
Content-Language: en-US
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "King, Colin" <colin.king@intel.com>
References: <20220815023855.GF1089@zhen-hp.sh.intel.com>
 <YvrXnUnnot139qKL@intel.com> <20220816040508.GG1089@zhen-hp.sh.intel.com>
 <20220816044303.GH1089@zhen-hp.sh.intel.com>
 <116bdd80d399da39a6ba3f3d2f71a1f78e2b026f.camel@intel.com>
From: "Colin King (gmail)" <colin.i.king@gmail.com>
In-Reply-To: <116bdd80d399da39a6ba3f3d2f71a1f78e2b026f.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 17/08/2022 21:07, Vivi, Rodrigo wrote:
> On Tue, 2022-08-16 at 12:43 +0800, Zhenyu Wang wrote:
>> On 2022.08.16 12:05:08 +0800, Zhenyu Wang wrote:
>>> On 2022.08.15 19:32:45 -0400, Rodrigo Vivi wrote:
>>>> On Mon, Aug 15, 2022 at 10:38:55AM +0800, Zhenyu Wang wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> Here's one gvt-fixes pull for 6.0-rc. Major one is Cometlake
>>>>> regression
>>>>> fix for mmio table rework, and others are left kernel doc fixes
>>>>> not pushed yet.
>>>>>
>>>>> Thanks
>>>>> --
>>>>> The following changes since commit
>>>>> a7a47a5dfa9a9692a41764ee9ab4054f12924a42:
>>>>>
>>>>>    drm/i915/reset: Add additional steps for Wa_22011802037 for
>>>>> execlist backend (2022-07-25 15:57:54 +0100)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>    https://github.com/intel/gvt-linux.git tags/gvt-fixes-2022-
>>>>> 08-15
>>>>>
>>>>> for you to fetch changes up to
>>>>> 394f0560a76298842defd1d95bd64b203a5fdcc4:
>>>>>
>>>>>    drm/i915/gvt: Fix Comet Lake (2022-08-15 10:54:03 +0800)
>>>>>
>>>>> ---------------------------------------------------------------
>>>>> -
>>>>> gvt-fixes-2022-08-15
>>>>>
>>>>> - CometLake regression fix in mmio table rework (Alex)
>>>>> - misc kernel doc and typo fixes
>>>>>
>>>>> ---------------------------------------------------------------
>>>>> -
>>>>> Alex Williamson (1):
>>>>>        drm/i915/gvt: Fix Comet Lake
>>>>>
>>>>> Colin Ian King (1):
>>>>>        drm/i915/reg: Fix spelling mistake "Unsupport" ->
>>>>> "Unsupported"
>>>>
>>>> dim: d6632370536d ("drm/i915/reg: Fix spelling mistake
>>>> "Unsupport" -> "Unsupported""): committer Signed-off-by missing.
>>>>
>>>> is it possible to fix this in your tree?
>>>
>>> Sorry about that. Let me re-generate.
>>
>> oh, surprise! I just found Colin's email is actually defined in
>> .mailmap,
>> so all his commits in kernel are changed for @intel.com address as in
>> mailmap...
> 
> Colin, would you mind to get the Sign-off-by in the patches the same
> as your authorship so the tools don't get confused?
> (starting with modifying in tree this already merged patch)

Since my patches are generally trivial janitorial fixed done in my spare 
time I'm going to get the .mailmap changed to use my gmail email address 
rather than my Intel one (since I don't do kernel work in my current role).

This should clean up the confusion. Apologies.

Colin

> 
> Thanks,
> Rodrigo.
> 
>>
>> So maybe I can't change that?
>>
>>
> 

