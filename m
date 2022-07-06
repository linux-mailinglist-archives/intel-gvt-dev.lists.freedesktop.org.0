Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF243567F07
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  6 Jul 2022 08:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D21C10FFFD;
	Wed,  6 Jul 2022 06:56:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049B410FFFD;
 Wed,  6 Jul 2022 06:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/m24PsaB4Cz1aJpY2Cyju0n6At9XHWz5aCK5PGbqU1o=; b=X7/FBvhB9T2/CRNeMUuvEypKFb
 mD4tslMhbVmzWVE7SzYN0fXxNPgmANxnjxT2D6qxg2jDjE0bROkrGdpPBFAyPSO8FHnKUCIG/tgPV
 CMNagu0OUPgBs64PQS7P4nXbZgGlxj5VjAJ6nM6zqV7hQjSC6sKfZLLO0RJ0VL4NobI37zolQJAUN
 cAgI2u0JmXW32Dyx1G0/S+Yv9wxomqBEfcd4FRBh8980GD/IG+cC0BSRiZbJJO4/EubgDPvK8J0WA
 zOJSX/xDYsjpPpiNWA8VsEiOYtCIsjsjimpF4ualAySYR/TX0H9EHbt+3pK55aWBcTupeb+etyics
 m5+ajWhg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o8yxV-006rmp-Lm; Wed, 06 Jul 2022 06:56:25 +0000
Date: Tue, 5 Jul 2022 23:56:25 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFT][PATCH v2 4/9] vfio: Pass in starting IOVA to
 vfio_pin/unpin_pages API
Message-ID: <YsUyGS7kct2BbiS8@infradead.org>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-5-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706062759.24946-5-nicolinc@nvidia.com>
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

> -		vfio_unpin_pages(&q->matrix_mdev->vdev, &q->saved_pfn, 1);
> +		vfio_unpin_pages(&q->matrix_mdev->vdev, q->saved_pfn << PAGE_SHIFT, 1);

Overly long line here.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
