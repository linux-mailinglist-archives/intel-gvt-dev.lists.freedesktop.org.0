Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E20E7070F6
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 17 May 2023 20:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F7210E241;
	Wed, 17 May 2023 18:40:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E697610E241
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 17 May 2023 18:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684348836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G48bN8NGBWygIugoTzRlRFImF/dJtXKz4qEWAAyIYjw=;
 b=Yogg+UTLW2NG67uVUGScGt/8/93KhSm7tkuRhSUDBDItxdMTj3K1E5rdfM4LT6n7vUM8Lh
 h18hCdWH1rjm/riLIUktScxvk8GgCLLim7GDzEgVCx6v8Ej8zrI/gw6ZLEoO58yd9mkyII
 rraLM8AuMTK9ZH2a/Q6NrUHDutbvBqo=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-6lcXxFdJM721e1aLYX2myA-1; Wed, 17 May 2023 14:40:35 -0400
X-MC-Unique: 6lcXxFdJM721e1aLYX2myA-1
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-338280a9459so16985505ab.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 17 May 2023 11:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684348834; x=1686940834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G48bN8NGBWygIugoTzRlRFImF/dJtXKz4qEWAAyIYjw=;
 b=kKcnSBVKUsZDjDuChFI23jlY3zWjXX+pCta6TsbHtbNySLkK//lHmSdBl5tdqIKm4j
 prAdTCXr8eF1h1BxmXN6D3FOEonKd9sP/xyzXBpT9srneuuEqdUTFt2mRNHaU65QLtRZ
 2b5z5hw3shNLoFIxhjL0I9quNzYi4Ki+DUE7IzThPEqPPz/Urud1AFswnf8NLkRgzhLv
 PnoTTo3gsLMntv+9UbRf6qUpVETmwzguPQHdxbjHorVbXF/hITmUCnras1WaB2uM6TD+
 cqqfdIFajVvibtfAaeBbg+8u+fJKM/19Z4rr6rORL5F5RDpC+OrJhn8i8pxRRYhjgP/J
 cV+A==
X-Gm-Message-State: AC+VfDyttzS3ChREg4IGWH7wEQrDoDnaG3EzJLCenYiHdbPBPS67tiOC
 2lfk5FAaMyOgI2rvmNU6NihL9228k18dafiySeD3EBc4LnSzd1fXxAL/8suK0TlcjeLJlsCsnrZ
 pE6K+7mWG4XgYRTqIUPh9IXVFIflfYCvVCQ==
X-Received: by 2002:a92:d142:0:b0:335:c544:a1a2 with SMTP id
 t2-20020a92d142000000b00335c544a1a2mr3012042ilg.0.1684348834640; 
 Wed, 17 May 2023 11:40:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4J9s6ZhInpKVnoJzYNMp1MQQnmbMgUJVkyPpcx6aNR0Viq1l1HNls0cAZuhx154qPo2ZXLvg==
X-Received: by 2002:a92:d142:0:b0:335:c544:a1a2 with SMTP id
 t2-20020a92d142000000b00335c544a1a2mr3012011ilg.0.1684348834418; 
 Wed, 17 May 2023 11:40:34 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 q7-20020a92c007000000b0032b54912651sm8328134ild.5.2023.05.17.11.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 11:40:33 -0700 (PDT)
Date: Wed, 17 May 2023 12:40:32 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v5 06/10] vfio-iommufd: Add helper to retrieve
 iommufd_ctx and devid for vfio_device
Message-ID: <20230517124032.4bac8e0e.alex.williamson@redhat.com>
In-Reply-To: <ZGUbY6yVfbd3hRxY@nvidia.com>
References: <20230513132136.15021-1-yi.l.liu@intel.com>
 <20230513132136.15021-7-yi.l.liu@intel.com>
 <20230517121517.4b7ceb52.alex.williamson@redhat.com>
 <ZGUbY6yVfbd3hRxY@nvidia.com>
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
 chao.p.peng@linux.intel.com, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org, lulu@redhat.com,
 yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org,
 eric.auger@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 yi.y.sun@linux.intel.com, clegoate@redhat.com, cohuck@redhat.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 17 May 2023 15:22:27 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, May 17, 2023 at 12:15:17PM -0600, Alex Williamson wrote:
> 
> > > +int vfio_iommufd_physical_devid(struct vfio_device *vdev)
> > > +{
> > > +	if (vdev->iommufd_device)
> > > +		return iommufd_device_to_id(vdev->iommufd_device);
> > > +	if (vdev->noiommu_access)
> > > +		return iommufd_access_to_id(vdev->noiommu_access);
> > > +	return -EINVAL;
> > > +}
> > > +EXPORT_SYMBOL_GPL(vfio_iommufd_physical_devid);  
> > 
> > I think these exemplify that it would be better if both emulated and
> > noiommu use the same iommufd_access pointer.  Thanks,  
> 
> Oh, I mis understood your other remark.. Yeah good question I have to
> study this also

I guess I also missed that this wasn't iommufd_access vs
noiommu_access, it's device vs access, but shouldn't any iommufd_access
pointer provide the devid?  I need to go look why we need two different
methods to get a devid...  Thanks,

Alex

