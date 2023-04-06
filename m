Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1C86D994A
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  6 Apr 2023 16:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8AE510EBCF;
	Thu,  6 Apr 2023 14:13:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C78D10EBCF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  6 Apr 2023 14:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680790421;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ZqDQDqjyds8VPlocoEi3C0IrbNugg8tUJmM/qJ6sTM=;
 b=blwhxrz7ku3LJl0AqR6XCYeK5eqZAOVCtfxUzHmf0i+vbqAyO7G31MrW5V6hNQED0gKt/G
 qyA2CeoIdEtXXszq1mfrnlmYUrrz3QPLmGmxg8yQ9m44aG05e3J68vuNhFKRIKJHNNKZgV
 mV5/Yz34xq8vVIyMRjqFYRPQ8yaq034=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-7k74bBBiPI-FRflDPuuhxA-1; Thu, 06 Apr 2023 10:13:39 -0400
X-MC-Unique: 7k74bBBiPI-FRflDPuuhxA-1
Received: by mail-qt1-f200.google.com with SMTP id
 c14-20020ac87d8e000000b003e38726ec8bso26779730qtd.23
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 06 Apr 2023 07:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680790419;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ZqDQDqjyds8VPlocoEi3C0IrbNugg8tUJmM/qJ6sTM=;
 b=70667dIS4GwyTbu8tfzCkSmEa6XRWYopG6eEH6KUN2T+5fAvgDvhLgVW+dWT4M/JYW
 BBbFmoR6I/u7IgPyxWONLlPS7oTKHCD445EtU4kfpOGoMP9WOnrFxusBukZzRUerkpql
 GA0OX4Kdjb28bSFjK6KveXqye/h0Sf2v5tJNm9d2xSAvoadgCPYExsNHpeFbelxEL8Tb
 GvaoL8W10nzIM6UwCCEEEFNJcgbOq/VnOmxrlilwkO6lwHPkZ2R3IqLDB2E1iHHTAw+s
 nPRPNZrb9Bob/MZezZ/F671axKAMHEQaGHPfjbNZzD4qX7wxF1F8zIIDJG//F1iK5ywW
 H5Cg==
X-Gm-Message-State: AAQBX9cMxl9+F+KkVbJxheLMIhHcRxejGOVipeqXWnyOkvWKKxaibMdu
 iAlTuMHfghgjKXOxQOSedCq6LG2Xr3e8R/2IXkT3y4AZ9fD8EdSX+cNvKauo0UB3nbwhKENueXN
 NA+WRcYf+V5wsCHTyptXbesylR9DLhhKQjw==
X-Received: by 2002:a05:6214:2aab:b0:5ce:7b40:89bd with SMTP id
 js11-20020a0562142aab00b005ce7b4089bdmr4087297qvb.18.1680790418955; 
 Thu, 06 Apr 2023 07:13:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350bO91aKaALXlf/32wwODUUkbjJFfCvulNU+0tH+77KwqRdD7uBXiKVvaUVXOK53XyO/yxSRcA==
X-Received: by 2002:a05:6214:2aab:b0:5ce:7b40:89bd with SMTP id
 js11-20020a0562142aab00b005ce7b4089bdmr4087239qvb.18.1680790418519; 
 Thu, 06 Apr 2023 07:13:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 lv6-20020a056214578600b005dd8b9345cbsm534712qvb.99.2023.04.06.07.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 07:13:37 -0700 (PDT)
Message-ID: <0c51b289-4393-46d5-fb05-a4fc6de92e7b@redhat.com>
Date: Thu, 6 Apr 2023 16:13:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v9 09/25] vfio: Add cdev_device_open_cnt to vfio_group
To: Yi Liu <yi.l.liu@intel.com>, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com
References: <20230401151833.124749-1-yi.l.liu@intel.com>
 <20230401151833.124749-10-yi.l.liu@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230401151833.124749-10-yi.l.liu@intel.com>
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

Hi Yi,

On 4/1/23 17:18, Yi Liu wrote:
> for counting the devices that are opened via the cdev path. This count
> is increased and decreased by the cdev path. The group path checks it
> to achieve exclusion with the cdev path. With this, only one path (group
> path or cdev path) will claim DMA ownership. This avoids scenarios in
> which devices within the same group may be opened via different paths.
>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  drivers/vfio/group.c | 33 +++++++++++++++++++++++++++++++++
>  drivers/vfio/vfio.h  |  3 +++
>  2 files changed, 36 insertions(+)
>
> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> index 71f0a9a4016e..d55ce3ca44b7 100644
> --- a/drivers/vfio/group.c
> +++ b/drivers/vfio/group.c
> @@ -383,6 +383,33 @@ static long vfio_group_fops_unl_ioctl(struct file *filep,
>  	}
>  }
>  
> +int vfio_device_block_group(struct vfio_device *device)
> +{
> +	struct vfio_group *group = device->group;
> +	int ret = 0;
> +
> +	mutex_lock(&group->group_lock);
> +	if (group->opened_file) {
> +		ret = -EBUSY;
> +		goto out_unlock;
> +	}
> +
> +	group->cdev_device_open_cnt++;
> +
> +out_unlock:
> +	mutex_unlock(&group->group_lock);
> +	return ret;
> +}
> +
> +void vfio_device_unblock_group(struct vfio_device *device)
> +{
> +	struct vfio_group *group = device->group;
> +
> +	mutex_lock(&group->group_lock);
> +	group->cdev_device_open_cnt--;
> +	mutex_unlock(&group->group_lock);
> +}
> +
>  static int vfio_group_fops_open(struct inode *inode, struct file *filep)
>  {
>  	struct vfio_group *group =
> @@ -405,6 +432,11 @@ static int vfio_group_fops_open(struct inode *inode, struct file *filep)
>  		goto out_unlock;
>  	}
>  
> +	if (group->cdev_device_open_cnt) {
> +		ret = -EBUSY;
> +		goto out_unlock;
> +	}
> +
>  	/*
>  	 * Do we need multiple instances of the group open?  Seems not.
>  	 */
> @@ -479,6 +511,7 @@ static void vfio_group_release(struct device *dev)
>  	mutex_destroy(&group->device_lock);
>  	mutex_destroy(&group->group_lock);
>  	WARN_ON(group->iommu_group);
> +	WARN_ON(group->cdev_device_open_cnt);
>  	ida_free(&vfio.group_ida, MINOR(group->dev.devt));
>  	kfree(group);
>  }
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index 854f2c97cb9a..b2f20b78a707 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -83,8 +83,11 @@ struct vfio_group {
>  	struct blocking_notifier_head	notifier;
>  	struct iommufd_ctx		*iommufd;
>  	spinlock_t			kvm_ref_lock;
> +	unsigned int			cdev_device_open_cnt;
>  };
>  
> +int vfio_device_block_group(struct vfio_device *device);
> +void vfio_device_unblock_group(struct vfio_device *device);
>  int vfio_device_set_group(struct vfio_device *device,
>  			  enum vfio_group_type type);
>  void vfio_device_remove_group(struct vfio_device *device);

