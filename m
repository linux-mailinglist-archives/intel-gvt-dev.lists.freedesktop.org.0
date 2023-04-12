Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A236DFC2A
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 12 Apr 2023 19:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B2E10E0D4;
	Wed, 12 Apr 2023 17:01:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161C910E0D4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 12 Apr 2023 17:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681318914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JeneufXpiEYUuGyGZ8Q8ABZcDJsC9i3M9esfSkLThDs=;
 b=KNpsIDsfGoR0IDV2fc28pYySC90u/Q50VA9j/GMM6c9iNp9n7pCyJmCFVyH29gw1x4apuv
 MSpBTGfZ6OQt0lBoWImtJPgCE5GtP9hZ93hpxtzrpz1PG3V+1/ehkNnjNaGAN45epHfKF1
 enF2RSKSrpM45uvFA3B7ImVGEg8/LLw=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-Ice5_4tXPCmjZV6EQxcTOw-1; Wed, 12 Apr 2023 13:01:50 -0400
X-MC-Unique: Ice5_4tXPCmjZV6EQxcTOw-1
Received: by mail-il1-f199.google.com with SMTP id
 q17-20020a056e020c3100b003245df8be9fso8276714ilg.14
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 12 Apr 2023 10:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681318910; x=1683910910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JeneufXpiEYUuGyGZ8Q8ABZcDJsC9i3M9esfSkLThDs=;
 b=CbmTOTge5Vz1vHvDSti4GyrhiPrBO817V3lGvH/iNf6c08YN5LOgHVBheYNho5OQ1s
 RcT8JbUf5iIMi10EtH34WUGKYAAoqnoJcSttNcY7aYM9JLTDf4va0Anldk61zE6kpa/K
 x3iCcqEzhBd5Nqff0pNv9smJfi9oYG4Thb3J2fUXQGweujPgBnsUSIu4bEdcCM5LxnHp
 VkZOnIDJLzd3v85jM/n7pr0WKAUkunxgqYwxj83Edd/km8EsqGelUfv8xyj0EpH6i0jJ
 0/FaILVi76RsIRrzIEIBxmkKgefXHNMY1BlIzJvdnsx60WELeUOHRpr/n5X9h4siTxr1
 YpYw==
X-Gm-Message-State: AAQBX9eDWeWXwx0/g/ONUoUn+1HT/v2MRTQhcFpHc+y4tLvxkmoLH+bL
 fTQzmI7un9OjvUhFcviUjznvI2OuUiR7q3zpB6SGxUcJp5IZJCvAWT3RTLPSYFMvN5ykyw7/FBM
 cSCrUhK1shGC7qLwiUlW944BB/blgHO8fmw==
X-Received: by 2002:a92:ce45:0:b0:317:eef2:f5cc with SMTP id
 a5-20020a92ce45000000b00317eef2f5ccmr1867114ilr.10.1681318909824; 
 Wed, 12 Apr 2023 10:01:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350bmLI/n5FzFmQ15lqziDjlrAa04nLOH96tqFhO3CiJ/t4ZshQUfj7wCR54qShlH2HyBk5wL5Q==
X-Received: by 2002:a92:ce45:0:b0:317:eef2:f5cc with SMTP id
 a5-20020a92ce45000000b00317eef2f5ccmr1867093ilr.10.1681318909541; 
 Wed, 12 Apr 2023 10:01:49 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 a10-20020a5d9eca000000b007587774bec7sm4503807ioe.54.2023.04.12.10.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 10:01:48 -0700 (PDT)
Date: Wed, 12 Apr 2023 11:01:47 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230412110147.5883582b.alex.williamson@redhat.com>
In-Reply-To: <ZDbIzvawep4Sk+0M@nvidia.com>
References: <ZC4CwH2ouTfZ9DNN@nvidia.com>
 <DS0PR11MB75292DA91ED15AE94A85EB3DC3919@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230406115347.7af28448.alex.williamson@redhat.com>
 <ZDVfqpOCnImKr//m@nvidia.com>
 <20230411095417.240bac39.alex.williamson@redhat.com>
 <20230411111117.0766ad52.alex.williamson@redhat.com>
 <ZDWph7g0hcbJHU1B@nvidia.com>
 <20230411155827.3489400a.alex.williamson@redhat.com>
 <ZDX0wtcvZuS4uxmG@nvidia.com>
 <BN9PR11MB52761A24E435E9EF910766E28C9B9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ZDbIzvawep4Sk+0M@nvidia.com>
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>, "Xu, 
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
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

On Wed, 12 Apr 2023 12:05:50 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Apr 12, 2023 at 07:27:43AM +0000, Tian, Kevin wrote:
> > > From: Jason Gunthorpe
> > > Sent: Wednesday, April 12, 2023 8:01 AM
> > > 
> > > I see this problem as a few basic requirements from a qemu-like
> > > application:
> > > 
> > >  1) Does the configuration I was given support reset right now?
> > >  2) Will the configuration I was given support reset for the duration
> > >     of my execution?
> > >  3) What groups of the devices I already have open does the reset
> > >     effect?
> > >  4) For debugging, report to the user the full list of devices in the
> > >     reset group, in a way that relates back to sysfs.
> > >  5) Away to trigger a reset on a group of devices
> > > 
> > > #1/#2 is the API I suggested here. Ask the kernel if the current
> > > configuration works, and ask it to keep it working.
> > > 
> > > #3 is either INFO and a CAP for BDF or INFO2 reporting dev_id
> > > 
> > > #4 is either INFO and print the BDFs or INFO2 reporting the struct
> > > vfio_device IDR # (eg /sys/class/vfio/vfioXXX/).  
> > 
> > mdev doesn't have BDF. Of course it doesn't support hot_reset either.  
> 
> It should support a reset.. Maybe idxd doesn't, but it should be part
> of the SIOV model. Our SIOV devices would need it for instance.

IIRC we require mdev devices to support VFIO_DEVICE_RESET, hot-reset is
a different beast.  I assume SIOV device support would also require
VFIO_DEVICE_RESET support and hot-reset would also be irrelevant to
them.

> > but it's presented to userspace as a pci device. Is it weird for a pci
> > device which doesn't provide a BDF cap?  
> 
> It is weird for a PCI device, but it is not weird for a VFIO
> device. Leaking the physical labels out of the uAPI is not clean,
> IMHO.
> 
> > from this point the vfio_device IDR# sounds more generic.  
> 
> Yes, I was thinking about this for the SIOV model.

Seems like we're off on a tangent, the hot-reset ioctl is not relevant
to devices simply because they expose a vfio-pci API, there is any
underlying hardware aspect that anything that is only virtualizing a
vfio-pci API shouldn't be concerned with.  Thanks,

Alex

