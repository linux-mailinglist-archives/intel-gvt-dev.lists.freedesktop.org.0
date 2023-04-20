Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE876E96A7
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 20 Apr 2023 16:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8FD10E2D6;
	Thu, 20 Apr 2023 14:08:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A008810E0A7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 20 Apr 2023 14:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681999724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88fvHxwMeGPUsSGfcCvf7c9NVgAUBwse69MjjzKia0Y=;
 b=ftiRkQdAcOp3hVw2o+F1x19xipm4kJyE334wzQhLjTi4n6aFPKpAs3uZmKySIcpqHNvXaP
 KFjDgx1b6ziUMcVuMELL0bkSws51/BkUXGtmeurI7gJbdpQZx3GE/F4vyB/mKAZ/UbNJz+
 aD1hOJ2Xz8ll2ReMEmVWhom/6v71dWs=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-ICFWeNI8PsuKoOWNMVyQ3g-1; Thu, 20 Apr 2023 10:08:43 -0400
X-MC-Unique: ICFWeNI8PsuKoOWNMVyQ3g-1
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-32b2485c113so6482025ab.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 20 Apr 2023 07:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681999722; x=1684591722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=88fvHxwMeGPUsSGfcCvf7c9NVgAUBwse69MjjzKia0Y=;
 b=fh9AzwBredwP3sY53IJ0NjCFIRWB6xH+BRburjuJnc5gFcsZbaqHHklL/tIUrG4sM1
 K6BblQ9OAOAzU5E5A85ryJN5cVS+E1+kaZdMT4PSJaVG0juMzHEo+7rsXUXt7CgeWfvj
 ot3gOsaWrlxRZIwZO7/BX3kiRZU/xJqAffD/ZzivUnT/fjzaI5OWEtTFQjTKowlO+2yd
 v6VsOhHkBBY/ysno8xdxHkV6dpaHQZFL3Yd7ZM5Ku2oPnBb6+bA/PSb0PRrJpMY0SB7L
 G8uxJLzjDsdmXgas4BodsA4j1L8aaYx0/Yl1wFawXR+3Jpecc5mqf/9Xv822MJmjb/Dn
 VxDw==
X-Gm-Message-State: AAQBX9fdJbB9xa770xgVU0BJ+Z/Noj53bOU6cICFLt+sInxQY2pnQir+
 Gin6DqJvBeH1j1LOea3ZZDkeBVd+zfdo7gbp4idGDiIuAavak6iNLCfjVbuyCP43EX7RRnFZV1k
 yixPcisvczOW+AbRWtx3cZ6pPcxa2R2x5RA==
X-Received: by 2002:a92:c747:0:b0:329:5a6e:3a18 with SMTP id
 y7-20020a92c747000000b003295a6e3a18mr1404738ilp.4.1681999722377; 
 Thu, 20 Apr 2023 07:08:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350aB3ZoBfSt2FgwLwqdDfKyJgN0OkNdN/CcuOgu0oQM1pm2T0RIghw52odblQs9ef7EA3h30Og==
X-Received: by 2002:a92:c747:0:b0:329:5a6e:3a18 with SMTP id
 y7-20020a92c747000000b003295a6e3a18mr1404710ilp.4.1681999722053; 
 Thu, 20 Apr 2023 07:08:42 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 q4-20020a056e02096400b00313b08feec7sm464678ilt.42.2023.04.20.07.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 07:08:41 -0700 (PDT)
Date: Thu, 20 Apr 2023 08:08:39 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230420080839.652732dc.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529C11E11F187D7BD88C18AC3639@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <BN9PR11MB5276782DA56670C8209470828C989@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ZDfslVwqk6JtPpyD@nvidia.com>
 <20230413120712.3b9bf42d.alex.williamson@redhat.com>
 <BN9PR11MB5276A160CA699933B897C8C18C999@BN9PR11MB5276.namprd11.prod.outlook.com>
 <DS0PR11MB7529B7481AC97261E12AA116C3999@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230414111043.40c15dde.alex.williamson@redhat.com>
 <DS0PR11MB75290A78D6879EC2E31E21AEC39C9@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230417130140.1b68082e.alex.williamson@redhat.com>
 <ZD2erN3nKbnyqei9@nvidia.com>
 <20230417140642.650fc165.alex.williamson@redhat.com>
 <ZD6TvA+9oI0v4vC2@nvidia.com>
 <20230418123920.5d92f402.alex.williamson@redhat.com>
 <DS0PR11MB7529C11E11F187D7BD88C18AC3639@DS0PR11MB7529.namprd11.prod.outlook.com>
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
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
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

On Thu, 20 Apr 2023 12:10:20 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Wednesday, April 19, 2023 2:39 AM
> > 
> > On Tue, 18 Apr 2023 09:57:32 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > On Mon, Apr 17, 2023 at 02:06:42PM -0600, Alex Williamson wrote:  
> > > > On Mon, 17 Apr 2023 16:31:56 -0300
> > > > Jason Gunthorpe <jgg@nvidia.com> wrote:
> > > >  
> > > > > On Mon, Apr 17, 2023 at 01:01:40PM -0600, Alex Williamson wrote:  
> > > > > > Yes, it's not trivial, but Jason is now proposing that we consider
> > > > > > mixing groups, cdevs, and multiple iommufd_ctxs as invalid.  I think
> > > > > > this means that regardless of which device calls INFO, there's only one
> > > > > > answer (assuming same set of devices opened, all cdev, all within same
> > > > > > iommufd_ctx).  Based on what I explained about my understanding of INFO2
> > > > > > and Jason agreed to, I think the output would be:
> > > > > >
> > > > > > flags: NOT_RESETABLE | DEV_ID
> > > > > > {
> > > > > >   { valid devA-id,  devA-BDF },
> > > > > >   { valid devC-id,  devC-BDF },
> > > > > >   { valid devD-id,  devD-BDF },
> > > > > >   { invalid dev-id, devE-BDF },
> > > > > > }
> > > > > >
> > > > > > Here devB gets dropped because the kernel understands that devB is
> > > > > > unopened, affected, and owned.  It's therefore not a blocker for
> > > > > > hot-reset.  
> > > > >
> > > > > I don't think we want to drop anything because it makes the API
> > > > > ill suited for the debugging purpose.
> > > > >
> > > > > devb should be returned with an invalid dev_id if I understand your
> > > > > example. Maybe it should return with -1 as the dev_id instead of 0, to
> > > > > make the debugging a bit better.
> > > > >
> > > > > Userspace should look at only NOT_RESETTABLE to determine if it
> > > > > proceeds or not, and it should use the valid dev_id list to iterate
> > > > > over the devices it has open to do the config stuff.  
> > > >
> > > > If an affected device is owned, not opened, and not interfering with
> > > > the reset, what is it adding to the API to report it for debugging
> > > > purposes?  
> > >
> > > It lets it print the entire group of devices, this is the only way
> > > something can learn the actual list of all BDFs affected.  
> > 
> > If we do so, userspace must be able to differentiate which devices are
> > blocking, which necessitates at least a bi-modal invalid dev-id.
> >   
> > > dev_id can just return 0, we don't need a complex bitmap. Userspace
> > > looks at the flag, if !NOT_RESETABLE then it ignores dev_id=0.  
> > 
> > I'm having trouble with a succinct definition of dev-id == 0, is it "A
> > device affected by the hot-reset reset, which does not directly
> > contribute to the availability of the hot-reset, ex. an unopened device
> > within the same IOMMU group as an opened device (ie. this is not the
> > device responsible if hot-reset is unavailable).   
> 
> Hide this device in the list looks fine to me. But the calling user should
> not do any new device open before finishing hot-reset. Otherwise, user may
> miss a device that needs to do pre/post reset. I think this requirement is
> acceptable. Is it? 

I think Kevin and Jason are leaning towards reporting the entire
dev-set.  The INFO ioctl has always been a point-in-time reading, no
guarantees are made if the host or user configuration is changed.
Nothing changes in that respect.

> > Whereas dev-id < 0
> > (== -1) is an affected device which prevents hot-reset, ex. an un-owned
> > device, device configured within a different iommufd_ctx, or device
> > opened outside of the vfio cdev API."  Is that about right?  Thanks,  
> 
> Do you mean to have separate err-code for the three possibilities? As
> the devid is generated by iommufd and it is u32. I'm not sure if we can
> have such err-code definition without reserving some ids in iommufd. 

Yes, if we're going to report the full dev-set, I think we need at
least two unique error codes or else the user has no way to determine
the subset of invalid dev-ids which block the reset.  I think Jason is
proposing the set of valid dev-ids are >0, a dev-id of zero indicates
some form of non-blocking, while <0 (or maybe specifically -1)
indicates a blocking device.  I was trying to get consensus on a formal
definition of each of those error codes in my previous reply.  Thanks,

Alex

