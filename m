Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A996D6C3DD4
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 Mar 2023 23:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B5410E090;
	Tue, 21 Mar 2023 22:47:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9BC10E090
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 21 Mar 2023 22:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679438861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pkqj6f0mmvcRZY6WGcLhSYjSkEneOC6n3/87lujTtak=;
 b=E/FN7OSole7Ev8l7nlXxXfiOv+0BvbSYc0EIFq1PIkn6bKG/NGYVO7AVFL+JDEM9fHaOEF
 Qt+aI69yOjwrKhArt1HQf/3oVL8wb3E4KrPaS2GNccCm3guPPAuKP7BWE7ifAf41pquv1D
 ekDDyxBxu+wibL72FNvulsJWoDrsJkU=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-p7HlbflLPHOtWUkQO22nMw-1; Tue, 21 Mar 2023 18:47:40 -0400
X-MC-Unique: p7HlbflLPHOtWUkQO22nMw-1
Received: by mail-io1-f69.google.com with SMTP id
 a21-20020a5d9595000000b0074c9dc19e16so8416444ioo.15
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 21 Mar 2023 15:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679438859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pkqj6f0mmvcRZY6WGcLhSYjSkEneOC6n3/87lujTtak=;
 b=gufwXxc/blpprrxsfq/92pzYLDh+aRrGqifvF2WH41uK0j1rg5vCKs++blDjNQkdSm
 DiaaorKYRNH1f+5BvNO+b8gdMR9IGTmUwuFB3buOBXR9hFm9B1zHF6KxefrEP1YJWkRa
 QVW3ICN3YS9y48tAxYUhBhphiYHDxYiGSJzzZlHqKlmdQAXJ7CVZ/d8Ga4WqnAuLcE17
 CQbfjcKx8sVtbwtrSfoNJTjo2EjeDo4fFlB1rnIO1O3dyPw9IjViR+ZeP9wCwLr2XCRt
 nU+U3clAa9DLq34vR1dZMGeg/Y1U4VZvf6hTEDj/gBdTSvCJ9+T+Q2rg4ccqjP6UWcFn
 boHg==
X-Gm-Message-State: AO0yUKX89SZEr/X1uiemeZNeFo0o+TllD/6gaenhghH4wscgqd3uYHef
 ZEdjMib2SmF05by01SQJr2bU20MJM5mwYYcAMzYr4YKaI6etdrIS/LeHzzzhhOwLHPLKI7pxPrr
 D8gmpp1mUtqLGt/58Wrxp/fFfM4WYY6/QzQ==
X-Received: by 2002:a6b:db09:0:b0:74c:bc54:def6 with SMTP id
 t9-20020a6bdb09000000b0074cbc54def6mr3056447ioc.16.1679438859362; 
 Tue, 21 Mar 2023 15:47:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set9EbNNXSPjEUSnoMvgIPdEGf1CXd6ABSfzKBINcdwi6xMSz3jsAv4ymlWXyfvMVdfEnqs2RsA==
X-Received: by 2002:a6b:db09:0:b0:74c:bc54:def6 with SMTP id
 t9-20020a6bdb09000000b0074cbc54def6mr3056419ioc.16.1679438859071; 
 Tue, 21 Mar 2023 15:47:39 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 y16-20020a027310000000b004061d6abcd1sm4452110jab.162.2023.03.21.15.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 15:47:38 -0700 (PDT)
Date: Tue, 21 Mar 2023 16:47:37 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v6 12/24] vfio/pci: Allow passing zero-length fd array
 in VFIO_DEVICE_PCI_HOT_RESET
Message-ID: <20230321164737.62b45132.alex.williamson@redhat.com>
In-Reply-To: <ZBottXxBlOsXmnmX@nvidia.com>
References: <BN9PR11MB5276F7879E428080D2B214D98CBC9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20230316182256.6659bbbd.alex.williamson@redhat.com>
 <BN9PR11MB5276D5A71E43EA4CDD1C960A8CBD9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20230317091557.196638a6.alex.williamson@redhat.com>
 <ZBiUiEC8Xj9sOphr@nvidia.com>
 <20230320165217.5b1019a4.alex.williamson@redhat.com>
 <ZBjum1wQ1L2AIfhB@nvidia.com>
 <20230321143122.632f7e63.alex.williamson@redhat.com>
 <ZBoYgNq60eDpV9Un@nvidia.com>
 <20230321150112.1c482380.alex.williamson@redhat.com>
 <ZBottXxBlOsXmnmX@nvidia.com>
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

On Tue, 21 Mar 2023 19:20:37 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Mar 21, 2023 at 03:01:12PM -0600, Alex Williamson wrote:
> 
> > > Though it would be nice if qemu didn't need two implementations so Yi
> > > I'd rather see a new info in this series as well and qemu can just
> > > consistently use dev_id and never bdf in iommufd mode.  
> > 
> > We also need to consider how libvirt determines if QEMU has the kernel
> > support it needs to pass file descriptors.  It'd be a lot cleaner if
> > this aligned with the introduction of vfio cdevs.  
> 
> Yes, that would be much better if it was one package.
> 
> But this is starting to grow and we have so many threads that need to
> progress blocked on this cdev enablement :(
> 
> Could we go forward with the cdev main patches and kconfig it to
> experimental or something while the rest of the parts are completed
> and tested through qemu? ie move the vfio-pci reset enablment to after
> the cdev patches?

We need to be able to guarantee that there cannot be any significant
builds of the kernel with vfio cdev support if our intention is to stage
it for libvirt.  We don't have a global EXPERIMENTAL config option any
more.  Adding new code under BROKEN seems wrong.  Fedora ships with
STAGING enabled.  A sternly worded Kconfig entry is toothless.  What is
the proposed mechanism to make this not look like a big uncompiled code
dump?  Thanks,

Alex

