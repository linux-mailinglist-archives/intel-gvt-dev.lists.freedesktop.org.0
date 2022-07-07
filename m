Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AC656ADCA
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  7 Jul 2022 23:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FA112BC50;
	Thu,  7 Jul 2022 21:37:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D769712BADA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  7 Jul 2022 21:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657229842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSEXwFPAyvrhENqvrLwIjRSY51Sdjq2lfUdnz+vUg/A=;
 b=euUx328dFgVy0iIjYh0dpejAuD3x6i4BFkAL+Hr9coUZQoF1QSv/ZrP3E+K1mznSPYBlfa
 1OUHxlQ0fmagoSAgXsf0Ass+mDbK8ukHSIUUCWjKEHv34UWuSFGIYLUaoL4SZZfRDjuL9E
 TgpTRHL0pR+k9zuu5dh5Cxs2m8JzYHA=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-bRzP53lVP2WsO6MJk1bEiQ-1; Thu, 07 Jul 2022 17:37:19 -0400
X-MC-Unique: bRzP53lVP2WsO6MJk1bEiQ-1
Received: by mail-io1-f69.google.com with SMTP id
 d207-20020a6bb4d8000000b00678e98db7aeso1039532iof.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 07 Jul 2022 14:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=xSEXwFPAyvrhENqvrLwIjRSY51Sdjq2lfUdnz+vUg/A=;
 b=RDOzMdiXsiOTle2L8xwWbW/+nUXtq9/xkXgam75Rx+zSKhDwZ3L2NoVaSfSRB2bq4F
 GY7bPk5Q+cW66sBMuThEmkJyH3atjgpZmOMwBrgd2JXds5+V9Kp+EYqOP5/ZSZswo2YQ
 BF9LjcghiZaWPRPcwN7jVB6UgJ/pqYs0hnA4hY+kww/ljgCc8t9fX3IrmCyiXMFIfvIy
 M3goRP/a9Ck5Wt4DpqdukV6alQJi0uhXmHAtEcmrVzQJdoa/h3dFncGrTaVtVGjw/jCh
 97dxZJTJiACq6OiXGvWlKkAOd1MVMx0qiuGrpeCPYrL2H8YntPv67yypAykyuDS4e6E3
 +NQw==
X-Gm-Message-State: AJIora+avE39EnMAfxK+3nc2Nz5I0SpbBtRSMiEWw6AV9CeL2tkDYe1e
 UzWY3QHZxT/RtT1mXOPc4pPMmjgr0d2HHINqsXbM5ucFJ1tZZgxmon5lrcA2xKwVtQtOhmRbn6y
 RzsMOp7Z2NtFgnQBjnOTQc1KDN+cXThuIxw==
X-Received: by 2002:a05:6e02:928:b0:2dc:759:7817 with SMTP id
 o8-20020a056e02092800b002dc07597817mr113871ilt.84.1657229838429; 
 Thu, 07 Jul 2022 14:37:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s70GZAk3YrQZOFfNpy3nkoHR4IJbk/AIEya6UVHis8OCEYOJsN20yij7l5PEEyvprcYnTFbw==
X-Received: by 2002:a05:6e02:928:b0:2dc:759:7817 with SMTP id
 o8-20020a056e02092800b002dc07597817mr113848ilt.84.1657229838191; 
 Thu, 07 Jul 2022 14:37:18 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 j62-20020a026341000000b0033ed7ef1b5csm5136571jac.41.2022.07.07.14.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:37:17 -0700 (PDT)
Date: Thu, 7 Jul 2022 15:37:16 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Message-ID: <20220707153716.70f755ab.alex.williamson@redhat.com>
In-Reply-To: <1-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
References: <0-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
 <1-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
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

On Mon,  4 Jul 2022 21:59:03 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
> index b49e2e9db2dc6f..09e0ce7b72324c 100644
> --- a/drivers/s390/cio/vfio_ccw_ops.c
> +++ b/drivers/s390/cio/vfio_ccw_ops.c
> @@ -44,31 +44,19 @@ static int vfio_ccw_mdev_reset(struct vfio_ccw_private *private)
>  	return ret;
>  }
>  
> -static int vfio_ccw_mdev_notifier(struct notifier_block *nb,
> -				  unsigned long action,
> -				  void *data)
> +static void vfio_ccw_dma_unmap(struct vfio_device *vdev, u64 iova, u64 length)
>  {
>  	struct vfio_ccw_private *private =
> -		container_of(nb, struct vfio_ccw_private, nb);
> -
> -	/*
> -	 * Vendor drivers MUST unpin pages in response to an
> -	 * invalidation.
> -	 */
> -	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
> -		struct vfio_iommu_type1_dma_unmap *unmap = data;
> -
> -		if (!cp_iova_pinned(&private->cp, unmap->iova))
> -			return NOTIFY_OK;
> +		container_of(vdev, struct vfio_ccw_private, vdev);
>  
> -		if (vfio_ccw_mdev_reset(private))
> -			return NOTIFY_BAD;
> +	/* Drivers MUST unpin pages in response to an invalidation. */
> +	if (!cp_iova_pinned(&private->cp, iova))
> +		return;
>  
> -		cp_free(&private->cp);
> -		return NOTIFY_OK;
> -	}
> +	if (vfio_ccw_mdev_reset(private))
> +		return;
>  
> -	return NOTIFY_DONE;
> +	cp_free(&private->cp);
>  }


The cp_free() call is gone here with [1], so I think this function now
just ends with:

	...
	vfio_ccw_mdev_reset(private);
}

There are also minor contextual differences elsewhere from that series,
so a quick respin to record the changes on list would be appreciated.

However the above kind of highlights that NOTIFY_BAD that silently gets
dropped here.  I realize we weren't testing the return value of the
notifier call chain and really we didn't intend that notifiers could
return a failure here, but does this warrant some logging or suggest
future work to allow a device to go offline here?  Thanks.

Alex

[1]https://lore.kernel.org/all/20220707135737.720765-1-farman@linux.ibm.com/

