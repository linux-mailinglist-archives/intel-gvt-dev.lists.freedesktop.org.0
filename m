Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43896DAF74
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Apr 2023 17:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D70B10EDD6;
	Fri,  7 Apr 2023 15:14:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239EA10EDD6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  7 Apr 2023 15:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680880449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXAPNdBJMnoHbxVht9yPga+A2CeJtiyrlF4HM2aW+j0=;
 b=cHndazdCekSF0j04vvOsKY77wy+p2XoxtrlbQJMbkAcJdxKuTn+b1UTSLI+S+PVYGmVOHv
 GdBbp+pg0ItZNSfnzJdAuWRAdv2VRp+u7famliPT7Vbum42yxPNtoAZIqpOADbLnubsWZT
 IBfCAvVHNAg1JoB4iRf8R8JyAjGX3Jk=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-4JHZ-7DVMt-ejtY9DbA8SQ-1; Fri, 07 Apr 2023 11:14:06 -0400
X-MC-Unique: 4JHZ-7DVMt-ejtY9DbA8SQ-1
Received: by mail-il1-f199.google.com with SMTP id
 a3-20020a92c543000000b0032651795968so13885258ilj.19
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 07 Apr 2023 08:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680880445; x=1683472445;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iXAPNdBJMnoHbxVht9yPga+A2CeJtiyrlF4HM2aW+j0=;
 b=huJkj3lM0UplF9+RW06/a4n1/OLOwPOl6iJCpA4humaAY+L/dqBGGL6Zl38CI9ozJ8
 jvpmm+e2hPUwRjmzoEUIbLDzJNj4e5xjwwpUYjV3HNWFjEICgf/WFFirs9RcVx6a2JLq
 zAHbExDokXRePuQVvE3F78z8NE5CqGuX55VMlvlIN7ArcGBcKttSWhJtRoH1B7KXcXrM
 d8aEKxvC+PWRqGqExJwNT23pLrI6O0MUA8NjVuA67r1veRKfRhocc5s6lqppdNs1TXBf
 TgR6kFVH4I60ji111gQXuRkzRrRwTxGPp+vqeRDOR4BxYj/hCaTb/r5c42O29hdpvlUX
 lhEA==
X-Gm-Message-State: AAQBX9dCPw5qynpI4tCqJ543evJL473Aqr05XMX8uSRplMnPw+apsmid
 281KVx8EqrIUiuSjAEdBWBXDe08IKn48N5j3g/JaDefgUmui9ArGr9vDfc2g6gm46ahXPr1mOBS
 KjCJWB65Z8+uBWZHSKH5LwbCTTHH5caj8XQ==
X-Received: by 2002:a6b:e611:0:b0:74c:9235:8753 with SMTP id
 g17-20020a6be611000000b0074c92358753mr2519779ioh.13.1680880445447; 
 Fri, 07 Apr 2023 08:14:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350YEpVoORZpa6d3nNLDs1r1CtYmaffUAedkEJ1EC3FuUQNNUjaJPIAYHNqBk5PYwGJ72oUes6w==
X-Received: by 2002:a6b:e611:0:b0:74c:9235:8753 with SMTP id
 g17-20020a6be611000000b0074c92358753mr2519746ioh.13.1680880445186; 
 Fri, 07 Apr 2023 08:14:05 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 z20-20020a027a54000000b004061ac1ddd1sm1174890jad.169.2023.04.07.08.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 08:14:04 -0700 (PDT)
Date: Fri, 7 Apr 2023 09:14:01 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230407091401.1c847419.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529C1CA38D7D1035869F358C3969@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-13-yi.l.liu@intel.com>
 <DS0PR11MB752996A6E6B3263BAD01DAC2C3929@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230403090151.4cb2158c.alex.williamson@redhat.com>
 <DS0PR11MB75291E6ED702ADD03AAE023BC3969@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230407060335.7babfeb8.alex.williamson@redhat.com>
 <DS0PR11MB7529B0A91FF97C078BEA3783C3969@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230407075155.3ad4c804.alex.williamson@redhat.com>
 <DS0PR11MB7529C1CA38D7D1035869F358C3969@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Fri, 7 Apr 2023 14:04:02 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Friday, April 7, 2023 9:52 PM
> > 
> > On Fri, 7 Apr 2023 13:24:25 +0000
> > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >   
> > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > Sent: Friday, April 7, 2023 8:04 PM
> > > >  
> > > > > > > > @@ -791,7 +813,21 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev,  
> > void  
> > > > > > *data)  
> > > > > > > >  	if (!iommu_group)
> > > > > > > >  		return -EPERM; /* Cannot reset non-isolated devices */  
> > >
> > > [1]
> > >  
> > > > > > >
> > > > > > > Hi Alex,
> > > > > > >
> > > > > > > Is disabling iommu a sane way to test vfio noiommu mode?  
> > > > > >
> > > > > > Yes
> > > > > >  
> > > > > > > I added intel_iommu=off to disable intel iommu and bind a device to vfio-pci.
> > > > > > > I can see the /dev/vfio/noiommu-0 and /dev/vfio/devices/noiommu-vfio0.  
> > Bind  
> > > > > > > iommufd==-1 can succeed, but failed to get hot reset info due to the above
> > > > > > > group check. Reason is that this happens to have some affected devices, and
> > > > > > > these devices have no valid iommu_group (because they are not bound to  
> > vfio-  
> > > > pci  
> > > > > > > hence nobody allocates noiommu group for them). So when hot reset info  
> > loops  
> > > > > > > such devices, it failed with -EPERM. Is this expected?  
> > > > > >
> > > > > > Hmm, I didn't recall that we put in such a limitation, but given the
> > > > > > minimally intrusive approach to no-iommu and the fact that we never
> > > > > > defined an invalid group ID to return to the user, it makes sense that
> > > > > > we just blocked the ioctl for no-iommu use.  I guess we can do the same
> > > > > > for no-iommu cdev.  
> > > > >
> > > > > I just realize a further issue related to this limitation. Remember that we
> > > > > may finally compile out the vfio group infrastructure in the future. Say I
> > > > > want to test noiommu, I may boot such a kernel with iommu disabled. I think
> > > > > the _INFO ioctl would fail as there is no iommu_group. Does it mean we will
> > > > > not support hot reset for noiommu in future if vfio group infrastructure is
> > > > > compiled out?  
> > > >
> > > > We're talking about IOMMU groups, IOMMU groups are always present
> > > > regardless of whether we expose a vfio group interface to userspace.
> > > > Remember, we create IOMMU groups even in the no-iommu case.  Even with
> > > > pure cdev, there are underlying IOMMU groups that maintain the DMA
> > > > ownership.  
> > >
> > > hmmm. As [1], when iommu is disabled, there will be no iommu_group for a
> > > given device unless it is registered to VFIO, which a fake group is created.
> > > That's why I hit the limitation [1]. When vfio_group is compiled out, then
> > > even fake group goes away.  
> > 
> > In the vfio group case, [1] can be hit with no-iommu only when there
> > are affected devices which are not bound to vfio.  
> 
> yes. because vfio would allocate fake group when device is registered to
> it.
> 
> > Why are we not
> > allocating an IOMMU group to no-iommu devices when vfio group is
> > disabled?  Thanks,  
> 
> hmmm. when the vfio group code is configured out. The
> vfio_device_set_group() just returns 0 after below patch is
> applied and CONFIG_VFIO_GROUP=n. So when there is no
> vfio group, the fake group also goes away.
> 
> https://lore.kernel.org/kvm/20230401151833.124749-25-yi.l.liu@intel.com/

Is this a fundamental issue or just a problem with the current
implementation proposal?  It seems like the latter.  FWIW, I also don't
see a taint happening in the cdev path for no-iommu use.  Thanks,

Alex

