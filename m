Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDFA53F2B1
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 Jun 2022 01:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8DA10E103;
	Mon,  6 Jun 2022 23:45:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72DF10E103
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  6 Jun 2022 23:45:38 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id br33so10365377qkb.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 06 Jun 2022 16:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7eRK9Jzco6zaNzKezRSe21QtwINuCVoa5KXsUQC3180=;
 b=jAX96k1SfIBELpO/UdAggYmzm0dmWWLs4cZGxrIiYnFWe9BunBdImD3qE8GX5/n5oS
 XCx/pwFQWFciiYl4z+k/bYiShg6+7bYd46TLVpcKqAV/kIMY3GwAk/gtb4ydf738iOPy
 coh732bxpVTleJJieq3gSkDgOl405aKGul1zSi/Yc+iyGBgb3W5EzPgSgYW1tWmI9sis
 Efyc9Ocfdj8n9hPJeLOeHaYPboTVJVoA7aZu6izJFJxfqJCMMREhWrXbTmoBoble+zA8
 p7JMHKmke/sKbHKTqw6HuH48Mq8ZhtHTheLgBXknvv53yCbIYAvg7TdJve9La6ZRWbua
 oJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7eRK9Jzco6zaNzKezRSe21QtwINuCVoa5KXsUQC3180=;
 b=sMCLZgDEiU0QGQbXznr2w49ekmlhKfEKJOt6lV0j8G5F1IIifSKPb6cOf3Yww2lMMb
 +hp9vMNCeIDI0Q2IDWs90G+g+Vs9G70l08ov+fAFHAjObfmic8X1Aamnq86DusY/JZVh
 pyCB87QBeatySUObxa3zhP+/LbzdU/bK+bXnR+rLaXMslcWQ7GTcwR9m3kR9s2+ba6oe
 Zmysxp0HqhIqgE2wVQa0vySJKZvYYR9kVg0+rkDVaegDUNou1qVKl4XY2UUlHHeDZDJZ
 1KbEk9aPeiWhiTFd7xcIauXDNhVI6H0A5qB2Kbj6+y6U1d+Fm3aRuGC24HMX9HZIHdkV
 fr1g==
X-Gm-Message-State: AOAM5339F4veK2grHxJ77YuJjYbmLcLbM7Kb33quY8L8vHcgVpdXWqiR
 0vNQlrjKLa1Sn4N+A5XK1mQXxQ==
X-Google-Smtp-Source: ABdhPJxcfjZTvFvT18Z5mBZR5Sa0iKO+ftAmalw28pYUIVYuQcvulbwp+qhNES3flaj709o81mFsqg==
X-Received: by 2002:a37:2750:0:b0:6a6:9ee2:5f5c with SMTP id
 n77-20020a372750000000b006a69ee25f5cmr12669209qkn.558.1654559137777; 
 Mon, 06 Jun 2022 16:45:37 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 s126-20020a375e84000000b0069fcc501851sm11986621qkb.78.2022.06.06.16.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:45:37 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nyMPg-002q1q-O1; Mon, 06 Jun 2022 20:45:36 -0300
Date: Mon, 6 Jun 2022 20:45:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 5/8] vfio/mdev: remove mdev_from_dev
Message-ID: <20220606234536.GF3932382@ziepe.ca>
References: <20220603063328.3715-1-hch@lst.de>
 <20220603063328.3715-6-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603063328.3715-6-hch@lst.de>
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, Jun 03, 2022 at 08:33:25AM +0200, Christoph Hellwig wrote:
> Just open code it in the only caller.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/vfio/mdev/mdev_core.c | 6 ++----
>  include/linux/mdev.h          | 4 ----
>  2 files changed, 2 insertions(+), 8 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
