Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12965BED74
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 20 Sep 2022 21:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5C08933E;
	Tue, 20 Sep 2022 19:17:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBDE10E760
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 20 Sep 2022 19:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663701456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=48Tp1la85hsdqkGfG0YxmrPZH84TL2fOAb8LsP1PYSg=;
 b=Av7MqM/4oHonE62bEhj4hXvAWyJ+SUTuWU0IXT7x45sJ8GWXO7v27G+PDovyfYKL8C6IxP
 edz7jdm0tOOl3s3ne5a6LGuPnQBoExlmZ/MiwDZWRkQLj7RjQ3mQ2dRFcp0I3AdgLZcpJ7
 aekeVO+JF+l8kypUKEG+oC8JWHE2P8Y=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503-CTx5-W3CPM6zBm4EkTXyyg-1; Tue, 20 Sep 2022 15:17:27 -0400
X-MC-Unique: CTx5-W3CPM6zBm4EkTXyyg-1
Received: by mail-il1-f199.google.com with SMTP id
 d6-20020a056e020be600b002dcc7977592so2164610ilu.17
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 20 Sep 2022 12:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=48Tp1la85hsdqkGfG0YxmrPZH84TL2fOAb8LsP1PYSg=;
 b=2OuOmZ+NbHcLSLjmo6MIDX0nTuUalyP2q9Cga9rTc12zfeS1zEXMVYeQqMg7pCi8KS
 e+Y3x1Eu2FedOtQDhMMTuRAlYsJMl/hb/VL3ksbFzOK8GzgEkPnGlbgSlvvlCk5s8dd7
 9GWBpJUaIWzvKGpiWg9A49vZP9n6Ww9UVhyqwr2Qlp1n1bZamrAotIrXfrkxwWfS04gW
 I9Cq3RPnuyNZAP6DidYxxOIt+pjkDWf+IlVeNR/PQ1hbZsQ7n2H+pj1+8sMKfk1fbM9D
 No4AQnLSImYow5Npc/sLAJumzkKTKdtXKrnD1ewZ38c+Pvbhy1IW5Bv9lCq+VzsucHTH
 sMYg==
X-Gm-Message-State: ACrzQf0Jxgx5fYZ/i0eQywh49hhuv806cfOZDIgPOUvZVWM0QTsgkkXn
 DSEyorh4mRUkXBWY5Aza6gwoU9zdvxBy6cUxn8BOJUP6RahN+sR+Rz9wAIOFvf98CFu8BDMqNHx
 lO1nZfVyXMCnthjR4P7SLtojbb1D2yLzkZw==
X-Received: by 2002:a6b:670e:0:b0:6a0:cffe:5c44 with SMTP id
 b14-20020a6b670e000000b006a0cffe5c44mr9830981ioc.74.1663701447173; 
 Tue, 20 Sep 2022 12:17:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Jz+PJQhyf25QQiv7P7Dcvr+B3WKZW0Zx0uCADBWPkyugzHyErwfotGdnRZ3kL/bsX2pQ9HA==
X-Received: by 2002:a6b:670e:0:b0:6a0:cffe:5c44 with SMTP id
 b14-20020a6b670e000000b006a0cffe5c44mr9830947ioc.74.1663701446917; 
 Tue, 20 Sep 2022 12:17:26 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 b27-20020a026f5b000000b00349d4ee2a4asm215964jae.91.2022.09.20.12.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:17:26 -0700 (PDT)
Date: Tue, 20 Sep 2022 13:17:23 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v3 06/15] vfio/mtty: Use the new device life cycle helpers
Message-ID: <20220920131723.2541b7e8.alex.williamson@redhat.com>
In-Reply-To: <20220909102247.67324-7-kevin.tian@intel.com>
References: <20220909102247.67324-1-kevin.tian@intel.com>
 <20220909102247.67324-7-kevin.tian@intel.com>
Organization: Red Hat
MIME-Version: 1.0
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, Christoph Hellwig <hch@infradead.org>,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri,  9 Sep 2022 18:22:38 +0800
Kevin Tian <kevin.tian@intel.com> wrote:

> From: Yi Liu <yi.l.liu@intel.com>
> 
> and manage available ports inside @init/@release.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> Signed-off-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  samples/vfio-mdev/mtty.c | 67 +++++++++++++++++++++++-----------------
>  1 file changed, 39 insertions(+), 28 deletions(-)
> 
> diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
> index f42a59ed2e3f..41301d50b247 100644
> --- a/samples/vfio-mdev/mtty.c
> +++ b/samples/vfio-mdev/mtty.c
...
> +static int mtty_probe(struct mdev_device *mdev)
> +{
> +	struct mdev_state *mdev_state;
> +	int ret;
> +
> +	mdev_state = vfio_alloc_device(mdev_state, vdev, &mdev->dev,
> +				       &mtty_dev_ops);
> +	if (IS_ERR(mdev_state))
> +		return PTR_ERR(mdev_state);
>  
>  	ret = vfio_register_emulated_iommu_dev(&mdev_state->vdev);
>  	if (ret)
> -		goto err_vconfig;
> +		goto err_put_vdev;
>  	dev_set_drvdata(&mdev->dev, mdev_state);
>  	return 0;
>  
> -err_vconfig:
> -	kfree(mdev_state->vconfig);
> -err_state:
> -	vfio_uninit_group_dev(&mdev_state->vdev);
> -	kfree(mdev_state);
> -err_nr_ports:
> -	atomic_add(nr_ports, &mdev_avail_ports);
> +err_put_vdev:
> +	vfio_put_device(&mdev_state->vdev);
>  	return ret;
>  }
>  
> +static void mtty_release_dev(struct vfio_device *vdev)
> +{
> +	struct mdev_state *mdev_state =
> +		container_of(vdev, struct mdev_state, vdev);
> +
> +	kfree(mdev_state->vconfig);
> +	vfio_free_device(vdev);
> +	atomic_add(mdev_state->nr_ports, &mdev_avail_ports);

I must be missing something, isn't this a use-after-free?

mdev_state is allocated via vfio_alloc_device(), where vdev is the
first entry in that structure, so this is equivalent to
kvfree(mdev_state).  mbochs has the same issue.  mdpy and vfio-ap
adjust global counters after vfio_free_device(), which I think muddies
the situation.  Shouldn't we look suspiciously at any .release callback
where vfio_free_device() isn't the last thing executed?  Thanks,

Alex

