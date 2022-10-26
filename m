Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C6D60EAC9
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 26 Oct 2022 23:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C689610E366;
	Wed, 26 Oct 2022 21:25:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC5610E394
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 26 Oct 2022 21:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666819499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ys5yrKnSWNrdXyOIt/+2hibuD6RgZdYjr5anEvm87I=;
 b=LtqFzzp14WfeSnWvKxREB7Rx+aDjPwYGyCOQ+8appuHvB/PXNY6YJmRmxpYrV9xazC7dny
 lWIwFbZCM+bsz3/wfVN3CN36m/idrbseiz9c8JYwmovAUCYlPIwSTao6euShzbgLoUk+Ct
 9ah2CYoTRHUHcmlyPL09O0zfaf5oGIg=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-GTjBlU46N7OBBHRlNKdBlw-1; Wed, 26 Oct 2022 17:24:57 -0400
X-MC-Unique: GTjBlU46N7OBBHRlNKdBlw-1
Received: by mail-il1-f199.google.com with SMTP id
 n14-20020a056e02100e00b002f9e283e850so14546978ilj.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 26 Oct 2022 14:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ys5yrKnSWNrdXyOIt/+2hibuD6RgZdYjr5anEvm87I=;
 b=hrbmnrLlqWi1y3CgrtlR8rfLQE8kIjcleg6E3SjWj3KtMoivcNhzF8LgGAnIQieO5G
 1DB/yNYvxblGC6aXsZ5Pi+4yw30v3BTmgAvxOcprtdeqyaZ7O/pQ7hXbBF0JzRNeXdnw
 dHukhgKNgXU1xniD8+kuCCG5h98I4PDxJlIj6Qj7uedr6wpzwAk1cdcBJHkeyabjRmpP
 7s9vHeR+01UxAzKBgJeyJOyC6nCJK0Ul4tlYZZQocQ8ntoCCA5jzOm5oxV5OVDJlGzux
 t1oDCDZi4lvCcWcwB0rjXTqo0FOvHu1JgD6ZHUE6jOxPRRp8HR5Fyxi5L6Ej5bFKJzzn
 6pqw==
X-Gm-Message-State: ACrzQf30ete1cc4qNt2FOsPc6Ouy2jZo16jmfkUuvPwy7ypAjcPzTBe6
 8YFMFH9HfcDKYKuT2VINc9NEmDxH6TuzV/qJ4IEWzhWHg8TovSauDtEeRQvm8z9LEBt8XGRRM+N
 g+BCLR9X85FDJBBqnKRfTTB5ze5IOoPLTHg==
X-Received: by 2002:a05:6e02:1a6d:b0:2fa:cb68:b9f with SMTP id
 w13-20020a056e021a6d00b002facb680b9fmr29052089ilv.303.1666819496958; 
 Wed, 26 Oct 2022 14:24:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM78B1N1rhquL7I27LvLWaJii8bhooCw6yJ0rMTPt8axTAAIzjlyMmOikhzath1gqGNuTiEASg==
X-Received: by 2002:a05:6e02:1b08:b0:2fc:4df6:e468 with SMTP id
 i8-20020a056e021b0800b002fc4df6e468mr27916129ilv.148.1666819486067; 
 Wed, 26 Oct 2022 14:24:46 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 x13-20020a02948d000000b0036c8a246f54sm2409348jah.142.2022.10.26.14.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 14:24:45 -0700 (PDT)
Date: Wed, 26 Oct 2022 15:24:42 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Message-ID: <20221026152442.4855c5de.alex.williamson@redhat.com>
In-Reply-To: <4-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <4-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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
Cc: kvm@vger.kernel.org, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Halil Pasic <pasic@linux.ibm.com>, iommu@lists.linux.dev,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 25 Oct 2022 15:17:10 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> This legacy module knob has become uAPI, when set on the vfio_iommu_type1
> it disables some security protections in the iommu drivers. Move the
> storage for this knob to vfio_main.c so that iommufd can access it too.

I don't really understand this, we're changing the behavior of the
iommufd_device_attach() operation based on the modules options of
vfio_iommu_type1, which may not be loaded or even compiled into the
kernel.  Our compatibility story falls apart when VFIO_CONTAINER is not
set, iommufd sneaks in to usurp /dev/vfio/vfio, and the user's module
options for type1 go unprocessed.

I hate to suggest that type1 becomes a module that does nothing more
than maintain consistency of this variable when the full type1 isn't
available, but is that what we need to do?  Thanks,

Alex

> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/vfio.h             | 2 ++
>  drivers/vfio/vfio_iommu_type1.c | 5 ++---
>  drivers/vfio/vfio_main.c        | 3 +++
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index f95f4925b83bbd..54e5a8e0834ccb 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -130,4 +130,6 @@ extern bool vfio_noiommu __read_mostly;
>  enum { vfio_noiommu = false };
>  #endif
>  
> +extern bool vfio_allow_unsafe_interrupts;
> +
>  #endif
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 23c24fe98c00d4..186e33a006d314 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -44,9 +44,8 @@
>  #define DRIVER_AUTHOR   "Alex Williamson <alex.williamson@redhat.com>"
>  #define DRIVER_DESC     "Type1 IOMMU driver for VFIO"
>  
> -static bool allow_unsafe_interrupts;
>  module_param_named(allow_unsafe_interrupts,
> -		   allow_unsafe_interrupts, bool, S_IRUGO | S_IWUSR);
> +		   vfio_allow_unsafe_interrupts, bool, S_IRUGO | S_IWUSR);
>  MODULE_PARM_DESC(allow_unsafe_interrupts,
>  		 "Enable VFIO IOMMU support for on platforms without interrupt remapping support.");
>  
> @@ -2282,7 +2281,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>  		    iommu_group_for_each_dev(iommu_group, (void *)IOMMU_CAP_INTR_REMAP,
>  					     vfio_iommu_device_capable);
>  
> -	if (!allow_unsafe_interrupts && !msi_remap) {
> +	if (!vfio_allow_unsafe_interrupts && !msi_remap) {
>  		pr_warn("%s: No interrupt remapping support.  Use the module param \"allow_unsafe_interrupts\" to enable VFIO IOMMU support on this platform\n",
>  		       __func__);
>  		ret = -EPERM;
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 8d809ecd982b39..1e414b2c48a511 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -51,6 +51,9 @@ static struct vfio {
>  	struct ida			device_ida;
>  } vfio;
>  
> +bool vfio_allow_unsafe_interrupts;
> +EXPORT_SYMBOL_GPL(vfio_allow_unsafe_interrupts);
> +
>  static DEFINE_XARRAY(vfio_device_set_xa);
>  static const struct file_operations vfio_group_fops;
>  

