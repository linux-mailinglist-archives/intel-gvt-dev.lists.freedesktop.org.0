Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C17276140E5
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 31 Oct 2022 23:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5BB10E201;
	Mon, 31 Oct 2022 22:53:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D82A10E201
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 31 Oct 2022 22:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667256796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHpC1zf1qV1jmlc1wntYS1OKLTiiLa4Edpg3f0kbUyY=;
 b=BN+EvRRauibQvs3QghlcOMA5pe5ImWI5cEWd7QybddMNxesYL4CaSpebsOAmomxq+/mB7/
 3s2O/DNzba+UPTrsdpDQ5wb+q7FHhFSFz5199z3lEZrtONUodBbfoZRBxqsGkReZ+BDQUp
 LWO6ZFL5YEgD5CzvgLxgVboO1WWxvyE=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-597-JITtk2IzNgOlcSug53vVcw-1; Mon, 31 Oct 2022 18:53:14 -0400
X-MC-Unique: JITtk2IzNgOlcSug53vVcw-1
Received: by mail-il1-f197.google.com with SMTP id
 l4-20020a056e021aa400b00300ad9535c8so3262374ilv.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 31 Oct 2022 15:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bHpC1zf1qV1jmlc1wntYS1OKLTiiLa4Edpg3f0kbUyY=;
 b=s50PSHIBN593Jn1JqLmwWmaLEi8lZovI7ZeUxt7+lJ0I6NRrvIC62hns8CCgUyhjKP
 a/oAzgU8Hu4/BzEMn/rKV+Bn3Eu0f2UFtJ8LjpmM6p0iXpjdKWFwOYLyqAU8Wq2Ijuli
 Ho6YTYoCE/TKc9fufXu228N0PdOOuUY09dYWQk0FZBj+QnNtvxb875rElS2nwL4dczBy
 /LEiH7jwKWTY2t3PjCmZ6vjcIlmkK06Zgq6YVq500D2G1t20StFiyuyHU529WBtXe6Xq
 4TGkBjZl8JaIElhIub75qeWL7mWJjChNRTXcDn/WD9/VEOYxgsJbsxxCru38tP0R/ARc
 nKFA==
X-Gm-Message-State: ACrzQf0h1Bifex2Ykf+OPwN8ESycXSO/SVCJXLs5vNwn1GsskHABLHvv
 +NFxqhes2UEU0zA7N51Awrp9GqJkWm4rqT47OG+1T+RBpv1YNzCtC7oANvoI/SG4GZkrxHfEDOA
 L09+FZopq8E65UlKOCkSjDCV4n7rh2RSnGw==
X-Received: by 2002:a05:6e02:180c:b0:2fc:4018:9440 with SMTP id
 a12-20020a056e02180c00b002fc40189440mr7991804ilv.225.1667256793686; 
 Mon, 31 Oct 2022 15:53:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7liCEme2wsc4XzJa+HajVmv1KVpsxVcMQII15KI4qdQbhYdKRKQskOMruD/YfHk1W7Cq0evQ==
X-Received: by 2002:a05:6e02:180c:b0:2fc:4018:9440 with SMTP id
 a12-20020a056e02180c00b002fc40189440mr7991769ilv.225.1667256793463; 
 Mon, 31 Oct 2022 15:53:13 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g15-20020a02850f000000b00372bbd04b75sm3200984jai.87.2022.10.31.15.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 15:53:12 -0700 (PDT)
Date: Mon, 31 Oct 2022 16:53:11 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 10/10] iommufd: Allow iommufd to supply /dev/vfio/vfio
Message-ID: <20221031165311.0698e1ea.alex.williamson@redhat.com>
In-Reply-To: <Y1wjFNxwPRm7S6yZ@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <10-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <20221026153133.44dc05c8.alex.williamson@redhat.com>
 <Y1wjFNxwPRm7S6yZ@nvidia.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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
Cc: kvm@vger.kernel.org, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Halil Pasic <pasic@linux.ibm.com>, iommu@lists.linux.dev,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 28 Oct 2022 15:44:36 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Oct 26, 2022 at 03:31:33PM -0600, Alex Williamson wrote:
> > On Tue, 25 Oct 2022 15:50:45 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > If the VFIO container is compiled out, give a kconfig option for iommufd
> > > to provide the miscdev node with the same name and permissions as vfio
> > > uses.
> > > 
> > > The compatibility node supports the same ioctls as VFIO and automatically
> > > enables the VFIO compatible pinned page accounting mode.  
> > 
> > I think I'd like to see some sort of breadcrumb when /dev/vfio/vfio is
> > provided by something other than the vfio container code.  If we intend
> > to include this before P2P is resolved, that breadcrumb   
> 
> I don't belive I can get P2P done soon enough. I plan to do it after
> this is merged. Right now these two series are taking all my time.
> 
> > (dmesg I'm guessing) might also list any known limitations of the
> > compatibility to save time with debugging.  Thanks,  
> 
> Yes, that makes sense.
> 
> Do you want a dmesg at module load time, on every open, or a sysfs
> something? What seems like it would make it into a bug report?

I think dmesg at module load time should probably be ok, every open
seems like harassment and sysfs would require updated support in
various bug reporting tools.  Users are often terrible about reporting
full dmesg in bugs, but they do often filter it for "IOMMU" or "VFIO",
so keep that in mind when crafting the log message.  Thanks,

Alex

