Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5520C72EC91
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Jun 2023 22:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2848D10E3E0;
	Tue, 13 Jun 2023 20:11:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4452410E148
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 20:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686687056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sIOI1MZa8Qvt3GA5tgX3/QbGmFAGID2zKyAE50cAXvQ=;
 b=DE1DhmNbKZlE0eDtQ0H/ZUP+aWmgkGqzfCP9/fQa8bTd12g/ZeU/2i7+6ng9vbkuaj+Ldl
 9oJzqkQAiGHX0lTmFQQ7zC8gMSqh2f1wpz7llhtmeDDZY/xpq7l5LzmLsic5ocCAcoZ9zk
 jp4VHQ0R8AAI8Ssqw2h9aVuChSraT58=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-VODM1qEtMxmZPQTqQbI9sg-1; Tue, 13 Jun 2023 16:10:54 -0400
X-MC-Unique: VODM1qEtMxmZPQTqQbI9sg-1
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-77ad94642d4so709730339f.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 13:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686687052; x=1689279052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sIOI1MZa8Qvt3GA5tgX3/QbGmFAGID2zKyAE50cAXvQ=;
 b=D71DISo8iJPVwHDqeMvGOqMswV8C1+6ikYpqcFaUU4jDLjpPPgZBnVbmvVeZoqaP2U
 RrEZI7f+SJqn3mcUxdZtoR+5LeQew/C+vGQOVTrjZpXWC+2VF3k7ATmBxmpawwF6To4O
 WuxxmVryEgUkkvTDpamoN5FK98SjOoTr61FWcKKKDf4+sEURVllmtqOeBMXmyIvCYyxz
 YSoAkNCfp37AGlb4VYooVgWOp37FoRAhbXgMhc6JG2AM5M4VJ4kQ+maJJkBTIQvOMmZc
 e1Kge7fZc4IEyXJ88JByZfeOqdVHsOUeiqNaR0ZhpjxXmSBKUPJLH3NsJ8A7++GOqWU6
 V8Vg==
X-Gm-Message-State: AC+VfDwu5vAHJ6LSJX/oLxjmgNTlp6miv61ao0TMl+/nfqpcpTwArv6f
 AfMY+360HxPTj8skQRZqbugZMo9wkgRdrrzuX894OSCXHijxy7dWbOM4HSbmix1H9DmLdaCpGTK
 iBBhgMTDtANfFLmQM/PGXLdU76x6yHbkkHA==
X-Received: by 2002:a5d:9d4e:0:b0:753:ca30:6bb0 with SMTP id
 k14-20020a5d9d4e000000b00753ca306bb0mr12540458iok.4.1686687052514; 
 Tue, 13 Jun 2023 13:10:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4DNZHxVZbAxwbazA89i6boaoAMcqTbpYJSYBiB4fBVRBnBcDqPvcZYm0qsZ2hQJsBCtxR5uA==
X-Received: by 2002:a5d:9d4e:0:b0:753:ca30:6bb0 with SMTP id
 k14-20020a5d9d4e000000b00753ca306bb0mr12540429iok.4.1686687052264; 
 Tue, 13 Jun 2023 13:10:52 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f13-20020a6bdd0d000000b0076c569c7a48sm3955848ioc.39.2023.06.13.13.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:10:51 -0700 (PDT)
Date: Tue, 13 Jun 2023 14:10:50 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v12 21/24] vfio: Determine noiommu device in
 __vfio_register_dev()
Message-ID: <20230613141050.29e7a22b.alex.williamson@redhat.com>
In-Reply-To: <ZIiozfqet185iLIs@nvidia.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
 <20230602121653.80017-22-yi.l.liu@intel.com>
 <20230612164228.65b500e0.alex.williamson@redhat.com>
 <DS0PR11MB7529AE3701E154BF4C092E57C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230613081913.279dea9e.alex.williamson@redhat.com>
 <DS0PR11MB7529EB2903151B3399F636F5C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230613084828.7af51055.alex.williamson@redhat.com>
 <DS0PR11MB7529E84BCB100DE620FD2468C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230613091301.56986440.alex.williamson@redhat.com>
 <20230613111511.425bdeae.alex.williamson@redhat.com>
 <ZIiozfqet185iLIs@nvidia.com>
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "clegoate@redhat.com" <clegoate@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 13 Jun 2023 14:35:09 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Jun 13, 2023 at 11:15:11AM -0600, Alex Williamson wrote:
> > [Sorry for breaking threading, replying to my own message id with reply
> >  content from Yi since the Cc list got broken]  
> 
> Yikes it is really busted, I think I fixed it?
> 
> > If we renamed your function above to vfio_device_has_iommu_group(),
> > couldn't we just wrap device_add like below instead to not have cdev
> > setup for a noiommu device, generate an error for a physical device w/o
> > IOMMU backing, and otherwise setup the cdev device?
> > 
> > static inline int vfio_device_add(struct vfio_device *device, enum vfio_group_type type)
> > {
> > #if IS_ENABLED(CONFIG_VFIO_GROUP)
> > 	if (device->group->type == VFIO_NO_IOMMU)
> > 		return device_add(&device->device);  
> 
> vfio_device_is_noiommu() embeds the IS_ENABLED

But patch 23/ makes the definition of struct vfio_group conditional on
CONFIG_VFIO_GROUP, so while CONFIG_VFIO_NOIOMMU depends on
CONFIG_VFIO_GROUP and the result could be determined, I think the
compiler is still unhappy about the undefined reference.  We'd need a
!CONFIG_VFIO_GROUP stub for the function.

> > #else
> > 	if (type == VFIO_IOMMU && !vfio_device_has_iommu_group(device))
> > 		return -EINVAL;
> > #endif  
> 
> The require test is this from the group code:
> 
>  	if (!device_iommu_capable(dev, IOMMU_CAP_CACHE_COHERENCY)) {
> 
> We could lift it out of the group code and call it from vfio_main.c like:
> 
> if (type == VFIO_IOMMU && !vfio_device_is_noiommu(vdev) && !device_iommu_capable(dev,
>      IOMMU_CAP_CACHE_COHERENCY))
>    FAIL

Ack.  Thanks,

Alex

