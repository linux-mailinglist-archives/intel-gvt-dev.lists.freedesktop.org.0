Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2741653F2B5
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 Jun 2022 01:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD85E10E247;
	Mon,  6 Jun 2022 23:46:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E0C10E247
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  6 Jun 2022 23:46:11 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id 68so3638034qkk.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 06 Jun 2022 16:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F3hOH9RA5JoblI2pxUlcLp6jn6iFgdYtxKJdEXArLz8=;
 b=H4hdQBXcoHuewS6bMmzTaq4Gi46SWkQGuA+7UxvO61phStKl3JgqnymllrkMmhexSP
 dLWLsx3WY0TdjatRyvhQoRXXax2GfIDXfrFQwQ+jlZwwk4ewAKjtmikJRqr4MMOKwpQh
 +ooX9uHqlT4o1HAJ/XreaoYzR0uC67Hi+rLGCgt7+kskip/KVVuAB1HFaptGPaj4fh7C
 e6ngIUJIIOaFVhWkjQQB4UKzxypeniGWdibGtKORusraOMk42575Og1/cAFZKn3cJ/ys
 FINhuHpisIRcMnxUJjsOoT2Jxo1H86pe4P1ZB6rp/lSPDNDJhxff9ViRq1na/nZTlz8a
 a2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F3hOH9RA5JoblI2pxUlcLp6jn6iFgdYtxKJdEXArLz8=;
 b=ERTznr1///tR+1x7CNUh1zKA0GINdXOyuia+WcjTd8ZcaU1bqsQFXd3PQAHFETu0oV
 YgP+dTVoIoPXOYnPcGDjbt9uolhXRIfSW3e3yZw3MLhLvv6nitvhC6w0pTQeWAmJnC8q
 bh8S0Uq2wOvqlU5rnHk7licxO2PB0oPM2lsO0Mr+gKyv0EcV38Hm3wZlWhewtea1IImr
 3CW7VYR4uUbLaodk6GBGv16OEOHUSNkSwQrZHjYjZZmVUvHKQgTcrlaM6Urk1pKpeorG
 4IaqNnsXts/8zrO0N5Z76PaIikFTdWzm/bZYmCulVtKezwWceSAWpIePWoitSnA1HdNe
 CF9Q==
X-Gm-Message-State: AOAM531+32looSXF89qU3Sxhx2/Tii/Fam70A7Ftc2VoqV0Wigm8u2qd
 uKh6nLfv/rpdFms3aqlN6Elufg==
X-Google-Smtp-Source: ABdhPJz7BqWVlzqnzkNXKYLIBTQBhbYjjkh0W7sn7nsw4vknSF/ZFvjraLVZBw3KVNYyzDf0OrFGDQ==
X-Received: by 2002:a05:620a:298c:b0:6a0:94d2:2e39 with SMTP id
 r12-20020a05620a298c00b006a094d22e39mr18203085qkp.278.1654559170649; 
 Mon, 06 Jun 2022 16:46:10 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 10-20020ac8570a000000b00304e5839734sm6340649qtw.55.2022.06.06.16.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:46:10 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nyMQD-002q2l-Lj; Mon, 06 Jun 2022 20:46:09 -0300
Date: Mon, 6 Jun 2022 20:46:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 6/8] vfio/mdev: unexport mdev_bus_type
Message-ID: <20220606234609.GG3932382@ziepe.ca>
References: <20220603063328.3715-1-hch@lst.de>
 <20220603063328.3715-7-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603063328.3715-7-hch@lst.de>
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

On Fri, Jun 03, 2022 at 08:33:26AM +0200, Christoph Hellwig wrote:
> mdev_bus_type is only used in mdev.ko now, so unexport it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/vfio/mdev/mdev_driver.c  | 1 -
>  drivers/vfio/mdev/mdev_private.h | 1 +
>  include/linux/mdev.h             | 2 --
>  3 files changed, 1 insertion(+), 3 deletions(-)

Yay, people trying to sneak in tests of this bus type in platform code
has been a problem in the past

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
