Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 552286D674A
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Apr 2023 17:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B81210E2D5;
	Tue,  4 Apr 2023 15:29:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE4A10E2D5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Apr 2023 15:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680622153;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2+Wv7W8fsHHIewyLSZIiChbsaRykHPVOAna76qbG3Ps=;
 b=gwsM782AofTiRdC5EEzZqvDmbeMoXKlMKKFNX/A4/XeCYI1HDHm+vN4t9Q+MPG2U+Jjqaz
 HBXpnr6E5Pc7joQRt4N91b88ANF5gZkKJrv2XVj3WnbuG0ikr3NHSXOuR8W4k+BHRGuxqb
 hC+7qfUXKTvCKtNx2KgdDDDAYNJvb4o=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-5HT44dqjMQejoJpzDMFTaA-1; Tue, 04 Apr 2023 11:29:09 -0400
X-MC-Unique: 5HT44dqjMQejoJpzDMFTaA-1
Received: by mail-qv1-f72.google.com with SMTP id
 dl18-20020ad44e12000000b005a4d5420bc6so14753498qvb.11
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 04 Apr 2023 08:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680622149;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2+Wv7W8fsHHIewyLSZIiChbsaRykHPVOAna76qbG3Ps=;
 b=oRrqN0ovIufms0E1bL2fAmAIgCjiPelZqZxzXcibosdGTlENiSawm1pcGNQcUa7baV
 iF8BkG+rvnzTFgJ3MV5ARfC8I8u0D28bAtxuNDtn6Dyn6ok7PyfbHsgYN9+OHIBQNVix
 AeJ2prC4fwJgi2Q7TGQB38Pa8wP9wwR7etlfpx92qYwr3ne961AgRLT5LHCRpprhO9n9
 HN/tSbXWdxrBASlsmtXrGU95F0B/6cB+z+TCj7/JInDdr52oeqBsLfJDfwTn6DrkSwTE
 k4K1gtNaRoSirAjVgzssMCDoCVaZ5ROuyoaeHlszv1YVsMa0OoOFPsAIZYcsf7AUu5kY
 IUqQ==
X-Gm-Message-State: AAQBX9co9HxZ6p0f8Lns8OSEkWCCXDcNsb7yVD6krWZCi9FE2gBMuZOj
 YakDmZk+ux9rd7ugfbSa/6b9KDYWCPcuQOS06lEbig3fgVSqo9IojJ/7FIVFsYmEByKotzpr2Fi
 klmeRPEtCMto6tZWZJO+BkwGBOV2JaZYi3A==
X-Received: by 2002:ad4:5d68:0:b0:5d1:acb8:f126 with SMTP id
 fn8-20020ad45d68000000b005d1acb8f126mr4995803qvb.38.1680622149457; 
 Tue, 04 Apr 2023 08:29:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350YML0mMqHUHs1k3HMJkmmzOZKlEQzKI6fPsfnsSdnmZ4ori6n+2YUk0zwT+gzhWL3EpVBiXSg==
X-Received: by 2002:ad4:5d68:0:b0:5d1:acb8:f126 with SMTP id
 fn8-20020ad45d68000000b005d1acb8f126mr4995753qvb.38.1680622149123; 
 Tue, 04 Apr 2023 08:29:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 cv2-20020ad44d82000000b005dd8b9345f3sm3450439qvb.139.2023.04.04.08.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 08:29:00 -0700 (PDT)
Message-ID: <702c2883-1d51-b609-1e99-337295e6e307@redhat.com>
Date: Tue, 4 Apr 2023 17:28:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 04/12] vfio-iommufd: Add helper to retrieve iommufd_ctx
 and devid for vfio_device
To: Yi Liu <yi.l.liu@intel.com>, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-5-yi.l.liu@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230401144429.88673-5-yi.l.liu@intel.com>
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
Cc: linux-s390@vger.kernel.org, yi.y.sun@linux.intel.com, kvm@vger.kernel.org,
 mjrosato@linux.ibm.com, intel-gvt-dev@lists.freedesktop.org, joro@8bytes.org,
 cohuck@redhat.com, xudong.hao@intel.com, peterx@redhat.com,
 yan.y.zhao@intel.com, terrence.xu@intel.com, nicolinc@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 intel-gfx@lists.freedesktop.org, chao.p.peng@linux.intel.com, lulu@redhat.com,
 robin.murphy@arm.com, jasowang@redhat.com, yanting.jiang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi,

On 4/1/23 16:44, Yi Liu wrote:
> This is needed by the vfio-pci driver to report affected devices in the
> hot reset for a given device.
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/iommu/iommufd/device.c | 12 ++++++++++++
>  drivers/vfio/iommufd.c         | 14 ++++++++++++++
>  include/linux/iommufd.h        |  3 +++
>  include/linux/vfio.h           | 13 +++++++++++++
>  4 files changed, 42 insertions(+)
>
> diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
> index 25115d401d8f..04a57aa1ae2c 100644
> --- a/drivers/iommu/iommufd/device.c
> +++ b/drivers/iommu/iommufd/device.c
> @@ -131,6 +131,18 @@ void iommufd_device_unbind(struct iommufd_device *idev)
>  }
>  EXPORT_SYMBOL_NS_GPL(iommufd_device_unbind, IOMMUFD);
>  
> +struct iommufd_ctx *iommufd_device_to_ictx(struct iommufd_device *idev)
> +{
> +	return idev->ictx;
> +}
> +EXPORT_SYMBOL_NS_GPL(iommufd_device_to_ictx, IOMMUFD);
> +
> +u32 iommufd_device_to_id(struct iommufd_device *idev)
> +{
> +	return idev->obj.id;
> +}
> +EXPORT_SYMBOL_NS_GPL(iommufd_device_to_id, IOMMUFD);
> +
>  static int iommufd_device_setup_msi(struct iommufd_device *idev,
>  				    struct iommufd_hw_pagetable *hwpt,
>  				    phys_addr_t sw_msi_start)
> diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
> index 88b00c501015..809f2dd73b9e 100644
> --- a/drivers/vfio/iommufd.c
> +++ b/drivers/vfio/iommufd.c
> @@ -66,6 +66,20 @@ void vfio_iommufd_unbind(struct vfio_device *vdev)
>  		vdev->ops->unbind_iommufd(vdev);
>  }
>  
> +struct iommufd_ctx *vfio_iommufd_physical_ictx(struct vfio_device *vdev)
> +{
> +	if (!vdev->iommufd_device)
> +		return NULL;
> +	return iommufd_device_to_ictx(vdev->iommufd_device);
> +}
> +EXPORT_SYMBOL_GPL(vfio_iommufd_physical_ictx);
> +
> +void vfio_iommufd_physical_devid(struct vfio_device *vdev, u32 *id)
> +{
> +	if (vdev->iommufd_device)
> +		*id = iommufd_device_to_id(vdev->iommufd_device);
since there is no return value, may be worth to add at least a WARN_ON
in case of !vdev->iommufd_device
> +}
> +EXPORT_SYMBOL_GPL(vfio_iommufd_physical_devid);
>  /*
>   * The physical standard ops mean that the iommufd_device is bound to the
>   * physical device vdev->dev that was provided to vfio_init_group_dev(). Drivers
> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index 1129a36a74c4..ac96df406833 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -24,6 +24,9 @@ void iommufd_device_unbind(struct iommufd_device *idev);
>  int iommufd_device_attach(struct iommufd_device *idev, u32 *pt_id);
>  void iommufd_device_detach(struct iommufd_device *idev);
>  
> +struct iommufd_ctx *iommufd_device_to_ictx(struct iommufd_device *idev);
> +u32 iommufd_device_to_id(struct iommufd_device *idev);
> +
>  struct iommufd_access_ops {
>  	u8 needs_pin_pages : 1;
>  	void (*unmap)(void *data, unsigned long iova, unsigned long length);
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 3188d8a374bd..97a1174b922f 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -113,6 +113,8 @@ struct vfio_device_ops {
>  };
>  
>  #if IS_ENABLED(CONFIG_IOMMUFD)
> +struct iommufd_ctx *vfio_iommufd_physical_ictx(struct vfio_device *vdev);
> +void vfio_iommufd_physical_devid(struct vfio_device *vdev, u32 *id);
>  int vfio_iommufd_physical_bind(struct vfio_device *vdev,
>  			       struct iommufd_ctx *ictx, u32 *out_device_id);
>  void vfio_iommufd_physical_unbind(struct vfio_device *vdev);
> @@ -122,6 +124,17 @@ int vfio_iommufd_emulated_bind(struct vfio_device *vdev,
>  void vfio_iommufd_emulated_unbind(struct vfio_device *vdev);
>  int vfio_iommufd_emulated_attach_ioas(struct vfio_device *vdev, u32 *pt_id);
>  #else
> +static inline struct iommufd_ctx *
> +vfio_iommufd_physical_ictx(struct vfio_device *vdev)
> +{
> +	return NULL;
> +}
> +
> +static inline void
> +vfio_iommufd_physical_devid(struct vfio_device *vdev, u32 *id)
> +{
> +}
> +
>  #define vfio_iommufd_physical_bind                                      \
>  	((int (*)(struct vfio_device *vdev, struct iommufd_ctx *ictx,   \
>  		  u32 *out_device_id)) NULL)
besides

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

