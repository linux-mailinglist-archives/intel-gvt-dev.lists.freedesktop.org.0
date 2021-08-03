Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A633DF344
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  3 Aug 2021 18:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44C96E8A2;
	Tue,  3 Aug 2021 16:52:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E176E85B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  3 Aug 2021 16:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628009550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKtEVRvHNGT42iZNHToUtsFsYwSj6OAOl6LkhSWUXzQ=;
 b=HLV1Uxh/gQiv/X+OpQ5B69XeaYIxGDambTtmAWr5ZJH2dj7N4Z4L/z7Yj1gnzZXn3i9R2B
 lG9R4VggXRkMLPa9N8Q+o0v1TrFDrBkrrRBzYDyC9aUjDb8L1xpFEdVO8QbrLGotDuWGEm
 O4cGC8S+awZQszOe82cNu04N+KI6Jbw=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-zozNOpG3MaKCGuJcZhHEGA-1; Tue, 03 Aug 2021 12:52:29 -0400
X-MC-Unique: zozNOpG3MaKCGuJcZhHEGA-1
Received: by mail-oi1-f200.google.com with SMTP id
 n2-20020aca40020000b029025c9037b7faso8876918oia.14
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 03 Aug 2021 09:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sKtEVRvHNGT42iZNHToUtsFsYwSj6OAOl6LkhSWUXzQ=;
 b=G/OgjRoc04wnPTj+akAejO7nV3fotx3rURIfth4GS5R69Y/lblSB5GmS79QlLDYUi0
 Wy7teSL1HkprMoEdeGb3wFN+Ny8BuMUFjzbyrgPAB7dsSESpQJAv7kwffdS+ERMNiqk9
 pDDZzRUrRPHyYmdLlk1Z6Ce5ml94gN0SLoMCROpjrKM3A216TJUMaJ3vaP18LGDmCJyu
 9zmKbxxU8er1KYFBO+1KDY+yV4pQ+K6+WVW8Zis04FMxlHuVXw62qEP0Y/kKsrZ2c9y/
 5T2L8Rttlh7ggNJP0wGD8tRenkVZqi15VgvT6XqiMk8QX+jsUgJX2xO+jAMbmeQTLY4x
 2/4w==
X-Gm-Message-State: AOAM533wcAR4rCaUV/UJbOd5fcksXQmAcTPyZlP85ULBQmMPvybMxFda
 ZgURiRmCAoJZ/vteB+/rPInXWJyVN18CcBLC5dclDf1HNezAhuiGm1uO+LWGiAwv1p+8PHUCFTz
 kL8rjblR5mujUYYdhzvXtGGvPdw/rM3OpIQ==
X-Received: by 2002:a9d:62d4:: with SMTP id z20mr16205606otk.305.1628009548259; 
 Tue, 03 Aug 2021 09:52:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvKOEKD8L0w37wO357XcF+/U3bT3CXb+wzZAe9sXlApc1eVkv2cU2JtkoR7Kvj984JI4QXhg==
X-Received: by 2002:a9d:62d4:: with SMTP id z20mr16205581otk.305.1628009548040; 
 Tue, 03 Aug 2021 09:52:28 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id bd20sm2365330oib.1.2021.08.03.09.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 09:52:27 -0700 (PDT)
Date: Tue, 3 Aug 2021 10:52:25 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Daniel Vetter
 <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>, Eric
 Farman <farman@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, Jani
 Nikula <jani.nikula@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vineeth Vijayan
 <vneethv@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>, "Raj, Ashok"
 <ashok.raj@intel.com>, Christoph Hellwig <hch@lst.de>, Leon Romanovsky
 <leonro@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai Hadas
 <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH v3 09/14] vfio/pci: Change vfio_pci_try_bus_reset() to
 use the dev_set
Message-ID: <20210803105225.2ee7dac2.alex.williamson@redhat.com>
In-Reply-To: <20210803164152.GC1721383@nvidia.com>
References: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
 <9-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
 <20210803103406.5e1be269.alex.williamson@redhat.com>
 <20210803164152.GC1721383@nvidia.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 3 Aug 2021 13:41:52 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:
> On Tue, Aug 03, 2021 at 10:34:06AM -0600, Alex Williamson wrote:
> > I think the vfio_pci_find_reset_target() function needs to be re-worked
> > to just tell us true/false that it's ok to reset the provided device,
> > not to anoint an arbitrary target device.  Thanks,  
> 
> Yes, though this logic is confusing, why do we need to check if any
> device needs a reset at this point? If we are being asked to reset
> vdev shouldn't vdev needs_reset?
> 
> Or is the function more of a 'synchronize pending reset' kind of
> thing?

Yes, the latter.  For instance think about a multi-function PCI device
such as a GPU.  The functions have dramatically different capabilities,
some might have function level reset abilities and others not.  We want
to be able to trigger a bus reset as the last device of the set is
released, no matter the order they're released and no matter the
capabilities of the device we're currently processing.  Thanks,

Alex

