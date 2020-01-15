Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9A613CDBA
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Jan 2020 21:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E856EA8E;
	Wed, 15 Jan 2020 20:06:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8706EA8E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Jan 2020 20:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579118804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hZZ6QGHlswsnWLIhtTgYkdMVsWArToLiB6OrJPcJkRk=;
 b=RgyHccKGSTNHc9E3+WZ0uxIVvXJy20g9dpj9RWJtule7ouZLZXHkmG4jr6LSR/bsPNYCEb
 zgrNAMSxBopZzPa2RnTWZtBJn3U4hnhpoLvdSNpIUbPTUNYA2Uxevjio5//+5GEysk8dyu
 Tbm9m3sfJ+pcgizqZ7dyn9EFUWoo4rc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-C3FWJw7ZPD-RPcPBzl-2Eg-1; Wed, 15 Jan 2020 15:06:43 -0500
X-MC-Unique: C3FWJw7ZPD-RPcPBzl-2Eg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC2B7800D48;
 Wed, 15 Jan 2020 20:06:41 +0000 (UTC)
Received: from w520.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E9FD82486;
 Wed, 15 Jan 2020 20:06:39 +0000 (UTC)
Date: Wed, 15 Jan 2020 13:06:38 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v2 1/2] vfio: introduce vfio_dma_rw to read/write a
 range of IOVAs
Message-ID: <20200115130638.6926dd08@w520.home>
In-Reply-To: <20200115035303.12362-1-yan.y.zhao@intel.com>
References: <20200115034132.2753-1-yan.y.zhao@intel.com>
 <20200115035303.12362-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: kevin.tian@intel.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhenyuw@linux.intel.com, peterx@redhat.com, pbonzini@redhat.com,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 14 Jan 2020 22:53:03 -0500
Yan Zhao <yan.y.zhao@intel.com> wrote:

> vfio_dma_rw will read/write a range of user space memory pointed to by
> IOVA into/from a kernel buffer without pinning the user space memory.
> 
> TODO: mark the IOVAs to user space memory dirty if they are written in
> vfio_dma_rw().
> 
> Cc: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
>  drivers/vfio/vfio.c             | 45 +++++++++++++++++++
>  drivers/vfio/vfio_iommu_type1.c | 76 +++++++++++++++++++++++++++++++++
>  include/linux/vfio.h            |  5 +++
>  3 files changed, 126 insertions(+)
> 
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index c8482624ca34..8bd52bc841cf 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -1961,6 +1961,51 @@ int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn, int npage)
>  }
>  EXPORT_SYMBOL(vfio_unpin_pages);
>  
> +/*
> + * Read/Write a range of IOVAs pointing to user space memory into/from a kernel
> + * buffer without pinning the user space memory
> + * @dev [in]  : device
> + * @iova [in] : base IOVA of a user space buffer
> + * @data [in] : pointer to kernel buffer
> + * @len [in]  : kernel buffer length
> + * @write     : indicate read or write
> + * Return error code on failure or 0 on success.
> + */
> +int vfio_dma_rw(struct device *dev, dma_addr_t iova, void *data,
> +		   size_t len, bool write)
> +{
> +	struct vfio_container *container;
> +	struct vfio_group *group;
> +	struct vfio_iommu_driver *driver;
> +	int ret = 0;
> +
> +	if (!dev || !data || len <= 0)
> +		return -EINVAL;
> +
> +	group = vfio_group_get_from_dev(dev);
> +	if (!group)
> +		return -ENODEV;
> +
> +	ret = vfio_group_add_container_user(group);
> +	if (ret)
> +		goto out;
> +
> +	container = group->container;
> +	driver = container->iommu_driver;
> +
> +	if (likely(driver && driver->ops->dma_rw))
> +		ret = driver->ops->dma_rw(container->iommu_data,
> +					   iova, data, len, write);
> +	else
> +		ret = -ENOTTY;
> +
> +	vfio_group_try_dissolve_container(group);
> +out:
> +	vfio_group_put(group);
> +	return ret;
> +}
> +EXPORT_SYMBOL(vfio_dma_rw);
> +
>  static int vfio_register_iommu_notifier(struct vfio_group *group,
>  					unsigned long *events,
>  					struct notifier_block *nb)
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 2ada8e6cdb88..a2d850b97ae6 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -27,6 +27,7 @@
>  #include <linux/iommu.h>
>  #include <linux/module.h>
>  #include <linux/mm.h>
> +#include <linux/mmu_context.h>
>  #include <linux/rbtree.h>
>  #include <linux/sched/signal.h>
>  #include <linux/sched/mm.h>
> @@ -2326,6 +2327,80 @@ static int vfio_iommu_type1_unregister_notifier(void *iommu_data,
>  	return blocking_notifier_chain_unregister(&iommu->notifier, nb);
>  }
>  
> +static size_t vfio_iommu_type1_rw_dma_nopin(struct vfio_iommu *iommu,
> +					    dma_addr_t iova, void *data,
> +					    size_t count, bool write)

"_nopin"?  It might be pinned, but that's irrelevant to this interface.
Maybe "_chunk" as we're only trying to operate on the chunk of the whole
that fits within the next vfio_dma?  Also swapping rw_dma vs dma_rw,
pick one.

> +{
> +	struct mm_struct *mm;
> +	unsigned long vaddr;
> +	struct vfio_dma *dma;
> +	bool kthread = current->mm == NULL;
> +	size_t done = 0;
> +	size_t offset;
> +
> +	dma = vfio_find_dma(iommu, iova, 1);
> +	if (!dma)
> +		return 0;
> +
> +	if (write && !(dma->prot & IOMMU_WRITE))
> +		return 0;

Good catch, but users can also designate a mapping without read
permissions, in which case this interface should not allow read either.
Thanks,

Alex

> +
> +	mm = get_task_mm(dma->task);
> +
> +	if (!mm)
> +		return 0;
> +
> +	if (kthread)
> +		use_mm(mm);
> +	else if (current->mm != mm)
> +		goto out;
> +
> +	offset = iova - dma->iova;
> +
> +	if (count > dma->size - offset)
> +		count = dma->size - offset;
> +
> +	vaddr = dma->vaddr + offset;
> +
> +	if (write)
> +		done = __copy_to_user((void __user *)vaddr, data, count) ?
> +				       0 : count;
> +	else
> +		done = __copy_from_user(data, (void __user *)vaddr, count) ?
> +					0 : count;
> +
> +	if (kthread)
> +		unuse_mm(mm);
> +out:
> +	mmput(mm);
> +	return done;
> +}
> +
> +static int vfio_iommu_type1_dma_rw(void *iommu_data, dma_addr_t iova,
> +				   void *data, size_t count, bool write)
> +{
> +	struct vfio_iommu *iommu = iommu_data;
> +	int ret = 0;
> +	size_t done = 0;
> +
> +	mutex_lock(&iommu->lock);
> +	while (count > 0) {
> +		done = vfio_iommu_type1_rw_dma_nopin(iommu, iova, data,
> +						   count, write);
> +		if (!done) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		count -= done;
> +		data += done;
> +		iova += done;
> +	}
> +
> +	mutex_unlock(&iommu->lock);
> +	return ret;
> +}
> +
>  static const struct vfio_iommu_driver_ops vfio_iommu_driver_ops_type1 = {
>  	.name			= "vfio-iommu-type1",
>  	.owner			= THIS_MODULE,
> @@ -2338,6 +2413,7 @@ static const struct vfio_iommu_driver_ops vfio_iommu_driver_ops_type1 = {
>  	.unpin_pages		= vfio_iommu_type1_unpin_pages,
>  	.register_notifier	= vfio_iommu_type1_register_notifier,
>  	.unregister_notifier	= vfio_iommu_type1_unregister_notifier,
> +	.dma_rw			= vfio_iommu_type1_dma_rw,
>  };
>  
>  static int __init vfio_iommu_type1_init(void)
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index e42a711a2800..962f76a2d668 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -82,6 +82,8 @@ struct vfio_iommu_driver_ops {
>  					     struct notifier_block *nb);
>  	int		(*unregister_notifier)(void *iommu_data,
>  					       struct notifier_block *nb);
> +	int		(*dma_rw)(void *iommu_data, dma_addr_t iova,
> +				   void *data, size_t count, bool write);
>  };
>  
>  extern int vfio_register_iommu_driver(const struct vfio_iommu_driver_ops *ops);
> @@ -107,6 +109,9 @@ extern int vfio_pin_pages(struct device *dev, unsigned long *user_pfn,
>  extern int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn,
>  			    int npage);
>  
> +extern int vfio_dma_rw(struct device *dev, dma_addr_t iova, void *data,
> +		       size_t len, bool write);
> +
>  /* each type has independent events */
>  enum vfio_notify_type {
>  	VFIO_IOMMU_NOTIFY = 0,

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
