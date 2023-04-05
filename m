Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 248DE6D7862
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Apr 2023 11:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF07C10E8AD;
	Wed,  5 Apr 2023 09:32:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C3D10E8AD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Apr 2023 09:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680687159;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iJePrIKmM5p19yIm7M29IOK4mZgEMe/4wGNFN0wD5VI=;
 b=ZoGmpO4lm/uxLSnfhMV6lGBMJb/mAyPoXZ2WhunLkGbG7jFuOa5HFqmfGORNIcL90pCrdR
 n31BcgPlIQJrnSXeUgZk/cAOKG05kW9Tc3203oCzVD6bq9XdtHany/YT2YhqNevavKgedc
 wRFFJPQqMI2InFLByEIvNdlcn6nn+Rw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-1VhPXqY7PcGi_UyDfTfbUw-1; Wed, 05 Apr 2023 05:32:38 -0400
X-MC-Unique: 1VhPXqY7PcGi_UyDfTfbUw-1
Received: by mail-qv1-f70.google.com with SMTP id
 v8-20020a0ccd88000000b005c1927d1609so15826205qvm.12
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 05 Apr 2023 02:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680687155;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iJePrIKmM5p19yIm7M29IOK4mZgEMe/4wGNFN0wD5VI=;
 b=c3/N8sBL8OyIyNv79zpYLGHwOQppawxWvx93HPrisHU/Wnh2AiPk+pWEzwEv4b2efX
 hKxODJ0uxxAuFDgRsTPsKsvO0vLuoJlDeAR2NI3RSznus21WPfRoCbTA25dnhUtenwh0
 HyfSPl3UXhNB3oCizm7O8sO4Ft+ENBWbDIFp3FRWkQxS75BoIiZOSMUMWmdWyADxN0SL
 HwdNtMD56bRMU+Czmkce6IGerywVnhds3PqNCA4q7uOfvOXZu/yzPAhVVydYxSuo2xxi
 fLkdLW5zp6lluqnFVaNzaH7+cht0nPeUtjzg+o8/hfOb1N48rVlU659SQObpHu8trAsM
 qbvg==
X-Gm-Message-State: AAQBX9e8O+zT1OP2RjThJoxVy9JaAKfRhQQymSH3Vg5AkM4ae0B6wSEW
 +iTh0KwV+AIEw8JrEXxCqHXfy3RWq9KpueyzvZDKZSQCVlIlujChyy2UaCwhLwTu02ibBzeh7FN
 ChEgfjHARn+i3QdMs/ZgCUeuPU/oEltMZWg==
X-Received: by 2002:ac8:5d8d:0:b0:3bf:9f6e:a383 with SMTP id
 d13-20020ac85d8d000000b003bf9f6ea383mr3773388qtx.20.1680687154767; 
 Wed, 05 Apr 2023 02:32:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350Za+7n9GSyWy9b45qFE/eA8nCSnC0CPFcZ7xK49KUKdqgO8AfWeVw15E1LUZ5+byQQ44jGWCQ==
X-Received: by 2002:ac8:5d8d:0:b0:3bf:9f6e:a383 with SMTP id
 d13-20020ac85d8d000000b003bf9f6ea383mr3773354qtx.20.1680687154483; 
 Wed, 05 Apr 2023 02:32:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a05620a401300b0074589d41342sm1900175qko.17.2023.04.05.02.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 02:32:33 -0700 (PDT)
Message-ID: <4489a951-710f-a5b1-dcaf-f69d8b21f9fb@redhat.com>
Date: Wed, 5 Apr 2023 11:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 08/12] vfio/pci: Renaming for accepting device fd in
 hot reset path
To: Yi Liu <yi.l.liu@intel.com>, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-9-yi.l.liu@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230401144429.88673-9-yi.l.liu@intel.com>
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
> No functional change is intended.
>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 52 ++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 2a510b71edcb..da6325008872 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -177,10 +177,10 @@ static void vfio_pci_probe_mmaps(struct vfio_pci_core_device *vdev)
>  	}
>  }
>  
> -struct vfio_pci_group_info;
> +struct vfio_pci_file_info;
>  static void vfio_pci_dev_set_try_reset(struct vfio_device_set *dev_set);
>  static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
> -				      struct vfio_pci_group_info *groups,
> +				      struct vfio_pci_file_info *info,
>  				      struct iommufd_ctx *iommufd_ctx);
>  
>  /*
> @@ -800,7 +800,7 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev, void *data)
>  	return 0;
>  }
>  
> -struct vfio_pci_group_info {
> +struct vfio_pci_file_info {
>  	int count;
>  	struct file **files;
>  };
> @@ -1257,14 +1257,14 @@ static int vfio_pci_ioctl_get_pci_hot_reset_info(
>  }
>  
>  static int
> -vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
> -				    struct vfio_pci_hot_reset *hdr,
> -				    bool slot,
> -				    struct vfio_pci_hot_reset __user *arg)
> +vfio_pci_ioctl_pci_hot_reset_files(struct vfio_pci_core_device *vdev,
> +				   struct vfio_pci_hot_reset *hdr,
> +				   bool slot,
> +				   struct vfio_pci_hot_reset __user *arg)
>  {
> -	int32_t *group_fds;
> +	int32_t *fds;
>  	struct file **files;
> -	struct vfio_pci_group_info info;
> +	struct vfio_pci_file_info info;
>  	int file_idx, count = 0, ret = 0;
>  
>  	/*
> @@ -1281,17 +1281,17 @@ vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
>  	if (hdr->count > count)
>  		return -EINVAL;
>  
> -	group_fds = kcalloc(hdr->count, sizeof(*group_fds), GFP_KERNEL);
> +	fds = kcalloc(hdr->count, sizeof(*fds), GFP_KERNEL);
>  	files = kcalloc(hdr->count, sizeof(*files), GFP_KERNEL);
> -	if (!group_fds || !files) {
> -		kfree(group_fds);
> +	if (!fds || !files) {
> +		kfree(fds);
>  		kfree(files);
>  		return -ENOMEM;
>  	}
>  
> -	if (copy_from_user(group_fds, arg->group_fds,
> -			   hdr->count * sizeof(*group_fds))) {
> -		kfree(group_fds);
> +	if (copy_from_user(fds, arg->group_fds,
> +			   hdr->count * sizeof(*fds))) {
> +		kfree(fds);
>  		kfree(files);
>  		return -EFAULT;
>  	}
> @@ -1301,7 +1301,7 @@ vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
>  	 * the reset
>  	 */
>  	for (file_idx = 0; file_idx < hdr->count; file_idx++) {
> -		struct file *file = fget(group_fds[file_idx]);
> +		struct file *file = fget(fds[file_idx]);
>  
>  		if (!file) {
>  			ret = -EBADF;
> @@ -1318,9 +1318,9 @@ vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
>  		files[file_idx] = file;
>  	}
>  
> -	kfree(group_fds);
> +	kfree(fds);
>  
> -	/* release reference to groups on error */
> +	/* release reference to fds on error */
>  	if (ret)
>  		goto hot_reset_release;
>  
> @@ -1358,7 +1358,7 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
>  		return -ENODEV;
>  
>  	if (hdr.count)
> -		return vfio_pci_ioctl_pci_hot_reset_groups(vdev, &hdr, slot, arg);
> +		return vfio_pci_ioctl_pci_hot_reset_files(vdev, &hdr, slot, arg);
>  
>  	iommufd = vfio_iommufd_physical_ictx(&vdev->vdev);
>  
> @@ -2329,16 +2329,16 @@ const struct pci_error_handlers vfio_pci_core_err_handlers = {
>  };
>  EXPORT_SYMBOL_GPL(vfio_pci_core_err_handlers);
>  
> -static bool vfio_dev_in_groups(struct vfio_pci_core_device *vdev,
> -			       struct vfio_pci_group_info *groups)
> +static bool vfio_dev_in_files(struct vfio_pci_core_device *vdev,
> +			      struct vfio_pci_file_info *info)
>  {
>  	unsigned int i;
>  
> -	if (!groups)
> +	if (!info)
>  		return false;
>  
> -	for (i = 0; i < groups->count; i++)
> -		if (vfio_file_has_dev(groups->files[i], &vdev->vdev))
> +	for (i = 0; i < info->count; i++)
> +		if (vfio_file_has_dev(info->files[i], &vdev->vdev))
>  			return true;
>  	return false;
>  }
> @@ -2429,7 +2429,7 @@ static bool vfio_dev_in_iommufd_ctx(struct vfio_pci_core_device *vdev,
>   * get each memory_lock.
>   */
>  static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
> -				      struct vfio_pci_group_info *groups,
> +				      struct vfio_pci_file_info *info,
>  				      struct iommufd_ctx *iommufd_ctx)
>  {
>  	struct vfio_pci_core_device *cur_mem;
> @@ -2478,7 +2478,7 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>  		 * the calling device is in a singleton dev_set.
>  		 */
>  		if (cur_vma->vdev.open_count &&
> -		    !vfio_dev_in_groups(cur_vma, groups) &&
> +		    !vfio_dev_in_files(cur_vma, info) &&
>  		    !vfio_dev_in_iommufd_ctx(cur_vma, iommufd_ctx) &&
>  		    (dev_set->device_count > 1)) {
>  			ret = -EINVAL;

