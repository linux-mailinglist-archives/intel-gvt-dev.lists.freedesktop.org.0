Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9E872E624
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Jun 2023 16:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9179710E264;
	Tue, 13 Jun 2023 14:48:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B0E10E264
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 14:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686667715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Au5yHcPaamLUTDAy1lALivyiFfLlJB/EXoLrOXOPPA=;
 b=ak7H7lxgAZEfCYSJGGMEHlB1X59SOb0A5fjPo4fNs98nmZ+umuJAitwbsufCA6oCLCrDYE
 1ezGcT5eNqE7/uYrt4BFYJxr9sVh5H+iBccX7EHG8KBi3NaHCrRBnVqaK/e7IZ4gMSHW3t
 tNb7vmc6hN2bRDaFCzwIpflVr9KPbgk=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-RpcgZ7EpNxWTOt8TE0UOLg-1; Tue, 13 Jun 2023 10:48:33 -0400
X-MC-Unique: RpcgZ7EpNxWTOt8TE0UOLg-1
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-77a0fd9d2eeso650096439f.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 07:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686667711; x=1689259711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Au5yHcPaamLUTDAy1lALivyiFfLlJB/EXoLrOXOPPA=;
 b=bP5Dc+HcGqzJzPqKLjLZ758T7wLSgrPz80wz6Zyujemx9zhAywjGLjuMUL2KUIZSPh
 ATJbCvc/QWX3guxIq+REoJl8RFso1SSFgGFpOw2asAtt/Ny7LTt1eSfQmxoQW4t6V/IN
 6rAW+7+j7v1U9wObHyIB+Efh2q21fMDlAU+as/c1XQWwQfX3+jlA0LtWB065LhH0ZGye
 DuRzU02s+bGWn4LuSsQAEIjyKo0vWLw+9hiQ8+X8ySQj38WUc6lstYnR23sDVVDzlXcC
 JPaFDHAYNGINkZS9heiPBxGDFkZyBH0xUPF5D7812oMYf3z2lpXqrUYK0oLgcY2DEZgV
 TIqA==
X-Gm-Message-State: AC+VfDz3j433vUq9L/3CyVu0pnzkfpQT8Z7Gi23wlSDE1uQ+5O3Zq1vq
 9guvoctf3G5miI0wUpFINbXDxh3nim7UH532Jzrz4HF16C+FgTWRaGF71bezNBMcZZDywbURCzV
 hopIgk0K6RC7muLZA7jy/JG2ElVTznx8LOA==
X-Received: by 2002:a05:6602:224e:b0:76c:6382:8d5b with SMTP id
 o14-20020a056602224e00b0076c63828d5bmr11619921ioo.10.1686667710781; 
 Tue, 13 Jun 2023 07:48:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7kDLAWaKUO1yUsXW0IekRRbMRMPnfJq0GCOYazAfEkGhrECmQ2ohZ2H0Yn3F4btXNUZoyJKQ==
X-Received: by 2002:a05:6602:224e:b0:76c:6382:8d5b with SMTP id
 o14-20020a056602224e00b0076c63828d5bmr11619888ioo.10.1686667710504; 
 Tue, 13 Jun 2023 07:48:30 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 w12-20020a02968c000000b0041d7ad74b36sm3502462jai.17.2023.06.13.07.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 07:48:30 -0700 (PDT)
Date: Tue, 13 Jun 2023 08:48:28 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v12 21/24] vfio: Determine noiommu device in
 __vfio_register_dev()
Message-ID: <20230613084828.7af51055.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529EB2903151B3399F636F5C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
 <20230602121653.80017-22-yi.l.liu@intel.com>
 <20230612164228.65b500e0.alex.williamson@redhat.com>
 <DS0PR11MB7529AE3701E154BF4C092E57C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230613081913.279dea9e.alex.williamson@redhat.com>
 <DS0PR11MB7529EB2903151B3399F636F5C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
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
 "clegoate@redhat.com" <clegoate@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 13 Jun 2023 14:33:01 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Tuesday, June 13, 2023 10:19 PM
> > 
> > On Tue, 13 Jun 2023 05:53:42 +0000
> > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >   
> > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > Sent: Tuesday, June 13, 2023 6:42 AM
> > > >
> > > > On Fri,  2 Jun 2023 05:16:50 -0700
> > > > Yi Liu <yi.l.liu@intel.com> wrote:
> > > >  
> > > > > This moves the noiommu device determination and noiommu taint out of
> > > > > vfio_group_find_or_alloc(). noiommu device is determined in
> > > > > __vfio_register_dev() and result is stored in flag vfio_device->noiommu,
> > > > > the noiommu taint is added in the end of __vfio_register_dev().
> > > > >
> > > > > This is also a preparation for compiling out vfio_group infrastructure
> > > > > as it makes the noiommu detection and taint common between the cdev path
> > > > > and group path though cdev path does not support noiommu.  
> > > >
> > > > Does this really still make sense?  The motivation for the change is
> > > > really not clear without cdev support for noiommu.  Thanks,  
> > >
> > > I think it still makes sense. When CONFIG_VFIO_GROUP==n, the kernel
> > > only supports cdev interface. If there is noiommu device, vfio should
> > > fail the registration. So, the noiommu determination is still needed. But
> > > I'd admit the taint might still be in the group code.  
> > 
> > How is there going to be a noiommu device when VFIO_GROUP is unset?  
> 
> How about booting a kernel with iommu disabled, then all the devices
> are not protected by iommu. I suppose they are noiommu devices. If
> user wants to bound them to vfio, the kernel should have VFIO_GROUP.
> Otherwise, needs to fail.

"noiommu" is a vfio designation of a device, it must be created by
vfio.  There can certainly be devices which are not IOMMU backed, but
without vfio designating them as noiommu devices, which is only done
via the legacy and compat paths, there's no such thing as a noiommu
device.  Devices without an IOMMU are simply out of scope for cdev,
there should never be a vfio cdev entry created for them.  Thanks,

Alex

