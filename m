Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D32570CE68
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 23 May 2023 01:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A58510E01F;
	Mon, 22 May 2023 23:04:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA69410E01F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 May 2023 23:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684796674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0+n/QgjpwGDdtheHaeJfYxk19jJm9VkMNETIgTtOVc=;
 b=cfzR2fdUIxt3JqCmhap49c1ofgHQSzDH6ym8CdZZKK36j6U3aJruuvT0Nlx/lBBpI/AY3x
 ZoRE9NkxEl2Nbo/cPGyNG/6z7t8x/TyxvbB/AOnjDbrdv0shulmvHdblGXW1+F2W4IRxCq
 Mbd+cmW1Bzx4EQShGOPwXoJMbYbr1D4=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-7yj86HxgMvu8rQ_eqLD6jA-1; Mon, 22 May 2023 19:04:33 -0400
X-MC-Unique: 7yj86HxgMvu8rQ_eqLD6jA-1
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-76c7d59e5deso534717339f.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 May 2023 16:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684796673; x=1687388673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w0+n/QgjpwGDdtheHaeJfYxk19jJm9VkMNETIgTtOVc=;
 b=AJqeE+qvFqAb33ucj9s5VICk8S8VmHwptBUeFCQ7oJ2qgJGmjEQXR4WjcrfkzKuId5
 Dy77ms1+g2L2Oziyf7mkmpr8JLmgK9XxV+1svG00+YgjB6kt7BwGDQprnQLHGyj2QOlw
 8WMWIyalXCVuPcYJka5oJ1WNugysAX+a/jKWl55/mJWX0RBB5WGkVwfnvK813YgLmu5i
 i3jRKkjHgWDEGjVRjCThvLKGLDg3xwQXknFi19Xk1YrN/Wcayjz6e1G3aLXLGpwipKTu
 DHHxf3rnY8y7FxTElf+C2GOIfesz63mvbeO5Plhx6FNCispspSEsbhSEbIpNvGpHsEML
 yzHQ==
X-Gm-Message-State: AC+VfDzN4kJX6OCdHnjt26QPtzdgQ+R/BhUHVZ39xNYB7BMlv05k88j6
 D4sMQaH7bK5abcG7zxnQeOtwnvtFR+ZJ3mJzdfppyZDnCtd8RCy47UKuv/o6orHpmsZO476ET8v
 ucgKiGuqZ8x0hPBoMBy0gKYp/hbpytp/5aw==
X-Received: by 2002:a5e:890f:0:b0:76e:fbc6:347d with SMTP id
 k15-20020a5e890f000000b0076efbc6347dmr7364575ioj.20.1684796672721; 
 Mon, 22 May 2023 16:04:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Z8CUQuCHamNsEWTaswCX9W3UzFyBF5Ko9xA67aR5uOOig0LLcu/AMeAJp5EHdL25fonvk4A==
X-Received: by 2002:a5e:890f:0:b0:76e:fbc6:347d with SMTP id
 k15-20020a5e890f000000b0076efbc6347dmr7364559ioj.20.1684796672395; 
 Mon, 22 May 2023 16:04:32 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 x26-20020a0566380cba00b00411b2414eb5sm1999079jad.94.2023.05.22.16.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 16:04:31 -0700 (PDT)
Date: Mon, 22 May 2023 17:04:29 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v11 21/23] vfio: Determine noiommu device in
 __vfio_register_dev()
Message-ID: <20230522170429.2d5ca274.alex.williamson@redhat.com>
In-Reply-To: <20230513132827.39066-22-yi.l.liu@intel.com>
References: <20230513132827.39066-1-yi.l.liu@intel.com>
 <20230513132827.39066-22-yi.l.liu@intel.com>
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

On Sat, 13 May 2023 06:28:25 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> This is to make the cdev path and group path consistent for the noiommu
> devices registration. If vfio_noiommu is disabled, such registration
> should fail. However, this check is vfio_device_set_group() which is part
> of the vfio_group code. If the vfio_group code is compiled out, noiommu
> devices would be registered even vfio_noiommu is disabled.
> 
> This adds vfio_device_set_noiommu() which can fail and calls it in the
> device registration. For now, it never fails as long as
> vfio_device_set_group() is successful. But when the vfio_group code is
> compiled out, vfio_device_set_noiommu() would fail the noiommu devices
> when vfio_noiommu is disabled.

I'm lost.  After the next patch we end up with the following when
CONFIG_VFIO_GROUP is set:

static inline int vfio_device_set_noiommu(struct vfio_device *device)
{
        device->noiommu = IS_ENABLED(CONFIG_VFIO_NOIOMMU) &&
                          device->group->type == VFIO_NO_IOMMU;
        return 0;
}

I think this is relying on the fact that vfio_device_set_group() which
is called immediately prior to this function would have performed the
testing for noiommu and failed prior to this function being called and
therefore there is no error return here.

Note also here that I think CONFIG_VFIO_NOIOMMU was only being tested
here previously so that a smart enough compiler would optimize out the
entire function, we can never set a VFIO_NO_IOMMU type when
!CONFIG_VFIO_NOIOMMU.  That's no longer the case if the function is
refactored like this.

When !CONFIG_VFIO_GROUP:

static inline int vfio_device_set_noiommu(struct vfio_device *device)
{
        struct iommu_group *iommu_group;

        iommu_group = iommu_group_get(device->dev);
        if (!iommu_group) {
                if (!IS_ENABLED(CONFIG_VFIO_NOIOMMU) || !vfio_noiommu)
                        return -EINVAL;
                device->noiommu = true;
        } else {
                iommu_group_put(iommu_group);
                device->noiommu = false;
        }

        return 0;
}

Here again, the NOIOMMU config option is irrelevant, vfio_noiommu can
only be true if the config option is enabled.  Therefore if there's no
IOMMU group and the module option to enable noiommu is not set, return
an error.

It's really quite ugly that in one mode we rely on this function to
generate the error and in the other mode it happens prior to getting
here.

The above could be simplified to something like:

	iommu_group = iommu_group_get(device->dev);
	if (!iommu_group && !vfio_iommu)
		return -EINVAL;

	device->noiommu = !iommu_group;
	iommu_group_put(iommu_group); /* Accepts NULL */
	return 0;

Which would actually work regardless of CONFIG_VFIO_GROUP, where maybe
this could then be moved before vfio_device_set_group() and become the
de facto exit point for invalid noiommu configurations and maybe we
could remove the test from the group code (with a comment to note that
it's been tested prior)?  Thanks,

Alex

> As noiommu devices is checked and there are multiple places which needs
> to test noiommu devices, this also adds a flag to mark noiommu devices.
> Hence the callers of vfio_device_is_noiommu() can be converted to test
> vfio_device->noiommu.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/device_cdev.c |  4 ++--
>  drivers/vfio/group.c       |  2 +-
>  drivers/vfio/iommufd.c     | 10 +++++-----
>  drivers/vfio/vfio.h        |  7 ++++---
>  drivers/vfio/vfio_main.c   |  6 +++++-
>  include/linux/vfio.h       |  1 +
>  6 files changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
> index 3f14edb80a93..6d7f50ee535d 100644
> --- a/drivers/vfio/device_cdev.c
> +++ b/drivers/vfio/device_cdev.c
> @@ -111,7 +111,7 @@ long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
>  	if (df->group)
>  		return -EINVAL;
>  
> -	if (vfio_device_is_noiommu(device) && !capable(CAP_SYS_RAWIO))
> +	if (device->noiommu && !capable(CAP_SYS_RAWIO))
>  		return -EPERM;
>  
>  	ret = vfio_device_block_group(device);
> @@ -157,7 +157,7 @@ long vfio_device_ioctl_bind_iommufd(struct vfio_device_file *df,
>  	device->cdev_opened = true;
>  	mutex_unlock(&device->dev_set->lock);
>  
> -	if (vfio_device_is_noiommu(device))
> +	if (device->noiommu)
>  		dev_warn(device->dev, "noiommu device is bound to iommufd by user "
>  			 "(%s:%d)\n", current->comm, task_pid_nr(current));
>  	return 0;
> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> index 7aacbd9d08c9..bf4335bce892 100644
> --- a/drivers/vfio/group.c
> +++ b/drivers/vfio/group.c
> @@ -192,7 +192,7 @@ static int vfio_device_group_open(struct vfio_device_file *df)
>  		vfio_device_group_get_kvm_safe(device);
>  
>  	df->iommufd = device->group->iommufd;
> -	if (df->iommufd && vfio_device_is_noiommu(device) && device->open_count == 0) {
> +	if (df->iommufd && device->noiommu && device->open_count == 0) {
>  		ret = vfio_iommufd_compat_probe_noiommu(device,
>  							df->iommufd);
>  		if (ret)
> diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
> index 799ea322a7d4..dfe706f1e952 100644
> --- a/drivers/vfio/iommufd.c
> +++ b/drivers/vfio/iommufd.c
> @@ -71,7 +71,7 @@ int vfio_iommufd_bind(struct vfio_device_file *df)
>  
>  	lockdep_assert_held(&vdev->dev_set->lock);
>  
> -	if (vfio_device_is_noiommu(vdev))
> +	if (vdev->noiommu)
>  		return vfio_iommufd_noiommu_bind(vdev, ictx, &df->devid);
>  
>  	return vdev->ops->bind_iommufd(vdev, ictx, &df->devid);
> @@ -86,7 +86,7 @@ int vfio_iommufd_compat_attach_ioas(struct vfio_device *vdev,
>  	lockdep_assert_held(&vdev->dev_set->lock);
>  
>  	/* compat noiommu does not need to do ioas attach */
> -	if (vfio_device_is_noiommu(vdev))
> +	if (vdev->noiommu)
>  		return 0;
>  
>  	ret = iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id);
> @@ -103,7 +103,7 @@ void vfio_iommufd_unbind(struct vfio_device_file *df)
>  
>  	lockdep_assert_held(&vdev->dev_set->lock);
>  
> -	if (vfio_device_is_noiommu(vdev)) {
> +	if (vdev->noiommu) {
>  		vfio_iommufd_noiommu_unbind(vdev);
>  		return;
>  	}
> @@ -116,7 +116,7 @@ int vfio_iommufd_attach(struct vfio_device *vdev, u32 *pt_id)
>  {
>  	lockdep_assert_held(&vdev->dev_set->lock);
>  
> -	if (vfio_device_is_noiommu(vdev))
> +	if (vdev->noiommu)
>  		return 0;
>  
>  	return vdev->ops->attach_ioas(vdev, pt_id);
> @@ -126,7 +126,7 @@ void vfio_iommufd_detach(struct vfio_device *vdev)
>  {
>  	lockdep_assert_held(&vdev->dev_set->lock);
>  
> -	if (!vfio_device_is_noiommu(vdev))
> +	if (!vdev->noiommu)
>  		vdev->ops->detach_ioas(vdev);
>  }
>  
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index 50553f67600f..c8579d63b2b9 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -106,10 +106,11 @@ bool vfio_device_has_container(struct vfio_device *device);
>  int __init vfio_group_init(void);
>  void vfio_group_cleanup(void);
>  
> -static inline bool vfio_device_is_noiommu(struct vfio_device *vdev)
> +static inline int vfio_device_set_noiommu(struct vfio_device *device)
>  {
> -	return IS_ENABLED(CONFIG_VFIO_NOIOMMU) &&
> -	       vdev->group->type == VFIO_NO_IOMMU;
> +	device->noiommu = IS_ENABLED(CONFIG_VFIO_NOIOMMU) &&
> +			  device->group->type == VFIO_NO_IOMMU;
> +	return 0;
>  }
>  
>  #if IS_ENABLED(CONFIG_VFIO_CONTAINER)
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 8c3f26b4929b..8979f320d620 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -289,8 +289,12 @@ static int __vfio_register_dev(struct vfio_device *device,
>  	if (ret)
>  		return ret;
>  
> +	ret = vfio_device_set_noiommu(device);
> +	if (ret)
> +		goto err_out;
> +
>  	ret = dev_set_name(&device->device, "%svfio%d",
> -			   vfio_device_is_noiommu(device) ? "noiommu-" : "", device->index);
> +			   device->noiommu ? "noiommu-" : "", device->index);
>  	if (ret)
>  		goto err_out;
>  
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index cf9d082a623c..fa13889e763f 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -68,6 +68,7 @@ struct vfio_device {
>  	bool iommufd_attached;
>  #endif
>  	bool cdev_opened:1;
> +	bool noiommu:1;
>  };
>  
>  /**

