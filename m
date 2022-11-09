Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DD962326F
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Nov 2022 19:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D679610E61A;
	Wed,  9 Nov 2022 18:28:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A0910E615
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  9 Nov 2022 18:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668018509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mt9wA9NJ8erhcq3hDeHIo3uLVdgY+wacj95T/avg+94=;
 b=GesaVNQ5XpmA7TgDoiMLkQobFu6cRjNzCkP/t0w3RxHiOYnHeD9s1M6Mg0vtI8SRMiuRor
 xdk9TaFPgeoWrsUBGh0PbbiowE4rCJ4Zk/VLb9w/rCYJ/vSwpDBAVHddoR5Q8fE6kM5qyv
 W2PC2XQP2dwng4srdZU4zfdTWlwmiNc=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-77-lg_JtblIPRSU8HIpBpQsUw-1; Wed, 09 Nov 2022 13:28:26 -0500
X-MC-Unique: lg_JtblIPRSU8HIpBpQsUw-1
Received: by mail-il1-f200.google.com with SMTP id
 s4-20020a056e02216400b003021b648144so5588816ilv.19
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 09 Nov 2022 10:28:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mt9wA9NJ8erhcq3hDeHIo3uLVdgY+wacj95T/avg+94=;
 b=rxala3IlPARXIulUKLxT9rwt2k746/M9iXTNcjxQIRBzWaygTVu2G3GO2+tDpT/LTb
 u/vjQ0t5ZGpmI0u+csKEXm7KnzSH4/J4XdUUR/rxTLKL9EyuR/u515KFAaUhvziv6sMg
 lT5r0nexw+plGOg19HcmLQS17CRHYwsNKefgLzS2RNatmbtbLRY1gQkTEiifEn+QaMo4
 ebDK5kyzsBS2XiCCnRg7dOEdAbR2B61cfY5nNBdxADD/Aq4t+I22f2YoicC8SC28+dka
 cgFRRJrczHl8v3vF8QEg4cM5Zuta1cSR8orT4nL0S0vqqCXMRZ9HGJRzHbC3Jsreq+78
 wJPQ==
X-Gm-Message-State: ACrzQf3GSakWGj3a4CNJVYrP67IAX1efTaQDSQlX6ejfhmtWOp5yrlaM
 oQNZzeIE5sz7NKu4FxJ+CylPZijJjDfA0OJMBx7migpOLQ6Zqt+GN3OzNp7skbSyTVLx3zHAiMK
 PN7ZyYiLF6ydkTWURyMV9twIhOv3uAyaBOg==
X-Received: by 2002:a05:6602:1218:b0:6ca:5fd2:f8e1 with SMTP id
 y24-20020a056602121800b006ca5fd2f8e1mr2102248iot.118.1668018505744; 
 Wed, 09 Nov 2022 10:28:25 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7eUfyPf7jZTqBn46xsn3j0EDMn1ZQ6U+esr6/ILDBLlfe7a8Y4zkj42s7VYGmSVWZgP6Q5SA==
X-Received: by 2002:a05:6602:1218:b0:6ca:5fd2:f8e1 with SMTP id
 y24-20020a056602121800b006ca5fd2f8e1mr2102238iot.118.1668018505479; 
 Wed, 09 Nov 2022 10:28:25 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 b3-20020a92c143000000b002f165ceb09bsm5105515ilh.64.2022.11.09.10.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 10:28:24 -0800 (PST)
Date: Wed, 9 Nov 2022 11:28:22 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Message-ID: <20221109112822.7a8c5f7a.alex.williamson@redhat.com>
In-Reply-To: <Y2r80RgytKpPtK58@nvidia.com>
References: <4-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <20221026152442.4855c5de.alex.williamson@redhat.com>
 <Y1wiCc33Jh5QY+1f@nvidia.com>
 <20221031164526.0712e456.alex.williamson@redhat.com>
 <Y2kF75zVD581UeR2@nvidia.com>
 <20221107081853.18727337.alex.williamson@redhat.com>
 <Y2klGAUEUwpjWHw6@nvidia.com>
 <20221107110508.7f02abf4.alex.williamson@redhat.com>
 <Y2lSZwNT8f/RMoZf@nvidia.com>
 <20221108155520.4429c2e5.alex.williamson@redhat.com>
 <Y2r80RgytKpPtK58@nvidia.com>
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 iommu@lists.linux.dev, Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 8 Nov 2022 21:05:21 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Nov 08, 2022 at 03:55:20PM -0700, Alex Williamson wrote:
> 
> > > > So why exactly isn't this an issue for VDPA?  Are we just burying our
> > > > head in the sand that such platforms exists and can still be useful
> > > > given the appropriate risk vs reward trade-off?    
> > > 
> > > Simply that nobody has asked for it, and might never ask for it. This
> > > is all support for old platforms, and there just doesn't seem to be a
> > > "real" use case for very new (and actually rare) NIC hardware stuck
> > > into ancient platforms with this security problem.  
> > 
> > vIOMMU support for interrupt remapping is relatively new, the nesting
> > case is important as well.  
> 
> This is where we got hit. In the end we fixed the qemu..
> 
> > > I'd be much more comfortable with this as a system wide iommufd flag
> > > if we also tied it to do some demonstration of privilege - eg a
> > > requirement to open iommufd with CAP_SYS_RAWIO for instance.  
> > 
> > Which is not compatible to existing use cases, which is also why we
> > can't invent some way to allow some applications to run without CPU
> > mitigations, while requiring it for others as a baseline.  
> 
> Isn't it? Didn't we learn that libvirt runs as root and will open and
> pass the iommufd as root?

We're jumping ahead to native iommufd support here, what happens when
VFIO_CONTAINER=n and it's QEMU opening the fds, with only file access
privileges?

> > > That is the usual protocol for these kinds of insecurities..  
> > 
> > Hmm, is it?  
> 
> I think so. At least you should have something to shut down an
> insecure feature in kernel lockdown modes. CAP_SYS_RAWIO is a simple
> way to do it.

How are CPU vulnerabilities handled in lockdown mode, do apps require
certain capabilities to run fast vs safe, or do we simply disallow
unsafe globally in lockdown?  I think we have a lot more leniency to
ignore/disallow flags that enable global insecurities when any sort of
lockdown is imposed.

> > > I think right now we can leave this as-is and we can wait for some
> > > more information to decide how best to proceed.  
> > 
> > It's certainly not acceptable in the latest proposal, iommufd consumes
> > an option set by another module and when that module goes away, so does
> > any claim of compatibility.  The code becomes dead and the feature not
> > present.  The option doesn't belong on the vfio module.  Do we need a
> > vfio-iommufd module to host it?  Thanks,  
> 
> I don't know, as I said in the other email, these little things need
> work and discussion to resolve. We need to recheck the security stuff
> against the 2022 kernel where things have changed. We don't need to do
> it all right now.
> 
> People who want allow_unsafe_interrupts to work will simply not set
> VFIO_CONTAINER=n at this time. Same with P2P, vfio-no-iommu and any
> other gaps we haven't discovered.
> 
> vfio-iommufd seems like overkill, I think your first suggestion to put
> in vfio.ko was more practical.

Convenient perhaps, but architecturally the wrong place for it.

> My only doubt is if we should make it system wide for everything - and
> I'm just a bit uncomfortable with that from a security POV. But maybe
> I don't quite know exactly what the risks are.

There's a paper about these sorts of attacks here[1].  As I noted
earlier, a non-malicious DMA targeting an address that would trigger an
interrupt is extremely unlikely, and the resulting vulnerability is
largely more of a denial of service, IIRC.  It would certainly be
strongly dis-recommended in any scenario where the userspace drivers
are untrusted, such as a cloud hosting provider, but there are
certainly other scenarios where either the guest or userspace drivers
are also under the control of the hosting provider and this is not such
a concern.  Thanks,

Alex

[1]https://invisiblethingslab.com/resources/2011/Software%20Attacks%20on%20Intel%20VT-d.pdf

