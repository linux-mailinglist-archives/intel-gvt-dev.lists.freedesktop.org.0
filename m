Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 321E77071A7
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 17 May 2023 21:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EA410E26B;
	Wed, 17 May 2023 19:12:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD09110E26B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 17 May 2023 19:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684350770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kUYw29Zoa6zK25906srnQFhBp6MIgdBaKePMJ7buoyk=;
 b=UlXYGZZAuKKiHtQlL22UV74OkpyV2oBOGR5pd5+fJfVX5Sa5ZoBlT0XDv54NBD8oX+K+ua
 HCKIiuGmsVJSAHW+ycFZb40wJ2shGqhNUwX6/SLVhmqvmiCOrrb6LsCvDoRFu7V9nzmk81
 zfVWCy6Vs9+b+KioHKbtxn7SDsoVaVk=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-pRkcZa6bO3e36B3QnDuM8w-1; Wed, 17 May 2023 15:12:46 -0400
X-MC-Unique: pRkcZa6bO3e36B3QnDuM8w-1
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-763997ab8cdso175990739f.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 17 May 2023 12:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684350766; x=1686942766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kUYw29Zoa6zK25906srnQFhBp6MIgdBaKePMJ7buoyk=;
 b=PDOeQ5hfHV7mLcj8Y5oo96Z+DNKkqX4+7dbl3qyhGm7IvKi2HOHOx0JfsC6hYrIEQw
 55inlloOjmLnAOTK9396c50vjy/Bw1bRTKXt9TKhd1I0XuKGMAEuWOh8fzkpBwqWNINb
 YDWuw+k1t/UwZEIPFKXMP1WS3EMSAjWYFJ1hDWaEd2YHj+5MBAacWFOOLfHapVLTJVRY
 onKUiWYgyhqHSyXk8dbo0AJ/1XLEK9oxSAQmFTDI2CJgPX/gPoFNze9q8FwPafCoPRJn
 vi054V8HvMkqAAbWsmSPcjrF73031n2SJrUPwnogF6H3go42xCHMy2UjnMagBGktDGU+
 VAkw==
X-Gm-Message-State: AC+VfDyoYt7DeSN8A1iZcKk2hFx0lDnzdbAR1sgBgHSrzWKtc9L+rI4i
 RN+1AofCLQrunJEm7ywfleqyMs2meHe0Q+ukOTl529S5qLW9szJkKhWbWjAYTwrulWjtVL9tRVo
 xQx+/dV1enW+K/wBikuXb+MWId8uJXLhofw==
X-Received: by 2002:a5d:8349:0:b0:769:c95b:29d2 with SMTP id
 q9-20020a5d8349000000b00769c95b29d2mr5175337ior.15.1684350765818; 
 Wed, 17 May 2023 12:12:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6uBqxqAG67zrv6YM/LC+1w6MWWX/cwdvMLlHlj+jf/jYQ8FiDSZBcs0tVU+pbwwdfg9LZu7A==
X-Received: by 2002:a5d:8349:0:b0:769:c95b:29d2 with SMTP id
 q9-20020a5d8349000000b00769c95b29d2mr5175304ior.15.1684350765494; 
 Wed, 17 May 2023 12:12:45 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 r14-20020a02b10e000000b0040fc3543ff2sm8744956jah.84.2023.05.17.12.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 12:12:44 -0700 (PDT)
Date: Wed, 17 May 2023 13:12:43 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v5 07/10] vfio: Add helper to search vfio_device in a
 dev_set
Message-ID: <20230517131243.7028bf9c.alex.williamson@redhat.com>
In-Reply-To: <20230513132136.15021-8-yi.l.liu@intel.com>
References: <20230513132136.15021-1-yi.l.liu@intel.com>
 <20230513132136.15021-8-yi.l.liu@intel.com>
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

On Sat, 13 May 2023 06:21:33 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> There are drivers that need to search vfio_device within a given dev_set.
> e.g. vfio-pci. So add a helper.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c |  8 +++-----
>  drivers/vfio/vfio_main.c         | 15 +++++++++++++++
>  include/linux/vfio.h             |  3 +++
>  3 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 39e7823088e7..4df2def35bdd 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -2335,12 +2335,10 @@ static bool vfio_dev_in_groups(struct vfio_pci_core_device *vdev,
>  static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *data)
>  {
>  	struct vfio_device_set *dev_set = data;
> -	struct vfio_device *cur;
>  
> -	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
> -		if (cur->dev == &pdev->dev)
> -			return 0;
> -	return -EBUSY;
> +	lockdep_assert_held(&dev_set->lock);
> +
> +	return vfio_find_device_in_devset(dev_set, &pdev->dev) ? 0 : -EBUSY;

Maybe an opportunity to revisit why this returns -EBUSY rather than
something reasonable like -ENODEV.  It looks like we picked up the
-EBUSY in a882c16a2b7e where I think it was trying to preserve the
return of vfio_pci_try_zap_and_vma_lock_cb() but the return value here
is not even propagated so this looks like an chance to have it make
sense again.  Thanks,

Alex

>  }
>  
>  /*
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index f0ca33b2e1df..ab4f3a794f78 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -141,6 +141,21 @@ unsigned int vfio_device_set_open_count(struct vfio_device_set *dev_set)
>  }
>  EXPORT_SYMBOL_GPL(vfio_device_set_open_count);
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
>  /*
>   * Device objects - create, release, get, put, search
>   */
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index fcbe084b18c8..4c17395ed4d2 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -259,6 +259,9 @@ void vfio_unregister_group_dev(struct vfio_device *device);
>  
>  int vfio_assign_device_set(struct vfio_device *device, void *set_id);
>  unsigned int vfio_device_set_open_count(struct vfio_device_set *dev_set);
> +struct vfio_device *
> +vfio_find_device_in_devset(struct vfio_device_set *dev_set,
> +			   struct device *dev);
>  
>  int vfio_mig_get_next_state(struct vfio_device *device,
>  			    enum vfio_device_mig_state cur_fsm,

