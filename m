Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CC16D76CE
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Apr 2023 10:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5E210E87D;
	Wed,  5 Apr 2023 08:27:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4262910E87A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Apr 2023 08:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680683273;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GcpHYqJlmxv1qwKFnI+wK9HJlFafvS4mogND4ZGsn60=;
 b=YNuQeT9NhsfVOcUhwKoDDs50oTXo8tfM1UUOTubl5Oku2OMsuZDEehT3IkO8V4EDvSBqPa
 hOqMkoD2uwU5vuWRT+2pZ4eG5/mZj9FqITBu3mmQ/pMtIxIZCWzAE1jyPJ1NlTmFMTmo7r
 XNdTyhMbIvSy6Ggdty26ugXNZEq8u68=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-iQImkEvcMu2pc6CBJb08ug-1; Wed, 05 Apr 2023 04:27:50 -0400
X-MC-Unique: iQImkEvcMu2pc6CBJb08ug-1
Received: by mail-qt1-f197.google.com with SMTP id
 p22-20020a05622a00d600b003e38f7f800bso23656643qtw.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 05 Apr 2023 01:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680683270;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GcpHYqJlmxv1qwKFnI+wK9HJlFafvS4mogND4ZGsn60=;
 b=nydiUQrbX3XzpB2NQNKZziUzZHX/cTXqY6w0oVvgmvW6vAuyfyTGF47SlIaz38hpcn
 VdOhAOOd4v79QX/WTNm/KLKRiluWj88wcMreR/GLyL9JCNpYI7OTJ5KtXnBkX8moJ4p4
 tZXCj44M9OCjJqB9s8ADegaVFYJ3Td2d9XuUNhEbtXrQAza5S98AxyT2ir4bIEPwQphz
 ENIDYKpwY6+fPWtwIeoyeUZnyNNLfJtVtbD0L7d2w3O9jDE5ygvf9cs/6IxVK/+AKXmZ
 vekeIfli4tWz+1SDfjGM1KzSojS8++0MtMQtSZwKPHsHN+R+9k2tSCJGUOFF+GKfI7Ym
 HtgQ==
X-Gm-Message-State: AAQBX9e7gMyvQO11SOfN0L/gk2A9pZx/MaSHVdOD+cpGylpjpbDf90fX
 +ujxwrb8l4l8FJkO7sP3FRnKA02SAfmU+aJaWJNG6vw19bh84dobP9VhrOzuogiSxnrdThTGoqA
 HDC9OKWUou6ulXV7F4F6havetuocaYkSygQ==
X-Received: by 2002:a05:6214:19e9:b0:5ad:a15b:3e6c with SMTP id
 q9-20020a05621419e900b005ada15b3e6cmr8687303qvc.48.1680683269657; 
 Wed, 05 Apr 2023 01:27:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350bbobGfqCwHhoJjnu7RrVhZQap4CeV96CdvBZ8/RqwstJ/htqfWUzacWQApBoEi2broKENu4Q==
X-Received: by 2002:a05:6214:19e9:b0:5ad:a15b:3e6c with SMTP id
 q9-20020a05621419e900b005ada15b3e6cmr8687275qvc.48.1680683269247; 
 Wed, 05 Apr 2023 01:27:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 el7-20020ad459c7000000b005e1e999edcasm3872745qvb.42.2023.04.05.01.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 01:27:47 -0700 (PDT)
Message-ID: <ca119bbd-f4b8-a0c7-5fae-0bea66542908@redhat.com>
Date: Wed, 5 Apr 2023 10:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 06/12] vfio: Refine vfio file kAPIs for vfio PCI hot
 reset
To: Yi Liu <yi.l.liu@intel.com>, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-7-yi.l.liu@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230401144429.88673-7-yi.l.liu@intel.com>
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
On 4/1/23 16:44, Yi Liu wrote:
> This prepares vfio core to accept vfio device file from the vfio PCI
> hot reset path. vfio_file_is_group() is still kept for KVM usage.
>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/group.c             | 32 ++++++++++++++------------------
>  drivers/vfio/pci/vfio_pci_core.c |  4 ++--
>  drivers/vfio/vfio.h              |  2 ++
>  drivers/vfio/vfio_main.c         | 29 +++++++++++++++++++++++++++++
>  include/linux/vfio.h             |  1 +
>  5 files changed, 48 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> index 27d5ba7cf9dc..d0c95d033605 100644
> --- a/drivers/vfio/group.c
> +++ b/drivers/vfio/group.c
> @@ -745,6 +745,15 @@ bool vfio_device_has_container(struct vfio_device *device)
>  	return device->group->container;
>  }
>  
> +struct vfio_group *vfio_group_from_file(struct file *file)
> +{
> +	struct vfio_group *group = file->private_data;
> +
> +	if (file->f_op != &vfio_group_fops)
> +		return NULL;
> +	return group;
> +}
> +
>  /**
>   * vfio_file_iommu_group - Return the struct iommu_group for the vfio group file
>   * @file: VFIO group file
> @@ -755,13 +764,13 @@ bool vfio_device_has_container(struct vfio_device *device)
>   */
>  struct iommu_group *vfio_file_iommu_group(struct file *file)
>  {
> -	struct vfio_group *group = file->private_data;
> +	struct vfio_group *group = vfio_group_from_file(file);
>  	struct iommu_group *iommu_group = NULL;
>  
>  	if (!IS_ENABLED(CONFIG_SPAPR_TCE_IOMMU))
>  		return NULL;
>  
> -	if (!vfio_file_is_group(file))
> +	if (!group)
>  		return NULL;
>  
>  	mutex_lock(&group->group_lock);
> @@ -775,12 +784,12 @@ struct iommu_group *vfio_file_iommu_group(struct file *file)
>  EXPORT_SYMBOL_GPL(vfio_file_iommu_group);
>  
>  /**
> - * vfio_file_is_group - True if the file is usable with VFIO aPIS
> + * vfio_file_is_group - True if the file is a vfio group file
>   * @file: VFIO group file
>   */
>  bool vfio_file_is_group(struct file *file)
>  {
> -	return file->f_op == &vfio_group_fops;
> +	return vfio_group_from_file(file);
>  }
>  EXPORT_SYMBOL_GPL(vfio_file_is_group);
>  
> @@ -842,23 +851,10 @@ void vfio_file_set_kvm(struct file *file, struct kvm *kvm)
>  }
>  EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
>  
> -/**
> - * vfio_file_has_dev - True if the VFIO file is a handle for device
> - * @file: VFIO file to check
> - * @device: Device that must be part of the file
> - *
> - * Returns true if given file has permission to manipulate the given device.
> - */
> -bool vfio_file_has_dev(struct file *file, struct vfio_device *device)
> +bool vfio_group_has_dev(struct vfio_group *group, struct vfio_device *device)
>  {
> -	struct vfio_group *group = file->private_data;
> -
> -	if (!vfio_file_is_group(file))
> -		return false;
> -
>  	return group == device->group;
>  }
> -EXPORT_SYMBOL_GPL(vfio_file_has_dev);
>  
>  static char *vfio_devnode(const struct device *dev, umode_t *mode)
>  {
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index b68fcba67a4b..2a510b71edcb 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -1308,8 +1308,8 @@ vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
>  			break;
>  		}
>  
> -		/* Ensure the FD is a vfio group FD.*/
> -		if (!vfio_file_is_group(file)) {
> +		/* Ensure the FD is a vfio FD. vfio group or vfio device */
it is a bit strange to update the comment here and in the other places
in this patch whereas file_is_valid still sticks to group file check
By the way I would simply remove the comment which does not bring much
> +		if (!vfio_file_is_valid(file)) {
>  			fput(file);
>  			ret = -EINVAL;
>  			break;
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index 7b19c621e0e6..c0aeea24fbd6 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -84,6 +84,8 @@ void vfio_device_group_unregister(struct vfio_device *device);
>  int vfio_device_group_use_iommu(struct vfio_device *device);
>  void vfio_device_group_unuse_iommu(struct vfio_device *device);
>  void vfio_device_group_close(struct vfio_device *device);
> +struct vfio_group *vfio_group_from_file(struct file *file);
> +bool vfio_group_has_dev(struct vfio_group *group, struct vfio_device *device);
>  bool vfio_device_has_container(struct vfio_device *device);
>  int __init vfio_group_init(void);
>  void vfio_group_cleanup(void);
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 89497c933490..fe7446805afd 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -1154,6 +1154,35 @@ const struct file_operations vfio_device_fops = {
>  	.mmap		= vfio_device_fops_mmap,
>  };
>  
> +/**
> + * vfio_file_is_valid - True if the file is valid vfio file
> + * @file: VFIO group file or VFIO device file
I wonder if you shouldn't squash with next patch tbh.
> + */
> +bool vfio_file_is_valid(struct file *file)
> +{
> +	return vfio_group_from_file(file);
> +}
> +EXPORT_SYMBOL_GPL(vfio_file_is_valid);
> +
> +/**
> + * vfio_file_has_dev - True if the VFIO file is a handle for device
> + * @file: VFIO file to check
> + * @device: Device that must be part of the file
> + *
> + * Returns true if given file has permission to manipulate the given device.
> + */
> +bool vfio_file_has_dev(struct file *file, struct vfio_device *device)
> +{
> +	struct vfio_group *group;
> +
> +	group = vfio_group_from_file(file);
> +	if (!group)
> +		return false;
> +
> +	return vfio_group_has_dev(group, device);
> +}
> +EXPORT_SYMBOL_GPL(vfio_file_has_dev);
> +
>  /*
>   * Sub-module support
>   */
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 97a1174b922f..f8fb9ab25188 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -258,6 +258,7 @@ int vfio_mig_get_next_state(struct vfio_device *device,
>   */
>  struct iommu_group *vfio_file_iommu_group(struct file *file);
>  bool vfio_file_is_group(struct file *file);
> +bool vfio_file_is_valid(struct file *file);
>  bool vfio_file_enforced_coherent(struct file *file);
>  void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
>  bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
Eric

