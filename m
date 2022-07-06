Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C9D567EFF
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  6 Jul 2022 08:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B4410F26A;
	Wed,  6 Jul 2022 06:55:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C3B10F26A;
 Wed,  6 Jul 2022 06:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ik/uJsE+zpdPuUdS11m0Q/X6NmB5A5tIeaLT1FExMqk=; b=HHs4PsCAW1BgdmGMF7lVwPZBlR
 WXelzySoHmOcfeyjYIDcxKxiSPrY3LgVkMWP06N+b1YMeIjqTQqibdKCLa3W3s6TISEEwPbYtz9hf
 BuIfwbhWwKLUHmKXNlqKTzZIYUbxhMSDKDYDdgAErXVCEYOpTmfAM4yMn9tEpniYFBvxBn76mxl2y
 bsyyRpfl1bgczxu9jW5/iSXW5sl1VvDaH7+wHUdC+IDz12TBfxUbxNt4TIWkoXcBraRCmAoI9xGPy
 vLhJBjwY9NsA2OjzsrT2pWrhwOn/GsnSIQUmBOpgVrLFDDuEAHUBsL2PiXUaquNnBt0KfA6OTgFvJ
 BQurlmbA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o8yvy-006rFh-Ez; Wed, 06 Jul 2022 06:54:50 +0000
Date: Tue, 5 Jul 2022 23:54:50 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFT][PATCH v2 1/9] vfio: Make vfio_unpin_pages() return void
Message-ID: <YsUxurAoglm7GmZP@infradead.org>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-2-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706062759.24946-2-nicolinc@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
 kwankhede@nvidia.com, vneethv@linux.ibm.com, agordeev@linux.ibm.com,
 hch@infradead.org, kvm@vger.kernel.org, corbet@lwn.net, pasic@linux.ibm.com,
 jgg@nvidia.com, borntraeger@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 zhi.a.wang@intel.com, jjherne@linux.ibm.com, farman@linux.ibm.com,
 jchrist@linux.ibm.com, gor@linux.ibm.com, linux-s390@vger.kernel.org,
 hca@linux.ibm.com, jani.nikula@linux.intel.com, alex.williamson@redhat.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 tvrtko.ursulin@linux.intel.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 svens@linux.ibm.com, daniel@ffwll.ch
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> +void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> +		      int npage)
>  {
>  	struct vfio_container *container;
>  	struct vfio_iommu_driver *driver;
> -	int ret;
>  
> -	if (!user_pfn || !npage || !vfio_assert_device_open(device))
> -		return -EINVAL;
> +	if (WARN_ON_ONCE(!user_pfn || !npage || !vfio_assert_device_open(device)))

This adds an overly long line.  Note that I think in general it is
better to have an individual WARN_ON per condition anyway, as that
allows to directly pinpoint what went wrong when it triggers.

> +	if (WARN_ON_ONCE(unlikely(!driver || !driver->ops->unpin_pages)))
> +		return;

I'd just skip this check an let it crash.  If someone calls unpin
on something totally random that wasn't even pinned we don't need to
handle that gracefully.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
