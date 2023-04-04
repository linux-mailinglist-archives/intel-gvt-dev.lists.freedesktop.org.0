Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FCF6D6464
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Apr 2023 15:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E13210E6B4;
	Tue,  4 Apr 2023 13:59:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C9610E6AD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Apr 2023 13:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680616783;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CiA47gAN7qT+ZNDZD32w5M0yj6bHGU0l8msuusUTdoo=;
 b=PIzXbAegx7NKJKIBbKTxlUVhl+vi67eAKvpg/F6amSdverJs1ittWMY82RaL9nlckN26MW
 Rh8zWLq750gH5igtI9CvPeFrn8KRcjph9aTaLdbnWRtTJ1SWIsce1NvWe9Xbk+SaLoIuy/
 2q9kdjc4x9xbVrxECAyXdEYLQLYzuLs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-9Cvwk6j_OC6hzrdfrxVusA-1; Tue, 04 Apr 2023 09:59:42 -0400
X-MC-Unique: 9Cvwk6j_OC6hzrdfrxVusA-1
Received: by mail-qv1-f69.google.com with SMTP id
 f8-20020a0cbec8000000b005b14a30945cso14637041qvj.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 04 Apr 2023 06:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680616780;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CiA47gAN7qT+ZNDZD32w5M0yj6bHGU0l8msuusUTdoo=;
 b=ELzKSzPTB055m2vjuliWXDsas7zc/ygYnfAFPMEr5zVnDwU/031KmCnX2c1kLCflvv
 oYHjJkLrIQN+3hHTTSDcQ5QaefXRUkUvfufNYV+2GIjxgUcv+DKii9SjNIuYLE11wVeI
 0HkFICd/A349Cr7DTfHwyERMqyLXKDbptf3v+k4A6LRvrMwcgk+6JIqPmTiI7qjLyNmZ
 5xajyF8dKdSYivsC2tBJOUJ37BDzVToeVZM01rOEJhEaIb8Y+LI6pYiHdUiLScHnXLAo
 39M+2UyUPAt/tVEWm1cx1YPU7I7ve+v7f/xn4PR7sOmoN3IPSD19xojMOTNCcSH11RL4
 fesA==
X-Gm-Message-State: AAQBX9doQHLxcK8S7JGAXNNYVeN9HyjISimp/orO42FoEV8jS8K80rVH
 FdyTraCW97wCu93vqrzA27/V2jYWJqohSgcXxGIDR7yibNSQPYeyR3tbmyGY69DX3oyL2KaU5Rr
 bR+qbQtV0L8NJHZFntEBvPB8mx2B/r7/AoQ==
X-Received: by 2002:a05:622a:d4:b0:3e6:518e:20d2 with SMTP id
 p20-20020a05622a00d400b003e6518e20d2mr3799527qtw.38.1680616780155; 
 Tue, 04 Apr 2023 06:59:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZZL+oXCfUUoM6pdP+baT0sl47qwZv5PYyBbT4M9DCOsE5FKMGPzd9k7TGNiSfdXRQRCW7Zbg==
X-Received: by 2002:a05:622a:d4:b0:3e6:518e:20d2 with SMTP id
 p20-20020a05622a00d400b003e6518e20d2mr3799466qtw.38.1680616779762; 
 Tue, 04 Apr 2023 06:59:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a37aa07000000b0074a0a47a1f3sm3647912qke.5.2023.04.04.06.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:59:38 -0700 (PDT)
Message-ID: <844faa5c-2968-2a4f-8a70-900f359be1a0@redhat.com>
Date: Tue, 4 Apr 2023 15:59:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 02/12] vfio/pci: Only check ownership of opened devices
 in hot reset
To: Yi Liu <yi.l.liu@intel.com>, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-3-yi.l.liu@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230401144429.88673-3-yi.l.liu@intel.com>
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

Hi YI,

On 4/1/23 16:44, Yi Liu wrote:
> If the affected device is not opened by any user, it's safe to reset it
> given it's not in use.
>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 14 +++++++++++---
>  include/uapi/linux/vfio.h        |  8 ++++++++
>  2 files changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 65bbef562268..5d745c9abf05 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -2429,10 +2429,18 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>  
>  	list_for_each_entry(cur_vma, &dev_set->device_list, vdev.dev_set_list) {
>  		/*
> -		 * Test whether all the affected devices are contained by the
> -		 * set of groups provided by the user.
> +		 * Test whether all the affected devices can be reset by the
> +		 * user.
> +		 *
> +		 * Resetting an unused device (not opened) is safe, because
> +		 * dev_set->lock is held in hot reset path so this device
> +		 * cannot race being opened by another user simultaneously.
> +		 *
> +		 * Otherwise all opened devices in the dev_set must be
> +		 * contained by the set of groups provided by the user.
>  		 */
> -		if (!vfio_dev_in_groups(cur_vma, groups)) {
> +		if (cur_vma->vdev.open_count &&
> +		    !vfio_dev_in_groups(cur_vma, groups)) {
>  			ret = -EINVAL;
>  			goto err_undo;
>  		}
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 0552e8dcf0cb..f96e5689cffc 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -673,6 +673,14 @@ struct vfio_pci_hot_reset_info {
>   * VFIO_DEVICE_PCI_HOT_RESET - _IOW(VFIO_TYPE, VFIO_BASE + 13,
>   *				    struct vfio_pci_hot_reset)
>   *
> + * Userspace requests hot reset for the devices it uses.  Due to the
> + * underlying topology, multiple devices can be affected in the reset
by the reset
> + * while some might be opened by another user.  To avoid interference
s/interference/hot reset failure?
> + * the calling user must ensure all affected devices, if opened, are
> + * owned by itself.
> + *
> + * The ownership is proved by an array of group fds.
> + *
>   * Return: 0 on success, -errno on failure.
>   */
>  struct vfio_pci_hot_reset {
Thanks

Eric

