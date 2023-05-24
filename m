Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF8970FF16
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 24 May 2023 22:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BFD10E614;
	Wed, 24 May 2023 20:20:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A954E10E60B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 24 May 2023 20:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684959602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EegkfqA5EXlXDaMvCtZ7J4hr1cwSStqvb2N7Cuhj6OE=;
 b=Q2T0ZfjLP2MalDfub66nmgSbR+B1FDDDsgYlp/cctN8dVIuuHvRXiDQaglGlQ7Q+7ENwDG
 QTA4d6qKUXDTluMx7l8P1toqXyuL7yzZxuz8EnO51hTv9+137DezvguUv+QY9iCWuxns1o
 aAfF8N5Awz2la7DUmv6LZVtlpYMvgnQ=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-DkZw8DDLPoy8dMovS1EThg-1; Wed, 24 May 2023 16:20:01 -0400
X-MC-Unique: DkZw8DDLPoy8dMovS1EThg-1
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-331ab91abdeso19795575ab.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 24 May 2023 13:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684959600; x=1687551600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EegkfqA5EXlXDaMvCtZ7J4hr1cwSStqvb2N7Cuhj6OE=;
 b=TJdohDMvMoNciDNmtyO66dhwmuaXdNRwmbH6vFLR9jBMjjoDgcveVYqHQONl/GxxpM
 jah1uCLZGRu7ReGGzYQRHEm4qJqPVmN5xEzBnrJtof8DXr2fMwsok6GPernZqv7msxqI
 ycB3j5UktpCpMi9Wr19l8Uwcpgj34md7+Oi57tdst65hK9XL9zgqNMVSVqdF285uz/e3
 M+j2SY6WPji6ce/Igfu85UGZQXFHeRtzetmNdAZN8SSTroDm+jctGMla4yUMCBljy0kY
 z/pABeXa8wjnmA5pBlwMAfxLoT6BuVIV5U5YUFQIAfpN/zu8q/2H3kLw/76dIp3xUhrK
 q87g==
X-Gm-Message-State: AC+VfDyslg8ICiJFZvP1/2tEECTdOrO0lHrrs3rJ2GkuxkqxPB+Kmb0K
 VpVGrc4+a1F1kaVyPCmM728QoZfSgZdEwa/zwwWVPx63kgpCObPJGIzPbxsX/FrK1A1IBEieZrZ
 xEROkWlxrDzjBPp6f1+KqjNFBgutIkh0AUQ==
X-Received: by 2002:a92:d389:0:b0:328:8770:b9c2 with SMTP id
 o9-20020a92d389000000b003288770b9c2mr12706842ilo.14.1684959600172; 
 Wed, 24 May 2023 13:20:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6FYSLSN+5lwBDopAeR4Gv749KmekrgMjBNu5QEmxHCyoEg5poCQBqc1LLm7wH3pqfsS9JOPQ==
X-Received: by 2002:a92:d389:0:b0:328:8770:b9c2 with SMTP id
 o9-20020a92d389000000b003288770b9c2mr12706825ilo.14.1684959599888; 
 Wed, 24 May 2023 13:19:59 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 b1-20020a029581000000b003c4e02148e5sm3333184jai.53.2023.05.24.13.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 13:19:59 -0700 (PDT)
Date: Wed, 24 May 2023 14:19:56 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 10/10] vfio/pci: Allow passing zero-length fd array
 in VFIO_DEVICE_PCI_HOT_RESET
Message-ID: <20230524141956.3655fab5.alex.williamson@redhat.com>
In-Reply-To: <20230522115751.326947-11-yi.l.liu@intel.com>
References: <20230522115751.326947-1-yi.l.liu@intel.com>
 <20230522115751.326947-11-yi.l.liu@intel.com>
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

On Mon, 22 May 2023 04:57:51 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> This is the way user to invoke hot-reset for the devices opened by cdev
> interface. User should check the flag VFIO_PCI_HOT_RESET_FLAG_DEV_ID_OWNED
> in the output of VFIO_DEVICE_GET_PCI_HOT_RESET_INFO ioctl before doing
> hot-reset for cdev devices.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 56 +++++++++++++++++++++++++-------
>  include/uapi/linux/vfio.h        | 14 ++++++++
>  2 files changed, 59 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 890065f846e4..67f1cb426505 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -181,7 +181,8 @@ static void vfio_pci_probe_mmaps(struct vfio_pci_core_device *vdev)
>  struct vfio_pci_group_info;
>  static void vfio_pci_dev_set_try_reset(struct vfio_device_set *dev_set);
>  static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
> -				      struct vfio_pci_group_info *groups);
> +				      struct vfio_pci_group_info *groups,
> +				      struct iommufd_ctx *iommufd_ctx);
>  
>  /*
>   * INTx masking requires the ability to disable INTx signaling via PCI_COMMAND
> @@ -1301,8 +1302,7 @@ vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
>  	if (ret)
>  		return ret;
>  
> -	/* Somewhere between 1 and count is OK */
> -	if (!array_count || array_count > count)
> +	if (array_count > count || vfio_device_cdev_opened(&vdev->vdev))
>  		return -EINVAL;
>  
>  	group_fds = kcalloc(array_count, sizeof(*group_fds), GFP_KERNEL);
> @@ -1351,7 +1351,7 @@ vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
>  	info.count = array_count;
>  	info.files = files;
>  
> -	ret = vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, &info);
> +	ret = vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, &info, NULL);
>  
>  hot_reset_release:
>  	for (file_idx--; file_idx >= 0; file_idx--)
> @@ -1380,7 +1380,11 @@ static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
>  	else if (pci_probe_reset_bus(vdev->pdev->bus))
>  		return -ENODEV;
>  
> -	return vfio_pci_ioctl_pci_hot_reset_groups(vdev, hdr.count, slot, arg);
> +	if (hdr.count)
> +		return vfio_pci_ioctl_pci_hot_reset_groups(vdev, hdr.count, slot, arg);
> +
> +	return vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, NULL,
> +					  vfio_iommufd_device_ictx(&vdev->vdev));
>  }
>  
>  static int vfio_pci_ioctl_ioeventfd(struct vfio_pci_core_device *vdev,
> @@ -2347,13 +2351,16 @@ const struct pci_error_handlers vfio_pci_core_err_handlers = {
>  };
>  EXPORT_SYMBOL_GPL(vfio_pci_core_err_handlers);
>  
> -static bool vfio_dev_in_groups(struct vfio_pci_core_device *vdev,
> +static bool vfio_dev_in_groups(struct vfio_device *vdev,
>  			       struct vfio_pci_group_info *groups)
>  {
>  	unsigned int i;
>  
> +	if (!groups)
> +		return false;
> +
>  	for (i = 0; i < groups->count; i++)
> -		if (vfio_file_has_dev(groups->files[i], &vdev->vdev))
> +		if (vfio_file_has_dev(groups->files[i], vdev))
>  			return true;
>  	return false;
>  }
> @@ -2429,7 +2436,8 @@ static int vfio_pci_dev_set_pm_runtime_get(struct vfio_device_set *dev_set)
>   * get each memory_lock.
>   */
>  static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
> -				      struct vfio_pci_group_info *groups)
> +				      struct vfio_pci_group_info *groups,
> +				      struct iommufd_ctx *iommufd_ctx)
>  {
>  	struct vfio_pci_core_device *cur_mem;
>  	struct vfio_pci_core_device *cur_vma;
> @@ -2459,11 +2467,37 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>  		goto err_unlock;
>  
>  	list_for_each_entry(cur_vma, &dev_set->device_list, vdev.dev_set_list) {
> +		bool owned;
> +
>  		/*
> -		 * Test whether all the affected devices are contained by the
> -		 * set of groups provided by the user.
> +		 * Test whether all the affected devices can be reset by the
> +		 * user.
> +		 *
> +		 * If the user provides a set of groups, all the devices
> +		 * in the dev_set should be contained by the set of groups
> +		 * provided by the user.

"If called from a group opened device and the user provides a set of
groups,..."

> +		 *
> +		 * If the user provides a zero-length group fd array, then

"If called from a cdev opened device and the user provides a
zero-length array,..."


> +		 * all the devices in the dev_set must be bound to the same
> +		 * iommufd_ctx as the input iommufd_ctx.  If there is any
> +		 * device that has not been bound to iommufd_ctx yet, check
> +		 * if its iommu_group has any device bound to the input
> +		 * iommufd_ctx Such devices can be considered owned by

"."...........................^

> +		 * the input iommufd_ctx as the device cannot be owned
> +		 * by another iommufd_ctx when its iommu_group is owned.
> +		 *
> +		 * Otherwise, reset is not allowed.


In the case where a non-null array is provided,
vfio_pci_ioctl_pci_hot_reset_groups() explicitly tests
vfio_device_cdev_opened(), so we exclude cdev devices from providing a
group list.  However, what prevents a compat opened group device from
providing a null array?

I thought it would be that this function is called with groups == NULL
and therefore the vfio_dev_in_groups() test below fails, but I don't
think that's true for a compat opened device.  Thanks,

Alex


>  		 */
> -		if (!vfio_dev_in_groups(cur_vma, groups)) {
> +		if (iommufd_ctx) {
> +			int devid = vfio_iommufd_device_hot_reset_devid(&cur_vma->vdev,
> +									iommufd_ctx);
> +
> +			owned = (devid != VFIO_PCI_DEVID_NOT_OWNED);
> +		} else {
> +			owned = vfio_dev_in_groups(&cur_vma->vdev, groups);
> +		}
> +
> +		if (!owned) {
>  			ret = -EINVAL;
>  			goto err_undo;
>  		}
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 01203215251a..24858b650562 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -686,6 +686,9 @@ enum {
>   *	  Flag VFIO_PCI_HOT_RESET_FLAG_DEV_ID_OWNED would be set when all the
>   *	  affected devices are owned by the user.  This flag is available only
>   *	  when VFIO_PCI_HOT_RESET_FLAG_DEV_ID is set, otherwise reserved.
> + *	  When set, user could invoke VFIO_DEVICE_PCI_HOT_RESET with a zero
> + *	  length fd array on the calling device as the ownership is validated
> + *	  by iommufd_ctx.
>   *
>   * Return: 0 on success, -errno on failure:
>   *	-enospc = insufficient buffer, -enodev = unsupported for device.
> @@ -717,6 +720,17 @@ struct vfio_pci_hot_reset_info {
>   * VFIO_DEVICE_PCI_HOT_RESET - _IOW(VFIO_TYPE, VFIO_BASE + 13,
>   *				    struct vfio_pci_hot_reset)
>   *
> + * Userspace requests hot reset for the devices it operates.  Due to the
> + * underlying topology, multiple devices can be affected in the reset
> + * while some might be opened by another user.  To avoid interference
> + * the calling user must ensure all affected devices are owned by itself.
> + *
> + * As the ownership described by VFIO_DEVICE_GET_PCI_HOT_RESET_INFO, the
> + * cdev opened devices must exclusively provide a zero-length fd array and
> + * the group opened devices must exclusively use an array of group fds for
> + * proof of ownership.  Mixed access to devices between cdev and legacy
> + * groups are not supported by this interface.
> + *
>   * Return: 0 on success, -errno on failure.
>   */
>  struct vfio_pci_hot_reset {

