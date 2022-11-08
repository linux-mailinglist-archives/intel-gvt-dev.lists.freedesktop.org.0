Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2137621F3C
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Nov 2022 23:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5ED110E52E;
	Tue,  8 Nov 2022 22:28:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD8088DE5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Nov 2022 22:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667946518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pAwH+5JDvufKDL3NMoeBuf7w8Ln38eP9Ts8frUc7hNk=;
 b=YUvGaK1Tyw/McKK6jwIM1IWR2zkZfxHnkJ3W1XM7GOgjOPs7v4ZWe1OwqedjczOkAbkB8h
 EZWtdHHtGOXR+tXgbtkMJ6xNNyVIZPIym+oO4dncP52tAjnucKqqVki4Z3qoORF069j7Bn
 JxC0wgeVxOE+tN7xv/DSNWSXskQehAQ=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-78-VElbgtW5M5SafbwwHcKIqg-1; Tue, 08 Nov 2022 17:28:37 -0500
X-MC-Unique: VElbgtW5M5SafbwwHcKIqg-1
Received: by mail-il1-f199.google.com with SMTP id
 a15-20020a056e0208af00b00300806a52b6so12273023ilt.22
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 08 Nov 2022 14:28:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pAwH+5JDvufKDL3NMoeBuf7w8Ln38eP9Ts8frUc7hNk=;
 b=j5RQnThiam0o5oqCn5wNZZvULfikj2rD7hAOyE3MJrg3riMZJqi9zpAbGq5wQk8G0s
 o40OmRe5EwY2gSiGHwyHeHND5YU78nLR7LUTEibR0EmZcYZ2q1BOfFICjBsly/Y82MoD
 rEnjezK5HLgbelVUSp15hWXUAwG/IVAr1ZHUj9bIhxPJ/A7TpV9CLz7rvqO3MIxldaiB
 GGYufGouDPYx9RTt0oZ7fQa/9m7V/yHJh/qfC7sc3KgLmmjEi6duZ/ZojoYxOHEVTiaV
 NN2N3cEP0S0c1xh91gos8a6YaPsNBWtFkGH6VG8MCL7kHIUSLFDHXp/ViDy0hzo/+LET
 RUog==
X-Gm-Message-State: ACrzQf3SAg3T+szXKUAEDu8PaXI7X9Wvns6jJwWvk3hle9wQ+me7j4au
 ZpYI9Xe4V54yWxYaL4Yl+Eu0t6o12jwUr6Yp58eCzo4iDMWlPctnp0l3ia2aod+X+d02jKYreb4
 18lkLzqHG6xY/vjtUjOfOhiX4xYsB56fIXQ==
X-Received: by 2002:a05:6638:3e1b:b0:373:9526:ff23 with SMTP id
 co27-20020a0566383e1b00b003739526ff23mr1059584jab.25.1667946515340; 
 Tue, 08 Nov 2022 14:28:35 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7qQUvxc2/UNOHomsJy1dPTa1Nkgqu6DzA5Et+Lrzoib29h+Bm9PbubEw1u6deu68awl9vxhQ==
X-Received: by 2002:a05:6638:3e1b:b0:373:9526:ff23 with SMTP id
 co27-20020a0566383e1b00b003739526ff23mr1059545jab.25.1667946515058; 
 Tue, 08 Nov 2022 14:28:35 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 k9-20020a026609000000b003753b6452f9sm4039228jac.35.2022.11.08.14.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 14:28:34 -0800 (PST)
Date: Tue, 8 Nov 2022 15:28:31 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 10/11] vfio: Make vfio_container optionally compiled
Message-ID: <20221108152831.1a2ed3df.alex.williamson@redhat.com>
In-Reply-To: <10-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <10-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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
Cc: kvm@vger.kernel.org, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Halil Pasic <pasic@linux.ibm.com>, iommu@lists.linux.dev,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon,  7 Nov 2022 20:52:54 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Add a kconfig CONFIG_VFIO_CONTAINER that controls compiling the container
> code. If 'n' then only iommufd will provide the container service. All the
> support for vfio iommu drivers, including type1, will not be built.
> 
> This allows a compilation check that no inappropriate dependencies between
> the device/group and container have been created.
> 
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/Kconfig  | 35 +++++++++++++++--------
>  drivers/vfio/Makefile |  4 +--
>  drivers/vfio/vfio.h   | 65 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 91 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
> index 1118d322eec97d..286c1663bd7564 100644
> --- a/drivers/vfio/Kconfig
> +++ b/drivers/vfio/Kconfig
> @@ -3,8 +3,8 @@ menuconfig VFIO
>  	tristate "VFIO Non-Privileged userspace driver framework"
>  	select IOMMU_API
>  	depends on IOMMUFD || !IOMMUFD
> -	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
>  	select INTERVAL_TREE
> +	select VFIO_CONTAINER if IOMMUFD=n
>  	help
>  	  VFIO provides a framework for secure userspace device drivers.
>  	  See Documentation/driver-api/vfio.rst for more details.
> @@ -12,6 +12,18 @@ menuconfig VFIO
>  	  If you don't know what to do here, say N.
>  
>  if VFIO
> +config VFIO_CONTAINER
> +	bool "Support for the VFIO container /dev/vfio/vfio"
> +	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
> +	default y
> +	help
> +	  The VFIO container is the classic interface to VFIO for establishing
> +	  IOMMU mappings. If N is selected here then IOMMUFD must be used to
> +	  manage the mappings.
> +
> +	  Unless testing IOMMUFD say Y here.
> +
> +if VFIO_CONTAINER
>  config VFIO_IOMMU_TYPE1
>  	tristate
>  	default n
> @@ -21,16 +33,6 @@ config VFIO_IOMMU_SPAPR_TCE
>  	depends on SPAPR_TCE_IOMMU
>  	default VFIO
>  
> -config VFIO_SPAPR_EEH
> -	tristate
> -	depends on EEH && VFIO_IOMMU_SPAPR_TCE
> -	default VFIO
> -
> -config VFIO_VIRQFD
> -	tristate
> -	select EVENTFD
> -	default n
> -
>  config VFIO_NOIOMMU
>  	bool "VFIO No-IOMMU support"
>  	help


Perhaps this should have been obvious, but I'm realizing that
vfio-noiommu mode is completely missing without VFIO_CONTAINER, which
seems a barrier to deprecating VFIO_CONTAINER and perhaps makes it a
question whether IOMMUFD should really be taking over /dev/vfio/vfio.
No-iommu mode has users.  Thanks,

Alex

