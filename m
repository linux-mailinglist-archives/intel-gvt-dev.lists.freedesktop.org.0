Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6386F57C06E
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 Jul 2022 01:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C964F18B14A;
	Wed, 20 Jul 2022 23:05:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB64B18B129
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Jul 2022 23:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658358301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zg6tKh24AWnTu20bQJOGXj28spsKAAV7siHCBMGPsbs=;
 b=AcYOeD8t+ZniHHUjNPOR3CSqdjTcms8uCNVY+uO7RE6ENMgyKkR6Wn9yUVP7h/ZzTp9LaR
 0++AnwAQAeyxVWHD9qv4NIpDXQRtd6anQqihoaV0HaN5DPbCpNj8Ksogr+TmIGT0X5rafO
 U6MwvyLZhMsNc3QgIG3xZ8R18nyAgVw=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-c3oq0D3WMFuXXGTI5dIiEA-1; Wed, 20 Jul 2022 19:05:00 -0400
X-MC-Unique: c3oq0D3WMFuXXGTI5dIiEA-1
Received: by mail-il1-f199.google.com with SMTP id
 w5-20020a056e021c8500b002dcb397284dso11706158ill.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Jul 2022 16:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=zg6tKh24AWnTu20bQJOGXj28spsKAAV7siHCBMGPsbs=;
 b=wwcHUgIEUlEddcAdkHyct5wzqf7+0FPD6eul/kLqx6t+DO2EY0rnqQ6OY87j73vk2z
 VSXp1Unq+q28fB8MmTJvpuUHOQXXqi1X1X9BXhYyNwMVqMd2y/7h0X6bk52VIWVWbY2b
 pxN+JIZNgKhQzu1ZpfC60S34c9UoFW6NsqdABhIwDdz6B0TbZHGGJdcUxrzlJkvm8BCv
 mTOB/RWBmwy8LHt/UqzvonYJVf8UBLJ3FhCbriIo/o3oR93S7qbhCu1BjGMXgR6O6Wjq
 fcA+6X8HzGyiTAgCdD7ov/2rPi7Us5IWxpEJ4BtJYd7ZdKNTo3BzZX8wwuck5SsXbvL4
 Cflg==
X-Gm-Message-State: AJIora9c/B5tValWHiQmQvNdB02oW+VmdHT+zD/qIyeBbLmGzwC8BR+1
 NmPUMxDSsZr+skCydrp8I7g49lf83Bmpq4/KxqcKqP6yk6mUcTplgcuUG+ocDE7poDcYtFuRbyb
 o1xBSbJAY0J+EmIy26ADNiC7CZGwMDP6Yaw==
X-Received: by 2002:a92:d64d:0:b0:2dc:e337:58ab with SMTP id
 x13-20020a92d64d000000b002dce33758abmr8883695ilp.85.1658358300016; 
 Wed, 20 Jul 2022 16:05:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sQXCea5IlpPt4z3PoQC/VJ/h3ZRlmifntgfmb+p+6Hl0NlKR1GQe1eKRx6WPGYdv4/I+TsDA==
X-Received: by 2002:a92:d64d:0:b0:2dc:e337:58ab with SMTP id
 x13-20020a92d64d000000b002dce33758abmr8883682ilp.85.1658358299767; 
 Wed, 20 Jul 2022 16:04:59 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 n24-20020a056638111800b0034195de93b3sm92309jal.51.2022.07.20.16.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 16:04:59 -0700 (PDT)
Date: Wed, 20 Jul 2022 17:04:57 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Message-ID: <20220720170457.39cda0d0.alex.williamson@redhat.com>
In-Reply-To: <20220720200829.GW4609@nvidia.com>
References: <0-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
 <1-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
 <20220720134113.4225f9d6.alex.williamson@redhat.com>
 <20220720200829.GW4609@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 20 Jul 2022 17:08:29 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Jul 20, 2022 at 01:41:13PM -0600, Alex Williamson wrote:
>  
> > ie. we don't need the gfn, we only need the iova.  
> 
> Right, that makes sense
>  
> > However then I start to wonder why we're passing in 1 for the number of
> > pages because this previously notifier, now callback is called for the
> > entire vfio_dma range when we find any pinned pages.    
> 
> Well, it is doing this because it only ever pins one page.

Of course that page is not necessarily the page it unpins given the
contract misunderstanding below.
 
> The drivers are confused about what the contract is. vfio is calling
> the notifier with the entire IOVA range that is being unmapped and the
> drivers are expecting to receive notifications only for the IOVA they
> have actually pinned.
> 
> > Should ap and ccw implementations of .dma_unmap just be replaced with a
> > BUG_ON(1)?  
> 
> The point of these callbacks is to halt concurrent DMA, and ccw does
> that today.

ccw essentially only checks whether the starting iova of the unmap is
currently mapped.  If not it does nothing, if it is it tries to reset
the device and unpin everything.  Chances are the first iova is not the
one pinned, so we don't end up removing the pinned page and type1 will
eventually BUG_ON after a few tries.

> It looks like AP is missing a call to ap_aqic(), so it is
> probably double wrong.

Thankfully the type1 unpinning path can't be tricked into unpinning
something that wasn't pinned, so chances are the unpin call does
nothing, with a small risk that it unpins another driver's pinned page,
which might not yet have been notified and could still be using the
page.  In the end, if ap did have a page pinned in the range, we'll hit
the same BUG_ON as above.

> What I'd suggest is adding a WARN_ON that the dma->pfn_list is not
> empty and leave these functions alone.

The BUG_ON still exists in type1.

Eric, Matt, Tony, Halil, JasonH, any quick fixes here?  ccw looks like
it would be pretty straightforward to test against a range rather than
a single iova.
 
> Most likely AP should be fixed to call vfio_ap_irq_disable() and to
> check the q->saved_pfn against the IOVA.

Right, the q->saved_iova, perhaps calling vfio_ap_irq_disable() on
finding a matching queue.

> But I'm inclined to leave this as-is for this series given we are at
> rc7.

On the grounds that it's no worse, maybe, but given the changes
around this code hopefully we can submit fixes patches to stable if the
backport isn't obvious and the BUG_ON in type1 is reachable.  Thanks,

Alex

