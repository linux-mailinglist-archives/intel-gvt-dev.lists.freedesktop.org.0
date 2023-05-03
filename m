Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C1F6F616F
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  4 May 2023 00:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CE910E0F2;
	Wed,  3 May 2023 22:49:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B85410E0F2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 May 2023 22:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683154165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZKMay62CKj/rRkV21aMrRSKMlokKOiJJhw6mGzAbD4=;
 b=QfLDZengg6Sf7zpkUMVRWnrlfrPvb+/ZCKc9Znn47qnPJARld8nMDS76tcGPoHXe6HvajW
 QL5SDreF5m+14Wwfz7AMEZ7SPj79sTv2L7zteZh+rqqgi2uj8xPHXH1fjJCQXr3YiPrMei
 jEPphEFLq9KH4cLiWGa0+Pi7VFc4irs=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-r2msH22nM3O7a4EqdiXChg-1; Wed, 03 May 2023 18:49:21 -0400
X-MC-Unique: r2msH22nM3O7a4EqdiXChg-1
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3313a22001dso15084225ab.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 03 May 2023 15:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683154161; x=1685746161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pZKMay62CKj/rRkV21aMrRSKMlokKOiJJhw6mGzAbD4=;
 b=MOkfDmFbkSP6lYmieJDkLnjAJ+O1Wc6aSBq3DP/guSQGt/rNWEqyGJu+AIgMAbBquq
 MhUwXzfKGfOzXVwRD6KH2A0NJHgWDCxj/H9V9NoZEC5l7ufyVviqDwNCnjDFlWStIyhe
 kbY7hOZ+0R/1w43GsET+dY42kCxTZN8Uwv9a+bASLMuFlP+cfE2odf4+jKb2Px2Hlk0C
 kvWj+qbgKczQoiQXzuPVdGjD6r4ZOzaI+AbswrhaY9kCKujnhCpnu7YOClvQ3pcM4lLF
 0jVlVoGf7zKqPnmX9JPZk9/7N1dLRaonTZGDWpa7GgZiy6nmo018Mpg3geu18SOvlcPv
 11YA==
X-Gm-Message-State: AC+VfDyN/W7ynyZqBZz4cwbCGUZOzkLSptjh6++rb6irleTn+q+e45Ds
 SbsmPUyFkRzdgMkg0PZrFTJzPq0rUlE4gpqVvWFW3YqAEV++ZjutAhLjkE4fz/M2/HF6WeaZjVy
 qZj8HRki5nbi1OozJCEM3Fh9MEZkQjJUocA==
X-Received: by 2002:a92:c84d:0:b0:318:ab40:4e9b with SMTP id
 b13-20020a92c84d000000b00318ab404e9bmr15017942ilq.2.1683154161176; 
 Wed, 03 May 2023 15:49:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ntpPSWb/poW4t0J5+ldQYO37YiiaPp9DXn+9xjK5dBx+7eAyDqpM0q/3zcX+WxbzjTaBu6Q==
X-Received: by 2002:a92:c84d:0:b0:318:ab40:4e9b with SMTP id
 b13-20020a92c84d000000b00318ab404e9bmr15017917ilq.2.1683154160924; 
 Wed, 03 May 2023 15:49:20 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g8-20020a056e020d0800b0032c9da1d89csm9093182ilj.78.2023.05.03.15.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 15:49:20 -0700 (PDT)
Date: Wed, 3 May 2023 16:49:16 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4 2/9] vfio-iommufd: Create iommufd_access for noiommu
 devices
Message-ID: <20230503164916.652d7779.alex.williamson@redhat.com>
In-Reply-To: <ZFK5AJxhMBGKqWaH@nvidia.com>
References: <20230426145419.450922-1-yi.l.liu@intel.com>
 <20230426145419.450922-3-yi.l.liu@intel.com>
 <BN9PR11MB52768AF474FAB2AF36AC00508C6A9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <DS0PR11MB752972AC1A6030CB442ACF3FC36A9@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230427123203.22307c4f.alex.williamson@redhat.com>
 <c203f11f-4d9f-cf43-03ab-e41a858bdd92@intel.com>
 <ZFFUyhqID+LtUB/D@nvidia.com>
 <DS0PR11MB7529B4E4513B1A56A90F111DC36C9@DS0PR11MB7529.namprd11.prod.outlook.com>
 <ZFK5AJxhMBGKqWaH@nvidia.com>
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

On Wed, 3 May 2023 16:41:52 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> > > My general idea to complete the no-iommu feature is to add a new IOCTL
> > > to VFIO that is 'pin iova and return dma addr' that no-iommu userspace
> > > would call instead of trying to abuse mlock and /proc/ to do it. That
> > > ioctl would use the IOAS attached to the access just like a mdev would
> > > do, so it has a real IOVA, but it is not a mdev.  
> > 
> > This new ioctl may be IOMMUFD ioctl since its input is the IOAS and
> > addr, nothing related to the device. Is it?  
> 
> No, definately a VFIO special ioctl for VFIO no-iommu mode.

This seems like brushing off the dirty work to vfio.  Userspace drivers
relying on no-iommu are in pretty questionable territory already, do we
care if they don't have a good means to pin pages and derive the DMA
address of those pinned pages?  As I noted earlier, I'm really not
interested in expanding no-iommu, it's less important now than when it
was added (we have vIOMMUs in VMs now and more platforms with IOMMUs)
and we shouldn't be encouraging its use by further developing the
interface.  Thanks,

Alex

