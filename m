Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D6A3D042D
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 00:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F506E56D;
	Tue, 20 Jul 2021 22:01:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA1F6E56D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 20 Jul 2021 22:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626818494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGxLxC73Q30FLZh4kHloeV2LTAZ2CJRDqzZBDuBEMfM=;
 b=EMRoOrgBZRjNWI+44kHRDVeHc9uN3nxMbdOL/AL/jOMBeCMs4zLH8xpImFTOZ3MCZd83Zw
 NX38DcJlp38OIEwDC7jhz+1EjTbAbiQDRfExG5ZsvX/GhHN8xj3lNuHMsrIm/tfmWn0jWq
 FBBNtk6YjQdB5Nfhs92sn9/8YiC+Kmw=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-E-6J_oqDMcG6bFDOFd7zwA-1; Tue, 20 Jul 2021 18:01:32 -0400
X-MC-Unique: E-6J_oqDMcG6bFDOFd7zwA-1
Received: by mail-oo1-f70.google.com with SMTP id
 s11-20020a4ac10b0000b029024bc69d2a8aso220731oop.16
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 20 Jul 2021 15:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DGxLxC73Q30FLZh4kHloeV2LTAZ2CJRDqzZBDuBEMfM=;
 b=MWWmbA/uVaMHUykU6IKMXKLj1SSAnGr5tKSvQkrff9FKbbyGWgK1TX9E8VtxC1Sm07
 /Ts905iJKmhz9bZ9XXSJez8nr36sG2w0gj6chqgX+6NEH8fmbWMiivlKJ4hwim+calg5
 yj5U9ljDLfZZdUjRMM7hcntgMfaqI71NNfd1DhY71ihqIIB0fHLMjMOwmO6O3EcMtdse
 W1br20Ig0vhTPCbucKug3MeiaOmhZpvxOrGDLQAOnyKVmWlhPv/Arvtms+kpi9ybSlH4
 AMxIyW44HAjvQtTMWzMqcu622KwgJjuQMx+/PbXGhrTnBl4/zssk4kB/IePBn9G7aNCd
 w40w==
X-Gm-Message-State: AOAM5318wbu053AbFWoQKcAsC9YxtNAgby8EKBcWc+i+KlCIjhcmX6cO
 IWocZStSB4LsIR3TmoDTFMB+/NjLCAYyE2/2c4rkSUFmALwej5peyeq/scwWd2gFn3wGcZIhEQS
 2S5Unfr9lExEpQTGGzC/A0ibBVkrNda1/ig==
X-Received: by 2002:a05:6808:aa3:: with SMTP id
 r3mr18166248oij.133.1626818491767; 
 Tue, 20 Jul 2021 15:01:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuyDIfTXjm5YKo9TBgR+HrFk2cZEkVnlsdeNA/JOY8RcUjz3Wmb8/jGMHDDitpmXWLkurNEg==
X-Received: by 2002:a05:6808:aa3:: with SMTP id
 r3mr18166225oij.133.1626818491525; 
 Tue, 20 Jul 2021 15:01:31 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id q187sm259680oif.2.2021.07.20.15.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 15:01:30 -0700 (PDT)
Date: Tue, 20 Jul 2021 16:01:27 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 02/14] vfio/mbochs: Fix missing error unwind in
 mbochs_probe()
Message-ID: <20210720160127.17bf3c19.alex.williamson@redhat.com>
In-Reply-To: <2-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
References: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
 <2-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Max Gurtovoy <mgurtovoy@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, "Raj, Ashok" <ashok.raj@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 20 Jul 2021 14:42:48 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Compared to mbochs_remove() two cases are missing from the
> vfio_register_group_dev() unwind. Add them in.
> 
> Fixes: 681c1615f891 ("vfio/mbochs: Convert to use vfio_register_group_dev()")
> Reported-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  samples/vfio-mdev/mbochs.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
> index e81b875b4d87b4..501845b08c0974 100644
> --- a/samples/vfio-mdev/mbochs.c
> +++ b/samples/vfio-mdev/mbochs.c
> @@ -553,11 +553,14 @@ static int mbochs_probe(struct mdev_device *mdev)
>  
>  	ret = vfio_register_group_dev(&mdev_state->vdev);
>  	if (ret)
> -		goto err_mem;
> +		goto err_bytes;
>  	dev_set_drvdata(&mdev->dev, mdev_state);
>  	return 0;
>  
> +err_bytes:
> +	mbochs_used_mbytes -= mdev_state->type->mbytes;
>  err_mem:
> +	kfree(mdev_state->pages);
>  	kfree(mdev_state->vconfig);
>  	kfree(mdev_state);
>  	return ret;
> @@ -567,8 +570,8 @@ static void mbochs_remove(struct mdev_device *mdev)
>  {
>  	struct mdev_state *mdev_state = dev_get_drvdata(&mdev->dev);
>  
> -	mbochs_used_mbytes -= mdev_state->type->mbytes;
>  	vfio_unregister_group_dev(&mdev_state->vdev);
> +	mbochs_used_mbytes -= mdev_state->type->mbytes;
>  	kfree(mdev_state->pages);
>  	kfree(mdev_state->vconfig);
>  	kfree(mdev_state);

Hmm, doesn't this suggest we need another atomic conversion?  (untested)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index e81b875b4d87..842819e29c6b 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -129,7 +129,7 @@ static dev_t		mbochs_devt;
 static struct class	*mbochs_class;
 static struct cdev	mbochs_cdev;
 static struct device	mbochs_dev;
-static int		mbochs_used_mbytes;
+static atomic_t		mbochs_avail_mbytes;
 static const struct vfio_device_ops mbochs_dev_ops;
 
 struct vfio_region_info_ext {
@@ -511,14 +511,19 @@ static int mbochs_probe(struct mdev_device *mdev)
 		&mbochs_types[mdev_get_type_group_id(mdev)];
 	struct device *dev = mdev_dev(mdev);
 	struct mdev_state *mdev_state;
+	int avail_mbytes = atomic_read(&mbochs_avail_mbytes);
 	int ret = -ENOMEM;
 
-	if (type->mbytes + mbochs_used_mbytes > max_mbytes)
-		return -ENOMEM;
+	do {
+		if (avail_mbytes < type->mbytes)
+			return ret;
+	} while (!atomic_try_cmpxchg(&mbochs_avail_mbytes, &avail_mbytes,
+				     avail_mbytes - type->mbytes));
 
 	mdev_state = kzalloc(sizeof(struct mdev_state), GFP_KERNEL);
 	if (mdev_state == NULL)
-		return -ENOMEM;
+		goto err_resv;
+
 	vfio_init_group_dev(&mdev_state->vdev, &mdev->dev, &mbochs_dev_ops);
 
 	mdev_state->vconfig = kzalloc(MBOCHS_CONFIG_SPACE_SIZE, GFP_KERNEL);
@@ -549,8 +554,6 @@ static int mbochs_probe(struct mdev_device *mdev)
 	mbochs_create_config_space(mdev_state);
 	mbochs_reset(mdev_state);
 
-	mbochs_used_mbytes += type->mbytes;
-
 	ret = vfio_register_group_dev(&mdev_state->vdev);
 	if (ret)
 		goto err_mem;
@@ -558,8 +561,11 @@ static int mbochs_probe(struct mdev_device *mdev)
 	return 0;
 
 err_mem:
+	kfree(mdev_state->pages);
 	kfree(mdev_state->vconfig);
 	kfree(mdev_state);
+err_resv:
+	atomic_add(mdev_state->type->mbytes, &mbochs_avail_mbytes);
 	return ret;
 }
 
@@ -567,11 +573,11 @@ static void mbochs_remove(struct mdev_device *mdev)
 {
 	struct mdev_state *mdev_state = dev_get_drvdata(&mdev->dev);
 
-	mbochs_used_mbytes -= mdev_state->type->mbytes;
 	vfio_unregister_group_dev(&mdev_state->vdev);
 	kfree(mdev_state->pages);
 	kfree(mdev_state->vconfig);
 	kfree(mdev_state);
+	atomic_add(mdev_state->type->mbytes, &mbochs_avail_mbytes);
 }
 
 static ssize_t mbochs_read(struct vfio_device *vdev, char __user *buf,
@@ -1351,7 +1357,7 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 {
 	const struct mbochs_type *type =
 		&mbochs_types[mtype_get_type_group_id(mtype)];
-	int count = (max_mbytes - mbochs_used_mbytes) / type->mbytes;
+	int count = atomic_read(&mbochs_avail_mbytes) / type->mbytes;
 
 	return sprintf(buf, "%d\n", count);
 }
@@ -1460,6 +1466,8 @@ static int __init mbochs_dev_init(void)
 	if (ret)
 		goto err_class;
 
+	atomic_set(&mbochs_avail_mbytes, max_mbytes);
+
 	ret = mdev_register_device(&mbochs_dev, &mdev_fops);
 	if (ret)
 		goto err_device;

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
