Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C53B16D7BDF
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Apr 2023 13:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6B710E8F5;
	Wed,  5 Apr 2023 11:48:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC0510E8F2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Apr 2023 11:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680695296;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XUJMq3feSTxr1yNCi3lubHcB7k2hxhsRP2VpHbgXdR4=;
 b=Uo8Mz5vQJFgOPbHUx5or2s54W6y1gzbZ6AI2rexAMjA5ylR4BvRH3+9bOOdcD45L4bB/gk
 AomUtM4DvncSzq4qIFWoeU7iRD13bcLgE33LTflpFtrPC1StsvDVoHJjjo+6jQYEt9IemA
 p/41oRMFpOyf10xqLP2Wk7fjeboB+Ps=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-XDe12DVqMJ2B7o_tYeOmVw-1; Wed, 05 Apr 2023 07:48:15 -0400
X-MC-Unique: XDe12DVqMJ2B7o_tYeOmVw-1
Received: by mail-qt1-f197.google.com with SMTP id
 r22-20020ac85c96000000b003e638022bc9so12212909qta.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 05 Apr 2023 04:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680695295;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XUJMq3feSTxr1yNCi3lubHcB7k2hxhsRP2VpHbgXdR4=;
 b=PPfzpd+GSTN1UFfPnsc40SObK8ECzutXqcq6ahUXWeI6ThQ8WVP2LOhvLduqsyRUGQ
 FLnmdcom6EJaMIwMNNMA7k1lBSZ6V2TdhLeL0dFG7Z3cL/e/ZVIWd0HDJdftkOTgxBL/
 XbEBLdL6Qko6lJ62YyKgBIw8ENk+0aJfg1HB38t9Zqz3zkBS/pja8B9A3XSMshdUE5aX
 bcrRfOsD/KUbXpbudjTgpikn0huBliZQ36/W4sl7g2L1VF7u8Y2OzbnSLEhAZHnymOhr
 WSEURPVXCKEO1GCnEGZ4TQakXfDEl+L+/1NPqE3L1Z2Dlp2+kzjFPuitbOijupSLxsR/
 QVZA==
X-Gm-Message-State: AAQBX9eFNolji0nMBwlNqjM16/aUhd5lYDCe3MW3yRMtQlhFulegxwFG
 gfXMeKof4Qz0nNjmeueCr+7EpHXjIn0Qqhk1YtQdvJRdU1IvICY7CP0WY2kAP/BMIIZedCfSJQg
 QRN1DaKuyRaCRX9mOGAL85Nt9CIoskpwWuA==
X-Received: by 2002:a05:622a:24e:b0:3e4:6329:448e with SMTP id
 c14-20020a05622a024e00b003e46329448emr4707905qtx.16.1680695294892; 
 Wed, 05 Apr 2023 04:48:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350bTRAqI88LX9VbFNvjBJctHF4npfJOcif6/mBvLLVP/bBAY1tjUITSIzECLh8nneassa2qYIw==
X-Received: by 2002:a05:622a:24e:b0:3e4:6329:448e with SMTP id
 c14-20020a05622a024e00b003e46329448emr4707845qtx.16.1680695294510; 
 Wed, 05 Apr 2023 04:48:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 f24-20020ac84658000000b003b9a73cd120sm3923853qto.17.2023.04.05.04.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 04:48:13 -0700 (PDT)
Message-ID: <42a1dd97-a95e-d5a6-ad6e-d87373111bd2@redhat.com>
Date: Wed, 5 Apr 2023 13:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 10/12] vfio: Mark cdev usage in vfio_device
To: Yi Liu <yi.l.liu@intel.com>, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-11-yi.l.liu@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230401144429.88673-11-yi.l.liu@intel.com>
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



On 4/1/23 16:44, Yi Liu wrote:
> There are users that need to check if vfio_device is opened as cdev.
> e.g. vfio-pci. This adds a flag in vfio_device, it will be set in the
> cdev path when device is opened. This is not used at this moment, but
> a preparation for vfio device cdev support.

better to squash this patch with the patch setting cdev_opened then?

Thanks

Eric
>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  include/linux/vfio.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index f8fb9ab25188..d9a0770e5fc1 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -62,6 +62,7 @@ struct vfio_device {
>  	struct iommufd_device *iommufd_device;
>  	bool iommufd_attached;
>  #endif
> +	bool cdev_opened;
>  };
>  
>  /**
> @@ -151,6 +152,12 @@ vfio_iommufd_physical_devid(struct vfio_device *vdev, u32 *id)
>  	((int (*)(struct vfio_device *vdev, u32 *pt_id)) NULL)
>  #endif
>  
> +static inline bool vfio_device_cdev_opened(struct vfio_device *device)
> +{
> +	lockdep_assert_held(&device->dev_set->lock);
> +	return device->cdev_opened;
> +}
> +
>  /**
>   * @migration_set_state: Optional callback to change the migration state for
>   *         devices that support migration. It's mandatory for

