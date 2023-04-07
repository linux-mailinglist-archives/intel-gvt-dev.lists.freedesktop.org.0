Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B4A6DAC7B
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Apr 2023 14:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9276C10E1BE;
	Fri,  7 Apr 2023 12:03:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FBC10E1BE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  7 Apr 2023 12:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680869019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RkUUy9iLyVeqXpHFSjwkEYxhFcB9vKBhzKxpfaiYE+o=;
 b=EZrVU8BFU76i+Cr77Hd1dnYto4hC6OWDZrZP+9CrB2D0GQ35/daKGO9LFcHrM+Ph/lfsdy
 ii5ZPUGulBHf4bdOu4XZQYfLMT+BVzotbbqLNR6uDdphoaeBvl3AAIM3IKNqt8GLxipL/p
 Fgy2lyG17huzBuagsoAqxRrPKZEYLgE=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-BqZloQy8N9C9AiqoSpqHyA-1; Fri, 07 Apr 2023 08:03:38 -0400
X-MC-Unique: BqZloQy8N9C9AiqoSpqHyA-1
Received: by mail-il1-f197.google.com with SMTP id
 n17-20020a056e02141100b003259a56715bso27213125ilo.15
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 07 Apr 2023 05:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680869018; x=1683461018;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RkUUy9iLyVeqXpHFSjwkEYxhFcB9vKBhzKxpfaiYE+o=;
 b=jAidRBVgMofSigSuxFk0AxhIRebkiAFWHM/to7vU6QFVxN09wURzC0s1vrb9ipRsnr
 csqmPuleY2IQQ3ZjRyfOZgKmSu2d8vTyQqhmfut3+xxYWAb677tVhztKpX59xTbefXvU
 SgCp4LtVHm3obi2hy0l/OgicJsh4UfQywYdhnyRld7ByGUa2TVn9mpNmtZY4jHmte1TS
 buMoWisYoM35HIa8nEuzHORIATD/mm2J/YzUHKphroC2KoDI3IQi/tSXLiFfR4HHstQj
 KT9gBWVicRZXUTZQz3aFJG4QU+ntt+C9fkQWZ2qmpbQF0174Gpbpa9+GgyeZeIH8mQD3
 qZQg==
X-Gm-Message-State: AAQBX9fslfWBJGWcaItHyuDcZwQbfYtpkW6R7Bdp0evgch6/Uy7SSzDA
 HEM/1bXKgzLRKE763sTXiaimKYDnpurdiV8ykLwxC7WmDTIx+0439KT+ovxdBKTGg4hfIwG51ZV
 HT7f9hA+UL6yIGNVj3EkANh2XrUKWqLD/Dg==
X-Received: by 2002:a6b:e809:0:b0:74c:aa8f:a83e with SMTP id
 f9-20020a6be809000000b0074caa8fa83emr1736933ioh.6.1680869017715; 
 Fri, 07 Apr 2023 05:03:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350b47GhoP5h7PpNabOBHlWCa/K0lm8L4p8ItVOpFt9aS9p6DIyF0sceWV4C6aZBR6S4P0IdR1A==
X-Received: by 2002:a6b:e809:0:b0:74c:aa8f:a83e with SMTP id
 f9-20020a6be809000000b0074caa8fa83emr1736912ioh.6.1680869017415; 
 Fri, 07 Apr 2023 05:03:37 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 m42-20020a026d2a000000b003a4419ba0c2sm1027418jac.139.2023.04.07.05.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 05:03:36 -0700 (PDT)
Date: Fri, 7 Apr 2023 06:03:35 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230407060335.7babfeb8.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB75291E6ED702ADD03AAE023BC3969@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-13-yi.l.liu@intel.com>
 <DS0PR11MB752996A6E6B3263BAD01DAC2C3929@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230403090151.4cb2158c.alex.williamson@redhat.com>
 <DS0PR11MB75291E6ED702ADD03AAE023BC3969@DS0PR11MB7529.namprd11.prod.outlook.com>
Organization: Red Hat
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

On Fri, 7 Apr 2023 10:09:58 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> Hi Alex,
> 
> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Monday, April 3, 2023 11:02 PM
> > 
> > On Mon, 3 Apr 2023 09:25:06 +0000
> > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >   
> > > > From: Liu, Yi L <yi.l.liu@intel.com>
> > > > Sent: Saturday, April 1, 2023 10:44 PM  
> > >  
> > > > @@ -791,7 +813,21 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev, void  
> > *data)  
> > > >  	if (!iommu_group)
> > > >  		return -EPERM; /* Cannot reset non-isolated devices */  
> > >
> > > Hi Alex,
> > >
> > > Is disabling iommu a sane way to test vfio noiommu mode?  
> > 
> > Yes
> >   
> > > I added intel_iommu=off to disable intel iommu and bind a device to vfio-pci.
> > > I can see the /dev/vfio/noiommu-0 and /dev/vfio/devices/noiommu-vfio0. Bind
> > > iommufd==-1 can succeed, but failed to get hot reset info due to the above
> > > group check. Reason is that this happens to have some affected devices, and
> > > these devices have no valid iommu_group (because they are not bound to vfio-pci
> > > hence nobody allocates noiommu group for them). So when hot reset info loops
> > > such devices, it failed with -EPERM. Is this expected?  
> > 
> > Hmm, I didn't recall that we put in such a limitation, but given the
> > minimally intrusive approach to no-iommu and the fact that we never
> > defined an invalid group ID to return to the user, it makes sense that
> > we just blocked the ioctl for no-iommu use.  I guess we can do the same
> > for no-iommu cdev.  
> 
> I just realize a further issue related to this limitation. Remember that we
> may finally compile out the vfio group infrastructure in the future. Say I
> want to test noiommu, I may boot such a kernel with iommu disabled. I think
> the _INFO ioctl would fail as there is no iommu_group. Does it mean we will
> not support hot reset for noiommu in future if vfio group infrastructure is
> compiled out?

We're talking about IOMMU groups, IOMMU groups are always present
regardless of whether we expose a vfio group interface to userspace.
Remember, we create IOMMU groups even in the no-iommu case.  Even with
pure cdev, there are underlying IOMMU groups that maintain the DMA
ownership.

> As another thread, we are going to add a new bdf/group capability to
> DEVICE_GET_INFO. If the above kernel is booted, shall we exclude the new
> bdf/group capability or add a flag in the capability to mark the group_id
> is invalid?

As above, there's always an IOMMU group, it's never invalid.  Thanks,

Alex

