Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBA63ECC2E
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 16 Aug 2021 03:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE9289B60;
	Mon, 16 Aug 2021 01:06:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCA789B60
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 16 Aug 2021 01:05:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="213926604"
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="213926604"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2021 18:05:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="519329009"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2021 18:05:56 -0700
Date: Mon, 16 Aug 2021 08:50:56 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Subject: Re: [bug report] drm/i915/gvt: hold reference of VFIO group during
 opening of vgpu
Message-ID: <20210816005049.GA15842@yzhao56-desk.sh.intel.com>
References: <20210813110419.GA28028@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813110419.GA28028@kili>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, Aug 13, 2021 at 02:04:19PM +0300, Dan Carpenter wrote:
> Hello Yan Zhao,
> 
> The patch 776d95b768e6: "drm/i915/gvt: hold reference of VFIO group
> during opening of vgpu" from Mar 12, 2020, leads to the following
> Smatch static checker warning:
> 
> 	drivers/gpu/drm/i915/gvt/kvmgt.c:919 intel_vgpu_open_device()
> 	warn: 'vfio_group' is an error pointer or valid
> 
> drivers/gpu/drm/i915/gvt/kvmgt.c
>     909 	ret = vfio_register_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY, &events,
>     910 				&vdev->group_notifier);
>     911 	if (ret != 0) {
>     912 		gvt_vgpu_err("vfio_register_notifier for group failed: %d\n",
>     913 			ret);
>     914 		goto undo_iommu;
>     915 	}
>     916 
>     917 	vfio_group = vfio_group_get_external_user_from_dev(mdev_dev(mdev));
>     918 	if (IS_ERR_OR_NULL(vfio_group)) {
>                     ^^^^^^^^^^^^^^^^^^^^^^^^^^
> When a function returns both NULLs and error pointers, then the NULL is
> NOT an error.  This normally happens when a feature has been
> deliberately disabled:
> 
> 	foo = get_optional_feature();
> 
hi Dan,
Thanks for your mail.
The reason IS_ERR_OR_NULL was selected is that I think even the function
returns a valid NULL pointer for whatever reason, kvmgt should refuse to
handle it.
Though I agree we can turn it to IS_ERR safely for now, I'll leave it to
the maintainer to decide whether this change is deserved.

Thanks
Yan

> If the feature is disabled, then the code has to continue without
> printing an error message or crashing.  If the feature has an error then
> that has to be reported to the user and we return an error code.
> 
> In this case, I don't think vfio_group_get_external_user_from_dev()
> returns NULL so the fix is to just change the check to IS_ERR().
> 
> --> 919 		ret = !vfio_group ? -EFAULT : PTR_ERR(vfio_group);
>     920 		gvt_vgpu_err("vfio_group_get_external_user_from_dev failed\n");
>     921 		goto undo_register;
>     922 	}
>     923 	vdev->vfio_group = vfio_group;
>     924 
>     925 	/* Take a module reference as mdev core doesn't take
>     926 	 * a reference for vendor driver.
>     927 	 */
>     928 	if (!try_module_get(THIS_MODULE)) {
>     929 		ret = -ENODEV;
>     930 		goto undo_group;
>     931 	}
>     932 
>     933 	ret = kvmgt_guest_init(mdev);
>     934 	if (ret)
>     935 		goto undo_group;
>     936 
>     937 	intel_gvt_ops->vgpu_activate(vgpu);
>     938 
>     939 	atomic_set(&vdev->released, 0);
>     940 	return ret;
>     941 
>     942 undo_group:
>     943 	vfio_group_put_external_user(vdev->vfio_group);
>     944 	vdev->vfio_group = NULL;
>     945 
>     946 undo_register:
>     947 	vfio_unregister_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY,
>     948 					&vdev->group_notifier);
>     949 
>     950 undo_iommu:
>     951 	vfio_unregister_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
>     952 					&vdev->iommu_notifier);
>     953 out:
>     954 	return ret;
>     955 }
> 
> regards,
> dan carpenter
