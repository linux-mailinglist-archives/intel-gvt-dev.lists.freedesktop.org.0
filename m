Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83B85B0D46
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  7 Sep 2022 21:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F86410E86F;
	Wed,  7 Sep 2022 19:32:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0320C10E855
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  7 Sep 2022 19:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662579130;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m1CJ++kvdUMGjrXE1uicFDh4PP58j0HwwSXQDSgr4GU=;
 b=hu3zNg6h3hAbElvpsUxmwi2lR2w/g/NrK5tLS0IGD66AkTr+jQapWQ0MJ2E1N2VwdH29gp
 n/Sb/cDwg2ktu2u7irIf4d0+j9/lqi+P7kO0SrOI6q7iH2BSdETr2C/27oqb7MBZcCbaWI
 cL8v7LTN/t0ZC7oUA2BfyG58/9D6XAs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-675-x1ruh0KIPu6bF87Y_60o8w-1; Wed, 07 Sep 2022 15:32:08 -0400
X-MC-Unique: x1ruh0KIPu6bF87Y_60o8w-1
Received: by mail-wr1-f72.google.com with SMTP id
 d16-20020adfa350000000b00228628ff913so3383512wrb.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 07 Sep 2022 12:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=m1CJ++kvdUMGjrXE1uicFDh4PP58j0HwwSXQDSgr4GU=;
 b=PMEZYyroxdrCpL1B/rNfWpNLb9j8APaAXGGlO54sCyLT1lhiI6gtmwHCxb/0IQIEsQ
 5qyK4Vwhnd1IkjLSQysDHS75OTRilJ4BJf+vLi9XxpdwfHVIK/QtCVZ3ZultJIXa4MmL
 c3webzyTRjKXOOL0HK3EP4U4NdhwSGI0+hypauQImI8HUpIyLOjpEmQD9EmCrYJrED41
 MaaeqrW0IlVOyScX/qNGI43TpMZIv0LyUUfeBs1ejKlZMoVKa0m4rZW0pLRCvV74t1Vb
 n+AZpZibo6VeZ7S0PNYBGmqCtcjv4nGOwdrPffuLAgCuw0ht1E9HiRmartxJXvgWQw0P
 rkcA==
X-Gm-Message-State: ACgBeo0nqg8bKFZyRXDmRHJkK1k5MN69nTp3RBKalPaFrQ7189jCNzGa
 K4bifW9Svy3IYBVlfIepRPBpAGIH8HD0Jg6TSGwXwMwOLUo6P0m31XLwmC/tR/3pczdaOgg0+X1
 5mC8JYshQWx+j62CGyh0Cf3/gEctDQx+Yhw==
X-Received: by 2002:adf:f44c:0:b0:228:8686:552f with SMTP id
 f12-20020adff44c000000b002288686552fmr2924556wrp.587.1662579127824; 
 Wed, 07 Sep 2022 12:32:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR72vo86tyr5ic2ECWrp1BreExY5T6k4o7wddPTtXAmNH4DNw8lGrcXVa4dBTy15HBHKMyC8tw==
X-Received: by 2002:adf:f44c:0:b0:228:8686:552f with SMTP id
 f12-20020adff44c000000b002288686552fmr2924534wrp.587.1662579127612; 
 Wed, 07 Sep 2022 12:32:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a5d6751000000b00228ccd00cedsm10069697wrw.107.2022.09.07.12.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Sep 2022 12:32:06 -0700 (PDT)
Message-ID: <4e128d18-2591-9291-769f-184e39089b93@redhat.com>
Date: Wed, 7 Sep 2022 21:32:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 12/15] vfio/amba: Use the new device life cycle helpers
To: Kevin Tian <kevin.tian@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, 
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Longfang Liu <liulongfang@huawei.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Abhishek Sahu <abhsahu@nvidia.com>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org
References: <20220901143747.32858-1-kevin.tian@intel.com>
 <20220901143747.32858-13-kevin.tian@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220901143747.32858-13-kevin.tian@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Reply-To: eric.auger@redhat.com
Cc: Yi Liu <yi.l.liu@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi Kevin,

On 9/1/22 16:37, Kevin Tian wrote:
> Implement amba's own vfio_device_ops.
>
> Remove vfio_platform_probe/remove_common() given no user now.
>
> Signed-off-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/platform/vfio_amba.c             | 72 ++++++++++++++-----
>  drivers/vfio/platform/vfio_platform_common.c  | 60 ----------------
>  drivers/vfio/platform/vfio_platform_private.h |  3 -
>  3 files changed, 55 insertions(+), 80 deletions(-)
>
> diff --git a/drivers/vfio/platform/vfio_amba.c b/drivers/vfio/platform/vfio_amba.c
> index 1aaa4f721bd2..6cdcc8905198 100644
> --- a/drivers/vfio/platform/vfio_amba.c
> +++ b/drivers/vfio/platform/vfio_amba.c
> @@ -7,6 +7,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/vfio.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/amba/bus.h>
>  
>  #include "vfio_platform_private.h"
> @@ -40,20 +41,16 @@ static int get_amba_irq(struct vfio_platform_device *vdev, int i)
>  	return ret ? ret : -ENXIO;
>  }
>  
> -static int vfio_amba_probe(struct amba_device *adev, const struct amba_id *id)
> +static int vfio_amba_init_dev(struct vfio_device *core_vdev)
>  {
> -	struct vfio_platform_device *vdev;
> +	struct vfio_platform_device *vdev =
> +		container_of(core_vdev, struct vfio_platform_device, vdev);
> +	struct amba_device *adev = to_amba_device(core_vdev->dev);
>  	int ret;
>  
> -	vdev = kzalloc(sizeof(*vdev), GFP_KERNEL);
> -	if (!vdev)
> -		return -ENOMEM;
> -
>  	vdev->name = kasprintf(GFP_KERNEL, "vfio-amba-%08x", adev->periphid);
> -	if (!vdev->name) {
> -		kfree(vdev);
> +	if (!vdev->name)
>  		return -ENOMEM;
> -	}
>  
>  	vdev->opaque = (void *) adev;
>  	vdev->flags = VFIO_DEVICE_FLAGS_AMBA;
> @@ -61,26 +58,67 @@ static int vfio_amba_probe(struct amba_device *adev, const struct amba_id *id)
>  	vdev->get_irq = get_amba_irq;
>  	vdev->reset_required = false;
>  
> -	ret = vfio_platform_probe_common(vdev, &adev->dev);
> -	if (ret) {
> +	ret = vfio_platform_init_common(vdev);
> +	if (ret)
>  		kfree(vdev->name);
> -		kfree(vdev);
> -		return ret;
> -	}
> +	return ret;
> +}
> +
> +static const struct vfio_device_ops vfio_amba_ops;
> +static int vfio_amba_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +	struct vfio_platform_device *vdev;
> +	int ret;
> +
> +	vdev = vfio_alloc_device(vfio_platform_device, vdev, &adev->dev,
> +				 &vfio_amba_ops);
> +	if (IS_ERR(vdev))
> +		return PTR_ERR(vdev);
>  
> +	ret = vfio_register_group_dev(&vdev->vdev);
> +	if (ret)
> +		goto out_put_vdev;
> +
> +	pm_runtime_enable(&adev->dev);
>  	dev_set_drvdata(&adev->dev, vdev);
>  	return 0;
> +
> +out_put_vdev:
> +	vfio_put_device(&vdev->vdev);
> +	return ret;
> +}
> +
> +static void vfio_amba_release_dev(struct vfio_device *core_vdev)
> +{
> +	struct vfio_platform_device *vdev =
> +		container_of(core_vdev, struct vfio_platform_device, vdev);
> +
> +	vfio_platform_release_common(vdev);
> +	kfree(vdev->name);
> +	vfio_free_device(core_vdev);
>  }
>  
>  static void vfio_amba_remove(struct amba_device *adev)
>  {
>  	struct vfio_platform_device *vdev = dev_get_drvdata(&adev->dev);
>  
> -	vfio_platform_remove_common(vdev);
> -	kfree(vdev->name);
> -	kfree(vdev);
> +	vfio_unregister_group_dev(&vdev->vdev);
> +	pm_runtime_disable(vdev->device);
> +	vfio_put_device(&vdev->vdev);
>  }
>  
> +static const struct vfio_device_ops vfio_amba_ops= {
> +	.name		= "vfio-amba",
> +	.init		= vfio_amba_init_dev,
> +	.release	= vfio_amba_release_dev,
> +	.open_device	= vfio_platform_open_device,
> +	.close_device	= vfio_platform_close_device,
> +	.ioctl		= vfio_platform_ioctl,
> +	.read		= vfio_platform_read,
> +	.write		= vfio_platform_write,
> +	.mmap		= vfio_platform_mmap,
> +};
> +
>  static const struct amba_id pl330_ids[] = {
>  	{ 0, 0 },
>  };
> diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
> index 4c01bf0adebb..55dc4f43c31e 100644
> --- a/drivers/vfio/platform/vfio_platform_common.c
> +++ b/drivers/vfio/platform/vfio_platform_common.c
> @@ -605,16 +605,6 @@ int vfio_platform_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma
>  }
>  EXPORT_SYMBOL_GPL(vfio_platform_mmap);
>  
> -static const struct vfio_device_ops vfio_platform_ops = {
> -	.name		= "vfio-platform",
> -	.open_device	= vfio_platform_open_device,
> -	.close_device	= vfio_platform_close_device,
> -	.ioctl		= vfio_platform_ioctl,
> -	.read		= vfio_platform_read,
> -	.write		= vfio_platform_write,
> -	.mmap		= vfio_platform_mmap,
> -};
> -
>  static int vfio_platform_of_probe(struct vfio_platform_device *vdev,
>  			   struct device *dev)
>  {
> @@ -674,56 +664,6 @@ void vfio_platform_release_common(struct vfio_platform_device *vdev)
>  }
>  EXPORT_SYMBOL_GPL(vfio_platform_release_common);
>  
> -int vfio_platform_probe_common(struct vfio_platform_device *vdev,
> -			       struct device *dev)
> -{
> -	int ret;
> -
> -	vfio_init_group_dev(&vdev->vdev, dev, &vfio_platform_ops);
> -
> -	ret = vfio_platform_acpi_probe(vdev, dev);
> -	if (ret)
> -		ret = vfio_platform_of_probe(vdev, dev);
> -
> -	if (ret)
> -		goto out_uninit;
> -
> -	vdev->device = dev;
> -
> -	ret = vfio_platform_get_reset(vdev);
> -	if (ret && vdev->reset_required) {
> -		dev_err(dev, "No reset function found for device %s\n",
> -			vdev->name);
> -		goto out_uninit;
> -	}
> -
> -	ret = vfio_register_group_dev(&vdev->vdev);
> -	if (ret)
> -		goto put_reset;
> -
> -	mutex_init(&vdev->igate);
> -
> -	pm_runtime_enable(dev);
> -	return 0;
> -
> -put_reset:
> -	vfio_platform_put_reset(vdev);
> -out_uninit:
> -	vfio_uninit_group_dev(&vdev->vdev);
> -	return ret;
> -}
> -EXPORT_SYMBOL_GPL(vfio_platform_probe_common);
> -
> -void vfio_platform_remove_common(struct vfio_platform_device *vdev)
> -{
> -	vfio_unregister_group_dev(&vdev->vdev);
> -
> -	pm_runtime_disable(vdev->device);
> -	vfio_platform_put_reset(vdev);
> -	vfio_uninit_group_dev(&vdev->vdev);
> -}
> -EXPORT_SYMBOL_GPL(vfio_platform_remove_common);
> -
>  void __vfio_platform_register_reset(struct vfio_platform_reset_node *node)
>  {
>  	mutex_lock(&driver_lock);
> diff --git a/drivers/vfio/platform/vfio_platform_private.h b/drivers/vfio/platform/vfio_platform_private.h
> index a769d649fb97..8d8fab516849 100644
> --- a/drivers/vfio/platform/vfio_platform_private.h
> +++ b/drivers/vfio/platform/vfio_platform_private.h
> @@ -78,9 +78,6 @@ struct vfio_platform_reset_node {
>  	vfio_platform_reset_fn_t of_reset;
>  };
>  
> -int vfio_platform_probe_common(struct vfio_platform_device *vdev,
> -			       struct device *dev);
> -void vfio_platform_remove_common(struct vfio_platform_device *vdev);
>  int vfio_platform_init_common(struct vfio_platform_device *vdev);
>  void vfio_platform_release_common(struct vfio_platform_device *vdev);
>  
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

