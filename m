Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 990B86A8AF0
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  2 Mar 2023 22:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99BA10E290;
	Thu,  2 Mar 2023 21:04:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3D010E2A0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  2 Mar 2023 21:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677791092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EdnbjlV/XNQ2xABD+7i8aLqQ6C5aoh9/k3+KKrPoC4Q=;
 b=Gw6fqBWZ1XtD7f6JEmmLfvS/1IvduqRQmZ1uZ1tmK5bnITj4TX6ZmD47CmaMrkgiCEbM2y
 ErXUj/wW/rfRXyTsE2Jt6fFRc0m9sR4GZyDajKfbWlxdN1r/CBRcdUy1tfi2OnhhuKCT+r
 dp63OHylAwd9le0uMl0zcVTzoI7ohe0=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-oCXc6YU_Pgmo9151dIclUw-1; Thu, 02 Mar 2023 16:04:51 -0500
X-MC-Unique: oCXc6YU_Pgmo9151dIclUw-1
Received: by mail-io1-f69.google.com with SMTP id
 y187-20020a6bc8c4000000b0074d28aa136dso217711iof.13
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 02 Mar 2023 13:04:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EdnbjlV/XNQ2xABD+7i8aLqQ6C5aoh9/k3+KKrPoC4Q=;
 b=koO/B1N8oTZXRKz7bUrzGbFYAyk4vdDJshw6CscY5O3aGeC+lOU5y5mWf2/HFBdPxd
 MTpHV1TefnMFCD2x59nAlcmxzLzxUJp6bK4dnedEeY11sjxEvp9z+w2Vl8JDFozxMSFN
 Z5KNxIyAd/o9qhqyrHURQq9n9J9zl4jtTTE0aYwytKfVtrIPrr+SxB78rmqKuLSavdc+
 QeJUk7hUZPiMRLSNI9x10TYPzKN5e54Vz6I5lGus28uqaxg/Jl9rEX7X+2gxIGxQrSlu
 F9mFeowjM4f0Klukb81Ad1uM1EOz8e4gBIv2qB6kJNXwgXTXsffG6TXuj+uuGXg+jyha
 Myhw==
X-Gm-Message-State: AO0yUKXE48bTg3r6MVx3U0cOhSazZzGk5N4m2NtM7DG1W8pyA6SipUi2
 0yMooS+bSphq41wyl9iW7C3NZXyY54vzhD1E71JDCsabD+kKV8UWwAqr3G1pFaT1orIfrJOkEZy
 dQisC0brEZxm27ZBsmN8l4QK6e1cVnPoNMg==
X-Received: by 2002:a05:6e02:20e4:b0:317:3f4:c06c with SMTP id
 q4-20020a056e0220e400b0031703f4c06cmr7773631ilv.20.1677791090661; 
 Thu, 02 Mar 2023 13:04:50 -0800 (PST)
X-Google-Smtp-Source: AK7set94uChKRWLMdqu/Ih+nuSAZEd1Mmf7EHZCWSlCtEFZv1sWj3peN/v4x5tVoV8vEfvWV2G/sUA==
X-Received: by 2002:a05:6e02:20e4:b0:317:3f4:c06c with SMTP id
 q4-20020a056e0220e400b0031703f4c06cmr7773607ilv.20.1677791090355; 
 Thu, 02 Mar 2023 13:04:50 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 u2-20020a92da82000000b00313ca4be5e1sm109451iln.12.2023.03.02.13.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:04:49 -0800 (PST)
Date: Thu, 2 Mar 2023 14:04:48 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v5 09/19] vfio/pci: Allow passing zero-length fd array
 in VFIO_DEVICE_PCI_HOT_RESET
Message-ID: <20230302140448.5a6a748a.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB75295B4B2578765C8B08AC7EC3B29@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230227111135.61728-1-yi.l.liu@intel.com>
 <20230227111135.61728-10-yi.l.liu@intel.com>
 <DS0PR11MB75295B4B2578765C8B08AC7EC3B29@DS0PR11MB7529.namprd11.prod.outlook.com>
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
 "lulu@redhat.com" <lulu@redhat.com>, "joro@8bytes.org" <joro@8bytes.org>,
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

On Thu, 2 Mar 2023 06:07:04 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Liu, Yi L <yi.l.liu@intel.com>
> > Sent: Monday, February 27, 2023 7:11 PM  
> [...]
> > @@ -2392,13 +2416,25 @@ static int
> > vfio_pci_dev_set_pm_runtime_get(struct vfio_device_set *dev_set)
> >  	return ret;
> >  }
> > 
> > +static bool vfio_dev_in_iommufd_ctx(struct vfio_pci_core_device *vdev,
> > +				    struct iommufd_ctx *iommufd_ctx)
> > +{
> > +	struct iommufd_ctx *iommufd = vfio_device_iommufd(&vdev-  
> > >vdev);  
> > +
> > +	if (!iommufd)
> > +		return false;
> > +
> > +	return iommufd == iommufd_ctx;
> > +}
> > +
> >  /*
> >   * We need to get memory_lock for each device, but devices can share
> > mmap_lock,
> >   * therefore we need to zap and hold the vma_lock for each device, and
> > only then
> >   * get each memory_lock.
> >   */
> >  static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
> > -				      struct vfio_pci_group_info *groups)
> > +				      struct vfio_pci_group_info *groups,
> > +				      struct iommufd_ctx *iommufd_ctx)
> >  {
> >  	struct vfio_pci_core_device *cur_mem;
> >  	struct vfio_pci_core_device *cur_vma;
> > @@ -2429,10 +2465,27 @@ static int vfio_pci_dev_set_hot_reset(struct
> > vfio_device_set *dev_set,
> > 
> >  	list_for_each_entry(cur_vma, &dev_set->device_list,
> > vdev.dev_set_list) {
> >  		/*
> > -		 * Test whether all the affected devices are contained by
> > the
> > -		 * set of groups provided by the user.
> > +		 * Test whether all the affected devices can be reset by the
> > +		 * user.  The affected devices may already been opened or
> > not
> > +		 * yet.
> > +		 *
> > +		 * For the devices not opened yet, user can reset them. The
> > +		 * reason is that the hot reset is done under the protection
> > +		 * of the dev_set->lock, and device open is also under this
> > +		 * lock.  During the hot reset, such devices can not be
> > opened
> > +		 * by other users.
> > +		 *
> > +		 * For the devices that have been opened, needs to check
> > the
> > +		 * ownership.  If the user provides a set of group fds, the
> > +		 * ownership check is done by checking if all the opened
> > +		 * devices are contained by the groups.  If the user provides
> > +		 * a zero-length fd array, the ownerhsip check is done by
> > +		 * checking if all the opened devices are bound to the same
> > +		 * iommufd_ctx.
> >  		 */
> > -		if (!vfio_dev_in_groups(cur_vma, groups)) {
> > +		if (cur_vma->vdev.open_count &&
> > +		    !vfio_dev_in_groups(cur_vma, groups) &&
> > +		    !vfio_dev_in_iommufd_ctx(cur_vma, iommufd_ctx)) {  
> 
> Hi Alex, Jason,
> 
> There is one concern on this approach which is related to the
> cdev noiommu mode. As patch 16 of this series, cdev path
> supports noiommu mode by passing a negative iommufd to
> kernel. In such case, the vfio_device is not bound to a valid
> iommufd. Then the check in vfio_dev_in_iommufd_ctx() is
> to be broken.
> 
> An idea is to add a cdev_noiommu flag in vfio_device, when
> checking the iommufd_ictx, also check this flag. If all the opened
> devices in the dev_set have vfio_device->cdev_noiommu==true,
> then the reset is considered to be doable. But there is a special
> case. If devices in this dev_set are opened by two applications
> that operates in cdev noiommu mode, then this logic is not able
> to differentiate them. In that case, should we allow the reset?
> It seems to ok to allow reset since noiommu mode itself means
> no security between the applications that use it. thoughts?

I don't think the existing vulnerabilities of no-iommu mode should be
carte blanche to add additional weaknesses.  Thanks,

Alex

