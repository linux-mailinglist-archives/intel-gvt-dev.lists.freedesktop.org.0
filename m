Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1ED6D8209
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Apr 2023 17:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C3110E9F6;
	Wed,  5 Apr 2023 15:36:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640F410E9F6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Apr 2023 15:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680709010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TuiXIjl7StR1lWcqJYYE1fB/Z6K6yMMeGx6F0a8wvVw=;
 b=S7tSwdTqvz1YuAnnO1XSo+mTdpqXxrPZMjfU8iAWVEXIbN215w6CDlLdfEIzN9uh4tZF1U
 ZaoFX+04Q2ST9hpEm+c4hwZPl3Q7suXiJwz+eQXLbP5fYHWLaAW3UE53ULOw1DqbpT+S+h
 X7ko45yJqijsSSZSkywGXV6itrI+upM=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-BlQOqMeSOGG5IwRPAnb7pw-1; Wed, 05 Apr 2023 11:36:49 -0400
X-MC-Unique: BlQOqMeSOGG5IwRPAnb7pw-1
Received: by mail-il1-f197.google.com with SMTP id
 r14-20020a056e02108e00b00326334613f0so13891740ilj.20
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 05 Apr 2023 08:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680709008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TuiXIjl7StR1lWcqJYYE1fB/Z6K6yMMeGx6F0a8wvVw=;
 b=DfIq5+/WE5/iBrraInbMfOR54THA4V7eHsEytSakh/Xucp2peshw6YGkxW8r7LIGiA
 gJbK4JRCMjM6mG60hpN3UZfUsHNvAUusGatSIOb1sBwA8406l84By3kfR085R6VvHy0j
 /Ni2wZmdZskHKeVaUuFMEvpAXoPw6Ttwi43VNteXarGzI6/DbaEMil+qsggSeW7ZUKY2
 HFVFEeyQ8z/1JtiRaY06snjb7ALFSzV23rUPf0HJLWQEMkgcrcHL0qe0LU4m5w2ryUKr
 brzR/pv8lwwNPgDVXVkmd96v41j11te4N/c+Ygb1M4/BWOGIFSJIMxbkdX5X+2155Hha
 RdNQ==
X-Gm-Message-State: AAQBX9erFVMCdRjF8G9Kr4aukxuS0He1ZSSFG5bfkJ5e3SGyKxwuF9x1
 BFhCGdwAUP7SZS9CCeWwPfgbsZW0PM20MAVrNBFGznBaIbDWMNxLCRtYQrWVFLfE/mEVn2LnvkV
 3JCRC49uBpUhhYdyLwk3V1JjoeweNiPwD6w==
X-Received: by 2002:a5e:da44:0:b0:760:1fb6:c7d2 with SMTP id
 o4-20020a5eda44000000b007601fb6c7d2mr3357759iop.5.1680709008440; 
 Wed, 05 Apr 2023 08:36:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yiu+6jYuVXySDhz9l7TaJE2CbZAprEqCSA9voKn6Sxg2Pef1TWywH9iD954/Pk6M8+1tZHJQ==
X-Received: by 2002:a5e:da44:0:b0:760:1fb6:c7d2 with SMTP id
 o4-20020a5eda44000000b007601fb6c7d2mr3357742iop.5.1680709008129; 
 Wed, 05 Apr 2023 08:36:48 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 e11-20020a02210b000000b004050d92f6d4sm4046543jaa.50.2023.04.05.08.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 08:36:47 -0700 (PDT)
Date: Wed, 5 Apr 2023 09:36:46 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 05/12] vfio/pci: Allow passing zero-length fd array
 in VFIO_DEVICE_PCI_HOT_RESET
Message-ID: <20230405093646.337f0992.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529730CD29F2BD13F1DD9AEC3909@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-6-yi.l.liu@intel.com>
 <20230404141838.6a4efdd4.alex.williamson@redhat.com>
 <DS0PR11MB752919BC81CCCAB1A13998CAC3909@DS0PR11MB7529.namprd11.prod.outlook.com>
 <DS0PR11MB7529730CD29F2BD13F1DD9AEC3909@DS0PR11MB7529.namprd11.prod.outlook.com>
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
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "Zhao, 
 Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 5 Apr 2023 08:01:49 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Liu, Yi L <yi.l.liu@intel.com>
> > Sent: Wednesday, April 5, 2023 3:55 PM  
>  
> > >
> > > Therefore, I think as written, the singleton dev_set hot-reset is
> > > enabled for iommufd and (unintentionally?) for the group path, while
> > > also negating a requirement for a group fd or that a provided group fd
> > > actually matches the device in this latter case.  The null-array
> > > approach is not however extended to groups for more general use.
> > > Additionally, limiting no-iommu hot-reset to singleton dev_sets
> > > provides only a marginal functional difference vs VFIO_DEVICE_RESET.  
> > 
> > I think the singletion dev_set hot-reset is for iommufd (or more accurately
> > for the noiommu case in cdev path).  
> 
> but actually, singleton dev_set hot-reset can work for group path as well.
> Based on this, I'm also wondering do we really want to have singleton dev_set
> hot-reset only for cdev noiommu case? or we allow it generally or just
> don't support it as it is equivalent with VFIO_DEVICE_RESET?

I think you're taking the potential that VFIO_DEVICE_RESET and
hot-reset could do the same thing too far.  The former is more likely
to do an FLR, or even a PM reset.  QEMU even tries to guess what reset
VFIO_DEVICE_RESET might use in order to choose to do a hot-reset if it
seems like the device might only support a PM reset otherwise.

Changing the reset method of a device requires privilege, which is
maybe something we'd compromise on for no-iommu, but the general
expectation is that VFIO_DEVICE_RESET provides a device level scope and
hot-reset provides a... hot-reset, and sometimes those are the same
thing, but that doesn't mean we can lean on the former.

> If we don't support singletion dev_set hot-reset, noiommu devices in cdev
> path shall fail the hot-reset if empty-fd array is provided. But we may just
> document that empty-fd array does not work for noiommu. User should
> use the device fd array.

I don't see any replies to my comment on 08/12 where I again question
why we need an empty array option.  It's causing all sorts of headaches
and I don't see the justification for it beyond some hand waving that
it reduces complexity for the user.  This singleton dev-set notion
seems equally unjustified.  Do we just need to deal with hot-reset
being unsupported for no-iommu devices with iommufd?  Thanks,

Alex

