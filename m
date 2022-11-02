Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924A761663D
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  2 Nov 2022 16:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF4B10E49F;
	Wed,  2 Nov 2022 15:33:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB17510E4A9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  2 Nov 2022 15:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667403227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OypQqLWai0VaMJwiQgOKKG3cobC5fKhMwKsuUswxphk=;
 b=U5sd106iKYbX6exfi7qSKweE4yH8smdLtVqFnFGytW3/RmqCnF4IFm4nUP7lW4eNwtNVdG
 fjYtH0wUzl4NzKg7wGQ8BStsp3MB+XahZhonfTS0Q4leJ2bWCbZRuJ1IVaLbyHWtwOOOCK
 RFXD1Yg0cNzGU+1YFWj6gZMf1L5e7oI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-ywcGUWlbNua3SadPps_K9w-1; Wed, 02 Nov 2022 11:33:42 -0400
X-MC-Unique: ywcGUWlbNua3SadPps_K9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C0D91C0A589;
 Wed,  2 Nov 2022 15:33:36 +0000 (UTC)
Received: from localhost (unknown [10.39.194.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 917E71121339;
 Wed,  2 Nov 2022 15:33:35 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Yi
 Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v2 7/7] vfio: Remove vfio_free_device
In-Reply-To: <20221102150152.2521475-8-farman@linux.ibm.com>
Organization: Red Hat GmbH
References: <20221102150152.2521475-1-farman@linux.ibm.com>
 <20221102150152.2521475-8-farman@linux.ibm.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 02 Nov 2022 16:33:34 +0100
Message-ID: <87pme5s75d.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>,
 linux-s390@vger.kernel.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Nov 02 2022, Eric Farman <farman@linux.ibm.com> wrote:

> With the "mess" sorted out, we should be able to inline the
> vfio_free_device call introduced by commit cb9ff3f3b84c
> ("vfio: Add helpers for unifying vfio_device life cycle")
> and remove them from driver release callbacks.
>
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c      |  1 -
>  drivers/s390/cio/vfio_ccw_ops.c       |  2 --
>  drivers/s390/crypto/vfio_ap_ops.c     |  6 ------
>  drivers/vfio/fsl-mc/vfio_fsl_mc.c     |  1 -
>  drivers/vfio/pci/vfio_pci_core.c      |  1 -
>  drivers/vfio/platform/vfio_amba.c     |  1 -
>  drivers/vfio/platform/vfio_platform.c |  1 -
>  drivers/vfio/vfio_main.c              | 22 ++++------------------
>  include/linux/vfio.h                  |  1 -
>  samples/vfio-mdev/mbochs.c            |  1 -
>  samples/vfio-mdev/mdpy.c              |  1 -
>  samples/vfio-mdev/mtty.c              |  1 -
>  12 files changed, 4 insertions(+), 35 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

