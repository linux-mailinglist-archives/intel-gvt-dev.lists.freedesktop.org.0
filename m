Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2138255F0C0
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 Jun 2022 23:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F7A10EC5C;
	Tue, 28 Jun 2022 21:59:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95FD10F2DF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 Jun 2022 21:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656453560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0WWZ2h4Ou+3qMEe93oAVSbUord2r1cb1r0isXElizxU=;
 b=ZpV9Xv8PteB0XfnZYHuixMBs+0T0Rj8pWNTWianOj/051dSGD79bhersvTEt+avjQ8NNjy
 yi/cKziEemDKMQXD5o9+LS8StRroLwra+UybwtUUc8G7wvN6jJqtj5eZNr7K1qTO4hA0Hg
 u2hmTAjBcwpFHrzUMJIAomKa8k/DN/Y=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-Be-sGQYrMtu9CfNxnIVS8A-1; Tue, 28 Jun 2022 17:59:17 -0400
X-MC-Unique: Be-sGQYrMtu9CfNxnIVS8A-1
Received: by mail-io1-f69.google.com with SMTP id
 e195-20020a6bb5cc000000b0066cc9ece80fso7815267iof.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 Jun 2022 14:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=0WWZ2h4Ou+3qMEe93oAVSbUord2r1cb1r0isXElizxU=;
 b=FgXiy4Ou6IZb3FBFESp2g8OoLfWkKp9KNMnDX8otqbTyO4Hic38J4s7tnZGlz3sPJX
 6aYnlxNI4xPBTrp7WEr8eDFgYIAHiOpyyuWkGEqogTskcDgTbRbo+68xBo202AX1HTq7
 EaTNnc5XEGKRycKBkjoex7ldakrugL7881ZA+/0SiBjgLNZg2U5UOPJAeWGVy+t4wWUK
 ps1UrDWm3nml8wzYtFKy0hmNOnrauOgo1uA5yQaXzb0GSGV8GM9wUJ9N3/ie+tMarutW
 huC+nLI7zutMED3ahfGQwxHBxYvm63Rf0YY0q4f/X5ZSskoGCbHNZFD5Tn+H7LQIzGrn
 bY/g==
X-Gm-Message-State: AJIora/HRNNoCx5i5ByYFapcyknyBP2R2kr0cKxlDFnOd+TnWh6oqj/4
 6IsWIx+UeRq19H3mokFQ5BhVdKDfrBs5MMnqWP95LucQ4/YZNt1KU0CN+KSJSxaq24kdDj+9+x1
 nWiGupLaLa2NBHyG3PfOIOmU3brFPwlKePw==
X-Received: by 2002:a05:6638:2481:b0:331:df8f:95e0 with SMTP id
 x1-20020a056638248100b00331df8f95e0mr151528jat.280.1656453557033; 
 Tue, 28 Jun 2022 14:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uu173+2OVxjSfaHP4q7qPxTBslWKjv/6lZ3otZt97K6XFUw2pYJUvcwU+lNS0e5TZF4qkCKA==
X-Received: by 2002:a05:6638:2481:b0:331:df8f:95e0 with SMTP id
 x1-20020a056638248100b00331df8f95e0mr151513jat.280.1656453556820; 
 Tue, 28 Jun 2022 14:59:16 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 r19-20020a02c853000000b00339dfb793aesm6603705jao.86.2022.06.28.14.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 14:59:16 -0700 (PDT)
Date: Tue, 28 Jun 2022 15:59:15 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/13] vfio/mdev: simplify mdev_type handling
Message-ID: <20220628155915.060ba2d9.alex.williamson@redhat.com>
In-Reply-To: <20220628051435.695540-5-hch@lst.de>
References: <20220628051435.695540-1-hch@lst.de>
 <20220628051435.695540-5-hch@lst.de>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Kevin Tian <kevin.tian@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Halil Pasic <pasic@linux.ibm.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 28 Jun 2022 07:14:26 +0200
Christoph Hellwig <hch@lst.de> wrote:
...
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
> index 5c828556cefd7..cea8113d2200e 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -131,6 +131,11 @@ int intel_gvt_init_vgpu_types(struct intel_gvt *gvt)
>  	if (!gvt->types)
>  		return -ENOMEM;
>  
> +	gvt->mdev_types = kcalloc(num_types, sizeof(*gvt->mdev_types),
> +			     GFP_KERNEL);
> +	if (!gvt->mdev_types)
> +		goto out_free_types;
> +
>  	min_low = MB_TO_BYTES(32);
>  	for (i = 0; i < num_types; ++i) {
>  		if (low_avail / vgpu_types[i].low_mm == 0)
> @@ -142,7 +147,7 @@ int intel_gvt_init_vgpu_types(struct intel_gvt *gvt)
>  
>  		if (vgpu_types[i].weight < 1 ||
>  					vgpu_types[i].weight > VGPU_MAX_WEIGHT)
> -			goto out_free_types;
> +			goto out_free_mdev_types;
>  
>  		gvt->types[i].weight = vgpu_types[i].weight;
>  		gvt->types[i].resolution = vgpu_types[i].edid;
> @@ -150,24 +155,28 @@ int intel_gvt_init_vgpu_types(struct intel_gvt *gvt)
>  						   high_avail / vgpu_types[i].high_mm);
>  
>  		if (GRAPHICS_VER(gvt->gt->i915) == 8)
> -			sprintf(gvt->types[i].name, "GVTg_V4_%s",
> +			sprintf(gvt->types[i].type.sysfs_name, "GVTg_V4_%s",
>  				vgpu_types[i].name);
>  		else if (GRAPHICS_VER(gvt->gt->i915) == 9)
> -			sprintf(gvt->types[i].name, "GVTg_V5_%s",
> +			sprintf(gvt->types[i].type.sysfs_name, "GVTg_V5_%s",
>  				vgpu_types[i].name);

Nit, sysfs_name is an arbitrary size, shouldn't we use snprintf() here
to make a good example?

>  		gvt_dbg_core("type[%d]: %s avail %u low %u high %u fence %u weight %u res %s\n",
> -			     i, gvt->types[i].name,
> +			     i, gvt->types[i].type.sysfs_name,
>  			     gvt->types[i].avail_instance,
>  			     gvt->types[i].low_gm_size,
>  			     gvt->types[i].high_gm_size, gvt->types[i].fence,
>  			     gvt->types[i].weight,
>  			     vgpu_edid_str(gvt->types[i].resolution));
> +
> +		gvt->mdev_types[i] = &gvt->types[i].type;
>  	}
>  
>  	gvt->num_types = i;
>  	return 0;
>  
> +out_free_mdev_types:
> +	kfree(gvt->mdev_types);
>  out_free_types:
>  	kfree(gvt->types);
>  	return -EINVAL;
...
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
> index 9192a21085ce4..25b8d42a522ac 100644
> --- a/drivers/s390/cio/vfio_ccw_ops.c
> +++ b/drivers/s390/cio/vfio_ccw_ops.c
> @@ -95,23 +95,13 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
>  }
>  static MDEV_TYPE_ATTR_RO(available_instances);
>  
> -static struct attribute *mdev_types_attrs[] = {
> +static const struct attribute *mdev_types_attrs[] = {
>  	&mdev_type_attr_name.attr,
>  	&mdev_type_attr_device_api.attr,
>  	&mdev_type_attr_available_instances.attr,
>  	NULL,
>  };
>  
> -static struct attribute_group mdev_type_group = {
> -	.name  = "io",
> -	.attrs = mdev_types_attrs,
> -};
> -
> -static struct attribute_group *mdev_type_groups[] = {
> -	&mdev_type_group,
> -	NULL,
> -};
> -
>  static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
>  {
>  	struct vfio_ccw_private *private = dev_get_drvdata(mdev->dev.parent);
> @@ -654,13 +644,16 @@ struct mdev_driver vfio_ccw_mdev_driver = {
>  	},
>  	.probe = vfio_ccw_mdev_probe,
>  	.remove = vfio_ccw_mdev_remove,
> -	.supported_type_groups  = mdev_type_groups,
> +	.types_attrs = mdev_types_attrs,
>  };
>  
>  int vfio_ccw_mdev_reg(struct subchannel *sch)
>  {
> +	sprintf(sch->mdev_type.sysfs_name, "io");

Here too, but this gets randomly changed to an strcat() in patch 09/
and pretty_name is added in 10/, also with an strcat().  Staying with
snprintf() seems easier to get both overflow and termination.

> +	sch->mdev_types[0] = &sch->mdev_type;
>  	return mdev_register_parent(&sch->parent, &sch->dev,
> -				    &vfio_ccw_mdev_driver);
> +				    &vfio_ccw_mdev_driver, sch->mdev_types,
> +				    1);
>  }
>  
>  void vfio_ccw_mdev_unreg(struct subchannel *sch)
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
> index 834945150dc9f..ff25858b2ebbe 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -537,23 +537,13 @@ static ssize_t device_api_show(struct mdev_type *mtype,
>  
>  static MDEV_TYPE_ATTR_RO(device_api);
>  
> -static struct attribute *vfio_ap_mdev_type_attrs[] = {
> +static const struct attribute *vfio_ap_mdev_type_attrs[] = {
>  	&mdev_type_attr_name.attr,
>  	&mdev_type_attr_device_api.attr,
>  	&mdev_type_attr_available_instances.attr,
>  	NULL,
>  };
>  
> -static struct attribute_group vfio_ap_mdev_hwvirt_type_group = {
> -	.name = VFIO_AP_MDEV_TYPE_HWVIRT,
> -	.attrs = vfio_ap_mdev_type_attrs,
> -};
> -
> -static struct attribute_group *vfio_ap_mdev_type_groups[] = {
> -	&vfio_ap_mdev_hwvirt_type_group,
> -	NULL,
> -};
> -
>  struct vfio_ap_queue_reserved {
>  	unsigned long *apid;
>  	unsigned long *apqi;
> @@ -1472,7 +1462,7 @@ static struct mdev_driver vfio_ap_matrix_driver = {
>  	},
>  	.probe = vfio_ap_mdev_probe,
>  	.remove = vfio_ap_mdev_remove,
> -	.supported_type_groups = vfio_ap_mdev_type_groups,
> +	.types_attrs = vfio_ap_mdev_type_attrs,
>  };
>  
>  int vfio_ap_mdev_register(void)
> @@ -1485,8 +1475,11 @@ int vfio_ap_mdev_register(void)
>  	if (ret)
>  		return ret;
>  
> +	strcpy(matrix_dev->mdev_type.sysfs_name, VFIO_AP_MDEV_TYPE_HWVIRT);

And then this might as well be an snprintf() as well too.

Series looks good to me otherwise, hopefully the mdev driver owners
will add some acks.  Thanks,

Alex

