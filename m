Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A7D51558D
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 29 Apr 2022 22:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D235110FA6A;
	Fri, 29 Apr 2022 20:28:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D43010FA6A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 29 Apr 2022 20:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651264105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8HsfkpqhssnZoIsPQ1O3oVRAyXbkapxW4GnxH0gSv4=;
 b=OXyk+ZlA2xofIDLIpoh4YJ+rLWv81XKCIyy/IB39BgGEe31RKH4WNLCYpEDcIa1ShrAN2n
 Df/3G8VM/wCkyyVQ1ZiPCi2WCGcyyQGgVCm4XzcCAkmyd+sygyQJLNjtrtFnsUkDESUdmC
 f8FSupPV971Lb1Wl1zABlpBDfU5IZDE=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-ZJeL2ba_MvOIgUVG0qCTsw-1; Fri, 29 Apr 2022 16:28:24 -0400
X-MC-Unique: ZJeL2ba_MvOIgUVG0qCTsw-1
Received: by mail-il1-f200.google.com with SMTP id
 r20-20020a056e02109400b002cc174742c9so4185717ilj.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 29 Apr 2022 13:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n8HsfkpqhssnZoIsPQ1O3oVRAyXbkapxW4GnxH0gSv4=;
 b=PELMsqmPe5CetunZrvGxDVVn4dRJ/t3vBx8nXG8r9Gr3OaADLL4GS+WIYe7YAf16at
 HOEZRxiYy7cC+hvNTbqK+nqFScSoa9qX16n2M8yCWh+SfFpb/0bWdgmuEMguRBPGTSpv
 zPd1/ZanmaH4F3G9ZHGPg5vM4c/MgZZ5qvTC5DcMwdMLZMCgfFoVGnjmJYLPiR74D84m
 u1XjoidIFoUnwFmPCc2svxMt4TFyjZJ79aZI6VRHYpaKnBUI9RrSfwyj7Z2ZUFok2TVE
 IemZan+qU0dgKr0CN1FBlwiQZtAt65P8g2RxeyVfPsV7rws2dyPrM/ThdB1CLRBfG2g+
 xGIg==
X-Gm-Message-State: AOAM530nPGyhIjssfjBSclq4ie4oQzpnoi7NAtfkwc8FXUUzggpzZq7P
 e0r21C+yemC3o0CQ6KnVyzMiqJrJOfexOLV+cJfpj9YoEBWWvqiiDtYoDrpUG4tyADfAGWW+ZIo
 K61zp7sa/S1PKW7uhZFxxPYY1Xf4h4fYBdw==
X-Received: by 2002:a6b:ca44:0:b0:657:b54a:5c53 with SMTP id
 a65-20020a6bca44000000b00657b54a5c53mr445924iog.108.1651264103326; 
 Fri, 29 Apr 2022 13:28:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXw055Zf6CAZcffMOqFXVe3D8deItwuTS9dyUJRlHujGyFKq6cxPYeLOoiZHbK09XyaEEw5w==
X-Received: by 2002:a6b:ca44:0:b0:657:b54a:5c53 with SMTP id
 a65-20020a6bca44000000b00657b54a5c53mr445889iog.108.1651264103032; 
 Fri, 29 Apr 2022 13:28:23 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 j7-20020a02cb07000000b0032b3a7817b2sm836302jap.118.2022.04.29.13.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 13:28:22 -0700 (PDT)
Date: Fri, 29 Apr 2022 14:28:20 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 7/7] vfio: Remove calls to
 vfio_group_add_container_user()
Message-ID: <20220429142820.6afe7bbe.alex.williamson@redhat.com>
In-Reply-To: <7-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <7-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, "Liu, Yi L" <yi.l.liu@intel.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
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

On Thu, 21 Apr 2022 13:28:38 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> When the open_device() op is called the container_users is incremented and
> held incremented until close_device(). Thus, so long as drivers call
> functions within their open_device()/close_device() region they do not
> need to worry about the container_users.
> 
> These functions can all only be called between open_device() and
> close_device():
> 
>   vfio_pin_pages()
>   vfio_unpin_pages()
>   vfio_dma_rw()
>   vfio_register_notifier()
>   vfio_unregister_notifier()
> 
> Eliminate the calls to vfio_group_add_container_user() and add
> vfio_assert_device_open() to detect driver mis-use.

A comment here explaining that decrementing open_count is pushed until
after close_device to support this feature would help to explain the
somewhat subtle change in vfio_group_get_device_fd().

Otherwise the series looks ok with fixes noted by previous reviews.
Thanks,

Alex

