Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3BE706F53
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 17 May 2023 19:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6431110E094;
	Wed, 17 May 2023 17:26:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF5410E094
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 17 May 2023 17:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684344375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=karr8Ws2RnN8jravJ8lYfLxbPdfzQHz3dR1gc3JvIYw=;
 b=WUQPzLXAdcFzVyDOEXvB8C4PChnWpMHQiSA9FAgo3TvbFp2NTRYmiSX/MDaijDKGoZPHW0
 f5oX4armLf2H8kWVuv/Px1FBAM4rOxCDPh+97SHa3N0KBvS4z1AAqxMoc7YeSa0E1iJDmZ
 xdszM+gJH+Y00lHWJxatJFYtCikNZqE=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-cH7EHs76NVeJVg9GeEeXeg-1; Wed, 17 May 2023 13:26:14 -0400
X-MC-Unique: cH7EHs76NVeJVg9GeEeXeg-1
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3382d365fc2so6406715ab.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 17 May 2023 10:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684344372; x=1686936372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=karr8Ws2RnN8jravJ8lYfLxbPdfzQHz3dR1gc3JvIYw=;
 b=YyVcijEg/5UkjI+ADzv5qAofbhDSQhmgySJ/LoHNHRQu3Zph8L131ksKyLrZJ6dAKT
 tzSxA/ZYALFo3rcUbuM6UhpmgwIn0g3xmhQ1PceOWn83fz+ZpbeBh80sZ/FQyarN217O
 NGSp/5nGmDXKyHgm07UG2p8SWN+vRGIMr0CVRZMKYbXMXG0yfc5ZYz6YB3DABb5wmqGV
 MP1Nq35J2zS6RojQpQCnnsOii2aSYDJfYhqV6Rf/sbvdE9M9e0WPrAFDrDdnCjvPidG7
 x0n8VOiv2rM8kFm8qfe07MXuPGnaVTnA8SYorrtBA+PUrANvy2EdnQFkxpgYeWTOTK9+
 CSLQ==
X-Gm-Message-State: AC+VfDyRA289VQIT03LBTFvEV17ivgrkATG6TWwthu0w/YB8IkTg8CsQ
 XXliLRSCcZaN0LOmlT0LEsgsKbAUi2NO56L2caK3SjWcPWOk0DY7JVIulpXOpPPhLvr506Ix3vm
 LRlyBZ908z87w9VoJMA/LJGIll/bCIFdBOQ==
X-Received: by 2002:a92:d10e:0:b0:335:5b3b:72 with SMTP id
 a14-20020a92d10e000000b003355b3b0072mr2403518ilb.23.1684344372359; 
 Wed, 17 May 2023 10:26:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4a05JKtw3Lt/GR03Gffqm2EiKkTvP1xCEZE+Ofn8tXoudJrpGm2HfJE6E8YHrcsCVKm+MYKA==
X-Received: by 2002:a92:d10e:0:b0:335:5b3b:72 with SMTP id
 a14-20020a92d10e000000b003355b3b0072mr2403489ilb.23.1684344372042; 
 Wed, 17 May 2023 10:26:12 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 co24-20020a0566383e1800b004187f6d4e78sm4065330jab.105.2023.05.17.10.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 10:26:11 -0700 (PDT)
Date: Wed, 17 May 2023 11:26:09 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v5 01/10] vfio-iommufd: Create iommufd_access for
 noiommu devices
Message-ID: <20230517112609.78a3e916.alex.williamson@redhat.com>
In-Reply-To: <20230513132136.15021-2-yi.l.liu@intel.com>
References: <20230513132136.15021-1-yi.l.liu@intel.com>
 <20230513132136.15021-2-yi.l.liu@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
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
Cc: mjrosato@linux.ibm.com, jasowang@redhat.com, xudong.hao@intel.com,
 zhenzhong.duan@intel.com, peterx@redhat.com, terrence.xu@intel.com,
 chao.p.peng@linux.intel.com, linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 jgg@nvidia.com, kevin.tian@intel.com, yan.y.zhao@intel.com,
 intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 clegoate@redhat.com, cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Sat, 13 May 2023 06:21:27 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> This binds noiommu device to iommufd and creates iommufd_access for this
> bond. This is useful for adding an iommufd-based device ownership check
> for VFIO_DEVICE_PCI_HOT_RESET since this model requires all the other
> affected devices bound to the same iommufd as the device to be reset.
> For noiommu devices, there is no backend iommu, so create iommufd_access
> instead of iommufd_device.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/iommufd.c | 43 ++++++++++++++++++++++++++++++++++++++++--
>  include/linux/vfio.h   |  1 +
>  2 files changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
> index 88b00c501015..c1379e826052 100644
> --- a/drivers/vfio/iommufd.c
> +++ b/drivers/vfio/iommufd.c
> @@ -10,6 +10,42 @@
>  MODULE_IMPORT_NS(IOMMUFD);
>  MODULE_IMPORT_NS(IOMMUFD_VFIO);
>  
> +static void vfio_noiommu_access_unmap(void *data, unsigned long iova,
> +				      unsigned long length)
> +{

Should this WARN_ON if called?

> +}
> +
> +static const struct iommufd_access_ops vfio_user_noiommu_ops = {
> +	.needs_pin_pages = 1,

But it doesn't.

> +	.unmap = vfio_noiommu_access_unmap,
> +};
> +
> +static int vfio_iommufd_noiommu_bind(struct vfio_device *vdev,
> +				     struct iommufd_ctx *ictx,
> +				     u32 *out_device_id)
> +{
> +	struct iommufd_access *user;
> +
> +	lockdep_assert_held(&vdev->dev_set->lock);
> +
> +	user = iommufd_access_create(ictx, &vfio_user_noiommu_ops,
> +				     vdev, out_device_id);
> +	if (IS_ERR(user))
> +		return PTR_ERR(user);
> +	vdev->noiommu_access = user;
> +	return 0;
> +}
> +
> +static void vfio_iommufd_noiommu_unbind(struct vfio_device *vdev)
> +{
> +	lockdep_assert_held(&vdev->dev_set->lock);
> +
> +	if (vdev->noiommu_access) {
> +		iommufd_access_destroy(vdev->noiommu_access);
> +		vdev->noiommu_access = NULL;
> +	}
> +}
> +
>  int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
>  {
>  	u32 ioas_id;
> @@ -29,7 +65,8 @@ int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
>  		 */
>  		if (!iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id))
>  			return -EPERM;
> -		return 0;
> +
> +		return vfio_iommufd_noiommu_bind(vdev, ictx, &device_id);
>  	}
>  
>  	ret = vdev->ops->bind_iommufd(vdev, ictx, &device_id);
> @@ -59,8 +96,10 @@ void vfio_iommufd_unbind(struct vfio_device *vdev)
>  {
>  	lockdep_assert_held(&vdev->dev_set->lock);
>  
> -	if (vfio_device_is_noiommu(vdev))
> +	if (vfio_device_is_noiommu(vdev)) {
> +		vfio_iommufd_noiommu_unbind(vdev);
>  		return;
> +	}
>  
>  	if (vdev->ops->unbind_iommufd)
>  		vdev->ops->unbind_iommufd(vdev);
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 2c137ea94a3e..16fd04490550 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -57,6 +57,7 @@ struct vfio_device {
>  	struct list_head group_next;
>  	struct list_head iommu_entry;
>  	struct iommufd_access *iommufd_access;
> +	struct iommufd_access *noiommu_access;

It's not clear to me why we need a separate iommufd_access for noiommu.
Can't we add a vfio_device_is_noiommu() check to the
vfio_{un}pin_pages() and vfio_dma_rw() interfaces and reuse the
existing pointer for both emulated and noiommu cases?  Maybe even the
iommufd_access* functions should test needs_pin_pages and generate an
error/warning if an access that was registered without reporting that
it needs page pinning makes use of such an interface.  Thanks,

Alex

>  	void (*put_kvm)(struct kvm *kvm);
>  #if IS_ENABLED(CONFIG_IOMMUFD)
>  	struct iommufd_device *iommufd_device;

