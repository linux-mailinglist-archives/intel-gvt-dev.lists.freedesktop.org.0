Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6034A70888D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 May 2023 21:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E753E10E134;
	Thu, 18 May 2023 19:46:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DF310E134
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 May 2023 19:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684439158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YyW7RBXSmGHBAYv2QWmk4im2x9juM0YLLtgp7WpEXSw=;
 b=iXQgOq0OmOIxO11tSM0fk4hwYV2adHYx285c4hQwxwwLJxFEdm7OVNiu7YjXSssyWF47Xc
 6HHHcrwKvBSKozjMs6D4zm6ie1KkYqg84ZTcTj1z2VYqgj0T6nR5YPCHqy/PuplXY3R9uB
 u5r8hodyj7IBfmDxQ9l22GMQkISn29o=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-_kkvBmZEP2uH_bVRIB8gNQ-1; Thu, 18 May 2023 15:45:56 -0400
X-MC-Unique: _kkvBmZEP2uH_bVRIB8gNQ-1
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-760718e6878so397727939f.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 May 2023 12:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684439156; x=1687031156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YyW7RBXSmGHBAYv2QWmk4im2x9juM0YLLtgp7WpEXSw=;
 b=EIOgnOrbYePY7YVfD46Glp9sEcC2tt2wYcIBRMQzTVKSB+Bjs1lBingVNsRzkDUbTI
 Lvu+/r9LGKpm5KljDTdgYkxYZ3o2Mk1Xozk4a6NUEL9iAIAde4ZYB9jhd7Nps9bvuF6n
 g/J84BzohEOBLYC4cGKi1td0yhzzClhGfpBBwMAHjYUBPkgUwrj4aQ6sVIPlEhGLzAW7
 KHnABab4D5wUnpxp3tbLLtJtx+vIdkPMGvWp1/zKYJp8Y2xKo41dhA9hJWMdDC1lukrs
 dWOjz0viWn075+hoG3UH4U1Jstcq4vENI7aXt7pLJt8rcSROgEtNQClZ5eQn83JTBB/O
 Uxdg==
X-Gm-Message-State: AC+VfDwbFa1ozb6a31gIvxlPEsTYFw4f9U41WpCnjicMeHz+/ezikUL/
 jcb7kHoPSmiv3P06O9QolQdhOnz4LOU7CuSe2XZdsIqwQVTwg5KLj4wnZDLee01TcrKPZCBNPaG
 u65EsK4W5A9pBXdNmhD5194bHQqnLHzyVfA==
X-Received: by 2002:a5d:8a0f:0:b0:76c:542f:d72d with SMTP id
 w15-20020a5d8a0f000000b0076c542fd72dmr7574485iod.8.1684439155757; 
 Thu, 18 May 2023 12:45:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6mLg71ghw6nUoJ1B4NGoNnfmwKaX7dGCH7IWZJcYah+MUSz+GwstUtbVvS/kPE6+ZuOI19yw==
X-Received: by 2002:a5d:8a0f:0:b0:76c:542f:d72d with SMTP id
 w15-20020a5d8a0f000000b0076c542fd72dmr7574467iod.8.1684439155504; 
 Thu, 18 May 2023 12:45:55 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05660221cc00b007702f55116fsm599490ioc.38.2023.05.18.12.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 12:45:54 -0700 (PDT)
Date: Thu, 18 May 2023 13:45:53 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v5 07/10] vfio: Add helper to search vfio_device in a
 dev_set
Message-ID: <20230518134553.27fdf0b0.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529BAEF7080D2EA66912510C37F9@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230513132136.15021-1-yi.l.liu@intel.com>
 <20230513132136.15021-8-yi.l.liu@intel.com>
 <20230517131243.7028bf9c.alex.williamson@redhat.com>
 <DS0PR11MB7529BAEF7080D2EA66912510C37F9@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Thu, 18 May 2023 12:31:07 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Thursday, May 18, 2023 3:13 AM
> > 
> > On Sat, 13 May 2023 06:21:33 -0700
> > Yi Liu <yi.l.liu@intel.com> wrote:
> >   
> > > There are drivers that need to search vfio_device within a given dev_set.
> > > e.g. vfio-pci. So add a helper.
> > >
> > > Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> > > ---
> > >  drivers/vfio/pci/vfio_pci_core.c |  8 +++-----
> > >  drivers/vfio/vfio_main.c         | 15 +++++++++++++++
> > >  include/linux/vfio.h             |  3 +++
> > >  3 files changed, 21 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> > > index 39e7823088e7..4df2def35bdd 100644
> > > --- a/drivers/vfio/pci/vfio_pci_core.c
> > > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > > @@ -2335,12 +2335,10 @@ static bool vfio_dev_in_groups(struct  
> > vfio_pci_core_device *vdev,  
> > >  static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *data)
> > >  {
> > >  	struct vfio_device_set *dev_set = data;
> > > -	struct vfio_device *cur;
> > >
> > > -	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
> > > -		if (cur->dev == &pdev->dev)
> > > -			return 0;
> > > -	return -EBUSY;
> > > +	lockdep_assert_held(&dev_set->lock);
> > > +
> > > +	return vfio_find_device_in_devset(dev_set, &pdev->dev) ? 0 : -EBUSY;  
> > 
> > Maybe an opportunity to revisit why this returns -EBUSY rather than
> > something reasonable like -ENODEV.  It looks like we picked up the
> > -EBUSY in a882c16a2b7e where I think it was trying to preserve the
> > return of vfio_pci_try_zap_and_vma_lock_cb() but the return value here
> > is not even propagated so this looks like an chance to have it make
> > sense again.  Thanks,  
> 
> From the name of this function, yes, -ENODEV is better. is it
> Ok to modify it to be -ENODEV in this patch or a separate one?

This patch is fine so long as it's noted in the commit log.  Thanks,

Alex
 
> > >  }
> > >
> > >  /*
> > > diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> > > index f0ca33b2e1df..ab4f3a794f78 100644
> > > --- a/drivers/vfio/vfio_main.c
> > > +++ b/drivers/vfio/vfio_main.c
> > > @@ -141,6 +141,21 @@ unsigned int vfio_device_set_open_count(struct  
> > vfio_device_set *dev_set)  
> > >  }
> > >  EXPORT_SYMBOL_GPL(vfio_device_set_open_count);
> > >
> > > +struct vfio_device *
> > > +vfio_find_device_in_devset(struct vfio_device_set *dev_set,
> > > +			   struct device *dev)
> > > +{
> > > +	struct vfio_device *cur;
> > > +
> > > +	lockdep_assert_held(&dev_set->lock);
> > > +
> > > +	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
> > > +		if (cur->dev == dev)
> > > +			return cur;
> > > +	return NULL;
> > > +}
> > > +EXPORT_SYMBOL_GPL(vfio_find_device_in_devset);
> > > +
> > >  /*
> > >   * Device objects - create, release, get, put, search
> > >   */
> > > diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> > > index fcbe084b18c8..4c17395ed4d2 100644
> > > --- a/include/linux/vfio.h
> > > +++ b/include/linux/vfio.h
> > > @@ -259,6 +259,9 @@ void vfio_unregister_group_dev(struct vfio_device *device);
> > >
> > >  int vfio_assign_device_set(struct vfio_device *device, void *set_id);
> > >  unsigned int vfio_device_set_open_count(struct vfio_device_set *dev_set);
> > > +struct vfio_device *
> > > +vfio_find_device_in_devset(struct vfio_device_set *dev_set,
> > > +			   struct device *dev);
> > >
> > >  int vfio_mig_get_next_state(struct vfio_device *device,
> > >  			    enum vfio_device_mig_state cur_fsm,  
> 

