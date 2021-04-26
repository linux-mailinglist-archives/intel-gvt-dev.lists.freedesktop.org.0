Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CFE36B491
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 26 Apr 2021 16:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0E46E1EC;
	Mon, 26 Apr 2021 14:14:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8B86E15F;
 Mon, 26 Apr 2021 14:14:00 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1578768C4E; Mon, 26 Apr 2021 16:13:55 +0200 (CEST)
Date: Mon, 26 Apr 2021 16:13:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 08/12] vfio/gvt: Convert to use vfio_register_group_dev()
Message-ID: <20210426141355.GF15209@lst.de>
References: <0-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
 <8-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>, "Raj,
 Ashok" <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Tarun Gupta <targupta@nvidia.com>, Zhi Wang <zhi.a.wang@intel.com>,
 intel-gfx@lists.freedesktop.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> diff --git a/drivers/vfio/mdev/Makefile b/drivers/vfio/mdev/Makefile
> index ff9ecd80212503..7c236ba1b90eb1 100644
> --- a/drivers/vfio/mdev/Makefile
> +++ b/drivers/vfio/mdev/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -mdev-y := mdev_core.o mdev_sysfs.o mdev_driver.o vfio_mdev.o
> +mdev-y := mdev_core.o mdev_sysfs.o mdev_driver.o
>  
>  obj-$(CONFIG_VFIO_MDEV) += mdev.o
> diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
> index 51b8a9fcf866ad..f95d01b57fb168 100644
> --- a/drivers/vfio/mdev/mdev_core.c
> +++ b/drivers/vfio/mdev/mdev_core.c

I think all these mdev core changes belong into a separate commit with a
separate commit log.

>  static int __init mdev_init(void)
>  {
> -	int rc;
> -
> -	rc = mdev_bus_register();
> -	if (rc)
> -		return rc;
> -	rc = mdev_register_driver(&vfio_mdev_driver);
> -	if (rc)
> -		goto err_bus;
> -	return 0;
> -err_bus:
> -	mdev_bus_unregister();
> -	return rc;
> +	return  mdev_bus_register();

Weird indentation.  But I think it would be best to just kill off the
mdev_init wrapper anyway.

>  static void __exit mdev_exit(void)
>  {
> -	mdev_unregister_driver(&vfio_mdev_driver);
> -
>  	if (mdev_bus_compat_class)
>  		class_compat_unregister(mdev_bus_compat_class);
> -
>  	mdev_bus_unregister();
>  }

Same here.

> diff --git a/drivers/vfio/mdev/mdev_driver.c b/drivers/vfio/mdev/mdev_driver.c
> index 6e96c023d7823d..0012a9ee7cb0a4 100644
> --- a/drivers/vfio/mdev/mdev_driver.c
> +++ b/drivers/vfio/mdev/mdev_driver.c
> @@ -74,15 +74,8 @@ static int mdev_remove(struct device *dev)
>  static int mdev_match(struct device *dev, struct device_driver *drv)
>  {
>  	struct mdev_device *mdev = to_mdev_device(dev);
> +
> +	return drv == &mdev->type->parent->ops->device_driver->driver;
>  }

Btw, I think we don't even need ->match with the switch to use
device_bind_driver that I suggested.

> -EXPORT_SYMBOL_GPL(vfio_init_group_dev);
> +EXPORT_SYMBOL(vfio_init_group_dev);

> -EXPORT_SYMBOL_GPL(vfio_register_group_dev);
> +EXPORT_SYMBOL(vfio_register_group_dev);

> -EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
> +EXPORT_SYMBOL(vfio_unregister_group_dev);


Err, no.  vfio should remain EXPORT_SYMBOL_GPL, just because the weird
mdev "GPL condom" that should never have been merged in that form went away.
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
