Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FF86D8419
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Apr 2023 18:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4280B10EA1F;
	Wed,  5 Apr 2023 16:52:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A5010EA1F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Apr 2023 16:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680713539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EB7/SSqRugBMOg+yS5JddA7JHRMlc+6bLSnv6uWfB7Q=;
 b=FWsEcCmG+pjgDspgOrM5IrK86X63JLGGTJuW/srJR9bO9jzk8+oSGr4K/Sf1eIgtKFhF5Z
 vORDsLDAeV18swTEPHIExlZN0mcuCLF7NXaotHeG9WxXyuR/wop87h9B2h0OSI8IfCNP6v
 36XpwPGucm8ot7jS+OQEP70YoMMnAy8=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-R8ESclauPFyx54g29ZGO-g-1; Wed, 05 Apr 2023 12:52:18 -0400
X-MC-Unique: R8ESclauPFyx54g29ZGO-g-1
Received: by mail-io1-f69.google.com with SMTP id
 i4-20020a6b5404000000b0075ff3fb6f4cso7058342iob.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 05 Apr 2023 09:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680713538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EB7/SSqRugBMOg+yS5JddA7JHRMlc+6bLSnv6uWfB7Q=;
 b=tiMhctEE5qYk6wRYgRbfjopKgD3MxDLukLfcAEo3yKTPd/ds+i1nbTYbPDT1VUD5t9
 Yv16rJfZ5Spa0H9Krk/xR+dnRL0/tnB9FPCf3YPWI9u1BqSYZcoPqYVn/YO4Oe8QZf3E
 gXu5h+Htmg9sW6Cg1fTWszdrVTtDHUaxvh+Xyf7HZRJ8PAK2Ell5hqtKhUpZsKQ7bvoj
 l4fiBna7JjdoN90w/5pBaYb3hLHaqWFzQxF4LDmOLnI43negwF71w+YbJYgOgg5z6Ihq
 NzUcg+uM4mCuxgDejc/HwRr5umNvz0uI+1nAfuxV7ds8jfv5+lqUauT0Rt71UqPrXsne
 V7dA==
X-Gm-Message-State: AAQBX9fr7lvg6nkwhlaOr2oS5BWhJPT4g6KJm6SxgtrXvc4rvkwLnFGV
 Ai12wQfcPG8Qnh7A4c9LXWLRSBMlo5uuxkgKGjBbsuxJZ5dvhRiGy1e37VcizdgUXZe66lnpbib
 gFja8uBpoWsL33YahAE1r7wvIeFl/9T4jlg==
X-Received: by 2002:a5e:8f0d:0:b0:758:d81e:31b3 with SMTP id
 c13-20020a5e8f0d000000b00758d81e31b3mr5365220iok.19.1680713537878; 
 Wed, 05 Apr 2023 09:52:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350bE76z65MsjEi90EUqHhSdz/Ba8x+YHs3xVBowAybeX8RM8K+11AMUit3DvIcx7b80rO9J9wA==
X-Received: by 2002:a5e:8f0d:0:b0:758:d81e:31b3 with SMTP id
 c13-20020a5e8f0d000000b00758d81e31b3mr5365199iok.19.1680713537661; 
 Wed, 05 Apr 2023 09:52:17 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 d187-20020a0262c4000000b003c2b76fcdf2sm1141357jac.52.2023.04.05.09.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 09:52:16 -0700 (PDT)
Date: Wed, 5 Apr 2023 10:52:15 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230405105215.428fa9f5.alex.williamson@redhat.com>
In-Reply-To: <ZC2jsQuWiMYM6JZb@nvidia.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-13-yi.l.liu@intel.com>
 <a937e622-ce32-6dda-d77c-7d8d76474ee0@redhat.com>
 <DS0PR11MB7529D4E354C3B85D7698017DC3909@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230405102545.41a61424.alex.williamson@redhat.com>
 <ZC2jsQuWiMYM6JZb@nvidia.com>
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
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
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

On Wed, 5 Apr 2023 13:37:05 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Apr 05, 2023 at 10:25:45AM -0600, Alex Williamson wrote:
> 
> > But that kind of brings to light the question of what does the user do
> > when they encounter this situation.  
> 
> What does it do now when it encounters a group_id it doesn't
> understand? Userspace already doesn't know if the foreign group is
> open or not, right?

It's simple, there is currently no screwiness around opened devices.
If the caller doesn't own all the groups mapping to the affected
devices, hot-reset is not available.

> > reset can complete.  If the device is opened by a different user, the
> > reset is blocked.  The only logical conclusion is that the user should
> > try the reset regardless of the result of the info ioctl, which the  
> 
> IMHO my suggested version is still the overall saner uAPI.
> 
> An info that basically returns success/fail if reset is security
> authorized and information about the reset groupings.
> 
> Actual reset follows the returned groupings automatically.
> 
> Easy for qemu. Call the info at startup to confirm reset can be
> emulated, use the returned information to propogate the reset groups
> to the guest. Trigger the reset with no fuss when the guest asks for
> it.
> 
> Less weird corner cases.

This leads to scenarios where the info ioctl indicates a hot-reset is
initially available, perhaps only because one of the affected devices
was not opened at the time, and now it fails when QEMU actually tries
to use it.  In the group model, QEMU can know the set of affected
devices and the required groups, confirm it owns those, and for all
practical purposes guarantee that a hot-reset is available (yes, there
might be some exceptionally rare topology changes).

This goofiness around unopened devices and null-arrays is killing this
API.  Thanks,

Alex

