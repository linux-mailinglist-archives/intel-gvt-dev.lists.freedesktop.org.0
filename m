Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324386E28FC
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 14 Apr 2023 19:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8020D10E1D7;
	Fri, 14 Apr 2023 17:10:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DC510EE32
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 14 Apr 2023 17:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681492249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K34W6RnfQ6nKdpvXaQKTZxAcJlVcKYDwWEBLIMPWzBs=;
 b=IlTEwJOM6Xv1iF7kUiKEPFxjOZBNTrflypNvomNO3/xXxuVe2HGga2JD2OaPmctCq6AzQp
 2sJRD9yFmphipzgEt4h+TPoNYlXOrbtutaPuTBBj93dV/jyOEqgXD0a55b8Mroz4thDRuc
 5nyk8PejTw2FbFRWZX2lkPRY9Lk4sNs=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-LW7IFgcLOj-P2EVNCyC1yg-1; Fri, 14 Apr 2023 13:10:48 -0400
X-MC-Unique: LW7IFgcLOj-P2EVNCyC1yg-1
Received: by mail-io1-f72.google.com with SMTP id
 z21-20020a6bc915000000b00760b2376536so2480823iof.21
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 14 Apr 2023 10:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681492247; x=1684084247;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K34W6RnfQ6nKdpvXaQKTZxAcJlVcKYDwWEBLIMPWzBs=;
 b=iHuh+Z6ZWrVcNKvQ0K02OmNlyHFOkHuVn83+v1CQ9TjT5v0oYbkfgAtxB0r+2yLE9Q
 IoKO90rbh4nAy45lSQ8gsF5KGgbUfAtn9/rNSdWwGdEojJoHWAmGuNbbdl6hfggh9Alj
 xgVg0DrFRdjJzTi1YSehjYSFq/ktiC1eS0hxuZ+cV2N442K9sass25vbnOq9G9TIxtVe
 gpizqKZzPEAPTIqTOOsiPjNTy9JR3uxvwp3ww9S+0u9Tp8yhW0jUyWs4f//NboAJR3XE
 gsPHanyavIVqQGNcG6nWldNLODfkmpa0Y9B/lRVur7H8xnAtt3Pzks/pLjZiUBhO5U6E
 aacg==
X-Gm-Message-State: AAQBX9cZHGGNdgftBhRtS06kEH27nu/dnY8BOLFPr2trVVDYmhDYUq6R
 7ybaeMehuAjWw0DihBazrlmvg+xo9c+mTAApNSgBogcUz6WDnd6wZ2N83fmeOAuD6Mk8ry2Ak5O
 +12u8mNHqtkI4H7EreQ3RseojhvT518x93A==
X-Received: by 2002:a05:6602:48b:b0:760:a0be:e63c with SMTP id
 y11-20020a056602048b00b00760a0bee63cmr7725242iov.4.1681492247464; 
 Fri, 14 Apr 2023 10:10:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZcHLvlPpmCixL+MNuyf2o//jjEeGR7snNUTvyb2rQNazK5gJMh2gLv10tmHPumFeHdoAM1QA==
X-Received: by 2002:a05:6602:48b:b0:760:a0be:e63c with SMTP id
 y11-20020a056602048b00b00760a0bee63cmr7725218iov.4.1681492247165; 
 Fri, 14 Apr 2023 10:10:47 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 z22-20020a05660200d600b0074ca5ac5037sm1270271ioe.26.2023.04.14.10.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 10:10:46 -0700 (PDT)
Date: Fri, 14 Apr 2023 11:10:43 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230414111043.40c15dde.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529B7481AC97261E12AA116C3999@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <20230406115347.7af28448.alex.williamson@redhat.com>
 <ZDVfqpOCnImKr//m@nvidia.com>
 <20230411095417.240bac39.alex.williamson@redhat.com>
 <20230411111117.0766ad52.alex.williamson@redhat.com>
 <ZDWph7g0hcbJHU1B@nvidia.com>
 <20230411155827.3489400a.alex.williamson@redhat.com>
 <ZDX0wtcvZuS4uxmG@nvidia.com>
 <20230412105045.79adc83d.alex.williamson@redhat.com>
 <ZDcPTTPlni/Mi6p3@nvidia.com>
 <BN9PR11MB5276782DA56670C8209470828C989@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ZDfslVwqk6JtPpyD@nvidia.com>
 <20230413120712.3b9bf42d.alex.williamson@redhat.com>
 <BN9PR11MB5276A160CA699933B897C8C18C999@BN9PR11MB5276.namprd11.prod.outlook.com>
 <DS0PR11MB7529B7481AC97261E12AA116C3999@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Fri, 14 Apr 2023 11:38:24 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Tian, Kevin <kevin.tian@intel.com>
> > Sent: Friday, April 14, 2023 5:12 PM
> >   
> > > From: Alex Williamson <alex.williamson@redhat.com>
> > > Sent: Friday, April 14, 2023 2:07 AM
> > >
> > > We had already iterated a proposal where the group-id is replaced with
> > > a dev-id in the existing ioctl and a flag indicates when the return
> > > value is a dev-id vs group-id.  This had a gap that userspace cannot
> > > determine if a reset is available given this information since un-owned
> > > devices report an invalid dev-id and userspace can't know if it has
> > > implicit ownership.  
> >  
> > >
> > > It seems cleaner to me though that we would could still re-use INFO in
> > > a similar way, simply defining a new flag bit which is valid only in
> > > the case of returning dev-ids and indicates if the reset is available.
> > > Therefore in one ioctl, userspace knows if hot-reset is available
> > > (based on a kernel determination) and can pull valid dev-ids from the  
> 
> Need to confirm the meaning of hot-reset available flag. I think it
> should at least meet below two conditions to set this flag. Although
> it may not mean hot-reset is for sure to succeed. (but should be
> a high chance).
> 
> 1) dev_set is resettable (all affected device are in dev_set)
> 2) affected device are owned by the current user

Per thread with Kevin, ownership can't always be known by the kernel.
Beyond the group vs cdev discussion there, isn't it also possible
(though perhaps not recommended) that a user can have multiple iommufd
ctxs?  So I think 2) becomes "ownership of the affected dev-set can be
inferred from the iommufd_ctx of the calling device", iow, the
null-array calling model is available and the flag is redefined to
match.  Reset may still be available via the proof-of-ownership model.
 
> Also, we need to has assumption that below two cases are rare
> if user encounters it, it just bad luck for them. I think the existing
> _INFO and hot-reset already has such assumption. So cdev mode
> can adopt it as well.
> 
> a) physical topology change (e.g. new devices plugged to affected slot)
> b) an affected device is unbound from vfio

Yes, these are sufficiently rare that we can't do much about them.

> > So the kernel needs to compare the group id between devices with
> > valid dev-ids and devices with invalid dev-ids to decide the implicit
> > ownership. For noiommu device which has no group_id when
> > VFIO_GROUP is off then it's resettable only if having a valid dev_id.  
> 
> In cdev mode, noiommu device doesn't have dev_id as it is not
> bound to valid iommufd. So if VFIO_GROUP is off, we may never
> allow hot-reset for noiommu devices. But we don't want to have
> regression with noiommu devices. Perhaps we may define the usage
> of the resettable flag like this:
> 1) if it is set, user does not need to own all the affected devices as
>     some of them may have been owned implicitly. Kernel should have
>     checked it.
> 2) if the flag is not set, that means user needs to check ownership
>     by itself. It needs to own all the affected devices. If not, don't
>    do hot-reset.

Exactly, the flag essentially indicates that the null-array approach is
available, lack of the flag indicates proof-of-ownership is required.
 
> This way we can still make noiommu devices support hot-reset
> just like VFIO_GROUP is on. Because noiommu devices have fake
> groups, such groups are all singleton. So checking all affected
> devices are opened by user is just same as check all affected
> groups.

Yep.

> > The only corner case with this option is when a user mixes group
> > and cdev usages. iirc you mentioned it's a valid usage to be supported.
> > In that case the kernel doesn't have sufficient knowledge to judge
> > 'resettable' as it doesn't know which groups are opened by this user.
> >
> > Not sure whether we can leave it in a ugly way so INFO may not tell
> > 'resettable' accurately in that weird scenario.  
> 
> This seems not easy to support. If above scenario is allowed there can be
> three cases that returns invalid dev_id.
> 1) devices not opened by user but owned implicitly

The cdev approach has a hard time with this in general, it has no way to
represent unopened devices. so any case where the nature of an unopened
device block reset on the dev-set is rather opaque to the user.

> 2) devices not owned by user

(and presumable not owned)  We still provide BDF.  Not much difference
from the group case here, being able to point to a BDF or group is
about all we can do.

> 3) devices opened via group but owned by user

I think this still works in the proof-of-ownership, passing fds to
hot-reset model.

> User would require more info to tell the above cases from each other.

Obviously we could be equivalent to the group model if IOMMU groups
were exposed for a device and all devices had IOMMU groups, but
reasons...

> > > array to associate affected, owned devices, and still has the
> > > equivalent information to know that one or more of the devices listed
> > > with an invalid dev-id are preventing the hot-reset from being
> > > available.
> > >
> > > Is that an option?  Thanks,
> > >  
> > 
> > This works for me if above corner case can be waived.  
> 
> One side check, perhaps already confirmed in prior email. @Alex, So
> the reason for the prediction of hot-reset is to avoid the possible
> vfio_pci_pre_reset() which does heavy operations like stop DMA and
> copy config space. Is it? Any other special reason? Anyhow, this reason
> is enough for this prediction per my understanding.

It's not clear to me what "prediction" is referring to.  As above, I
think we can redefine the reset-available flag I proposed to more
restrictively indicate that the null-array approach is available based
on the dev-set group in relation to the iommufd_ctx of the calling
device.  Prediction of the affected devices seems like basic
functionality to me, we can't assume the user's usage model, they must
be able to make a well informed decision regarding affected devices.
Thanks,

Alex

