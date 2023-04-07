Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEADC6DAE5D
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Apr 2023 15:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29CE10E367;
	Fri,  7 Apr 2023 13:52:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F2210E367
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  7 Apr 2023 13:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680875522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5oB5DxaREwrVRr8+bFg0rReMg3cK5Dvz3xm2hNY4dxU=;
 b=QOb5EJQQqLSFlRrHKkJ8okYnNtI3WRrGW1oM2w/B7UuNfHsUAI+no7KWtj4sWSq+5Gd6uG
 yLcuEVb14Y4OsDq1Cy2os+jbQE5QqvpNJI969Tm09xYE2rtAM79dNdVkB3W4ZaR6GU39Qr
 XgiSA+8MJxantvj/umiNP/NUGYATOZU=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-w6NllQzYPnGsOLYu4eTrEg-1; Fri, 07 Apr 2023 09:52:00 -0400
X-MC-Unique: w6NllQzYPnGsOLYu4eTrEg-1
Received: by mail-il1-f199.google.com with SMTP id
 d11-20020a056e020c0b00b00326156e3a8bso22086262ile.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 07 Apr 2023 06:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680875520; x=1683467520;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5oB5DxaREwrVRr8+bFg0rReMg3cK5Dvz3xm2hNY4dxU=;
 b=kFeYHtHJ0m3Vtdd1XR0SbVlyq7asuOfH69lTsYrMe+YwUfOgTgn0HmQSTdYiYZKgcg
 ITsMtPjVTe80GnYot1z55K2n4EF3irDCvx7RmltpirJWPyywI0iYS9P1xdif6uyTxbNz
 oA2rvKKir72xnzjsUfCpyAPZ0BW6O8xtMwKWpbY2lyswQ7bZLWdzJuPSiD3U41V6i/NG
 mh0mQ4bf8/9n3cJB76bHfx/qB2BeNV4phF29gYThvkV77SaE4RuxIzN8e9TsxxExm9o8
 XIw2bhhYzYHBBfEqfHMqTQdJti3TwPJiJvuCusvC6RCmjRvxOchPjmOmNv/l0pwY2Iez
 7knw==
X-Gm-Message-State: AAQBX9cQpaCVyWNa1svjPuUPUGLFDxgtHLRzIRbW+nnzjpfkMbwvaPnK
 r84PQUnQgHLzH/FJW8ZazznXW1FUS8NLlDS/w8fP9IMUr6aXoYD5ZAPQ889KSZxUEDqIGhzu3Ed
 ubsiNxDKlMnyeOxo0yahBNLt9agk5S0M6DA==
X-Received: by 2002:a92:d48f:0:b0:328:6172:a743 with SMTP id
 p15-20020a92d48f000000b003286172a743mr443834ilg.17.1680875519893; 
 Fri, 07 Apr 2023 06:51:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zt5SmVHCjY2WY3fhBLjS2FZtxV74Lk/zdXvq7uKSlH13byRx8CMKnoBIxJ5VwJKvWvSSSNGA==
X-Received: by 2002:a92:d48f:0:b0:328:6172:a743 with SMTP id
 p15-20020a92d48f000000b003286172a743mr443824ilg.17.1680875519642; 
 Fri, 07 Apr 2023 06:51:59 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 s28-20020a02b15c000000b00374fa5b600csm1112214jah.0.2023.04.07.06.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 06:51:59 -0700 (PDT)
Date: Fri, 7 Apr 2023 07:51:55 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230407075155.3ad4c804.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529B0A91FF97C078BEA3783C3969@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-13-yi.l.liu@intel.com>
 <DS0PR11MB752996A6E6B3263BAD01DAC2C3929@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230403090151.4cb2158c.alex.williamson@redhat.com>
 <DS0PR11MB75291E6ED702ADD03AAE023BC3969@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230407060335.7babfeb8.alex.williamson@redhat.com>
 <DS0PR11MB7529B0A91FF97C078BEA3783C3969@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Fri, 7 Apr 2023 13:24:25 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Friday, April 7, 2023 8:04 PM
> >   
> > > > > > @@ -791,7 +813,21 @@ static int vfio_pci_fill_devs(struct pci_dev *pdev, void  
> > > > *data)  
> > > > > >  	if (!iommu_group)
> > > > > >  		return -EPERM; /* Cannot reset non-isolated devices */  
> 
> [1]
> 
> > > > >
> > > > > Hi Alex,
> > > > >
> > > > > Is disabling iommu a sane way to test vfio noiommu mode?  
> > > >
> > > > Yes
> > > >  
> > > > > I added intel_iommu=off to disable intel iommu and bind a device to vfio-pci.
> > > > > I can see the /dev/vfio/noiommu-0 and /dev/vfio/devices/noiommu-vfio0. Bind
> > > > > iommufd==-1 can succeed, but failed to get hot reset info due to the above
> > > > > group check. Reason is that this happens to have some affected devices, and
> > > > > these devices have no valid iommu_group (because they are not bound to vfio-  
> > pci  
> > > > > hence nobody allocates noiommu group for them). So when hot reset info loops
> > > > > such devices, it failed with -EPERM. Is this expected?  
> > > >
> > > > Hmm, I didn't recall that we put in such a limitation, but given the
> > > > minimally intrusive approach to no-iommu and the fact that we never
> > > > defined an invalid group ID to return to the user, it makes sense that
> > > > we just blocked the ioctl for no-iommu use.  I guess we can do the same
> > > > for no-iommu cdev.  
> > >
> > > I just realize a further issue related to this limitation. Remember that we
> > > may finally compile out the vfio group infrastructure in the future. Say I
> > > want to test noiommu, I may boot such a kernel with iommu disabled. I think
> > > the _INFO ioctl would fail as there is no iommu_group. Does it mean we will
> > > not support hot reset for noiommu in future if vfio group infrastructure is
> > > compiled out?  
> > 
> > We're talking about IOMMU groups, IOMMU groups are always present
> > regardless of whether we expose a vfio group interface to userspace.
> > Remember, we create IOMMU groups even in the no-iommu case.  Even with
> > pure cdev, there are underlying IOMMU groups that maintain the DMA
> > ownership.  
> 
> hmmm. As [1], when iommu is disabled, there will be no iommu_group for a
> given device unless it is registered to VFIO, which a fake group is created.
> That's why I hit the limitation [1]. When vfio_group is compiled out, then
> even fake group goes away.

In the vfio group case, [1] can be hit with no-iommu only when there
are affected devices which are not bound to vfio.  Why are we not
allocating an IOMMU group to no-iommu devices when vfio group is
disabled?  Thanks,

Alex

