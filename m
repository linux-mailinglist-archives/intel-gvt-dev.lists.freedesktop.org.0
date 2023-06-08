Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26333728A57
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  8 Jun 2023 23:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE2810E622;
	Thu,  8 Jun 2023 21:41:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3288910E0EA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  8 Jun 2023 21:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686260455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=th2bvhX62hzxRrLB1ybsAs0POe7Ojvtoj9i9GhxJpv4=;
 b=CLpg52IGLXeOnG798Egwxx/hDRnb7DP4KTJ+Zz8kWW95lsIB3OKp4rqNwQMXJEYXONViU0
 QtI64pGrVECHz6xq/HKviJneVoa0ZHPZY51TDPEP4fH7WvLhn/FlD/2WLqAtNOEen1jryb
 r/wK+fEuVhFV/MiCmzq0H/2UpMGfqog=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-tG7p9AC9NuCN4lIS7Gjkjw-1; Thu, 08 Jun 2023 17:40:54 -0400
X-MC-Unique: tG7p9AC9NuCN4lIS7Gjkjw-1
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-77ad4f28a23so71452239f.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 08 Jun 2023 14:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686260454; x=1688852454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=th2bvhX62hzxRrLB1ybsAs0POe7Ojvtoj9i9GhxJpv4=;
 b=QjW9PFFQmhzMhGL+NX8giA5kIRZ5pmjiohAwOc3ix6gQaJZ9YM3JolJ4LHje41edyt
 JVYQKDmtjfCT96KOe5TT2p7vXino03Tivf6Z7Rr1NqYocY7t/xxV0E4ECI9W7r4k8uiy
 1gnDYxNAUdw472qC9jzUsMNirg56O+R/7ZAlk4cCJdTh8btHdKyl9L+KcpxGG3qxxuO/
 ma+wVfH1uF0+rwpiini5FOTCdNkD1b+0vKoaoi0hiI/FPcUXjK6VdHG6OY4I0n9oSd1D
 wHHxp5b2c6vMsSsfdqRq+NAacgQV52ZoMMZfx/MXSDHQpKi4A5+54PtZRz6GExqTo4b1
 1Z5g==
X-Gm-Message-State: AC+VfDzD6fNwbglYlkiis1fApjVGBvD56cISRjGAKRFMZXhN4u+wxQgL
 fJXK9tUEMMWpNBWvl6jIesO+8baUnHgr240d8i0Qaf85J4C72fVGKAOmx3hXsheoHrmmbR+DA2k
 oS4K9UG09DchFyiIAIJk9CWtNrLP4QKmB/A==
X-Received: by 2002:a5e:8345:0:b0:777:ab8e:7039 with SMTP id
 y5-20020a5e8345000000b00777ab8e7039mr7756607iom.15.1686260454067; 
 Thu, 08 Jun 2023 14:40:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6UUVLC5rbROJu7mWqoujxWOhqO8BOzy7CP85v3updJvqBKZ/ov8Q2c1LG3o15l/VOOm831qQ==
X-Received: by 2002:a5e:8345:0:b0:777:ab8e:7039 with SMTP id
 y5-20020a5e8345000000b00777ab8e7039mr7756585iom.15.1686260453798; 
 Thu, 08 Jun 2023 14:40:53 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 h2-20020a02cd22000000b00420cda3fd2esm510972jaq.155.2023.06.08.14.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 14:40:53 -0700 (PDT)
Date: Thu, 8 Jun 2023 15:40:51 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v7 4/9] iommufd: Add iommufd_ctx_has_group()
Message-ID: <20230608154051.0f0e4449.alex.williamson@redhat.com>
In-Reply-To: <20230602121515.79374-5-yi.l.liu@intel.com>
References: <20230602121515.79374-1-yi.l.liu@intel.com>
 <20230602121515.79374-5-yi.l.liu@intel.com>
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

On Fri,  2 Jun 2023 05:15:10 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> This adds the helper to check if any device within the given iommu_group
> has been bound with the iommufd_ctx. This is helpful for the checking on
> device ownership for the devices which have not been bound but cannot be
> bound to any other iommufd_ctx as the iommu_group has been bound.
> 
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/iommu/iommufd/device.c | 30 ++++++++++++++++++++++++++++++
>  include/linux/iommufd.h        |  8 ++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
> index 4f9b2142274c..4571344c8508 100644
> --- a/drivers/iommu/iommufd/device.c
> +++ b/drivers/iommu/iommufd/device.c
> @@ -98,6 +98,36 @@ struct iommufd_device *iommufd_device_bind(struct iommufd_ctx *ictx,
>  }
>  EXPORT_SYMBOL_NS_GPL(iommufd_device_bind, IOMMUFD);
>  
> +/**
> + * iommufd_ctx_has_group - True if any device within the group is bound
> + *                         to the ictx
> + * @ictx: iommufd file descriptor
> + * @group: Pointer to a physical iommu_group struct
> + *
> + * True if any device within the group has been bound to this ictx, ex. via
> + * iommufd_device_bind(), therefore implying ictx ownership of the group.
> + */
> +bool iommufd_ctx_has_group(struct iommufd_ctx *ictx, struct iommu_group *group)
> +{
> +	struct iommufd_object *obj;
> +	unsigned long index;
> +
> +	if (!ictx || !group)
> +		return false;
> +
> +	xa_lock(&ictx->objects);
> +	xa_for_each(&ictx->objects, index, obj) {
> +		if (obj->type == IOMMUFD_OBJ_DEVICE &&
> +		    container_of(obj, struct iommufd_device, obj)->group == group) {
> +			xa_unlock(&ictx->objects);
> +			return true;
> +		}
> +	}
> +	xa_unlock(&ictx->objects);
> +	return false;
> +}
> +EXPORT_SYMBOL_NS_GPL(iommufd_ctx_has_group, IOMMUFD);
> +
>  /**
>   * iommufd_device_unbind - Undo iommufd_device_bind()
>   * @idev: Device returned by iommufd_device_bind()
> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index 1129a36a74c4..33fe57e95e42 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -16,6 +16,7 @@ struct page;
>  struct iommufd_ctx;
>  struct iommufd_access;
>  struct file;
> +struct iommu_group;
>  
>  struct iommufd_device *iommufd_device_bind(struct iommufd_ctx *ictx,
>  					   struct device *dev, u32 *id);
> @@ -50,6 +51,7 @@ void iommufd_ctx_get(struct iommufd_ctx *ictx);
>  #if IS_ENABLED(CONFIG_IOMMUFD)
>  struct iommufd_ctx *iommufd_ctx_from_file(struct file *file);
>  void iommufd_ctx_put(struct iommufd_ctx *ictx);
> +bool iommufd_ctx_has_group(struct iommufd_ctx *ictx, struct iommu_group *group);
>  
>  int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
>  			     unsigned long length, struct page **out_pages,
> @@ -71,6 +73,12 @@ static inline void iommufd_ctx_put(struct iommufd_ctx *ictx)
>  {
>  }
>  
> +static inline bool iommufd_ctx_has_group(struct iommufd_ctx *ictx,
> +					 struct iommu_group *group)
> +{
> +	return false;
> +}
> +
>  static inline int iommufd_access_pin_pages(struct iommufd_access *access,
>  					   unsigned long iova,
>  					   unsigned long length,

It looks like the v12 cdev series no longer requires this stub?  We
haven't used this function except from iommufd specific code since v5.
Thanks,

Alex

