Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AF736B74E
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 26 Apr 2021 18:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E636E855;
	Mon, 26 Apr 2021 16:56:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCE16E84F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 26 Apr 2021 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619456169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wblMniRG+tXdb/s6n04oEssn2lw4/r02yCdxqqbqlzs=;
 b=TRhgnVxJvvd99cpU+6W5DY36ZpMtmH8hLYhJkC6SV1zozzvdWO4mDk3GoQ+0QNLzGn3F2z
 7vc++tUzEN92NpFCAXuCMTIQTNoy2vrqvBdUKiE6GvR5oXgt5v+OM823/p4XEv72hq0sAr
 tEAqLRhXAq4xYY/hb4vYL7pWNVcbJJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-s49uKpPGNyKpsWJAWsiPLw-1; Mon, 26 Apr 2021 12:56:04 -0400
X-MC-Unique: s49uKpPGNyKpsWJAWsiPLw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BE5118BE167;
 Mon, 26 Apr 2021 16:55:57 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 694853697;
 Mon, 26 Apr 2021 16:55:56 +0000 (UTC)
Date: Mon, 26 Apr 2021 10:55:55 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 2/2] Revert "vfio/gvt: Make DRM_I915_GVT depend on
 VFIO_MDEV"
Message-ID: <20210426105555.3cad2599@redhat.com>
In-Reply-To: <20210426094143.4031527-2-zhenyuw@linux.intel.com>
References: <20210426094143.4031527-1-zhenyuw@linux.intel.com>
 <20210426094143.4031527-2-zhenyuw@linux.intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Arnd Bergmann <arnd@kernel.org>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, 26 Apr 2021 17:41:43 +0800
Zhenyu Wang <zhenyuw@linux.intel.com> wrote:

> This reverts commit 07e543f4f9d116d6b4240644191dee6388ef4a85.

07e543f4f9d1 ("vfio/gvt: Make DRM_I915_GVT depend on VFIO_MDEV")

> With all mdev handing moved to kvmgt module, only kvmgt should depend
> on VFIO_MDEV. So revert this one.
> 
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 8f15bfb5faac..93f4d059fc89 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -102,7 +102,6 @@ config DRM_I915_GVT
>  	bool "Enable Intel GVT-g graphics virtualization host support"
>  	depends on DRM_I915
>  	depends on 64BIT
> -	depends on VFIO_MDEV
>  	default n
>  	help
>  	  Choose this option if you want to enable Intel GVT-g graphics

I take it that this retracts your ack from
https://lore.kernel.org/dri-devel/20210425032356.GH1551@zhen-hp.sh.intel.com/
I'll drop it from consideration for pushing through my tree unless
indicated otherwise.  Thanks,

Alex

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
