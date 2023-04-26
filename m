Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B16D6EF566
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 26 Apr 2023 15:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C557910E99E;
	Wed, 26 Apr 2023 13:20:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FF810E99C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 26 Apr 2023 13:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682515226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3tF50+FCEBA470O0m1Pz3/uU72DgfPgXqci+5b6Z6Us=;
 b=UF8Mz8hpehmtjIWkAzgzLRfRVCNBht68tnNICfeozGGiVam3Kv1jcUyfYHXUAnGsPbtBeO
 /dsuC7RGoDxOWxN6zZbcXZyQqOUePKWsCaJLmK2ynFTOJmp0PZw+Orm8ZddEdabu6Ekaql
 9SYCZLuk3p1IVXPFvMTw2Z0+T1PK+tg=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655--v7jvutEPUKXioFf4oP2RQ-1; Wed, 26 Apr 2023 09:20:23 -0400
X-MC-Unique: -v7jvutEPUKXioFf4oP2RQ-1
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-760c58747cdso1035316139f.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 26 Apr 2023 06:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682515222; x=1685107222;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3tF50+FCEBA470O0m1Pz3/uU72DgfPgXqci+5b6Z6Us=;
 b=cbSRWDdE6MCmTh4EGEgrKboHCWkgoSYR0dFzzeFLjpK7Gc/DTnPk8qICSYXJR+GKGJ
 n5nRWncQ5aW63vFbU200wNtSCxhcGY1kW1j87kPXD59g+8YvL9CSSpwnlIBzcJfhCgu1
 JAheNqsO/17pmcMUuNm4R8gTQm+lMT2hGh4F+sUumkL4vR5lF6VEGvyGM1FbWJBz3T4+
 tcj0XmI0FKxc1b2jDtV9k9Yqhk96qlkdnga6qlRbBMTtj5sjNR2Gj5obQIs5e4VJTxR6
 3Ef9JVfD4kSzYKJdfh9gVnFKacEdxf85Vq9z/JTeDwjt/h1fDo+vl+jXGgjMzN/DuNF5
 6D0g==
X-Gm-Message-State: AAQBX9d3Ff6BlyDXK5wKb1/OM/w7gw8EabIaFIs3PReUtfVlxNj9t8K7
 k+l1CGPj7yXM4bQhqYINWIUteLK4ZLMFrfPjC0u9co+qouw20fLVZp6nqpV58uSPtRm70b1NrN7
 Iw9pK3dnZ7oAiPQ3dsH5NaeWvhhYxhqZlvw==
X-Received: by 2002:a5d:96c2:0:b0:763:6b5a:cb1e with SMTP id
 r2-20020a5d96c2000000b007636b5acb1emr9806276iol.10.1682515222503; 
 Wed, 26 Apr 2023 06:20:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350bVAxUZl+SaNxB4KtQp9lG5YMqf1m8i1/etdz67vKvzBfIWPiTagkhyoXG3sdYL8vcNxrib3g==
X-Received: by 2002:a5d:96c2:0:b0:763:6b5a:cb1e with SMTP id
 r2-20020a5d96c2000000b007636b5acb1emr9806258iol.10.1682515222228; 
 Wed, 26 Apr 2023 06:20:22 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 h20-20020a5d9e14000000b0075d23c433efsm4465857ioh.29.2023.04.26.06.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 06:20:21 -0700 (PDT)
Date: Wed, 26 Apr 2023 07:20:20 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230426072020.62834ac6.alex.williamson@redhat.com>
In-Reply-To: <DS0PR11MB75298CDC8108BA213243DBB8C3659@DS0PR11MB7529.namprd11.prod.outlook.com>
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
 <20230420080839.652732dc.alex.williamson@redhat.com>
 <DS0PR11MB75298CDC8108BA213243DBB8C3659@DS0PR11MB7529.namprd11.prod.outlook.com>
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

On Wed, 26 Apr 2023 07:22:17 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Thursday, April 20, 2023 10:09 PM  
> [...]
> > > > Whereas dev-id < 0
> > > > (== -1) is an affected device which prevents hot-reset, ex. an un-owned
> > > > device, device configured within a different iommufd_ctx, or device
> > > > opened outside of the vfio cdev API."  Is that about right?  Thanks,  
> > >
> > > Do you mean to have separate err-code for the three possibilities? As
> > > the devid is generated by iommufd and it is u32. I'm not sure if we can
> > > have such err-code definition without reserving some ids in iommufd.  
> > 
> > Yes, if we're going to report the full dev-set, I think we need at
> > least two unique error codes or else the user has no way to determine
> > the subset of invalid dev-ids which block the reset.  I think Jason is
> > proposing the set of valid dev-ids are >0, a dev-id of zero indicates
> > some form of non-blocking, while <0 (or maybe specifically -1)
> > indicates a blocking device.  I was trying to get consensus on a formal
> > definition of each of those error codes in my previous reply.  Thanks,  
> 
> Seems like RESETTABLE flag is not needed if we report -1 for the devices
> that block hotreset. Userspace can deduce if the calling device is resettable
> or not by checking if there is any -1 in the affected device list.

There is some redundancy there, yes.  Given the desire for a null array
on the actual reset ioctl I assumed there would also be a desire to
streamline the info ioctl such that userspace isn't required to parse
the return array, for example maybe userspace isn't required to pass a
full buffer and can get the reset availability status from only the
header.  Of course it's still the responsibility of userspace to know
the extent of the reset.  Thanks,

Alex

