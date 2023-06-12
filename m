Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFF272D486
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Jun 2023 00:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D88010E118;
	Mon, 12 Jun 2023 22:37:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B3010E106
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 12 Jun 2023 22:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686609468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OlsJhktWOpnOGrwPLFGfPFUUuk70SiPk0xbup/yE/10=;
 b=Oa8moIuWV14Z2U84au3INqetjkSlFkfGH2MazcLyAMraEJn1LFzc6KT/wAwfkQZQDJvCq5
 ND5vcewOkvfi855lHxpnQbTBZtHQ8v5mxpVC+NTXiZ8nu53uT6J6AwoTmO4MyOUxIrLu+a
 vfVhzK913Q3k1YMur+ylrWNqAHp4whk=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-BtBjFk1jOoSfrJ8mhxK2Rw-1; Mon, 12 Jun 2023 18:37:45 -0400
X-MC-Unique: BtBjFk1jOoSfrJ8mhxK2Rw-1
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-777b8c9cc4aso559177039f.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 12 Jun 2023 15:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686609464; x=1689201464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OlsJhktWOpnOGrwPLFGfPFUUuk70SiPk0xbup/yE/10=;
 b=EmBs2BZtBRmgvOolNm66C+cLq7UYA8nFMRpqyBz4nxI4cRlg5lhynbpET/OTd3Qxig
 7Ehd6s9B3ahiMGuHGr2G43SObRUizSQI4vgDxzJL5NwJq/iRZb36FbKuv9INXadJXwvm
 3C0Z7NIwwHhv+FqO0zn5VDFypFHG/T2canydLGHrxsymb571RNpYSJGql77aCI6dSBbF
 r+l3wntDydM/606BD+huMr1uM3f80gKVl3ae9WwRtGOA9cPHuL4L6V0UiB/nnSCjILih
 magLRPsTCz2qzKB9QooreH4rW2XY0V3j+ROkptOcHdk4lWsxBvrNRxfFjwJPfgK+c5Eh
 z/bw==
X-Gm-Message-State: AC+VfDwbNAUdsL5diLb0yjVlColfQZRsvkqz4zd0r8ztF6gZ0Lvnmhbq
 RaTiypLT3iaAb3LAO4QGMaP5JaOKkKkvuZa/wNnzPCX4ZzW2/cf/NqThwGmyH4dO0rO8jB/OWcL
 jsguqttkne/YUdwZB0PucQQgLMzah3mrvcQ==
X-Received: by 2002:a5d:9ad3:0:b0:769:bdaa:a4d9 with SMTP id
 x19-20020a5d9ad3000000b00769bdaaa4d9mr8400449ion.12.1686609464335; 
 Mon, 12 Jun 2023 15:37:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Q/YdMzaOFvhmUbJ9Qg8ZlVUIaIY3sDJYl5DoaZ6J+wwRakiDgr+MX4WPTG6XR/j4s9Jvayw==
X-Received: by 2002:a5d:9ad3:0:b0:769:bdaa:a4d9 with SMTP id
 x19-20020a5d9ad3000000b00769bdaaa4d9mr8400441ion.12.1686609464083; 
 Mon, 12 Jun 2023 15:37:44 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 ep27-20020a0566384e1b00b0041855b3a685sm2990490jab.150.2023.06.12.15.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 15:37:43 -0700 (PDT)
Date: Mon, 12 Jun 2023 16:37:42 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v12 20/24] vfio: Only check group->type for noiommu test
Message-ID: <20230612163742.215eabde.alex.williamson@redhat.com>
In-Reply-To: <20230602121653.80017-21-yi.l.liu@intel.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
 <20230602121653.80017-21-yi.l.liu@intel.com>
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

On Fri,  2 Jun 2023 05:16:49 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> group->type can be VFIO_NO_IOMMU only when vfio_noiommu option is true.
> And vfio_noiommu option can only be true if CONFIG_VFIO_NOIOMMU is enabled.
> So checking group->type is enough when testing noiommu.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/vfio/group.c | 3 +--
>  drivers/vfio/vfio.h  | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> index 41a09a2df690..653b62f93474 100644
> --- a/drivers/vfio/group.c
> +++ b/drivers/vfio/group.c
> @@ -133,8 +133,7 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
>  
>  	iommufd = iommufd_ctx_from_file(f.file);
>  	if (!IS_ERR(iommufd)) {
> -		if (IS_ENABLED(CONFIG_VFIO_NOIOMMU) &&
> -		    group->type == VFIO_NO_IOMMU)
> +		if (group->type == VFIO_NO_IOMMU)
>  			ret = iommufd_vfio_compat_set_no_iommu(iommufd);
>  		else
>  			ret = iommufd_vfio_compat_ioas_create(iommufd);
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index 5835c74e97ce..1b89e8bc8571 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -108,8 +108,7 @@ void vfio_group_cleanup(void);
>  
>  static inline bool vfio_device_is_noiommu(struct vfio_device *vdev)
>  {
> -	return IS_ENABLED(CONFIG_VFIO_NOIOMMU) &&
> -	       vdev->group->type == VFIO_NO_IOMMU;
> +	return vdev->group->type == VFIO_NO_IOMMU;
>  }
>  
>  #if IS_ENABLED(CONFIG_VFIO_CONTAINER)

This patch should be dropped.  It's logically correct, but ignores that
the config option can be determined at compile time and therefore the
code can be better optimized based on that test.  I think there was a
specific case where I questioned it, but this drops an otherwise valid
compiler optimization.  Thanks,

Alex

