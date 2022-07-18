Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF42F578CC6
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 Jul 2022 23:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9206112137;
	Mon, 18 Jul 2022 21:33:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9100112137
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Jul 2022 21:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658180015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=McBcNHr9RW9GxlAu+UJlcdP1dYuV9WY6CAhxiggXqkA=;
 b=QyxmIgnaYtW7NNZjJpmGg6AGpvA08CBeX0soYaQLMuNL+0DXF/jjtxX+QL7ZMohRFRju10
 wNCOCisL7Kv5DEum/Fy45BUa1Xe04MjAashG/7m3DnxYCQT0YmM0Vb1bW5Kj2ao3owD8oQ
 +sIXYnG43Bxaz2ZDrtX8ats1SLq5tmE=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-UclNr6gwMeK7IXrYhkq9Ww-1; Mon, 18 Jul 2022 17:33:34 -0400
X-MC-Unique: UclNr6gwMeK7IXrYhkq9Ww-1
Received: by mail-io1-f71.google.com with SMTP id
 m9-20020a6b7b49000000b0067c0331524cso2344761iop.21
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Jul 2022 14:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=McBcNHr9RW9GxlAu+UJlcdP1dYuV9WY6CAhxiggXqkA=;
 b=kqDx+znU4xp96wV9JHZ1cq3YkE8jY6ZIBUp3WSj7Z8pOgH2e92+5yU1jqvMgZBwNqT
 6axWSAaJmQE8UrN9xxbbX+nrE9Ne6VMbpXVhd7AU25unlrz+/AuRz8L4z4U2j9yULEn/
 M5vJiE42XAxDjo74lo0+zw8GEr92cunSIm0LUUSz2D0QzLavZj7z4KMNYOHPgRiVPSjZ
 ONRZ5VfmYTZPjANC1CEAumt3Sgt5K697VQW8ZWOmBl04H8+KMQFP8AztJutYlKrZJuDh
 uIgLo5l882Dj61ICP/W/PRFNIStkaPshybJjGgvUxvsimAnkUMlFQrQSj5Mf31Hcmthp
 3r6A==
X-Gm-Message-State: AJIora+2Tq6yVq/piBRnpnhuxjcD1sIx7O2tiXQR1eUFlGCLWSkGSqnz
 bNAuB1KfolXB1D4+k6AAW2OBbZZSBZRmQxI15BX9tt32WgjF1Ug8OcXhnLb6io7UUIIBvXl/gva
 ckJegkSYLw/lJKNdv9XuWskXCVosF4bqpnA==
X-Received: by 2002:a6b:3e83:0:b0:678:e63b:355d with SMTP id
 l125-20020a6b3e83000000b00678e63b355dmr13719286ioa.134.1658180014077; 
 Mon, 18 Jul 2022 14:33:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sDrGa8ze2j/q2lwFrndLWdf63qIpnOAVsNqsBc/gBPGdJhX41ARLJ2Yuy3bl7gy/bKR3KwsA==
X-Received: by 2002:a6b:3e83:0:b0:678:e63b:355d with SMTP id
 l125-20020a6b3e83000000b00678e63b355dmr13719265ioa.134.1658180013803; 
 Mon, 18 Jul 2022 14:33:33 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 d190-20020a6bb4c7000000b0066961821575sm6386751iof.34.2022.07.18.14.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 14:33:33 -0700 (PDT)
Date: Mon, 18 Jul 2022 15:33:31 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: simplify the mdev interface v6
Message-ID: <20220718153331.18a52e31.alex.williamson@redhat.com>
In-Reply-To: <20220718054348.GA22345@lst.de>
References: <20220709045450.609884-1-hch@lst.de>
 <20220718054348.GA22345@lst.de>
Organization: Red Hat
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, 18 Jul 2022 07:43:48 +0200
Christoph Hellwig <hch@lst.de> wrote:

> Alex, does this series look good to you now?

It does.  I was hoping we'd get a more complete set acks from the mdev
driver owners, but I'll grab this within the next day or two with
whatever additional reviews come in by then.  Thanks,

Alex

> On Sat, Jul 09, 2022 at 06:54:36AM +0200, Christoph Hellwig wrote:
> > Hi all,
> > 
> > this series signigicantly simplies the mdev driver interface by following
> > the patterns for device model interaction used elsewhere in the kernel.
> > 
> > Changes since v5:
> >  - rebased to the latest vfio/next branch
> >  - drop the last patch again
> >  - make sure show_available_instances works properly for the internallly
> >    tracked case
> > 
> > Changes since v4:
> >  - move the kobject_put later in mdev_device_release 
> >  - add a Fixes tag for the first patch
> >  - add another patch to remove an extra kobject_get/put
> > 
> > Changes since v3:
> >  - make the sysfs_name and pretty_name fields pointers instead of arrays
> >  - add an i915 cleanup to prepare for the above
> > 
> > Changes since v2:
> >  - rebased to vfio/next
> >  - fix a pre-existing memory leak in i915 instead of making it worse
> >  - never manipulate if ->available_instances if drv->get_available is
> >    provided
> >  - keep a parent reference for the mdev_type
> >  - keep a few of the sysfs.c helper function around
> >  - improve the documentation for the parent device lifetime
> >  - minor spellig / formatting fixes
> > 
> > Changes since v1:
> >  - embedd the mdev_parent into a different sub-structure in i916
> >  - remove headers now inclued by mdev.h from individual source files
> >  - pass an array of mdev_types to mdev_register_parent
> >  - add additional patches to implement all attributes on the
> >    mdev_type in the core code
> > 
> > Diffstat:
> >  Documentation/driver-api/vfio-mediated-device.rst |   26 +-
> >  Documentation/s390/vfio-ap.rst                    |    2 
> >  Documentation/s390/vfio-ccw.rst                   |    2 
> >  drivers/gpu/drm/i915/gvt/aperture_gm.c            |   20 +-
> >  drivers/gpu/drm/i915/gvt/gvt.h                    |   42 ++--
> >  drivers/gpu/drm/i915/gvt/kvmgt.c                  |  168 ++++-------------
> >  drivers/gpu/drm/i915/gvt/vgpu.c                   |  210 +++++++---------------
> >  drivers/s390/cio/cio.h                            |    4 
> >  drivers/s390/cio/vfio_ccw_drv.c                   |   12 -
> >  drivers/s390/cio/vfio_ccw_ops.c                   |   51 -----
> >  drivers/s390/cio/vfio_ccw_private.h               |    2 
> >  drivers/s390/crypto/vfio_ap_ops.c                 |   68 +------
> >  drivers/s390/crypto/vfio_ap_private.h             |    6 
> >  drivers/vfio/mdev/mdev_core.c                     |  190 ++++---------------
> >  drivers/vfio/mdev/mdev_driver.c                   |    7 
> >  drivers/vfio/mdev/mdev_private.h                  |   32 ---
> >  drivers/vfio/mdev/mdev_sysfs.c                    |  189 ++++++++++---------
> >  include/linux/mdev.h                              |   77 ++++----
> >  samples/vfio-mdev/mbochs.c                        |  103 +++-------
> >  samples/vfio-mdev/mdpy.c                          |  115 +++---------
> >  samples/vfio-mdev/mtty.c                          |   94 +++------
> >  21 files changed, 463 insertions(+), 957 deletions(-)  
> ---end quoted text---
> 

