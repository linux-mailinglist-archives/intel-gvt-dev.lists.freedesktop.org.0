Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FDF61F76E
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Nov 2022 16:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F7810E3C8;
	Mon,  7 Nov 2022 15:19:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601E110E3C6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  7 Nov 2022 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667834338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPVWQ+YraXRChqzr4SQlG/qjPD1QpM0ZmFrgY+kvQEQ=;
 b=gd6w2bMniN8FYHUZ7hlaIMIgidZplfIaZn7BE5XdlsCN1+xA2JNsUkP1TRyhTaZatmdg6F
 jPYJFCXWfNrKunOLiOPadHHSrDVnJklWHgMECaJ1WJ02O79UYXR4xsduqb+SCuajUWwK2E
 0VWJoGTUUNuMxpdo2H+B9qpTHFxRu5A=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-574-16GePacTNRez3gfY0r_r7Q-1; Mon, 07 Nov 2022 10:18:57 -0500
X-MC-Unique: 16GePacTNRez3gfY0r_r7Q-1
Received: by mail-io1-f71.google.com with SMTP id
 r197-20020a6b8fce000000b006c3fc33424dso7252975iod.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 07 Nov 2022 07:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DPVWQ+YraXRChqzr4SQlG/qjPD1QpM0ZmFrgY+kvQEQ=;
 b=ncRBBxRk0yY5yOkDDdnEJRkI6KqAy507gRkGjycqjlZgSIouWb1kG1kLbalL5ztX8c
 UK0WNd8hz992T5DGQ1GvFvLXkRJoMjFr5wY46ehd9xd54IuH9lIry21rQyoDrzSvCOOX
 5hX8deG/BqnWPaOTUMxymz9cyxfJcBtNcxIlSmmvA+FynEJSLEb4k/gzHuOtDW/drGJR
 P86nF20usU8YN7tC/gTpb88xZ1jKOKLMf85kpR+bhmcTFmJvU0YjiuTGxriytXCvAWm9
 lv7JWoD+OVFyM6BRRBYob1nKYnBc97GOyv7cN/voQ4lQ8qX8MmqGvmRV/4E4SgL8EHMi
 bnlw==
X-Gm-Message-State: ACrzQf2/qP1HD7Pq2jd1n4FEsRoyER5unx+/kGBO02JxP1KlIMWU0QAw
 ucE3KAYRud7lZigx9AqWGg5PGYFGna6V8pVC7sWOg4aG/D0HuUwlgYkk1SAnbiHBOi+WkiYaiwY
 RvIV0G1lkPvm2CnTDPLbM6QQmKZmm+Yl7hg==
X-Received: by 2002:a92:d74f:0:b0:300:ad95:35c5 with SMTP id
 e15-20020a92d74f000000b00300ad9535c5mr25950912ilq.137.1667834336916; 
 Mon, 07 Nov 2022 07:18:56 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4lWUzVNR72O39IQE6LeiepbZvM9WXMUgdmYx2bv2/TRXid0tlwA/a3n4EvaTSlM1yrwXs6uQ==
X-Received: by 2002:a92:d74f:0:b0:300:ad95:35c5 with SMTP id
 e15-20020a92d74f000000b00300ad9535c5mr25950861ilq.137.1667834336637; 
 Mon, 07 Nov 2022 07:18:56 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 z101-20020a0293ee000000b0037556012c63sm2771396jah.132.2022.11.07.07.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 07:18:55 -0800 (PST)
Date: Mon, 7 Nov 2022 08:18:53 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Message-ID: <20221107081853.18727337.alex.williamson@redhat.com>
In-Reply-To: <Y2kF75zVD581UeR2@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <4-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <20221026152442.4855c5de.alex.williamson@redhat.com>
 <Y1wiCc33Jh5QY+1f@nvidia.com>
 <20221031164526.0712e456.alex.williamson@redhat.com>
 <Y2kF75zVD581UeR2@nvidia.com>
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

On Mon, 7 Nov 2022 09:19:43 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, Oct 31, 2022 at 04:45:26PM -0600, Alex Williamson wrote:
> 
> > > It is one idea, it depends how literal you want to be on "module
> > > parameters are ABI". IMHO it is a weak form of ABI and the need of
> > > this paramter in particular is not that common in modern times, AFAIK.
> > > 
> > > So perhaps we just also expose it through vfio.ko and expect people to
> > > migrate. That would give a window were both options are available.  
> > 
> > That might be best.  Ultimately this is an opt-out of a feature that
> > has security implications, so I'd rather error on the side of requiring
> > the user to re-assert that opt-out.  It seems the potential good in
> > eliminating stale or unnecessary options outweighs any weak claims of
> > preserving an ABI for a module that's no longer in service.  
> 
> Ok, lets do this
> 
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -55,6 +55,11 @@ static struct vfio {
>  bool vfio_allow_unsafe_interrupts;
>  EXPORT_SYMBOL_GPL(vfio_allow_unsafe_interrupts);
>  
> +module_param_named(allow_unsafe_interrupts,
> +                  vfio_allow_unsafe_interrupts, bool, S_IRUGO | S_IWUSR);
> +MODULE_PARM_DESC(allow_unsafe_interrupts,
> +                "Enable VFIO IOMMU support for on platforms without interrupt remapping support.");
> +
>  static DEFINE_XARRAY(vfio_device_set_xa);
>  static const struct file_operations vfio_group_fops;
> 
> > However, I'd question whether vfio is the right place for that new
> > module option.  As proposed, vfio is only passing it through to
> > iommufd, where an error related to lack of the hardware feature is
> > masked behind an -EPERM by the time it gets back to vfio, making any
> > sort of advisory to the user about the module option convoluted.  It
> > seems like iommufd should own the option to opt-out universally, not
> > just through the vfio use case.  Thanks,  
> 
> My thinking is this option shouldn't exist at all in other iommufd
> users. eg I don't see value in VDPA supporting it.

I disagree, the IOMMU interface is responsible for isolating the
device, this option doesn't make any sense to live in vfio-main, which
is the reason it was always a type1 option.  If vdpa doesn't allow full
device access such that it can guarantee that a device cannot generate
a DMA that can spoof MSI, then it sounds like the flag we pass when
attaching a device to iommfd should to reflect this difference in usage.
The driver either requires full isolation, default, or can indicate a
form of restricted DMA programming that prevents interrupt spoofing.
The policy whether to permit unsafe configurations should exist in one
place, iommufd.  Thanks,

Alex

