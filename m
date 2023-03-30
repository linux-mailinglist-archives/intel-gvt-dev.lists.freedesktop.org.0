Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DA16D0E9D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 30 Mar 2023 21:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A3910E33A;
	Thu, 30 Mar 2023 19:21:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F94110E057
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 Mar 2023 19:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680204110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqnQEZxaWao68chgcCo4orFozBmRoRDCr3XacwFOlaI=;
 b=XIbS3wOVZ67d6OiZdskTHt6GgJAFaErM9YBFoYy4R2AovHqCGorTznOL8cBTFDm9l9KK5T
 OcLMLudyrFyOKIjUhAu+9Jj4FECfESSPYi26yvGq+DiU9vf1k9+O9jdimsse+zS+YCqbQ3
 dIEkEKSiUd1bARK5NjO/jb4N8nJHKvI=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-a2fbB8bCPSWl2eYSTRSUIw-1; Thu, 30 Mar 2023 15:21:46 -0400
X-MC-Unique: a2fbB8bCPSWl2eYSTRSUIw-1
Received: by mail-io1-f70.google.com with SMTP id
 i189-20020a6b3bc6000000b00758a1ed99c2so12085407ioa.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 Mar 2023 12:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680204106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sqnQEZxaWao68chgcCo4orFozBmRoRDCr3XacwFOlaI=;
 b=yjmtq61b1oiMQDoxA6SnVNLq2AkV52zIHw2xZPrkCSegI4+mxKBdSch5dXHxvWZB/k
 8exYbjXwGFyZCAQlqYzjtkpuEhpBya6o4D7aT656JIPIMOz+2VzchIC6BB3zmKdkNomo
 6GV0w/omdAWDqFKjM01ZDZaqW/9KS8EoXb5o5+IVSBVhtJWUPqSN8Maa0UsJYSMuzO/l
 CZr5Zw41fRWNBpm/cgUR9IrqXejFb6ykslqGYSA0CHQSIn8Z3xUd8/SF46EGXClVOl4s
 kYFjhrqSSuV/84+aDtW+LllHV4zY3UtYkyPpxm+a806ZALcmzAOllceUCK1TYdOZvMqX
 GQiA==
X-Gm-Message-State: AO0yUKUM+qxszF9JWTpqe7EHFjY+LT8USuuYGvwMZpIQ5HZGHILZprTp
 44vAkDe2MsITlNVkmC+y0BUucFHdQ8i7DF8Rl4/3bOCLyHmoEjSsT17RQpMYODoE329+vyINdwe
 4Cqp3Y/RUTLkP15NDAv0g6ZW0vXXDSiC+3A==
X-Received: by 2002:a05:6602:20da:b0:74c:aa1d:c1a1 with SMTP id
 26-20020a05660220da00b0074caa1dc1a1mr17687530ioz.3.1680204105939; 
 Thu, 30 Mar 2023 12:21:45 -0700 (PDT)
X-Google-Smtp-Source: AK7set+mNeudR7e8tOPV/GXrIldwy7od5clU9Br4psJl/Z0Ulm5W6yZvi903JIlNz219vg0XihaniQ==
X-Received: by 2002:a05:6602:20da:b0:74c:aa1d:c1a1 with SMTP id
 26-20020a05660220da00b0074caa1dc1a1mr17687509ioz.3.1680204105715; 
 Thu, 30 Mar 2023 12:21:45 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 cp7-20020a056638480700b00403089c2a1dsm104349jab.108.2023.03.30.12.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 12:21:45 -0700 (PDT)
Date: Thu, 30 Mar 2023 13:21:43 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 0/6] vfio: Make emulated devices prepared for vfio
 device cdev
Message-ID: <20230330132143.0c33f4d3.alex.williamson@redhat.com>
In-Reply-To: <ZCSV2+LbgeWD2bPa@nvidia.com>
References: <20230327093351.44505-1-yi.l.liu@intel.com>
 <ZCSV2+LbgeWD2bPa@nvidia.com>
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
 linux-s390@vger.kernel.org, Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 lulu@redhat.com, yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org,
 eric.auger@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 yi.y.sun@linux.intel.com, cohuck@redhat.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 29 Mar 2023 16:47:39 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, Mar 27, 2023 at 02:33:45AM -0700, Yi Liu wrote:
> > Nicolin Chen (1):
> >   iommufd: Create access in vfio_iommufd_emulated_bind()
> > 
> > Yi Liu (5):
> >   iommu/iommufd: Pass iommufd_ctx pointer in iommufd_get_ioas()
> >   vfio-iommufd: No need to record iommufd_ctx in vfio_device
> >   vfio-iommufd: Make vfio_iommufd_emulated_bind() return iommufd_access
> >     ID
> >   vfio/mdev: Uses the vfio emulated iommufd ops set in the mdev sample
> >     drivers
> >   vfio: Check the presence for iommufd callbacks in
> >     __vfio_register_dev()
> > 
> >  drivers/iommu/iommufd/device.c          | 55 +++++++++++++++----------
> >  drivers/iommu/iommufd/ioas.c            | 14 +++----
> >  drivers/iommu/iommufd/iommufd_private.h |  4 +-
> >  drivers/iommu/iommufd/selftest.c        | 14 ++++---
> >  drivers/iommu/iommufd/vfio_compat.c     |  2 +-
> >  drivers/vfio/iommufd.c                  | 37 ++++++++---------
> >  drivers/vfio/vfio_main.c                |  5 ++-
> >  include/linux/iommufd.h                 |  5 ++-
> >  include/linux/vfio.h                    |  1 -
> >  samples/vfio-mdev/mbochs.c              |  3 ++
> >  samples/vfio-mdev/mdpy.c                |  3 ++
> >  samples/vfio-mdev/mtty.c                |  3 ++
> >  12 files changed, 85 insertions(+), 61 deletions(-)  
> 
> It looks like most of this is iommufd so I will take it - Ok Alex?
> 
> The following cdev patch needs it so I'll stick it on its own branch
> and we can sort it out after the reset series is done

Ok

Acked-by: Alex Williamson <alex.williamson@redhat.com>

