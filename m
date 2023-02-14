Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFE36970B5
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Feb 2023 23:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1024B10E9B6;
	Tue, 14 Feb 2023 22:26:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BBA10E9B6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Feb 2023 22:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676413591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=um02ikLd6nJv6WURDElSwLGGHyUNRrZKQet69e40WFc=;
 b=QnIo51UDv+oIPAcEwY6tSVgZGO1vBi8XISmKsrtc6ANdkbRB9F4vbHGPIvBzJ6NGkZ1fLS
 SveF1UwKD7fg0ul9o0EJqyCWI94kik2uetN7xqGhWwj723ufiLJgeKkkiUE9ePUfP+qE/t
 6/57DezPJain+4sZUatVLdnmMVyatVU=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-TSzfEuPMNt6XQ9cv5xhdEg-1; Tue, 14 Feb 2023 17:26:30 -0500
X-MC-Unique: TSzfEuPMNt6XQ9cv5xhdEg-1
Received: by mail-io1-f70.google.com with SMTP id
 z23-20020a6b6517000000b00718172881acso10937370iob.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Feb 2023 14:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=um02ikLd6nJv6WURDElSwLGGHyUNRrZKQet69e40WFc=;
 b=lQU4sa9WfRysBq4AqyQD/m8FZwWOx0VzjD9wz1TnpNoLCA+tjhsZk+ukp9KH95tmUS
 xx/coaIjdUyFa4x9GriexluiqBGr2tgYjpA8zUaisPmBBpXngPh0k3tjHOZM9Yrs6ZPT
 82ylZtBZGYRqQSUnVgCtWz+u/3CHpnvk7V/nSJUzY9s7yQxdQDLfWwj7ObsQyLVeRr7j
 /Dcwb0dQqxyj3y+gBSJQ7Kav1+xQDxc+D8xMhSTikBiBpOZoJiEw7iirBiliOpeFJBXK
 oHrMEecT7b5giwFSteyvXsdrDKWaMaLFki1mpg2VpapokCYgMGUuvfJ7c+gUq6BQ+5nw
 mCGg==
X-Gm-Message-State: AO0yUKW9yr+01686/qM9cVXE9OVM+rlzEfg3FsJR62nvq7wwgCBOeGQY
 prDJblsEOKhtMJTVXdzTAbBEaWPMcW2slW6kHz6VJBDpdodX1GfBeH02ZTRu/54zHmT6M9vwzUg
 9GkHfurE36T2wY9v9dN/Bi9Zedk8mhVK1Hw==
X-Received: by 2002:a05:6602:20d2:b0:71e:e53a:a79c with SMTP id
 18-20020a05660220d200b0071ee53aa79cmr281529ioz.11.1676413589887; 
 Tue, 14 Feb 2023 14:26:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+VYTIXgsMK+7tBWS/U3lsgOPhP21SECGaNspZBfh8mZq44rA+9buxgj4l7+Ie0XelQ0kVlrA==
X-Received: by 2002:a05:6602:20d2:b0:71e:e53a:a79c with SMTP id
 18-20020a05660220d200b0071ee53aa79cmr281506ioz.11.1676413589497; 
 Tue, 14 Feb 2023 14:26:29 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 y20-20020a02c014000000b003a4419ba0c2sm5032096jai.139.2023.02.14.14.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 14:26:28 -0800 (PST)
Date: Tue, 14 Feb 2023 15:26:27 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 05/15] kvm/vfio: Accept vfio device file from userspace
Message-ID: <20230214152627.3a399523.alex.williamson@redhat.com>
In-Reply-To: <20230213151348.56451-6-yi.l.liu@intel.com>
References: <20230213151348.56451-1-yi.l.liu@intel.com>
 <20230213151348.56451-6-yi.l.liu@intel.com>
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
Cc: linux-s390@vger.kernel.org, kevin.tian@intel.com, yi.y.sun@linux.intel.com,
 mjrosato@linux.ibm.com, kvm@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, joro@8bytes.org, cohuck@redhat.com,
 peterx@redhat.com, suravee.suthikulpanit@amd.com, eric.auger@redhat.com,
 nicolinc@nvidia.com, shameerali.kolothum.thodi@huawei.com, jgg@nvidia.com,
 intel-gfx@lists.freedesktop.org, chao.p.peng@linux.intel.com, lulu@redhat.com,
 robin.murphy@arm.com, jasowang@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, 13 Feb 2023 07:13:38 -0800
Yi Liu <yi.l.liu@intel.com> wrote:

> This defines KVM_DEV_VFIO_FILE* and make alias with KVM_DEV_VFIO_GROUP*.
> Old userspace uses KVM_DEV_VFIO_GROUP* works as well.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  Documentation/virt/kvm/devices/vfio.rst | 45 ++++++++++++++++---------
>  include/uapi/linux/kvm.h                | 16 ++++++---
>  virt/kvm/vfio.c                         | 16 ++++-----
>  3 files changed, 50 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/devices/vfio.rst b/Documentation/virt/kvm/devices/vfio.rst
> index 2d20dc561069..90f22933dcfa 100644
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
> @@ -39,3 +52,5 @@ KVM_DEV_VFIO_GROUP attributes:
>  	- @groupfd is a file descriptor for a VFIO group;
>  	- @tablefd is a file descriptor for a TCE table allocated via
>  	  KVM_CREATE_SPAPR_TCE.
> +
> +	only accepts vfio group file
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 55155e262646..484a8133bc69 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1401,10 +1401,18 @@ struct kvm_device_attr {
>  	__u64	addr;		/* userspace address of attr data */
>  };
>  
> -#define  KVM_DEV_VFIO_GROUP			1
> -#define   KVM_DEV_VFIO_GROUP_ADD			1
> -#define   KVM_DEV_VFIO_GROUP_DEL			2
> -#define   KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE		3
> +#define  KVM_DEV_VFIO_FILE	1
> +
> +#define   KVM_DEV_VFIO_FILE_ADD			1
> +#define   KVM_DEV_VFIO_FILE_DEL			2
> +#define   KVM_DEV_VFIO_FILE_SET_SPAPR_TCE	3
> +
> +/* KVM_DEV_VFIO_GROUP aliases are for compile time uapi compatibility */
> +#define  KVM_DEV_VFIO_GROUP	KVM_DEV_VFIO_FILE
> +
> +#define   KVM_DEV_VFIO_GROUP_ADD	KVM_DEV_VFIO_FILE_ADD
> +#define   KVM_DEV_VFIO_GROUP_DEL	KVM_DEV_VFIO_FILE_DEL
> +#define   KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE	KVM_DEV_VFIO_FILE_SET_SPAPR_TCE
>  
>  enum kvm_device_type {
>  	KVM_DEV_TYPE_FSL_MPIC_20	= 1,
> diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
> index 857d6ba349e1..d869913baafd 100644
> --- a/virt/kvm/vfio.c
> +++ b/virt/kvm/vfio.c
> @@ -286,18 +286,18 @@ static int kvm_vfio_set_file(struct kvm_device *dev, long attr,
>  	int32_t fd;
>  
>  	switch (attr) {
> -	case KVM_DEV_VFIO_GROUP_ADD:
> +	case KVM_DEV_VFIO_FILE_ADD:
>  		if (get_user(fd, argp))
>  			return -EFAULT;
>  		return kvm_vfio_file_add(dev, fd);
>  
> -	case KVM_DEV_VFIO_GROUP_DEL:
> +	case KVM_DEV_VFIO_FILE_DEL:
>  		if (get_user(fd, argp))
>  			return -EFAULT;
>  		return kvm_vfio_file_del(dev, fd);
>  
>  #ifdef CONFIG_SPAPR_TCE_IOMMU
> -	case KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE:
> +	case KVM_DEV_VFIO_FILE_SET_SPAPR_TCE:
>  		return kvm_vfio_file_set_spapr_tce(dev, arg);

I don't see that the SPAPR code is so easily fungible to a device file
descriptor.  The kvm_vfio_spapr_tce data structure includes a groupfd,
which is required to match a groupfd on the file_list.  So a SPAPR user
cannot pass a cdev via FILE_ADD if they intend to use this TCE code.

Maybe SPAPR code is therefore tied to the group interface since there's
nobody around advancing this code any longer.

That also makes me wonder what we're really gaining in forcing this
generalization from group to file.  There's no userspace that's
suddenly going to find itself with a device cdev to require an ABI
compatible interface.  So we allow either groups or cdevs, but then we
potentially end up with a file_list of both groups and device cdevs.
Given the SPAPR issue above, is there some advantage to creating a
parallel FILE interface alongside the GROUP interface, with separate
file lists for each?  At least that would allow SPAPR to expose only a
GROUP interface via the has_attr interface below.  Maybe there's some
utility in general for being able to probe device cdev support here?
Thanks,

Alex

>  #endif
>  	}
> @@ -309,7 +309,7 @@ static int kvm_vfio_set_attr(struct kvm_device *dev,
>  			     struct kvm_device_attr *attr)
>  {
>  	switch (attr->group) {
> -	case KVM_DEV_VFIO_GROUP:
> +	case KVM_DEV_VFIO_FILE:
>  		return kvm_vfio_set_file(dev, attr->attr,
>  					 u64_to_user_ptr(attr->addr));
>  	}
> @@ -321,12 +321,12 @@ static int kvm_vfio_has_attr(struct kvm_device *dev,
>  			     struct kvm_device_attr *attr)
>  {
>  	switch (attr->group) {
> -	case KVM_DEV_VFIO_GROUP:
> +	case KVM_DEV_VFIO_FILE:
>  		switch (attr->attr) {
> -		case KVM_DEV_VFIO_GROUP_ADD:
> -		case KVM_DEV_VFIO_GROUP_DEL:
> +		case KVM_DEV_VFIO_FILE_ADD:
> +		case KVM_DEV_VFIO_FILE_DEL:
>  #ifdef CONFIG_SPAPR_TCE_IOMMU
> -		case KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE:
> +		case KVM_DEV_VFIO_FILE_SET_SPAPR_TCE:
>  #endif
>  			return 0;
>  		}

