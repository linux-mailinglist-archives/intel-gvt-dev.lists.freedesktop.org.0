Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9F71ADFBB
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Apr 2020 16:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EFC6EC21;
	Fri, 17 Apr 2020 14:25:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FD16EC24
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 17 Apr 2020 14:25:43 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id y25so1133838pfn.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 17 Apr 2020 07:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L6cWP5WK6ujku9y43wjaNC6S0VeElTh4yenPv8t29Ak=;
 b=gKw5eoYUIpd77RsZ9EA4/OBI5it3b4QtTk5w0WNiaVsQlhU0AvTC99Kwb6pyQrnZwb
 8mkxqNjg6VEOZTZqnkLOebZlO/n/v5mMNjfkBB1cGO3Fx7O3pVDrmTfYyuyYufQ9ccR3
 RtPWKLjDzCOGMUWt9saeSwmpszseuFa+iiXqlLA7QMz5NdgXvU//k288EsKe0YfAzi6u
 dvmxk+qgp7K7fE2PnVT7fvqSgeWduMN7B1pblLGgZqKs3H1NpzAxQ5FN/ffFSwvnE0Dr
 z0qCKxdTOrenMDSXdIXvCN19QGBDvsZe/1e/6pTgbuMcknn8YL4CeODkrzae32Dl8ywr
 FA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L6cWP5WK6ujku9y43wjaNC6S0VeElTh4yenPv8t29Ak=;
 b=rbmiY4clMWI6kJDZBPNkI6CKa4AsSGDXuZfLmptIxOXQJfBA9Tq3L7ODiznktRjPK1
 H3mdDpwA4HyN8XPBgBKU6j7O0zgOYdZv0/4+l+H53MPfGNs2VtTPmJhdGieTklQy1r6y
 s0+cc/EuMsCF1BEPPXUElNIz4cARM1qpJJOT8MdStEdo3fgC7q3XPanqo1BI6lAJJQ5f
 ME6hB5NXx4uihPU/Kj6AIRoHkmJweKQVLB0Zs9MH0uuYXQbK4+zymDuJnybcxz+Bku12
 4CLMEh6HJs9amQzIa4QQ2v1rDbU4K43g07zv8NsIc3H/G3ZVy4aGqWq/Qc0SEhsf3zYr
 4Iug==
X-Gm-Message-State: AGi0Pua5Op1xlVPoTZSVrAlHiaU/vKA/IGRHDaznn/eH1ZLb1EsvtxIF
 QzE+qJ9OA3sd6cB7HnU1ExshFA==
X-Google-Smtp-Source: APiQypLk3UKQ7IlVU68RBsk4YcfumTB0+HNr5I6KmasWP50lwGXPB60OmHhJAmy9VXUBKXWGkLn5iw==
X-Received: by 2002:a63:1662:: with SMTP id 34mr3312317pgw.117.1587133542614; 
 Fri, 17 Apr 2020 07:25:42 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.145])
 by smtp.gmail.com with ESMTPSA id r18sm579944pfg.120.2020.04.17.07.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 07:25:41 -0700 (PDT)
Subject: Re: improve use_mm / unuse_mm v2
To: Christoph Hellwig <hch@lst.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20200416053158.586887-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <8d314bc3-ea59-684d-2d34-20b152a36f4f@kernel.dk>
Date: Fri, 17 Apr 2020 08:25:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416053158.586887-1-hch@lst.de>
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
Cc: Felipe Balbi <balbi@kernel.org>, amd-gfx@lists.freedesktop.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-usb@vger.kernel.org, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 intel-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 intel-gvt-dev@lists.freedesktop.org, Jason Wang <jasowang@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 4/15/20 11:31 PM, Christoph Hellwig wrote:
> Hi all,
> 
> this series improves the use_mm / unuse_mm interface by better
> documenting the assumptions, and my taking the set_fs manipulations
> spread over the callers into the core API.
> 
> Changes since v1:
>  - drop a few patches
>  - fix a comment typo
>  - cover the newly merged use_mm/unuse_mm caller in vfio

You can add my reviewed-by/tested-by to the patches, passes the
io_uring regression tests.

-- 
Jens Axboe

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
