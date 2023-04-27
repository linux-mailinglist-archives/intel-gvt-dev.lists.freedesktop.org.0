Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7AA6F0C01
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Apr 2023 20:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FC710E377;
	Thu, 27 Apr 2023 18:35:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5166510E377
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Apr 2023 18:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682620513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hyhutbl1P5p00Ldo4kjlPS0faKiyka/h141Hh06aCdE=;
 b=A+UzNkV4FPxjPtwmIp9CSO1fwlyMUWRs8u66CXcDPMkhr3kElprOMvXOd9zaZr+WzVV6+N
 ok+A07i7YUI3vkSZHkHLVId4a2/YfkJKWeyWoR/8F8ZJRhppw0+l3KpVyL8paOtZTLE1fJ
 q3bHVlXAW5ceqm0J7F3kfSV6jg9orKs=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-cPhZJgzZNUqSvUknGp9Yfg-1; Thu, 27 Apr 2023 14:35:10 -0400
X-MC-Unique: cPhZJgzZNUqSvUknGp9Yfg-1
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-32afe238257so63422455ab.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Apr 2023 11:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682620510; x=1685212510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hyhutbl1P5p00Ldo4kjlPS0faKiyka/h141Hh06aCdE=;
 b=dYltwhZwFM16PHp1KD6woIyjOeA+zPiWfDBuzv7/u0Gezx1taU+0O6BSNXbJuXR53v
 fVidUvH05beOYMEfuJYrmSINhj6OAfPZN2o2h44FicaZFRTU/GfF5wpoiN/oGTSqEDpu
 1sFN6qVpubImR0Y1/W1l3TGbXeGzli9nTffBke7A0fpe7Jx7RGr3udKdEuhaysW5LgVW
 qbzF8GmsvhLNSN3yeJT3WaXCd0pELWDns3dABszqohPjnZPucao6ff+NI6/XXhcs+kAO
 53z5pmfpxMP460Jla6WXRM3ZebR/PdBzvWVhiolq/jIjY1J5IF7y/llOrd06TPgj8maA
 Mlrw==
X-Gm-Message-State: AC+VfDyTKxuCjJJ2VvLfc6m3RCBSSChpCOvnh5t10xgnhMWVu2QLasNQ
 mDn5Y7Rz/3V2yL/B4CF9t08FdxFF38bbKUC/hgre/vuJpxnBF5bJ6cPpfONOqAhGK69CnjoR/e7
 s7Z+YmYZlZVbQlo+iZMuCkuIAByYch3knzg==
X-Received: by 2002:a92:d6c9:0:b0:32a:8a24:31a0 with SMTP id
 z9-20020a92d6c9000000b0032a8a2431a0mr1740516ilp.31.1682620510012; 
 Thu, 27 Apr 2023 11:35:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6qadVzYEMD+1W0+SRpJ/1qXTVhSN/ckiE2OD13eLxYiv9ISmKYP7X6A6gsdcovc2mbQDrEfA==
X-Received: by 2002:a92:d6c9:0:b0:32a:8a24:31a0 with SMTP id
 z9-20020a92d6c9000000b0032a8a2431a0mr1740495ilp.31.1682620509736; 
 Thu, 27 Apr 2023 11:35:09 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 p26-20020a02b01a000000b0040f94ea2a2bsm5647408jah.40.2023.04.27.11.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 11:35:09 -0700 (PDT)
Date: Thu, 27 Apr 2023 12:35:08 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v4 1/9] vfio: Determine noiommu in vfio_device registration
Message-ID: <20230427123508.251617d4.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB75294AF4D8B4A886F7646F44C36A9@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230426145419.450922-1-yi.l.liu@intel.com>
 <20230426145419.450922-2-yi.l.liu@intel.com>
 <BN9PR11MB527688F8FBB299306400A1308C6A9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <DS0PR11MB75294AF4D8B4A886F7646F44C36A9@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Thu, 27 Apr 2023 07:05:37 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Tian, Kevin <kevin.tian@intel.com>
> > Sent: Thursday, April 27, 2023 2:36 PM
> >   
> > > From: Liu, Yi L <yi.l.liu@intel.com>
> > > Sent: Wednesday, April 26, 2023 10:54 PM
> > >
> > > -static inline bool vfio_device_is_noiommu(struct vfio_device *vdev)
> > > +static inline int vfio_device_set_noiommu(struct vfio_device *device)
> > >  {
> > > -	return IS_ENABLED(CONFIG_VFIO_NOIOMMU) &&
> > > -	       vdev->group->type == VFIO_NO_IOMMU;
> > > +	device->noiommu = IS_ENABLED(CONFIG_VFIO_NOIOMMU) &&
> > > +			  device->group->type == VFIO_NO_IOMMU;
> > > +	return 0;  
> > 
> > Just void. this can't fail.  
> 
> Hmmm. Yes, before below commit, it cannot fail. Maybe this can be
> converted to int later.
> 
> https://lore.kernel.org/kvm/20230426150321.454465-22-yi.l.liu@intel.com/T/#u

AFAICT with the comments on the next patch, this change is not at all
justified within this series and should be dropped.  Thanks,

Alex

