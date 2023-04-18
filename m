Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42256E57F9
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Apr 2023 06:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E6110E66C;
	Tue, 18 Apr 2023 04:10:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A142210E66C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Apr 2023 04:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681791040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xh3TsCLXRD6/SzblTrxESG3WliTN/NlnShwKD7qJmCw=;
 b=Q2xFOhO2xzwwPnfdhgMpQReEKTp/IQGHbQCLzDamVnN5um6PmSkm7PLeEGgbBCH3Ap4bhj
 Hm4IvF0DBpcFKxy99Zu7P0EVA0M3pBm9dN1yJgywTqFUmo2KTJgZ4Zla19RgLGaHGqdXuU
 pJz2pk1YT7B7eNQ3fgqCrl/Fj1ruwIE=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-6InXNopvP-KyCOwJ6udt3Q-1; Tue, 18 Apr 2023 00:10:37 -0400
X-MC-Unique: 6InXNopvP-KyCOwJ6udt3Q-1
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-32ab644612aso14139205ab.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 17 Apr 2023 21:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681791037; x=1684383037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xh3TsCLXRD6/SzblTrxESG3WliTN/NlnShwKD7qJmCw=;
 b=SeBVXLA3J3Xs982amdZ3qVH2IqNOS+ZZPKhRcH4dbMRvqb2VzQ1BNkkdpvWroQo0S1
 DHTEvKdG9uEE4KbssSkQ7hfXMs0M/igV2cAedz2gg9iIvSZbH9F5EpvQSEWaJcmX5Zz/
 tPVDe0h4XMuBfu8+AZMNd54vxzAUmkSBPzDzvd+VoU4zvjfITetB70YBxB6xUvm+KQn8
 gUGZEcHLM0KtHGz+QTVIHoMeMkCd5bKYmXBh4d+9+Mg8Y4Cny82cZUEdoa8XVWm43HcH
 zr0qL3Tug7VqTyWtRmABSgngQT2KBi9Nlamx0t6x/DFxCynMFcGb6fTM20qj+xtxTZ1Z
 1USw==
X-Gm-Message-State: AAQBX9dVvcrSVBg8axMr82GASbwmjogLenE8dEQ20RpFvvbUvz/MzffE
 5se2ZXPZ3LuHy40uZqp5xiXsEtrXuhMeETiOixZKDtDtr2ZQExfWDr3G/D6P4RPJ+xSHLOE63Gs
 Rk/Xf1C6shKJGWUaxjWHvTNbFKbduf4D4Ww==
X-Received: by 2002:a92:d902:0:b0:32a:79c4:ce48 with SMTP id
 s2-20020a92d902000000b0032a79c4ce48mr12354963iln.23.1681791036708; 
 Mon, 17 Apr 2023 21:10:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350bdWlJiRpOSPyMXnDBV4MCo70URxAv/pP21vJfcpGLaqYd9J5vCEveva+zeAUdPVlViz88XbA==
X-Received: by 2002:a92:d902:0:b0:32a:79c4:ce48 with SMTP id
 s2-20020a92d902000000b0032a79c4ce48mr12354932iln.23.1681791036329; 
 Mon, 17 Apr 2023 21:10:36 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 7-20020a921307000000b0032732e7c25esm3585372ilt.36.2023.04.17.21.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 21:10:35 -0700 (PDT)
Date: Mon, 17 Apr 2023 22:10:33 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230417221033.778c00c9.alex.williamson@redhat.com>
In-Reply-To: <BN9PR11MB5276D93DDFE3ED97CD1B923B8C9D9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230412105045.79adc83d.alex.williamson@redhat.com>
 <ZDcPTTPlni/Mi6p3@nvidia.com>
 <BN9PR11MB5276782DA56670C8209470828C989@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ZDfslVwqk6JtPpyD@nvidia.com>
 <20230413120712.3b9bf42d.alex.williamson@redhat.com>
 <BN9PR11MB5276A160CA699933B897C8C18C999@BN9PR11MB5276.namprd11.prod.outlook.com>
 <DS0PR11MB7529B7481AC97261E12AA116C3999@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230414111043.40c15dde.alex.williamson@redhat.com>
 <DS0PR11MB75290A78D6879EC2E31E21AEC39C9@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230417130140.1b68082e.alex.williamson@redhat.com>
 <ZD2erN3nKbnyqei9@nvidia.com>
 <20230417140642.650fc165.alex.williamson@redhat.com>
 <BN9PR11MB5276D93DDFE3ED97CD1B923B8C9D9@BN9PR11MB5276.namprd11.prod.outlook.com>
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
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "Zhao, Yan Y" <yan.y.zhao@intel.com>,
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

On Tue, 18 Apr 2023 03:24:46 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Tuesday, April 18, 2023 4:07 AM
> > 
> > On Mon, 17 Apr 2023 16:31:56 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > On Mon, Apr 17, 2023 at 01:01:40PM -0600, Alex Williamson wrote:  
> > > > Yes, it's not trivial, but Jason is now proposing that we consider
> > > > mixing groups, cdevs, and multiple iommufd_ctxs as invalid.  I think
> > > > this means that regardless of which device calls INFO, there's only one
> > > > answer (assuming same set of devices opened, all cdev, all within same
> > > > iommufd_ctx).  Based on what I explained about my understanding of  
> > INFO2  
> > > > and Jason agreed to, I think the output would be:
> > > >
> > > > flags: NOT_RESETABLE | DEV_ID
> > > > {
> > > >   { valid devA-id,  devA-BDF },
> > > >   { valid devC-id,  devC-BDF },
> > > >   { valid devD-id,  devD-BDF },
> > > >   { invalid dev-id, devE-BDF },
> > > > }
> > > >
> > > > Here devB gets dropped because the kernel understands that devB is
> > > > unopened, affected, and owned.  It's therefore not a blocker for
> > > > hot-reset.  
> > >
> > > I don't think we want to drop anything because it makes the API
> > > ill suited for the debugging purpose.
> > >
> > > devb should be returned with an invalid dev_id if I understand your
> > > example. Maybe it should return with -1 as the dev_id instead of 0, to
> > > make the debugging a bit better.
> > >
> > > Userspace should look at only NOT_RESETTABLE to determine if it
> > > proceeds or not, and it should use the valid dev_id list to iterate
> > > over the devices it has open to do the config stuff.  
> > 
> > If an affected device is owned, not opened, and not interfering with
> > the reset, what is it adding to the API to report it for debugging
> > purposes?  I'm afraid this leads into expanding "invalid dev-id" into an  
> 
> consistent output before and after devB is opened.

In the case where devB is not opened including it only provides
useless information.  In the case where devB is opened it's necessary
to be reported as an opened, affected device.

> > errno or bitmap of error conditions that the user needs to parse.
> >   
> 
> Not exactly.
> 
> If RESETABLE invalid dev_id doesn't matter. The user only use the
> valid dev_id list to iterate as Jason pointed out.

Yes, but...

> If NOT_RESETTABLE due to devE not assigned to the VM one can
> easily figure out the fact by simply looking at the list of affected BDFs
> and the configuration of assigned devices of the VM. Then invalid
> dev_id also doesn't matter.

Huh?

Given:

flags: NOT_RESETABLE | DEV_ID
{
  { valid devA-id,  devA-BDF },
  { invalid dev-id, devB-BDF },
  { valid devC-id,  devC-BDF },
  { valid devD-id,  devD-BDF },
  { invalid dev-id, devE-BDF },
}

How does the user determine that devE is to blame and not devB based on
BDF?  The user cannot rely on sysfs for help, they don't know the IOMMU
grouping, nor do they know the BDF except as inferred by matching valid
dev-ids in the above output.
 
> If NOT_RESETTABLE while devE is already assigned to the VM then it's
> indication of mixing groups, cdevs or multiple iommufd_ctxs. Then
> people should debug with other means/hints to dig out the exact
> culprit.

I don't know what situation you're trying to explain here.  If devE
were opened within the same iommufd_ctx, this becomes:

flags: RESETABLE | DEV_ID
{
  { valid devA-id,  devA-BDF },
  { invalid dev-id, devB-BDF },
  { valid devC-id,  devC-BDF },
  { valid devD-id,  devD-BDF },
  { valid devE-id,  devE-BDF },
}

Yes, the user should only be looking at the flag to determine the
availability of hot-reset, (here's the but) but how is it consistent to
indicate both that hot-reset is available and include an invalid
dev-id?  The consistency as I propose is that an invalid dev-id is only
presented with NOT_RESETTABLE for the device blocking hot-reset.  In
the previous case, devB is not blocking reset and reporting an invalid
dev-id only serves to obfuscate determining the blocking device.

For the cases of affected group-opened devices or separate
iommufd_ctxs, the user gets invalid dev-ids for anything outside of
the calling device's iommufd_ctx.

We haven't discussed how it fails when called on a group-opened device
in a mixed environment.  I'd propose that the INFO ioctl behaves
exactly as it does today, reporting group-id and BDF for each affected
device.  However, the hot-reset ioctl itself is not extended to accept
devicefd because there is no proof-of-ownership model for cdevs.
Therefore even if the user could map group-id to devicefd, they get
-EINVAL calling HOT_RESET with a devicefd when the ioctl is called from
a group-opened device.  Thanks,

Alex

