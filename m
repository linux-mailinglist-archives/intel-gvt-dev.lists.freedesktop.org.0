Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB5419E462
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  4 Apr 2020 12:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1566E0E9;
	Sat,  4 Apr 2020 10:06:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903D76E0F6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  4 Apr 2020 10:05:59 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id g27so9459669ljn.10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 04 Apr 2020 03:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f5WeYVcExZ58viobGo5xENBYY/7iA5WtiHNaBP74Ohk=;
 b=aTi0ATN9MaY24407laRnBef6LfGPpOgdRBwSwCQz2c3RW4Gj/WkUSmsjFupt1+Si1I
 /jw0cOt3bzoZ1L8XI8Cd7xl4uND//yB9GJHWzUv8WZWdrs2vMEb5P/6AngfEuXPZiSGf
 XPfLEX+uHTRcYFmBj3aEbcKNRHtdDgUwBBnViuTIu3RWq8uVF0MXaSq7dRYUFOEfUxag
 Me75vpJfK3iUGksokG2xHslbFjKJVBBYOFEjoY7PYPAXlsjqaldQ3YKyfSNa7FMzpHkn
 t+K46duTvK6NW20LFcqGjElqmIe9KQb5vJm4zg6VH9x14j7uPUY0uawotq+psxvUvGUB
 UXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f5WeYVcExZ58viobGo5xENBYY/7iA5WtiHNaBP74Ohk=;
 b=U4TXLllzvUvMhP355Laa7zQAYaLWBEZ7zgvTsqWDi+F90KXoml60sdUK6oECOIo1Tj
 9derytcK32iisPtUwzYbd7diOJJargnjzbVin3eHcIYTF9ISjvn8oHWqVALToNsOOi1M
 Ipyp9eNWlvE4GtS3q3dt5qDYko7KQr4cTXxzLJVucrqxKk7H0ZcKWMi1leiZuYdutdpz
 +k8hrT3WthZMUBaz+6WsP+cidU98miS9zXO3nABc3i9VBm/p1LWAWXBh8kt1Qa4RoYIw
 FMz4Nhrk3vZeGCeI6fmHmsDVH12LsHY5vkoPV6Q2eWJUtX096It+DzmYsYH4QwAfDVYt
 P9/Q==
X-Gm-Message-State: AGi0PuZR+Q+UlqWTQnnvWcYN9uiuKoISisZViEaw4wGXTOh4VS6XIOCw
 KthmDxg9oqOyj72B4ePEFZ7KwA==
X-Google-Smtp-Source: APiQypJgK3TXAPv85OfJ7vCTcz4u4tUzYYbvpr+INBxhiypWT+murLDDhRYYaeJT38bk35encw/Ldg==
X-Received: by 2002:a2e:818e:: with SMTP id e14mr7232769ljg.225.1585994757852; 
 Sat, 04 Apr 2020 03:05:57 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:6f0:5f98:6c2c:3527:3946:ae?
 ([2a00:1fa0:6f0:5f98:6c2c:3527:3946:ae])
 by smtp.gmail.com with ESMTPSA id p21sm6378055ljg.5.2020.04.04.03.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Apr 2020 03:05:57 -0700 (PDT)
Subject: Re: [PATCH 2/6] i915/gvt/kvm: a NULL ->mm does not mean a thread is a
 kthread
To: Christoph Hellwig <hch@lst.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20200404094101.672954-1-hch@lst.de>
 <20200404094101.672954-3-hch@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0fb3cce8-fa3d-5c97-1eba-0f359797eea2@cogentembedded.com>
Date: Sat, 4 Apr 2020 13:05:52 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200404094101.672954-3-hch@lst.de>
Content-Language: en-US
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
Cc: Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 amd-gfx@lists.freedesktop.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-usb@vger.kernel.org,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 intel-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 intel-gvt-dev@lists.freedesktop.org, Jason Wang <jasowang@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hello!

On 04.04.2020 12:40, Christoph Hellwig wrote:

> Use the proper API instead.
> 
> Fixes: f440c8a572d7 ("drm/i915/gvt/kvmgt: read/write GPA via KVM API")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/gpu/drm/i915/gvt/kvmgt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 074c4efb58eb..5848400620b4 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -2037,7 +2037,7 @@ static int kvmgt_rw_gpa(unsigned long handle, unsigned long gpa,
>   	struct kvmgt_guest_info *info;
>   	struct kvm *kvm;
>   	int idx, ret;
> -	bool kthread = current->mm == NULL;
> +	bool kthread = (current->flags & PF_KTHREAD);

    Don't need the parens.

[...]

MBR, Sergei
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
