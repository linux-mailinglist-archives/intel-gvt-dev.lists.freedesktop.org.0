Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86AF75FF8C
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 Jul 2023 21:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AA710E115;
	Mon, 24 Jul 2023 19:09:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C5810E115
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 24 Jul 2023 19:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690225769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WawsHdGpz2PcjK+rzMy9rXk7uFt8JlrwIupXE53S044=;
 b=OhNcLwK5ozcz3RCrdyaGaeY79Go/i9cqA8kGQSfEvTyNXjeYsGT7+2+p84vLO6aYnQBwjO
 jp5b8ARH3JBssjH84KPodnDwDlEFcPlz6b2kC5Ss+FHmXs3Y+Adn1O8GUwFY1BGrG+vRZi
 orMSkmDcsrmV8pnhW+yra6hCOLcfxMk=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-RVOjpeieOmGpng-gghIrLA-1; Mon, 24 Jul 2023 15:09:26 -0400
X-MC-Unique: RVOjpeieOmGpng-gghIrLA-1
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-77e3eaa1343so239969539f.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 24 Jul 2023 12:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690225765; x=1690830565;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WawsHdGpz2PcjK+rzMy9rXk7uFt8JlrwIupXE53S044=;
 b=TZVar1noEvADMTpXEcZ8gnV4nFG4Cxsfz79Pn+ncpXRYBCwlYGrZDz0OHHuBBVuFZ1
 7zqOSu/PoLUoJfyY0Lv3EEVkWemdpn+cAt5lkxYcm55FX74I8ioN9u/1aZsqs+ebjh/j
 UYHnprcIlfdKESRDvcks7Eh3qotROE6D74bIN+iB6GaXEKRtrXtXu5OveNsflzt3mdnO
 PrQfQtpRuOcGFHu7AeikluJMfi1xGDJCJdK/7GsI+s/XysaQV4dkjMsxt2FJEwoEpD1k
 UvJjD7cTUuzWOvC99y4RhYXNIF+Ip9NQVnuvOMDS1mxaC7PsNp1JlvCFO4b9mCvJxazE
 lbNw==
X-Gm-Message-State: ABy/qLa93JB8fQdto+Z6NBcbXZe4ZE9vsH61VaaccujKAxb7tIytRakb
 ctxf83lmUt/D7zZA1sibTkJHzo/A8XI7ifuYMd7Z7cQ3b3tIPwyw5uVdFz5wdQkKasa5AJSNwhP
 QbNIWp+K6RkY8yuY+UcOwuRKZshj0Xd5NGw==
X-Received: by 2002:a5d:8856:0:b0:787:9f4:a286 with SMTP id
 t22-20020a5d8856000000b0078709f4a286mr830173ios.3.1690225765542; 
 Mon, 24 Jul 2023 12:09:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGQj4iG8mT+sSEqSQYkZfuQ4Hg9spnEgepBk2H1o6jlqFqHr7tDoImTU/XT+4VwrQSYWZsnbg==
X-Received: by 2002:a5d:8856:0:b0:787:9f4:a286 with SMTP id
 t22-20020a5d8856000000b0078709f4a286mr830154ios.3.1690225765283; 
 Mon, 24 Jul 2023 12:09:25 -0700 (PDT)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 e23-20020a056638021700b0042b4f9ddecasm3133372jaq.85.2023.07.24.12.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 12:09:24 -0700 (PDT)
Date: Mon, 24 Jul 2023 13:09:22 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v15 00/26] Add vfio_device cdev for iommufd support
Message-ID: <20230724130922.5bf567ef.alex.williamson@redhat.com>
In-Reply-To: <ZLbEigQvwSZFiCqv@nvidia.com>
References: <20230718135551.6592-1-yi.l.liu@intel.com>
 <ZLbEigQvwSZFiCqv@nvidia.com>
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
Cc: mjrosato@linux.ibm.com, jasowang@redhat.com, xudong.hao@intel.com,
 zhenzhong.duan@intel.com, peterx@redhat.com, terrence.xu@intel.com,
 chao.p.peng@linux.intel.com, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org, lulu@redhat.com,
 yanting.jiang@intel.com, joro@8bytes.org, nicolinc@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org,
 eric.auger@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 yi.y.sun@linux.intel.com, clegoate@redhat.com, cohuck@redhat.com,
 shameerali.kolothum.thodi@huawei.com, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 18 Jul 2023 13:57:46 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Jul 18, 2023 at 06:55:25AM -0700, Yi Liu wrote:
> > Existing VFIO provides group-centric user APIs for userspace. Userspace
> > opens the /dev/vfio/$group_id first before getting device fd and hence
> > getting access to device. This is not the desired model for iommufd. Per
> > the conclusion of community discussion[1], iommufd provides device-centric
> > kAPIs and requires its consumer (like VFIO) to be device-centric user
> > APIs. Such user APIs are used to associate device with iommufd and also
> > the I/O address spaces managed by the iommufd.
> > 
> > This series first introduces a per device file structure to be prepared
> > for further enhancement and refactors the kvm-vfio code to be prepared
> > for accepting device file from userspace. After this, adds a mechanism for
> > blocking device access before iommufd bind. Then refactors the vfio to be
> > able to handle cdev paths (e.g. iommufd binding, no-iommufd, [de]attach ioas).
> > This refactor includes making the device_open exclusive between the group
> > and the cdev path, only allow single device open in cdev path; vfio-iommufd
> > code is also refactored to support cdev. e.g. split the vfio_iommufd_bind()
> > into two steps. Eventually, adds the cdev support for vfio device and the
> > new ioctls, then makes group infrastructure optional as it is not needed
> > when vfio device cdev is compiled.
> > 
> > This series is based on some preparation works done to vfio emulated devices[2]
> > and vfio pci hot reset enhancements[3]. Per discussion[4], this series does not
> > support cdev for physical devices that do not have IOMMU. Such devices only
> > have group-centric user APIs.
> > 
> > This series is a prerequisite for iommu nesting for vfio device[5] [6].
> > 
> > The complete code can be found in below branch, simple tests done to the
> > legacy group path and the cdev path. QEMU changes are in upstreaming[7]
> > and the complete code can be found at[8]
> > 
> > https://github.com/yiliu1765/iommufd/tree/vfio_device_cdev_v15
> > (config CONFIG_IOMMUFD=y CONFIG_VFIO_DEVICE_CDEV=y)  
> 
> Alex, if you are still good with this lets make this into a shared
> branch, do you want to do it or would you like a PR from me?

Sorry, was out much of last week.  Yes, my intent would be to put this
both in a shared branch and my next branch for v6.6.  Given this is
mostly vfio, it seems like it'd make sense for me to provide that
branch but I may not get to it until tomorrow.  Thanks,

Alex

