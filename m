Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6DC53F2A3
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 Jun 2022 01:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF7F1127E7;
	Mon,  6 Jun 2022 23:38:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56311127E7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  6 Jun 2022 23:38:27 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id br33so10355915qkb.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 06 Jun 2022 16:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SU1Bpkz24VutH49VA7lUe4kyWhTSzOg82FW0ZiHgnzQ=;
 b=WUJN3PF98AmhnA9EnEIdGSfQ5ddQCk1y/4KLpggWx8LwpBQi4LI4gzsx6iazkzR8PZ
 cEfJk//4+Lnkx7Mko3HcmLj6+pnY/fOX7GfVZGwcM9We0Zc6O6MtTUsRjz6d10a/dk0j
 5A1rEl7jBhWHvzx4R7XAkT/NianJ6tYTcRYGSkN0RBiJVzefXBSVFUNLCPnmM+cAaEhy
 L7zMeGOack3Dn6a7dqz6pg8urZjq0mve71gJxnafaNfgNPJGtTCKQi2F93fG2N2L5VRo
 y/P3npTUwVoVAd2aPR78f0TyInxB0HJ1H0/vAhR6M0nAXppHqovFRhUMa2qfhtTKnOE6
 MxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SU1Bpkz24VutH49VA7lUe4kyWhTSzOg82FW0ZiHgnzQ=;
 b=PNAPVq5v583WjzSTxzeEKGKh6XWwFDaSKscVuxuE5HKTgR4lZHuivA5BlMntcTuzb/
 mJPBRJS3RPKV/onZV0U3HWZdvZ+Uvl7HNtDKpn7C9EaaPFqNIHSlIU9Jb3gn765E2bdr
 Efqtb7eNpsSVdeT+hRDCz8BQiropE0j2eztXxs85PBV/ao4IjIbBoIAkb/1tRd598+Vj
 KTBqkLZ27ZO5KJViw1dtgypij+yd7nj2C2sQ0wsjvCGIKmxaMNmHnTOdXn3WPT6Iq69P
 LAO0jPrDvml01pOyrva1jwrpHTyVg46XCU4DTnBKySBqLcfINYDPuQDBSg4aXGTQJf1f
 3+VA==
X-Gm-Message-State: AOAM533S+1tJUcxjR5hMzsd1LT8bg5zFIETZyPbMvtedxn48DZZ4cR0X
 8Lvdnk7WB5ShcxyUmJg30xD7LQ==
X-Google-Smtp-Source: ABdhPJzNb5TbcgQHOD4e1Y+ahg3esfZR81+kv/1bIwhxqm8jBZqA+IHLjSD8w4ADYCCosG/B97s89w==
X-Received: by 2002:a05:620a:25cb:b0:6a1:136:a7ed with SMTP id
 y11-20020a05620a25cb00b006a10136a7edmr17667931qko.531.1654558706881; 
 Mon, 06 Jun 2022 16:38:26 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 n79-20020a374052000000b0069fc13ce23dsm12539098qka.110.2022.06.06.16.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:38:26 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nyMIj-002ps2-KS; Mon, 06 Jun 2022 20:38:25 -0300
Date: Mon, 6 Jun 2022 20:38:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/8] vfio/mdev: remove mdev_{create,remove}_sysfs_files
Message-ID: <20220606233825.GE3932382@ziepe.ca>
References: <20220603063328.3715-1-hch@lst.de>
 <20220603063328.3715-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603063328.3715-5-hch@lst.de>
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

On Fri, Jun 03, 2022 at 08:33:24AM +0200, Christoph Hellwig wrote:
> Just fold these two trivial helpers into their only callers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/vfio/mdev/mdev_core.c    | 12 ++++++++++--
>  drivers/vfio/mdev/mdev_private.h |  3 ---
>  drivers/vfio/mdev/mdev_sysfs.c   | 28 ----------------------------
>  3 files changed, 10 insertions(+), 33 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
