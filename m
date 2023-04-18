Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD126E6A20
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Apr 2023 18:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AA110E816;
	Tue, 18 Apr 2023 16:50:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A2310E816
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Apr 2023 16:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681836597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QW4OejsqAutNiGQJiYZJkfIFG7vwNJbOHeoSgw01y+o=;
 b=fGTF8JJCwXReaYEtOX9mTBoMQKRroGh4FHXoL2s0r4S2DbZOr5lWQgB22uZZqbTkhcuPMi
 fPOa6MB2Sm/j+fwZqWrCCN+A4HY79KcU/I0jvg+ofM5DJ0ij22Rd5x+HER2MDg8U6RVkwM
 idNfMZo3pII0uPKGmdYUy437usU5Kw4=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-yJ6lV6emN32uWC2mqvuKbQ-1; Tue, 18 Apr 2023 12:49:56 -0400
X-MC-Unique: yJ6lV6emN32uWC2mqvuKbQ-1
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-32b532ee15bso61477775ab.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Apr 2023 09:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681836595; x=1684428595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QW4OejsqAutNiGQJiYZJkfIFG7vwNJbOHeoSgw01y+o=;
 b=aNgcMzZIwPrNZHanWru+e21NGnkI4Tf+jCHqzqFDx5C179v6+8QUcd/aqY67DOku+t
 0DVmGOfA3CDjHt92ELGxjb7k8F7AS727vsuFjzR6aKJDCrP3WVoJEw66GK9sp44/yXh7
 Y175BLnchZIFxN+KgRHo+8cjkOGFyHKSZ3erb18VIucTKgRX1z3lhjykB/Nz35wmRj6Z
 rsFemHL4V/+94ALAwsulhvAMdqy7YcAGEe03/RSzYLxeVtRhoRC8rS5TpvvFMOqo8Z+H
 nkgYM1+1XWtJONvyA7luSQ7fNMxCpFAOgHjXFPTkpI+X0/T1+iCimgIgMjtUlnBcPo5u
 a8hg==
X-Gm-Message-State: AAQBX9feFV466uTbhtS42Y0S22FV3A5RkZ6xHVnpeQpUqaP+kcaPI1Wr
 R4iVKI+pPoutychhY4onoyLhivwUe+wmMQ3gQnZFJqPNhw7Ep2uHUqf7PHZ4Tl+9up8H7hlJow5
 099FxvLp7tCtlIIsiqqyI9OOe7o2+bUhJ/Q==
X-Received: by 2002:a6b:1452:0:b0:760:e776:18c0 with SMTP id
 79-20020a6b1452000000b00760e77618c0mr2235536iou.9.1681836595275; 
 Tue, 18 Apr 2023 09:49:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZVsgHFq5DkfTVjZLoX8ZDscMPn0l0IcDwaF7P4VYcMS0dy9AZqf3xGlcdGUdzNLu695Of27Q==
X-Received: by 2002:a6b:1452:0:b0:760:e776:18c0 with SMTP id
 79-20020a6b1452000000b00760e77618c0mr2235519iou.9.1681836594980; 
 Tue, 18 Apr 2023 09:49:54 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 ay29-20020a056638411d00b003c5170ddcedsm4254803jab.110.2023.04.18.09.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 09:49:54 -0700 (PDT)
Date: Tue, 18 Apr 2023 10:49:53 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230418104953.28cfe9cb.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB7529F0992BD2C5CAC1BEA088C39D9@DS0PR11MB7529.namprd11.prod.outlook.com>
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
 <20230417221033.778c00c9.alex.williamson@redhat.com>
 <DS0PR11MB7529F0992BD2C5CAC1BEA088C39D9@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Tue, 18 Apr 2023 10:34:45 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Tuesday, April 18, 2023 12:11 PM
> >   
> [...]
> >
> > We haven't discussed how it fails when called on a group-opened device
> > in a mixed environment.  I'd propose that the INFO ioctl behaves
> > exactly as it does today, reporting group-id and BDF for each affected
> > device.  However, the hot-reset ioctl itself is not extended to accept
> > devicefd because there is no proof-of-ownership model for cdevs.
> > Therefore even if the user could map group-id to devicefd, they get
> > -EINVAL calling HOT_RESET with a devicefd when the ioctl is called from
> > a group-opened device.  Thanks,  
> 
> Will it be better to let userspace know it shall fail if invoking hot
> reset due to no proof-of-ownership as it also has cdev devices? Maybe
> the RESETTABLE flag should always be meaningful. Even if the calling
> device of _INFO is group-opened device. Old user applications does not
> need to check it as it will never have such mixed environment. But for
> new applications or the applications that have been updated per latest
> vfio uapi, it should strictly check this flag before going ahead to do
> hot-reset.

The group-opened model cannot consistently predict whether the user can
provide proof-of-ownership.  I don't think we should define a flag
simply because there's a case that we can predict, the definition of
that flag becomes problematic.  Let's not complicate the interface by
trying to optimize a case that will likely never exist in practice and
can be handled via the existing legacy API.  Thanks,

Alex

