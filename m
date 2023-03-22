Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B22386C4D73
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 22 Mar 2023 15:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8129510E95D;
	Wed, 22 Mar 2023 14:22:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE51110E38A;
 Wed, 22 Mar 2023 14:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679494946; x=1711030946;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=StLSUG9jSdG4qzMIdPRlmgOzudWc7UibT0yv+xP5TNI=;
 b=lknA6XlkU4H+l8j21jG53FbM8/Pp292PGvpmqyKXQQA5/FRi5SCOksvP
 zdLlrPQCO2MjnjwE9Cr6UJsMg/tRq2K7t2ojowYqwlIcj7GBb5A5VlHqw
 74VEtHV7GxJxGQI66iBeJfKL3qlfVcYbELxw7CGcM+hwngjUJKV+gft3Z
 kzCIz/kC62l9C2yZNZXksKElMWlobwO+D71hcjLc4nLavp2ZaZFXhh6jo
 pB87uiAT5D10V9fS7UKQYG/mf2/CcB0pkcCgMY/jESIpug1Th5AUOKbco
 xhyMvEI+lBg9B5dBECd7M8giV7SQPNFQT7xp+HDzGFZCe9OUPh/et7ysE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="340760578"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="340760578"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 07:22:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="927846116"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="927846116"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by fmsmga006.fm.intel.com with ESMTP; 22 Mar 2023 07:22:20 -0700
Date: Wed, 22 Mar 2023 22:10:55 +0800
From: Xu Yilun <yilun.xu@intel.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 05/24] kvm/vfio: Accept vfio device file from userspace
Message-ID: <ZBsMb3L4LmmK5tHW@yilunxu-OptiPlex-7050>
References: <20230308132903.465159-1-yi.l.liu@intel.com>
 <20230308132903.465159-6-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308132903.465159-6-yi.l.liu@intel.com>
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
 peterx@redhat.com, terrence.xu@intel.com, chao.p.peng@linux.intel.com,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org, lulu@redhat.com,
 joro@8bytes.org, nicolinc@nvidia.com, jgg@nvidia.com, kevin.tian@intel.com,
 yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 alex.williamson@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 yi.y.sun@linux.intel.com, cohuck@redhat.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 2023-03-08 at 05:28:44 -0800, Yi Liu wrote:
> This defines KVM_DEV_VFIO_FILE* and make alias with KVM_DEV_VFIO_GROUP*.
> Old userspace uses KVM_DEV_VFIO_GROUP* works as well.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>  Documentation/virt/kvm/devices/vfio.rst | 52 +++++++++++++++++--------
>  include/uapi/linux/kvm.h                | 16 ++++++--
>  virt/kvm/vfio.c                         | 16 ++++----
>  3 files changed, 55 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/devices/vfio.rst b/Documentation/virt/kvm/devices/vfio.rst
> index 79b6811bb4f3..5b05b48abaab 100644
> --- a/Documentation/virt/kvm/devices/vfio.rst
> +++ b/Documentation/virt/kvm/devices/vfio.rst
> @@ -9,24 +9,37 @@ Device types supported:
>    - KVM_DEV_TYPE_VFIO
>  
>  Only one VFIO instance may be created per VM.  The created device
> -tracks VFIO groups in use by the VM and features of those groups
> -important to the correctness and acceleration of the VM.  As groups
> -are enabled and disabled for use by the VM, KVM should be updated
> -about their presence.  When registered with KVM, a reference to the
> -VFIO-group is held by KVM.
> +tracks VFIO files (group or device) in use by the VM and features
> +of those groups/devices important to the correctness and acceleration
> +of the VM.  As groups/devices are enabled and disabled for use by the
> +VM, KVM should be updated about their presence.  When registered with
> +KVM, a reference to the VFIO file is held by KVM.
>  
>  Groups:
> -  KVM_DEV_VFIO_GROUP
> -
> -KVM_DEV_VFIO_GROUP attributes:
> -  KVM_DEV_VFIO_GROUP_ADD: Add a VFIO group to VFIO-KVM device tracking
> -	kvm_device_attr.addr points to an int32_t file descriptor
> -	for the VFIO group.
> -  KVM_DEV_VFIO_GROUP_DEL: Remove a VFIO group from VFIO-KVM device tracking
> -	kvm_device_attr.addr points to an int32_t file descriptor
> -	for the VFIO group.
> -  KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE: attaches a guest visible TCE table
> +  KVM_DEV_VFIO_FILE
> +	alias: KVM_DEV_VFIO_GROUP
> +
> +KVM_DEV_VFIO_FILE attributes:
> +  KVM_DEV_VFIO_FILE_ADD: Add a VFIO file (group/device) to VFIO-KVM device
> +	tracking
> +
> +	alias: KVM_DEV_VFIO_GROUP_ADD
> +
> +	kvm_device_attr.addr points to an int32_t file descriptor for the
> +	VFIO file.

A blank line here to be consistent with other attibutes.

> +  KVM_DEV_VFIO_FILE_DEL: Remove a VFIO file (group/device) from VFIO-KVM
> +	device tracking
> +
> +	alias: KVM_DEV_VFIO_GROUP_DEL
> +
> +	kvm_device_attr.addr points to an int32_t file descriptor for the
> +	VFIO file.
> +
> +  KVM_DEV_VFIO_FILE_SET_SPAPR_TCE: attaches a guest visible TCE table
>  	allocated by sPAPR KVM.
> +
> +	alias: KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE
> +
>  	kvm_device_attr.addr points to a struct::
>  
>  		struct kvm_vfio_spapr_tce {
> @@ -40,9 +53,14 @@ KVM_DEV_VFIO_GROUP attributes:
>  	- @tablefd is a file descriptor for a TCE table allocated via
>  	  KVM_CREATE_SPAPR_TCE.
>  
> +	only accepts vfio group file as SPAPR has no iommufd support
> +
>  ::
>  
> -The GROUP_ADD operation above should be invoked prior to accessing the
> +The FILE/GROUP_ADD operation above should be invoked prior to accessing the
>  device file descriptor via VFIO_GROUP_GET_DEVICE_FD in order to support
>  drivers which require a kvm pointer to be set in their .open_device()
> -callback.
> +callback.  It is the same for device file descriptor via character device
> +open which gets device access via VFIO_DEVICE_BIND_IOMMUFD.  For such file
> +descriptors, FILE_ADD should be invoked before VFIO_DEVICE_BIND_IOMMUFD
> +to support the drivers mentioned in piror sentence as well.

s/piror/prior

Thanks,
Yilun
