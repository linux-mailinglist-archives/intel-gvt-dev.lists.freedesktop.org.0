Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A447025B6
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 May 2023 09:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B25F10E13B;
	Mon, 15 May 2023 07:11:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E53110E13D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 15 May 2023 07:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684134689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PrvftN8LTvjLNSmV4hczj5SgdxauygqUnnKWnbj/64w=;
 b=BI1pdbCpE/M6/yEjAHMJjCgGzVYJmwMFOjAvIeYlZca/W0jh7LNoowatoYJnY3GnRvgTO1
 3idgtObRnZSd8jbpD5OE9VNd5FSXtQjv65RvtRdqzHFbH4jrXSgJIkURicG7Wt+Fl5usv9
 28AFvwtAnbLqpBjtEWU0tMX6BasdpWw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-RWB63c74MtiEp6_R7mAYmQ-1; Mon, 15 May 2023 03:11:28 -0400
X-MC-Unique: RWB63c74MtiEp6_R7mAYmQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f4fb0193c6so5891475e9.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 15 May 2023 00:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684134687; x=1686726687;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PrvftN8LTvjLNSmV4hczj5SgdxauygqUnnKWnbj/64w=;
 b=IRHfSi1dmyybpMWW/LqpURUXKkR9uK5GWDyQuvhlP4EOvAt4YSYA5+IvInU/1odbAA
 +Mi7KqyJvC7rNDvYavNMNwdFeLGqek+6NonSVNCMGBhvmc3m9OiwpVddpoVCdafI4nsz
 bcESAqgffhLnq6HUF8wXooSMeiW+bgZun3LH5IuiWJ17/khpacNBl78B+kcHwm1NODak
 NZK6gThZZUHrz+hQsJC4/o8+KZLPGPR7WiwmrYJ49YKZjRIaNgPWBL2lvNrMUUxz2QiY
 fXscjwEqVbKESjIUpmSMFg34hx0EfFLbNPYRcsKYoMJZVGYN0kVb3tdNwFHxQ8mDU+HW
 hFfA==
X-Gm-Message-State: AC+VfDxJNIZvlKhfgzsUWOcOJopgSWFBery5GZzMlDv9eFb1HsHxrp4j
 Wwi8ArpxBby47a8rbsIVYhH9V1YXVuOU1laTEL0EA7tUEmCaz9on+Rh9VYq85El6rbbX92Lc/S+
 nlaKLKE4piIZUURde+IHrIq6R5UhW31qG9w==
X-Received: by 2002:a1c:f711:0:b0:3f5:1a4:a08d with SMTP id
 v17-20020a1cf711000000b003f501a4a08dmr3278827wmh.7.1684134687147; 
 Mon, 15 May 2023 00:11:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qYm9mJZDymacavx2WUVx58H8QOzio8ACR10nRBchBc8miC//kNxyu+5sGW2UPuK2Nxwn/oQ==
X-Received: by 2002:a1c:f711:0:b0:3f5:1a4:a08d with SMTP id
 v17-20020a1cf711000000b003f501a4a08dmr3278789wmh.7.1684134686765; 
 Mon, 15 May 2023 00:11:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c290700b003f4ecf1fcbcsm11706405wmd.22.2023.05.15.00.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 00:11:26 -0700 (PDT)
Message-ID: <6f958b0b-64bd-147d-98d5-a2158b34247d@redhat.com>
Date: Mon, 15 May 2023 09:11:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 07/10] vfio: Add helper to search vfio_device in a
 dev_set
To: Yi Liu <yi.l.liu@intel.com>, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com
References: <20230513132136.15021-1-yi.l.liu@intel.com>
 <20230513132136.15021-8-yi.l.liu@intel.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <20230513132136.15021-8-yi.l.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 peterx@redhat.com, terrence.xu@intel.com, chao.p.peng@linux.intel.com,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org, lulu@redhat.com,
 zhenzhong.duan@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, yanting.jiang@intel.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 5/13/23 15:21, Yi Liu wrote:
> There are drivers that need to search vfio_device within a given dev_set.
> e.g. vfio-pci. So add a helper.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>   drivers/vfio/pci/vfio_pci_core.c |  8 +++-----
>   drivers/vfio/vfio_main.c         | 15 +++++++++++++++
>   include/linux/vfio.h             |  3 +++
>   3 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 39e7823088e7..4df2def35bdd 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -2335,12 +2335,10 @@ static bool vfio_dev_in_groups(struct vfio_pci_core_device *vdev,
>   static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *data)
>   {
>   	struct vfio_device_set *dev_set = data;
> -	struct vfio_device *cur;
>   
> -	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
> -		if (cur->dev == &pdev->dev)
> -			return 0;
> -	return -EBUSY;
> +	lockdep_assert_held(&dev_set->lock);

May be drop the lockdep_assert_held() above since there is one in
vfio_find_device_in_devset().

Thanks,

C.

> +
> +	return vfio_find_device_in_devset(dev_set, &pdev->dev) ? 0 : -EBUSY;
>   }
>   
>   /*
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index f0ca33b2e1df..ab4f3a794f78 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -141,6 +141,21 @@ unsigned int vfio_device_set_open_count(struct vfio_device_set *dev_set)
>   }
>   EXPORT_SYMBOL_GPL(vfio_device_set_open_count);
>   
> +struct vfio_device *
> +vfio_find_device_in_devset(struct vfio_device_set *dev_set,
> +			   struct device *dev)
> +{
> +	struct vfio_device *cur;
> +
> +	lockdep_assert_held(&dev_set->lock);
> +
> +	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
> +		if (cur->dev == dev)
> +			return cur;
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(vfio_find_device_in_devset);
> +
>   /*
>    * Device objects - create, release, get, put, search
>    */
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index fcbe084b18c8..4c17395ed4d2 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -259,6 +259,9 @@ void vfio_unregister_group_dev(struct vfio_device *device);
>   
>   int vfio_assign_device_set(struct vfio_device *device, void *set_id);
>   unsigned int vfio_device_set_open_count(struct vfio_device_set *dev_set);
> +struct vfio_device *
> +vfio_find_device_in_devset(struct vfio_device_set *dev_set,
> +			   struct device *dev);
>   
>   int vfio_mig_get_next_state(struct vfio_device *device,
>   			    enum vfio_device_mig_state cur_fsm,

