Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEB46FEC66
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 11 May 2023 09:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DBD10E085;
	Thu, 11 May 2023 07:11:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DF510E085
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 11 May 2023 07:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683789078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZNiRCSQizjrLet4+w7YasYKR5X4+4EtQJ4aMJEQXXo0=;
 b=YMCbe5UTXpAmMD/eyUaEztR39befzgPgD+9lYf6HKtBHetZgERBPvWOZ+AuYEhfeATAK1v
 TCfYiWQlGfZP0ghazN63dhWbNgeFSCh9RB1ArAgV73r6j/qB43aHmgiB4jnxdiHk4lPhZ2
 JPPTGQ+azmOQsTRn1uzbTh0bvvyHDpw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577--MhAODDKPDGv5AD6rEUteQ-1; Thu, 11 May 2023 03:11:15 -0400
X-MC-Unique: -MhAODDKPDGv5AD6rEUteQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3079c6648e3so2592681f8f.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 11 May 2023 00:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683789074; x=1686381074;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZNiRCSQizjrLet4+w7YasYKR5X4+4EtQJ4aMJEQXXo0=;
 b=ZroFNEGEiQUtQAqb+DScFheuBZuP2R82YYgUqiJUIX4me3fj4hp9bHniZCLzGWzgfE
 8zrnwNgb0c3V6PyHcPGthpRByHnA8f79co2AyEZZenhdlxn+f3i0adr7W3I/mC16ioyl
 K3Ic848T+ivHE5GkIZXHP+ZVbEfMe3uJPckLMQh1Y0A1JFbgSW6LoWBgWAoBlNCahjCd
 dH1wTZfNV9oSlrPjGpPqo65glC3VcHNoxXSYNXey1iZfAxGhRyHqX7y6C8yCGhdrIaE3
 KP/1VtuS9wwu//imCcXys5Plj6+0Cidf377CfHefW8x/Wf0KCYTpIWDE2w7P0N+sYUn8
 qLAQ==
X-Gm-Message-State: AC+VfDzRqDWbpErxTkDX8oUDGN7+RzeC7K8/5OF7HDJ92z/Lu3Tbm++C
 Et8xHADWQv52IxOb5Rm/CImme2Iyj+e0gPrfASYKHzCceADSmGRPUTLoB504AXyzM9xSGBqpoDP
 PmuAD+ywx6B6Lcx3Sg+U4hNrSXBmdOgYE0w==
X-Received: by 2002:adf:f302:0:b0:306:3b78:fe33 with SMTP id
 i2-20020adff302000000b003063b78fe33mr14011144wro.32.1683789074241; 
 Thu, 11 May 2023 00:11:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6yKhoWUVKatWXlNJACwaNqY57Nig7w2ksG7ecoiA64DliEZhMpd3/Eh87z/qa0jstH/lFHKQ==
X-Received: by 2002:adf:f302:0:b0:306:3b78:fe33 with SMTP id
 i2-20020adff302000000b003063b78fe33mr14011111wro.32.1683789073839; 
 Thu, 11 May 2023 00:11:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 i6-20020adfdec6000000b002c70ce264bfsm19376071wrn.76.2023.05.11.00.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 00:11:13 -0700 (PDT)
Message-ID: <0805efa4-9376-7485-e52b-d53216f74482@redhat.com>
Date: Thu, 11 May 2023 09:11:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 05/22] kvm/vfio: Accept vfio device file from userspace
To: Yi Liu <yi.l.liu@intel.com>, alex.williamson@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com
References: <20230426150321.454465-1-yi.l.liu@intel.com>
 <20230426150321.454465-6-yi.l.liu@intel.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <20230426150321.454465-6-yi.l.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 peterx@redhat.com, terrence.xu@intel.com, chao.p.peng@linux.intel.com,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org, lulu@redhat.com,
 zhenzhong.duan@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, yanting.jiang@intel.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 4/26/23 17:03, Yi Liu wrote:
> This defines KVM_DEV_VFIO_FILE* and make alias with KVM_DEV_VFIO_GROUP*.
> Old userspace uses KVM_DEV_VFIO_GROUP* works as well.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>   Documentation/virt/kvm/devices/vfio.rst | 47 ++++++++++++++++---------
>   include/uapi/linux/kvm.h                | 13 +++++--
>   virt/kvm/vfio.c                         | 16 ++++-----
>   3 files changed, 49 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/devices/vfio.rst b/Documentation/virt/kvm/devices/vfio.rst
> index 08b544212638..c549143bb891 100644
> --- a/Documentation/virt/kvm/devices/vfio.rst
> +++ b/Documentation/virt/kvm/devices/vfio.rst
> @@ -9,22 +9,34 @@ Device types supported:
>     - KVM_DEV_TYPE_VFIO
>   
>   Only one VFIO instance may be created per VM.  The created device
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
>   Groups:
> -  KVM_DEV_VFIO_GROUP
> -
> -KVM_DEV_VFIO_GROUP attributes:
> -  KVM_DEV_VFIO_GROUP_ADD: Add a VFIO group to VFIO-KVM device tracking
> -	kvm_device_attr.addr points to an int32_t file descriptor
> -	for the VFIO group.
> -  KVM_DEV_VFIO_GROUP_DEL: Remove a VFIO group from VFIO-KVM device tracking
> -	kvm_device_attr.addr points to an int32_t file descriptor
> -	for the VFIO group.
> +  KVM_DEV_VFIO_FILE
> +	alias: KVM_DEV_VFIO_GROUP
> +
> +KVM_DEV_VFIO_FILE attributes:
> +  KVM_DEV_VFIO_FILE_ADD: Add a VFIO file (group/device) to VFIO-KVM device
> +	tracking
> +
> +	kvm_device_attr.addr points to an int32_t file descriptor for the
> +	VFIO file.
> +
> +  KVM_DEV_VFIO_FILE_DEL: Remove a VFIO file (group/device) from VFIO-KVM
> +	device tracking
> +
> +	kvm_device_attr.addr points to an int32_t file descriptor for the
> +	VFIO file.
> +
> +KVM_DEV_VFIO_GROUP (legacy kvm device group restricted to the handling of VFIO group fd):
> +  KVM_DEV_VFIO_GROUP_ADD: same as KVM_DEV_VFIO_FILE_ADD for group fd only
> +
> +  KVM_DEV_VFIO_GROUP_DEL: same as KVM_DEV_VFIO_FILE_DEL for group fd only
> +
>     KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE: attaches a guest visible TCE table
>   	allocated by sPAPR KVM.
>   	kvm_device_attr.addr points to a struct::
> @@ -40,7 +52,10 @@ KVM_DEV_VFIO_GROUP attributes:
>   	- @tablefd is a file descriptor for a TCE table allocated via
>   	  KVM_CREATE_SPAPR_TCE.
>   
> -The GROUP_ADD operation above should be invoked prior to accessing the
> +The FILE/GROUP_ADD operation above should be invoked prior to accessing the
>   device file descriptor via VFIO_GROUP_GET_DEVICE_FD in order to support
>   drivers which require a kvm pointer to be set in their .open_device()
> -callback.
> +callback.  It is the same for device file descriptor via character device
> +open which gets device access via VFIO_DEVICE_BIND_IOMMUFD.  For such file
> +descriptors, FILE_ADD should be invoked before VFIO_DEVICE_BIND_IOMMUFD
> +to support the drivers mentioned in prior sentence as well.
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index d77aef872a0a..7980c7533136 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1410,9 +1410,16 @@ struct kvm_device_attr {
>   	__u64	addr;		/* userspace address of attr data */
>   };
>   
> -#define  KVM_DEV_VFIO_GROUP			1
> -#define   KVM_DEV_VFIO_GROUP_ADD			1
> -#define   KVM_DEV_VFIO_GROUP_DEL			2
> +#define  KVM_DEV_VFIO_FILE			1
> +
> +#define   KVM_DEV_VFIO_FILE_ADD			1
> +#define   KVM_DEV_VFIO_FILE_DEL			2
> +
> +/* KVM_DEV_VFIO_GROUP aliases are for compile time uapi compatibility */
> +#define  KVM_DEV_VFIO_GROUP	KVM_DEV_VFIO_FILE
> +
> +#define   KVM_DEV_VFIO_GROUP_ADD	KVM_DEV_VFIO_FILE_ADD
> +#define   KVM_DEV_VFIO_GROUP_DEL	KVM_DEV_VFIO_FILE_DEL
>   #define   KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE		3
>   
>   enum kvm_device_type {
> diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
> index 8f7fa07e8170..10a3c7ccadf1 100644
> --- a/virt/kvm/vfio.c
> +++ b/virt/kvm/vfio.c
> @@ -286,18 +286,18 @@ static int kvm_vfio_set_file(struct kvm_device *dev, long attr,
>   	int32_t fd;
>   
>   	switch (attr) {
> -	case KVM_DEV_VFIO_GROUP_ADD:
> +	case KVM_DEV_VFIO_FILE_ADD:
>   		if (get_user(fd, argp))
>   			return -EFAULT;
>   		return kvm_vfio_file_add(dev, fd);
>   
> -	case KVM_DEV_VFIO_GROUP_DEL:
> +	case KVM_DEV_VFIO_FILE_DEL:
>   		if (get_user(fd, argp))
>   			return -EFAULT;
>   		return kvm_vfio_file_del(dev, fd);
>   
>   #ifdef CONFIG_SPAPR_TCE_IOMMU
> -	case KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE:
> +	case KVM_DEV_VFIO_FILE_SET_SPAPR_TCE:

This should still be DEV_VFIO_GROUP_SET_SPAPR_TCE. Same below.

>   		return kvm_vfio_file_set_spapr_tce(dev, arg);
>   #endif
>   	}
> @@ -309,7 +309,7 @@ static int kvm_vfio_set_attr(struct kvm_device *dev,
>   			     struct kvm_device_attr *attr)
>   {
>   	switch (attr->group) {
> -	case KVM_DEV_VFIO_GROUP:
> +	case KVM_DEV_VFIO_FILE:
>   		return kvm_vfio_set_file(dev, attr->attr,
>   					 u64_to_user_ptr(attr->addr));
>   	}
> @@ -321,12 +321,12 @@ static int kvm_vfio_has_attr(struct kvm_device *dev,
>   			     struct kvm_device_attr *attr)
>   {
>   	switch (attr->group) {
> -	case KVM_DEV_VFIO_GROUP:
> +	case KVM_DEV_VFIO_FILE:
>   		switch (attr->attr) {
> -		case KVM_DEV_VFIO_GROUP_ADD:
> -		case KVM_DEV_VFIO_GROUP_DEL:
> +		case KVM_DEV_VFIO_FILE_ADD:
> +		case KVM_DEV_VFIO_FILE_DEL:
>   #ifdef CONFIG_SPAPR_TCE_IOMMU
> -		case KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE:
> +		case KVM_DEV_VFIO_FILE_SET_SPAPR_TCE:

Probably an error due to a global rename change.

Thanks,

C.

>   #endif
>   			return 0;
>   		}

