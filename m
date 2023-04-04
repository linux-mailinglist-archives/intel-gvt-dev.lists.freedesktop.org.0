Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0AE6D6E15
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Apr 2023 22:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28A010E1CF;
	Tue,  4 Apr 2023 20:31:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD4710E1CF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Apr 2023 20:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680640294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XqS1tmmJr7PAF8X4LNYoZBpPsb/UgoghZYeXc9m09Fg=;
 b=aU1a6Y6R8uTog04blRd+HniQYpuxvR+m9XSnjNDFyL1w2kywsUe1e8WK+ec9TpbHXtl/RK
 WQ1lWBKqBQZbfEJx7VC9NKkJ0R3L7MBBG38BR1rEuf26VZToiIihDqJgT+K0AX9NCueHvj
 fkk0NTnfbiKb1774dAV6wv52XmqxfRY=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-trShTWrLOc-5HmgvH_cg_A-1; Tue, 04 Apr 2023 16:31:31 -0400
X-MC-Unique: trShTWrLOc-5HmgvH_cg_A-1
Received: by mail-io1-f69.google.com with SMTP id
 r25-20020a056602235900b0074d472df653so20369198iot.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 04 Apr 2023 13:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680640291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XqS1tmmJr7PAF8X4LNYoZBpPsb/UgoghZYeXc9m09Fg=;
 b=p69o3shE+kTUO0ixG540kkMbSctawo14L5AqWrfFXBjAsuc13IYCospOYe3uZHXgs9
 GmEQWP1mppNpsfsCQJFTBUIULJZCeh3umcebIb8EY2wlKmTwPIMZ6EHOz2ASkrZyz1Iv
 lrz8WkulCc4JpvpoXS8u00oVpvk3BKVjRYPSIMkIr9DQvS13I9RcmpjXFnxCWuFUF4zl
 85OVjAhlBvoGsnlFGiERGZm7RlU3UwdjXEADQ4N691QzrRQTxi7pziVEMLNaUicZ5WUd
 s82rUdu3z8wkPaQ3BKucDGTRGaz/v78riPL35CvTpnkHcS1z+E6vqhUdOumApPxYmenf
 eJrA==
X-Gm-Message-State: AAQBX9dxnUwnljuYET8TdCOmSQi8NObFqmSdWDonrRV+CqrH3KDmGEPM
 j4lg864plGqHMTK/9ueAQ5TtHxhCnPoQgwviHGVZbqM9DwdiO+CXTDXCS9qvUFAkLYqnzQrmzt7
 FK003A8t29qzUQpmpfUJ/XaAzXAbumpjZcQ==
X-Received: by 2002:a5d:818e:0:b0:75c:8ca2:c9dd with SMTP id
 u14-20020a5d818e000000b0075c8ca2c9ddmr3054678ion.13.1680640290848; 
 Tue, 04 Apr 2023 13:31:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZjUtpAYCx6yaQp4dhQD6EMAb3LqUkY7lWvfjoqBYl2aC4WHyIt9JLMzzeXtpK9Oh7S0irxFA==
X-Received: by 2002:a5d:818e:0:b0:75c:8ca2:c9dd with SMTP id
 u14-20020a5d818e000000b0075c8ca2c9ddmr3054643ion.13.1680640290625; 
 Tue, 04 Apr 2023 13:31:30 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 j195-20020a0263cc000000b003b331f0bbdfsm3476000jac.97.2023.04.04.13.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 13:31:30 -0700 (PDT)
Date: Tue, 4 Apr 2023 14:31:28 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 07/12] vfio: Accpet device file from vfio PCI hot
 reset path
Message-ID: <20230404143128.52d8a256.alex.williamson@redhat.com>
In-Reply-To: <20230401144429.88673-8-yi.l.liu@intel.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-8-yi.l.liu@intel.com>
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
 peterx@redhat.com, terrence.xu@intel.com, chao.p.peng@linux.intel.com,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org, lulu@redhat.com,
 yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com, jgg@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org,
 eric.auger@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 yi.y.sun@linux.intel.com, cohuck@redhat.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Sat,  1 Apr 2023 07:44:24 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> This extends both vfio_file_is_valid() and vfio_file_has_dev() to accept
> device file from the vfio PCI hot reset.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/vfio_main.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index fe7446805afd..ebbb6b91a498 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -1154,13 +1154,23 @@ const struct file_operations vfio_device_fops = {
>  	.mmap		= vfio_device_fops_mmap,
>  };
>  
> +static struct vfio_device *vfio_device_from_file(struct file *file)
> +{
> +	struct vfio_device *device = file->private_data;
> +
> +	if (file->f_op != &vfio_device_fops)
> +		return NULL;
> +	return device;
> +}
> +
>  /**
>   * vfio_file_is_valid - True if the file is valid vfio file
>   * @file: VFIO group file or VFIO device file
>   */
>  bool vfio_file_is_valid(struct file *file)
>  {
> -	return vfio_group_from_file(file);
> +	return vfio_group_from_file(file) ||
> +	       vfio_device_from_file(file);
>  }
>  EXPORT_SYMBOL_GPL(vfio_file_is_valid);
>  
> @@ -1174,12 +1184,17 @@ EXPORT_SYMBOL_GPL(vfio_file_is_valid);
>  bool vfio_file_has_dev(struct file *file, struct vfio_device *device)
>  {
>  	struct vfio_group *group;
> +	struct vfio_device *vdev;
>  
>  	group = vfio_group_from_file(file);
> -	if (!group)
> -		return false;
> +	if (group)
> +		return vfio_group_has_dev(group, device);
> +
> +	vdev = vfio_device_from_file(file);
> +	if (vdev)
> +		return vdev == device;
>  
> -	return vfio_group_has_dev(group, device);
> +	return false;

Nit, unless we expect to be testing against NULL devices, this could
just be:

	return device == vfio_device_from_file(file);

Thanks,
Alex

