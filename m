Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E37A66C4AC0
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 22 Mar 2023 13:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FC610E925;
	Wed, 22 Mar 2023 12:36:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6816D10E0F6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 22 Mar 2023 12:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679488583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZEVZq83wbVrBX6YIpe57knDSAk+ax7b8c1a6ITeMnnE=;
 b=UawpxgmV2rbZhpnXEH+mMAM9lBdGX8bHhC/yUKgRwR/Q/D4CqpkjFD2HIXPlNRPAAwNgDR
 iW/NdZVumrBRDgjFGsuR6eXC5PiAjkQdwyfquu0o7nyHJpfVhApmrqwtQtJj0ZsIesMgqA
 KfdYicN6f7nfJ5VcRt0Q/HWjNG2846c=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-U2S8t0S-NqqctNEHSTEacw-1; Wed, 22 Mar 2023 08:36:22 -0400
X-MC-Unique: U2S8t0S-NqqctNEHSTEacw-1
Received: by mail-il1-f199.google.com with SMTP id
 i14-20020a056e0212ce00b0031d17f33e9aso9478491ilm.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 22 Mar 2023 05:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679488581;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZEVZq83wbVrBX6YIpe57knDSAk+ax7b8c1a6ITeMnnE=;
 b=PzBCRTrlW5pzQKO2aoUa43l8Z7T5JJkMKCO82PPMhuo9HVWinD+DxOaJlhVmmCCTdJ
 JM5HrDGqw1J7llOJPSKe++95wQ9J1mAIcU0x2w+NSiiAqqQXXQMiwzw853/8/NJPQJFd
 FA+ahcWd0bUv/sTxSjC5IOiFFZKO0qashOdyz/nAP6QSabxxdJP++/tevxhpLYiPx196
 KILw6uNvbpAnVie0glNyqIxfEDXIUi3So5KoL6AnbADZMyMKK7wwKe6krRusAZWBYuy1
 XlPeJcjvsVawrPN8+8Sapfm1PAsKHQ/G1UyALUD3GPoXmRLxYr762phqvH6dxW2BZANG
 BiIQ==
X-Gm-Message-State: AO0yUKVyTGJdNIWFiipa/6JVBiGZj7nJFrIdy+JpGSzmbrg13uVC25u5
 tS84bPfB7W53+I97VUbXriL6CoeOmUvlIaUGJFMGFGVYuXCHqX+Z4Xx7FYTeZwGZdPg5VpshJHd
 VLUZ/eqXeKd9r4rFatuhnhuyUhUWpJ6Q92w==
X-Received: by 2002:a6b:5b15:0:b0:73d:eb4b:345e with SMTP id
 v21-20020a6b5b15000000b0073deb4b345emr4250337ioh.6.1679488581506; 
 Wed, 22 Mar 2023 05:36:21 -0700 (PDT)
X-Google-Smtp-Source: AK7set+s1bVDw/httDHazd/bVKfPTyFl2eUE5yP3x7lZIEV1uxid79azuha2BxjfoT9XqWVJ/KVk0w==
X-Received: by 2002:a6b:5b15:0:b0:73d:eb4b:345e with SMTP id
 v21-20020a6b5b15000000b0073deb4b345emr4250309ioh.6.1679488581235; 
 Wed, 22 Mar 2023 05:36:21 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f29-20020a02241d000000b003a69bd12c6dsm4820604jaa.58.2023.03.22.05.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 05:36:20 -0700 (PDT)
Date: Wed, 22 Mar 2023 06:36:14 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v6 12/24] vfio/pci: Allow passing zero-length fd array
 in VFIO_DEVICE_PCI_HOT_RESET
Message-ID: <20230322063614.571699e4.alex.williamson@redhat.com>
In-Reply-To: <ZBr0JD7nPBM6Zr1z@nvidia.com>
References: <BN9PR11MB5276D5A71E43EA4CDD1C960A8CBD9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20230317091557.196638a6.alex.williamson@redhat.com>
 <ZBiUiEC8Xj9sOphr@nvidia.com>
 <20230320165217.5b1019a4.alex.williamson@redhat.com>
 <ZBjum1wQ1L2AIfhB@nvidia.com>
 <20230321143122.632f7e63.alex.williamson@redhat.com>
 <ZBoYgNq60eDpV9Un@nvidia.com>
 <20230321150112.1c482380.alex.williamson@redhat.com>
 <ZBottXxBlOsXmnmX@nvidia.com>
 <20230321164737.62b45132.alex.williamson@redhat.com>
 <ZBr0JD7nPBM6Zr1z@nvidia.com>
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
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "joro@8bytes.org" <joro@8bytes.org>,
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

On Wed, 22 Mar 2023 09:27:16 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Mar 21, 2023 at 04:47:37PM -0600, Alex Williamson wrote:
> > On Tue, 21 Mar 2023 19:20:37 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > On Tue, Mar 21, 2023 at 03:01:12PM -0600, Alex Williamson wrote:
> > >   
> > > > > Though it would be nice if qemu didn't need two implementations so Yi
> > > > > I'd rather see a new info in this series as well and qemu can just
> > > > > consistently use dev_id and never bdf in iommufd mode.    
> > > > 
> > > > We also need to consider how libvirt determines if QEMU has the kernel
> > > > support it needs to pass file descriptors.  It'd be a lot cleaner if
> > > > this aligned with the introduction of vfio cdevs.    
> > > 
> > > Yes, that would be much better if it was one package.
> > > 
> > > But this is starting to grow and we have so many threads that need to
> > > progress blocked on this cdev enablement :(
> > > 
> > > Could we go forward with the cdev main patches and kconfig it to
> > > experimental or something while the rest of the parts are completed
> > > and tested through qemu? ie move the vfio-pci reset enablment to after
> > > the cdev patches?  
> > 
> > We need to be able to guarantee that there cannot be any significant
> > builds of the kernel with vfio cdev support if our intention is to stage
> > it for libvirt.  We don't have a global EXPERIMENTAL config option any
> > more.  Adding new code under BROKEN seems wrong.  Fedora ships with
> > STAGING enabled.  A sternly worded Kconfig entry is toothless.  What is
> > the proposed mechanism to make this not look like a big uncompiled code
> > dump?  Thanks,  
> 
> I would suggest a sternly worded kconfig and STAGING.
> 
> This isn't such a big issue, we are trying to say that a future
> released qemu is not required to work on older kernels with a STAGING
> kconfig mark.
> 
> IOW we are saying that qemu release X.0 with production iommufd
> requires kernel version > x.y and just lightly reflecting this into
> the kconfig.
> 
> qemu should simply not support iommufd if it finds itself on a old
> kernel.

Inferring features based on kernel versions doesn't work in a world
where downstreams backport features to older kernels.  Thanks,

Alex

