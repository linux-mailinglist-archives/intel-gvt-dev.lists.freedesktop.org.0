Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFCD6F0BF9
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Apr 2023 20:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647B110E32F;
	Thu, 27 Apr 2023 18:32:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9233010E32F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Apr 2023 18:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682620331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p6LZTxbqMNSlOAcpVGltFAX5rwaxLlFX1/1eyhmddg0=;
 b=bPQfNoVOd4XbxBPsYNQ4d8p3n8ir32eJe2qSay3uzi4bvZBQ+k7ZwoWzES+4i35IOaNCZc
 BnQy5+FQD1GQctc4WkmG7FNzrHuhxANawRaiWGtuHauEcaHKPVqFMGSTR1AgqZvx5E33Wv
 pkmvUeI77cBS/1WEQZgwRlI7XAdXTjk=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-xu9iY1LOPNOjkNT8JMSpGQ-1; Thu, 27 Apr 2023 14:32:07 -0400
X-MC-Unique: xu9iY1LOPNOjkNT8JMSpGQ-1
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-32959198653so138734945ab.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Apr 2023 11:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682620326; x=1685212326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p6LZTxbqMNSlOAcpVGltFAX5rwaxLlFX1/1eyhmddg0=;
 b=W1aTCDxYXOT90jVVulQsu2j2f8G9qnr3e01Y/7rPUiA03HgKa95tbQaO21MSlkmDE3
 ZLI+8NbtuOHb/9N2+rx/duhOD9aAZXOPHqHpdpC7Ur7CwyyVur+xHBUkFscIs5Ii1mPq
 GT3VWTCZb32yhkms1YojPwIQiOF9PpsQgEDkj0wrkZNgX3GU5iAueeMVdhdXDhMfGiZX
 CUOOiHCnugRLEGeLvPFk9kwrYOcY6snNvvWvNej1qzF292ZL76BeC5GbrBzkaDnwfjoT
 ZcboK8GpDodF7xYLFpjFr3NnSPl7x5zBlNRP2mVY7fXnPh51JIKglhB/ETy8f90OytsO
 +Aug==
X-Gm-Message-State: AC+VfDwPVAlyzxbHw1zXhRFKZxeSGJrnOFxp9sLcftL48bGRgE4LTFxu
 B//4PVo3Osokoob53oE5/hUDuH5EMwsldk2BlUsnl3q6qeqVbspNLMNuPk4XsXyB1ihehSNR8F3
 xg5qxjyh15cVuCb/pmKpUYf+K19tk44TQAg==
X-Received: by 2002:a92:d3c3:0:b0:329:43f0:1570 with SMTP id
 c3-20020a92d3c3000000b0032943f01570mr1980498ilh.23.1682620326428; 
 Thu, 27 Apr 2023 11:32:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ZjtNj+NU5UefOIsxARLgAXnZyiFoLNkWt/mynkGIjXDEBZIDUWBFQOZkzcIK9k2Lxdx+w+g==
X-Received: by 2002:a92:d3c3:0:b0:329:43f0:1570 with SMTP id
 c3-20020a92d3c3000000b0032943f01570mr1980473ilh.23.1682620326188; 
 Thu, 27 Apr 2023 11:32:06 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 a20-20020a027354000000b004090c67f155sm5693305jae.91.2023.04.27.11.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 11:32:05 -0700 (PDT)
Date: Thu, 27 Apr 2023 12:32:03 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v4 2/9] vfio-iommufd: Create iommufd_access for noiommu
 devices
Message-ID: <20230427123203.22307c4f.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB752972AC1A6030CB442ACF3FC36A9@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230426145419.450922-1-yi.l.liu@intel.com>
 <20230426145419.450922-3-yi.l.liu@intel.com>
 <BN9PR11MB52768AF474FAB2AF36AC00508C6A9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <DS0PR11MB752972AC1A6030CB442ACF3FC36A9@DS0PR11MB7529.namprd11.prod.outlook.com>
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
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 27 Apr 2023 06:59:17 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Tian, Kevin <kevin.tian@intel.com>
> > Sent: Thursday, April 27, 2023 2:39 PM
> >   
> > > From: Liu, Yi L <yi.l.liu@intel.com>
> > > Sent: Wednesday, April 26, 2023 10:54 PM
> > > @@ -121,7 +128,8 @@ static void vfio_emulated_unmap(void *data,
> > > unsigned long iova,
> > >  {
> > >  	struct vfio_device *vdev = data;
> > >
> > > -	if (vdev->ops->dma_unmap)
> > > +	/* noiommu devices cannot do map/unmap */
> > > +	if (vdev->noiommu && vdev->ops->dma_unmap)
> > >  		vdev->ops->dma_unmap(vdev, iova, length);  
> > 
> > Is it necessary? All mdev devices implementing @dma_unmap won't
> > set noiommu flag.  
> 
> Hmmm. Yes, and all the devices set noiommu is not implementing @dma_unmap
> as far as I see. Maybe this noiommu check can be removed.

Not to mention that the polarity of the noiommu test is backwards here!
This also seems to be the only performance path where noiommu is tested
and therefore I believe the only actual justification of the previous
patch.
 
> > Instead in the future if we allow noiommu userspace to pin pages
> > we'd need similar logic too.  
> 
> I'm not quite sure about it so far. For mdev devices, the device driver
> may use vfio_pin_pages/vfio_dma_rw () to pin page. Hence such drivers
> need to listen to dma_unmap() event. But for noiommu users, does the
> device driver also participate in the page pin? At least for vfio-pci driver,
> it does not, or maybe it will in the future when enabling noiommu
> userspace to pin pages. It looks to me such userspace should order
> the DMA before calling ioctl to unpin page instead of letting device
> driver listen to unmap.

Whoa, noiommu is inherently unsafe an only meant to expose the vfio
device interface for userspace drivers that are going to do unsafe
things regardless.  Enabling noiommu to work with mdev, pin pages, or
anything else should not be on our agenda.  Userspaces relying on niommu
get the minimum viable interface and must impose a minuscule
incremental maintenance burden.  The only reason we're spending so much
effort on it here is to make iommufd noiommu support equivalent to
group/container noiommu support.  We should stop at that.  Thanks,

Alex

