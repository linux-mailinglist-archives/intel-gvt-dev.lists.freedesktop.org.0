Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088FF72E672
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Jun 2023 16:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01A710E0B1;
	Tue, 13 Jun 2023 14:59:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6780110E196
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 14:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686668384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QRtfwNfvdV2+4M7kYHt2quGEQYXsOTq8+l44AMF6dzY=;
 b=hVuJn8b4klrmR/I6H5S3wc64OLD2ADnRaB/exHEMTykzdjqgmTiWVS+pv+SMoBqEyJZghC
 VcqlbqpfyCfybtB6cgpid4fXe5QWt1FQnnM2ZGyXHIaKZir3sCg3R699Tj7hjh20WjT5mX
 Ambi08YReESVdTVcPkJbzGWtx0ZFrJI=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-zwVrMAQLMzO-sBhMESOBOg-1; Tue, 13 Jun 2023 10:59:43 -0400
X-MC-Unique: zwVrMAQLMzO-sBhMESOBOg-1
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-34087ba5febso1876195ab.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Jun 2023 07:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686668382; x=1689260382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QRtfwNfvdV2+4M7kYHt2quGEQYXsOTq8+l44AMF6dzY=;
 b=R0k+fO/yrN96+Dvvv2BVVrY1VLS/nY3D2JQt+e1mybaLHtTYuW0nLiwZCm8D6QMgPl
 wz06XW452jrs1ssmYUfHLhYWx926fjVLsklckRz/t2iu2DlROcC4ZcMAu16NEh0wkCU8
 EdJZjA9UTwJk2Mn31cGlO5k53jWf1Qf5Tcou8/pS+i6XjElfUfn6LKeR51fCYv/fPMfb
 3U4g1en3L4ORhh+SyhNVEkEBTTGdOA5VlMAXtfdrRkw4E5sFn8zHR0WdeoqNc65jSVgn
 Ysa84Y4O+S/ZSVskQV6PQcvJIFkWi9TAsppKV4GyT37R0MeMOEdqlu2htYLfmVdyJJpa
 Gh9A==
X-Gm-Message-State: AC+VfDxdiJhKcKUo5tVmjSOhfRYd4kSZfJn7z3zmDja7TknfzDRoY1r6
 p5HC3TMQcSKJRjepwdQTOmuVavm9/hP4Ge2AOKhjpikInh2bepgqofTvjWd1aaDTfnLvaSgkK2t
 1zHr7On3OppmZjokYNjyVFX887/lhdLUFMA==
X-Received: by 2002:a92:d692:0:b0:33b:16e9:bba5 with SMTP id
 p18-20020a92d692000000b0033b16e9bba5mr10637740iln.28.1686668381863; 
 Tue, 13 Jun 2023 07:59:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ56wOGNrFHguy8G1gOdD07CDWsifOYqsxCJef6NrgWP3Bq+BzA/QCcECdkeDnWN+pMbBIXbEQ==
X-Received: by 2002:a92:d692:0:b0:33b:16e9:bba5 with SMTP id
 p18-20020a92d692000000b0033b16e9bba5mr10637725iln.28.1686668381652; 
 Tue, 13 Jun 2023 07:59:41 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 ep25-20020a0566384e1900b0041f4f31ec7esm520823jab.71.2023.06.13.07.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 07:59:41 -0700 (PDT)
Date: Tue, 13 Jun 2023 08:59:39 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v12 18/24] vfio: Add VFIO_DEVICE_BIND_IOMMUFD
Message-ID: <20230613085939.63583166.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529E63E24335F6DF655E1A8C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230602121653.80017-1-yi.l.liu@intel.com>
 <20230602121653.80017-19-yi.l.liu@intel.com>
 <20230612162726.16f58ea4.alex.williamson@redhat.com>
 <DS0PR11MB752985BA514AFF36CA3A2785C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230613081808.049b9e6d.alex.williamson@redhat.com>
 <DS0PR11MB7529F0A41AA58AE37BCF8458C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230613083935.753430ed.alex.williamson@redhat.com>
 <DS0PR11MB7529E63E24335F6DF655E1A8C355A@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Tue, 13 Jun 2023 14:42:46 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Tuesday, June 13, 2023 10:40 PM
> > 
> > On Tue, 13 Jun 2023 14:28:43 +0000
> > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >   
> > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > Sent: Tuesday, June 13, 2023 10:18 PM  
> > >  
> > > > > > > diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> > > > > > > index 83cc5dc28b7a..e80a8ac86e46 100644
> > > > > > > --- a/include/linux/vfio.h
> > > > > > > +++ b/include/linux/vfio.h
> > > > > > > @@ -66,6 +66,7 @@ struct vfio_device {
> > > > > > >  	struct iommufd_device *iommufd_device;
> > > > > > >  	bool iommufd_attached;
> > > > > > >  #endif
> > > > > > > +	bool cdev_opened:1;  
> > > > > >
> > > > > > Perhaps a more strongly defined data type here as well and roll
> > > > > > iommufd_attached into the same bit field scheme.  
> > > > >
> > > > > Ok, then needs to make iommufd_attached always defined.  
> > > >
> > > > That does not follow.  Thanks,  
> > >
> > > Well, I meant the iommufd_attached now is defined only when
> > > CONFIG_IOMMUFD is enabled. To toll it with cdev_opened, needs
> > > to change this.  
> > 
> > Understood, but I don't think it's true.  If defined we use one more
> > bit of the bit field, which is a consideration when we approach filling
> > it, but we're not using bit-shift operations to address these bits, so
> > why does it matter if one has compiler conditional usage?  Thanks,  
> 
> Aha, I see. So you are suggesting something like the below. Is it?
> 
> #if IS_ENABLED(CONFIG_IOMMUFD)
> 	struct iommufd_device *iommufd_device;
> 	u8 iommufd_attached:1;
> #endif
> 	u8 cdev_opened:1;


Precisely.  Thanks,

Alex

