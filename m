Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E03E36DBFFD
	for <lists+intel-gvt-dev@lfdr.de>; Sun,  9 Apr 2023 15:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EFF10E186;
	Sun,  9 Apr 2023 13:29:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC2610E186
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun,  9 Apr 2023 13:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681046995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Bq1nCo2uzlf7ONPT962ojuNI8nu31GYm0qBMd4gwlY=;
 b=GsyLnEqnhAOVg1BO1KSdI8+iMSFfMBfuQsD43jhtaeCk/+rbgIkh/S4yWw9QSqvMx7vFzb
 XPBgboCS6ujCj1Rk9+W1aztmfWA2ufzn8GFlvhzaIKNbyiIAedrMHRIwPcqggZKeR2M+dj
 VgKjrXVejvQ8cL0yaO/ZKmB76PsuZ4Y=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-YUSwiGeNMEqaoM5szAiJqg-1; Sun, 09 Apr 2023 09:29:54 -0400
X-MC-Unique: YUSwiGeNMEqaoM5szAiJqg-1
Received: by mail-il1-f198.google.com with SMTP id
 w14-20020a056e0213ee00b0032827955ae6so5526467ilj.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 09 Apr 2023 06:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681046994; x=1683638994;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7Bq1nCo2uzlf7ONPT962ojuNI8nu31GYm0qBMd4gwlY=;
 b=AkqAKp6UP/bAx5XfLoz6qxmpaAmD+X9NXVEzcvBf+oFs9PReQHqCA5BnxWH1IVZmNl
 lWVvch7++nF8UhH0heUsnXpLy4Qy04Zf5pN2NSjDy8EYHgoRb57Kk86wrs+MjvGSHyhh
 89vcRiCcgmOtvdGqmGUHW1jXFujHS0IVvdkrrDEOaN/U01QwDU1kIQh0d+Iji+vu5Y87
 GcokFCXaaGgp1CNsjhX39JsRb1EMyIbds380QaSnPC5YAapADCRno8vHeFKHeWs4fRXP
 oFRbNeYYoGlyuRyMBGyGUaSOKtKN1v9EspTzcjRAEsoWarEDMA8n5l7r/u4JurEo8kR2
 FURA==
X-Gm-Message-State: AAQBX9c3IByzjpmctysgSKNUGu9CkjTDeOJCNB/NKpeSV25EY9yt6xdK
 qA18yqI4I7NuxUGxvzmaBoBlyGfGyqD21t1Hpb4Waoow1iZU9E/95vJFnPjEGczugmR5w6qJf50
 TjlnsM4uiFs1U5JTJ5wAMUJOQS3qiNkdxXQ==
X-Received: by 2002:a5e:8809:0:b0:74c:8b56:42bb with SMTP id
 l9-20020a5e8809000000b0074c8b5642bbmr4560164ioj.8.1681046993687; 
 Sun, 09 Apr 2023 06:29:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350YJ0qrgM7M+MbMuHoCCOrJeRM9wUmVuPROC4iykvLcAJsJnYWn/0UyGq9/cBzihanZpy7nabQ==
X-Received: by 2002:a5e:8809:0:b0:74c:8b56:42bb with SMTP id
 l9-20020a5e8809000000b0074c8b5642bbmr4560143ioj.8.1681046993392; 
 Sun, 09 Apr 2023 06:29:53 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 w9-20020a6b4a09000000b007596db3874dsm2327622iob.35.2023.04.09.06.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Apr 2023 06:29:52 -0700 (PDT)
Date: Sun, 9 Apr 2023 07:29:51 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230409072951.629af3a7.alex.williamson@redhat.com>
In-Reply-To: <81a3e148-89de-e399-fefa-0785dac75f85@intel.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-13-yi.l.liu@intel.com>
 <DS0PR11MB752996A6E6B3263BAD01DAC2C3929@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230403090151.4cb2158c.alex.williamson@redhat.com>
 <DS0PR11MB75291E6ED702ADD03AAE023BC3969@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230407060335.7babfeb8.alex.williamson@redhat.com>
 <DS0PR11MB7529B0A91FF97C078BEA3783C3969@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230407075155.3ad4c804.alex.williamson@redhat.com>
 <DS0PR11MB7529C1CA38D7D1035869F358C3969@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230407091401.1c847419.alex.williamson@redhat.com>
 <DS0PR11MB7529A9D103F88381F84CF390C3969@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230407150721.395eabc4.alex.williamson@redhat.com>
 <SN7PR11MB75407463181A0D7A4F21D546C3979@SN7PR11MB7540.namprd11.prod.outlook.com>
 <20230408082018.04dcd1e3.alex.williamson@redhat.com>
 <81a3e148-89de-e399-fefa-0785dac75f85@intel.com>
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

On Sun, 9 Apr 2023 19:58:47 +0800
Yi Liu <yi.l.liu@intel.com> wrote:

> On 2023/4/8 22:20, Alex Williamson wrote:
> > On Sat, 8 Apr 2023 05:07:16 +0000
> > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >   
> >>> From: Alex Williamson <alex.williamson@redhat.com>
> >>> Sent: Saturday, April 8, 2023 5:07 AM
> >>>
> >>> On Fri, 7 Apr 2023 15:47:10 +0000
> >>> "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >>>      
> >>>>> From: Alex Williamson <alex.williamson@redhat.com>
> >>>>> Sent: Friday, April 7, 2023 11:14 PM
> >>>>>
> >>>>> On Fri, 7 Apr 2023 14:04:02 +0000
> >>>>> "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >>>>>     
> >>>>>>> From: Alex Williamson <alex.williamson@redhat.com>
> >>>>>>> Sent: Friday, April 7, 2023 9:52 PM
> >>>>>>>
> >>>>>>> On Fri, 7 Apr 2023 13:24:25 +0000
> >>>>>>> "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >>>>>>>     
> >>>>>>>>> From: Alex Williamson <alex.williamson@redhat.com>
> >>>>>>>>> Sent: Friday, April 7, 2023 8:04 PM
> >>>>>>>>>     
> >>>>>>>>>>>>> @@ -791,7 +813,21 @@ static int vfio_pci_fill_devs(struct pci_dev  
> >>>>> *pdev,  
> >>>>>>> void  
> >>>>>>>>>>> *data)  
> >>>>>>>>>>>>>   	if (!iommu_group)
> >>>>>>>>>>>>>   		return -EPERM; /* Cannot reset non-isolated devices  
> >>> */  
> >>>>>>>>
> >>>>>>>> [1]
> >>>>>>>>     
> >>>>>>>>>>>>
> >>>>>>>>>>>> Hi Alex,
> >>>>>>>>>>>>
> >>>>>>>>>>>> Is disabling iommu a sane way to test vfio noiommu mode?  
> >>>>>>>>>>>
> >>>>>>>>>>> Yes
> >>>>>>>>>>>     
> >>>>>>>>>>>> I added intel_iommu=off to disable intel iommu and bind a device to  
> >>> vfio-  
> >>>>> pci.  
> >>>>>>>>>>>> I can see the /dev/vfio/noiommu-0 and /dev/vfio/devices/noiommu-  
> >>> vfio0.  
> >>>>>>> Bind  
> >>>>>>>>>>>> iommufd==-1 can succeed, but failed to get hot reset info due to the  
> >>>>> above  
> >>>>>>>>>>>> group check. Reason is that this happens to have some affected  
> >>> devices,  
> >>>>> and  
> >>>>>>>>>>>> these devices have no valid iommu_group (because they are not  
> >>> bound to  
> >>>>>>> vfio-  
> >>>>>>>>> pci  
> >>>>>>>>>>>> hence nobody allocates noiommu group for them). So when hot reset  
> >>> info  
> >>>>>>> loops  
> >>>>>>>>>>>> such devices, it failed with -EPERM. Is this expected?  
> >>>>>>>>>>>
> >>>>>>>>>>> Hmm, I didn't recall that we put in such a limitation, but given the
> >>>>>>>>>>> minimally intrusive approach to no-iommu and the fact that we never
> >>>>>>>>>>> defined an invalid group ID to return to the user, it makes sense that
> >>>>>>>>>>> we just blocked the ioctl for no-iommu use.  I guess we can do the same
> >>>>>>>>>>> for no-iommu cdev.  
> >>>>>>>>>>
> >>>>>>>>>> I just realize a further issue related to this limitation. Remember that we
> >>>>>>>>>> may finally compile out the vfio group infrastructure in the future. Say I
> >>>>>>>>>> want to test noiommu, I may boot such a kernel with iommu disabled. I  
> >>> think  
> >>>>>>>>>> the _INFO ioctl would fail as there is no iommu_group. Does it mean we  
> >>> will  
> >>>>>>>>>> not support hot reset for noiommu in future if vfio group infrastructure is
> >>>>>>>>>> compiled out?  
> >>>>>>>>>
> >>>>>>>>> We're talking about IOMMU groups, IOMMU groups are always present
> >>>>>>>>> regardless of whether we expose a vfio group interface to userspace.
> >>>>>>>>> Remember, we create IOMMU groups even in the no-iommu case.  Even  
> >>> with  
> >>>>>>>>> pure cdev, there are underlying IOMMU groups that maintain the DMA
> >>>>>>>>> ownership.  
> >>>>>>>>
> >>>>>>>> hmmm. As [1], when iommu is disabled, there will be no iommu_group for a
> >>>>>>>> given device unless it is registered to VFIO, which a fake group is created.
> >>>>>>>> That's why I hit the limitation [1]. When vfio_group is compiled out, then
> >>>>>>>> even fake group goes away.  
> >>>>>>>
> >>>>>>> In the vfio group case, [1] can be hit with no-iommu only when there
> >>>>>>> are affected devices which are not bound to vfio.  
> >>>>>>
> >>>>>> yes. because vfio would allocate fake group when device is registered to
> >>>>>> it.
> >>>>>>     
> >>>>>>> Why are we not
> >>>>>>> allocating an IOMMU group to no-iommu devices when vfio group is
> >>>>>>> disabled?  Thanks,  
> >>>>>>
> >>>>>> hmmm. when the vfio group code is configured out. The
> >>>>>> vfio_device_set_group() just returns 0 after below patch is
> >>>>>> applied and CONFIG_VFIO_GROUP=n. So when there is no
> >>>>>> vfio group, the fake group also goes away.
> >>>>>>
> >>>>>> https://lore.kernel.org/kvm/20230401151833.124749-25-yi.l.liu@intel.com/  
> >>>>>
> >>>>> Is this a fundamental issue or just a problem with the current
> >>>>> implementation proposal?  It seems like the latter.  FWIW, I also don't
> >>>>> see a taint happening in the cdev path for no-iommu use.  Thanks,  
> >>>>
> >>>> yes. the latter case. The reason I raised it here is to confirm the
> >>>> policy on the new group/bdf capability in the DEVICE_GET_INFO. If
> >>>> there is no iommu group, perhaps I only need to exclude the new
> >>>> group/bdf capability from the cap chain of DEVICE_GET_INFO. is it?  
> >>>
> >>> I think we need to revisit the question of why allocating an IOMMU
> >>> group for a no-iommu device is exclusive to the vfio group support.  
> >>
> >> For no-iommu device, the iommu group is a fake group allocated by vfio.
> >> is it? And the fake group allocation is part of the vfio group code.
> >> It is the vfio_device_set_group() in group.c. If vfio group code is not
> >> compiled in, vfio does not allocate fake groups. Detail for this compiling
> >> can be found in link [1].
> >>  
> >>> We've already been down the path of trying to report a field that only
> >>> exists for devices with certain properties with dev-id.  It doesn't
> >>> work well.  I think we've said all along that while the cdev interface
> >>> is device based, there are still going to be underlying IOMMU groups
> >>> for the user to be aware of, they're just not as much a fundamental
> >>> part of the interface.  There should not be a case where a device
> >>> doesn't have a group to report.  Thanks,  
> >>
> >> As the patch in link [1] makes vfio group optional, so if compile a kernel
> >> with CONFIG_VFIO_GROUP=n, and boot it with iommu disabled, then there is no
> >> group to report. Perhaps this is not a typical usage but still a sane usage
> >> for noiommu mode as I confirmed with you in this thread. So when it comes,
> >> needs to consider what to report for the group field.
> >>
> >> Perhaps I messed up the discussion by referring to a patch that is part of
> >> another series. But I think it should be considered when talking about the
> >> group to be reported.  
> > 
> > The question is whether the split that group.c code handles both the
> > vfio group AND creation of the IOMMU group in such cases is the correct
> > split.  I'm not arguing that the way the code is currently laid out has
> > the fake IOMMU group for no-iommu devices created in vfio group
> > specific code, but we have a common interface that makes use of IOMMU
> > group information for which we don't have an equivalent alternative
> > data field to report.  
> 
> yes. It is needed to ensure _HOT_RESET_INFO workable for noiommu devices.
> 
> > We've shown that dev-id doesn't work here because dev-ids only exist
> > for devices within the user's IOMMU context.  Also reporting an invalid
> > ID of any sort fails to indicate the potential implied ownership.
> > Therefore I recognize that if this interface is to report an IOMMU
> > group, then the creation of fake IOMMU groups existing only in vfio
> > group code would need to be refactored.  Thanks,  
> 
> yeah, needs to move the iommu group creation back to vfio_main.c. This
> would be a prerequisite for [1]
> 
> [1] https://lore.kernel.org/kvm/20230401151833.124749-25-yi.l.liu@intel.com/
> 
> I'll also try out your suggestion to add a capability like below and link
> it in the vfio_device_info cap chain.
> 
> #define VFIO_DEVICE_INFO_CAP_PCI_BDF          5
> 
> struct vfio_device_info_cap_pci_bdf {
>          struct vfio_info_cap_header header;
>          __u32   group_id;
>          __u16   segment;
>          __u8    bus;
>          __u8    devfn; /* Use PCI_SLOT/PCI_FUNC */
> };
> 

Group-id and bdf should be separate capabilities, all device should
report a group-id capability and only PCI devices a bdf capability.
Thanks,

Alex

