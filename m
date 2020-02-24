Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D7916B020
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 Feb 2020 20:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436526E8E6;
	Mon, 24 Feb 2020 19:15:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566006E8E6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 24 Feb 2020 19:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582571716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tp4/gxoVZyLzsQZK2RbOdubU9uGDPKG6UpGp1hSp4Fo=;
 b=AUMFqsbwLNxzP3dqQhXVcXM7kp6O45AY02zvVsNLx/B0AsRU5IKHbpXFSxNxVHj8sLTCPd
 BLtR+8PZVv4implhY9lscLZaiKbpO6MVVizm8j3KZsF6AjkAcOktEW0v5wZl1OuTQ+boZz
 ctJk3YBCTxfEVYOO2Ctr+avwQmWd+t4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-F7BL3YwJPta8MWRBmXzx4w-1; Mon, 24 Feb 2020 14:15:10 -0500
X-MC-Unique: F7BL3YwJPta8MWRBmXzx4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE648107ACCC;
 Mon, 24 Feb 2020 19:15:08 +0000 (UTC)
Received: from w520.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72C7A90F46;
 Mon, 24 Feb 2020 19:15:05 +0000 (UTC)
Date: Mon, 24 Feb 2020 12:15:04 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v3 1/7] vfio: allow external user to get vfio group from
 device
Message-ID: <20200224121504.367cdfb4@w520.home>
In-Reply-To: <20200224084641.31696-1-yan.y.zhao@intel.com>
References: <20200224084350.31574-1-yan.y.zhao@intel.com>
 <20200224084641.31696-1-yan.y.zhao@intel.com>
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

On Mon, 24 Feb 2020 03:46:41 -0500
Yan Zhao <yan.y.zhao@intel.com> wrote:

> external user is able to
> 1. add a device into an vfio group

How so?  The device is added via existing mechanisms, the only thing
added here is an interface to get a group reference from a struct
device.

> 2. call vfio_group_get_external_user_from_dev() with the device pointer
> to get vfio_group associated with this device and increments the container
> user counter to prevent the VFIO group from disposal before KVM exits.
> 3. When the external KVM finishes, it calls vfio_group_put_external_user()
> to release the VFIO group.
> 
> Suggested-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
>  drivers/vfio/vfio.c  | 37 +++++++++++++++++++++++++++++++++++++
>  include/linux/vfio.h |  2 ++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index c8482624ca34..914bdf4b9d73 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -1720,6 +1720,43 @@ struct vfio_group *vfio_group_get_external_user(struct file *filep)
>  }
>  EXPORT_SYMBOL_GPL(vfio_group_get_external_user);
>  
> +/**
> + * External user API, exported by symbols to be linked dynamically.
> + *
> + * The protocol includes:
> + * 1. External user add a device into a vfio group
> + *
> + * 2. The external user calls vfio_group_get_external_user_from_dev()
> + * with the device pointer
> + * to verify that:
> + *	- there's a vfio group associated with it and is initialized;
> + *	- IOMMU is set for the vfio group.
> + * If both checks passed, vfio_group_get_external_user_from_dev()
> + * increments the container user counter to prevent
> + * the VFIO group from disposal before KVM exits.
> + *
> + * 3. When the external KVM finishes, it calls
> + * vfio_group_put_external_user() to release the VFIO group.
> + * This call decrements the container user counter.
> + */

I don't think we need to duplicate this whole comment block for a
_from_dev() version of the existing vfio_group_get_external_user().
Please merge the comments.

> +
> +struct vfio_group *vfio_group_get_external_user_from_dev(struct device *dev)
> +{
> +	struct vfio_group *group;
> +	int ret;
> +
> +	group = vfio_group_get_from_dev(dev);
> +	if (!group)
> +		return ERR_PTR(-ENODEV);
> +
> +	ret = vfio_group_add_container_user(group);
> +	if (ret)
> +		return ERR_PTR(ret);

Error path leaks group reference.

> +
> +	return group;
> +}
> +EXPORT_SYMBOL_GPL(vfio_group_get_external_user_from_dev);
> +
>  void vfio_group_put_external_user(struct vfio_group *group)
>  {
>  	vfio_group_try_dissolve_container(group);
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index e42a711a2800..2e1fa0c7396f 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -94,6 +94,8 @@ extern void vfio_unregister_iommu_driver(
>   */
>  extern struct vfio_group *vfio_group_get_external_user(struct file *filep);
>  extern void vfio_group_put_external_user(struct vfio_group *group);
> +extern
> +struct vfio_group *vfio_group_get_external_user_from_dev(struct device *dev);

Slight cringe at this line wrap, personally would prefer to wrap the
args as done repeatedly elsewhere in this file.  Thanks,

Alex

>  extern bool vfio_external_group_match_file(struct vfio_group *group,
>  					   struct file *filep);
>  extern int vfio_external_user_iommu_id(struct vfio_group *group);

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
