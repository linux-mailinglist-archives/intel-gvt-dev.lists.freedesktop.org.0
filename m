Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5976A580643
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 25 Jul 2022 23:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40318F59A;
	Mon, 25 Jul 2022 21:18:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAAFE8F58E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 25 Jul 2022 21:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658783882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2NWyiHW5I2/geA1CEWbRzyNY6UqPET26DY1+YZLfRCI=;
 b=Z2rhhlgSwfwBG30boBU0JYzq/Eg/Deh8L3MyJBcn2x1v3Nl9J06L1p5dYuq0sJRujImVYR
 g34Oc6aBGSdEgTDkMyLPjbQgdrJHZl+zk6yZ6nxvzRWHG+KkAmnymgZUjY+ByuAoIYyht4
 ogIsp6h/eH0sr2FHKOvHSCNFykFZkr8=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-Ws_6EqKQOrqRyveGOLsqPA-1; Mon, 25 Jul 2022 17:17:59 -0400
X-MC-Unique: Ws_6EqKQOrqRyveGOLsqPA-1
Received: by mail-io1-f71.google.com with SMTP id
 u10-20020a6be30a000000b0067bcbb8a637so4762383ioc.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 25 Jul 2022 14:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=2NWyiHW5I2/geA1CEWbRzyNY6UqPET26DY1+YZLfRCI=;
 b=EPSfGPAWgV+6g4VaGzFb/Er+IAQo+JscyJtWWEYRhnQjOrTZzqUWB7X5gpvebrav2W
 abVarOyWmHcUvcPJ/HWV1IS1f+WGl5A3zR3lXEPzLyl65JUKlouTN+49B4iI1SsaH65I
 T4rsz6y5eyEa/J7i7Iwrb7/kuCKejAj1yaMM5nbzxTlPQHvE+z6fG8vNKIlobTukltoU
 myy0K4BVDILbkVI+/d3gqdx0nvg0t1X2vURPswvbc8rQoVTIpxgl4jTQaDIojuaprYLs
 LzexTm3b/0WjKrezrzq95mZubCTVs+7H4aUW3IiwWs+dO6bGIYQdUJ9Ohky6gF6Nu3y2
 N72w==
X-Gm-Message-State: AJIora+Ij3SoKZ1HDPg+4VAZMOVbvzW6U2lblK+48teJFWSPgyPlNyci
 uNeQGVBvXgHoPKiRFhIssWGY0GP+o+LNP5ZfhLfVnz2QXrvRb6YodSl45TjsYBfQoRZCx9bF0Uc
 wry3M60aCA8kE50kgsxPkVRr+xn++Sx0S5A==
X-Received: by 2002:a05:6e02:148c:b0:2dc:38ae:5c6a with SMTP id
 n12-20020a056e02148c00b002dc38ae5c6amr5550202ilk.115.1658783878655; 
 Mon, 25 Jul 2022 14:17:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uXwuWmhW15O2ymdEn2whv1cs+NjXgAHFLetXDjRt4kzq/rgyjNkTHVfDxBgkGk5gC+VO8tdQ==
X-Received: by 2002:a05:6e02:148c:b0:2dc:38ae:5c6a with SMTP id
 n12-20020a056e02148c00b002dc38ae5c6amr5550196ilk.115.1658783878367; 
 Mon, 25 Jul 2022 14:17:58 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 h76-20020a6bb74f000000b0067baeb55e65sm6614546iof.38.2022.07.25.14.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 14:17:58 -0700 (PDT)
Date: Mon, 25 Jul 2022 15:17:55 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH v4 00/10] cover-letter: Update vfio_pin/unpin_pages API
Message-ID: <20220725151755.12d53f2e.alex.williamson@redhat.com>
In-Reply-To: <20220723020256.30081-1-nicolinc@nvidia.com>
References: <20220723020256.30081-1-nicolinc@nvidia.com>
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
Cc: mjrosato@linux.ibm.com, linux-doc@vger.kernel.org, airlied@linux.ie,
 joonas.lahtinen@linux.intel.com, kevin.tian@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kwankhede@nvidia.com, terrence.xu@intel.com, vneethv@linux.ibm.com,
 agordeev@linux.ibm.com, hch@infradead.org, kvm@vger.kernel.org, corbet@lwn.net,
 pasic@linux.ibm.com, jgg@nvidia.com, borntraeger@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, jjherne@linux.ibm.com,
 farman@linux.ibm.com, jchrist@linux.ibm.com, gor@linux.ibm.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com, jani.nikula@linux.intel.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 tvrtko.ursulin@linux.intel.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 svens@linux.ibm.com, daniel@ffwll.ch
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 22 Jul 2022 19:02:46 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> This is a preparatory series for IOMMUFD v2 patches. It prepares for
> replacing vfio_iommu_type1 implementations of vfio_pin/unpin_pages()
> with IOMMUFD version.
> 
> There's a gap between these two versions: the vfio_iommu_type1 version
> inputs a non-contiguous PFN list and outputs another PFN list for the
> pinned physical page list, while the IOMMUFD version only supports a
> contiguous address input by accepting the starting IO virtual address
> of a set of pages to pin and by outputting to a physical page list.
> 
> The nature of existing callers mostly aligns with the IOMMUFD version,
> except s390's vfio_ccw_cp code where some additional change is needed
> along with this series. Overall, updating to "iova" and "phys_page"
> does improve the caller side to some extent.
> 
> Also fix a misuse of physical address and virtual address in the s390's
> crypto code. And update the input naming at the adjacent vfio_dma_rw().
> 
> This is on github:
> https://github.com/nicolinc/iommufd/commits/vfio_pin_pages-v4
> 
> Terrence has tested this series on i915; Eric has tested on s390.
> 
> Thanks!
> 
> Changelog
> v4:
>  * Dropped double-shifting at two gvt_unpin_guest_page calls, fixing
>    a bug that's discovered by Alex
>  * Added Reviewed-by from Anthony Krowiak
>  * Rebased on top of linux-vfio's next
> v3: https://lore.kernel.org/kvm/20220708224427.1245-1-nicolinc@nvidia.com/
>  * Added a patch to replace roundup with DIV_ROUND_UP in i915 gvt
>  * Dropped the "driver->ops->unpin_pages" and NULL checks in PATCH-1
>  * Changed to use WARN_ON and separate into lines in PATCH-1
>  * Replaced "guest" words with "user" and fix typo in PATCH-5
>  * Updated commit log of PATCH-1, PATCH-6, and PATCH-10
>  * Added Reviewed/Acked-by from Christoph, Jason, Kirti, Kevin and Eric
>  * Added Tested-by from Terrence (i915) and Eric (s390)
> v2: https://lore.kernel.org/kvm/20220706062759.24946-1-nicolinc@nvidia.com/
>  * Added a patch to make vfio_unpin_pages return void
>  * Added two patches to remove PFN list from two s390 callers
>  * Renamed "phys_page" parameter to "pages" for vfio_pin_pages
>  * Updated commit log of kmap_local_page() patch
>  * Added Harald's "Reviewed-by" to pa_ind patch
>  * Rebased on top of Alex's extern removal path
> v1: https://lore.kernel.org/kvm/20220616235212.15185-1-nicolinc@nvidia.com/
> 
> Nicolin Chen (10):
>   vfio: Make vfio_unpin_pages() return void
>   drm/i915/gvt: Replace roundup with DIV_ROUND_UP
>   vfio/ap: Pass in physical address of ind to ap_aqic()
>   vfio/ccw: Only pass in contiguous pages
>   vfio: Pass in starting IOVA to vfio_pin/unpin_pages API
>   vfio/ap: Change saved_pfn to saved_iova
>   vfio/ccw: Change pa_pfn list to pa_iova list
>   vfio: Rename user_iova of vfio_dma_rw()
>   vfio/ccw: Add kmap_local_page() for memcpy
>   vfio: Replace phys_pfn with pages for vfio_pin_pages()
> 
>  .../driver-api/vfio-mediated-device.rst       |   6 +-
>  arch/s390/include/asm/ap.h                    |   6 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c              |  45 ++--
>  drivers/s390/cio/vfio_ccw_cp.c                | 195 +++++++++++-------
>  drivers/s390/crypto/ap_queue.c                |   2 +-
>  drivers/s390/crypto/vfio_ap_ops.c             |  54 +++--
>  drivers/s390/crypto/vfio_ap_private.h         |   4 +-
>  drivers/vfio/vfio.c                           |  54 ++---
>  drivers/vfio/vfio.h                           |   8 +-
>  drivers/vfio/vfio_iommu_type1.c               |  45 ++--
>  include/linux/vfio.h                          |   9 +-
>  11 files changed, 213 insertions(+), 215 deletions(-)
> 

Applied to vfio next branch for v5.20.  Thanks,

Alex

