Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B187954F33C
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Jun 2022 10:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A21A11AACB;
	Fri, 17 Jun 2022 08:42:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E26A11AACA;
 Fri, 17 Jun 2022 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0+txUdQ43jf+UIe9zCVUaGGeb7a9BrmjbJwClV7VdAQ=; b=PiIGLlDRnD4KR6sJKZqqRuNH4y
 A1WYA1tieOBnORXjxYl7vYwDNHafaUH7kYlCGCM7t1x+LNel94rwNqbGLhL4BlEC1MZI6OoXIujQ+
 vShzmh+5ZQkZyPwkWL4IeGPcVy3qPp0FVWp+1X3n5/wOKktGNoZ+yXqlvb1GolNq7m204U7ValNhe
 PkayypEKB6d3IiePr18juhMYL99/5gj5wb8bEduIdLVbW/pWQRg5bqTa0WI1L1c72qUazXmBQ3noN
 dvIC73wU5vA/zg4eIo53LFb51U5nQ1OmOZtia6HZ6P0IvRSnO212m0w+el6cH6nOpWbqjM0UR53we
 YsE01FbA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o27Yw-006PUX-Gk; Fri, 17 Jun 2022 08:42:42 +0000
Date: Fri, 17 Jun 2022 01:42:42 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFT][PATCH v1 3/6] vfio: Pass in starting IOVA to
 vfio_pin/unpin_pages API
Message-ID: <Yqw+goqTJwb0lrxy@infradead.org>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
 <20220616235212.15185-4-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616235212.15185-4-nicolinc@nvidia.com>
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
 linux-s390@vger.kernel.org, kvm@vger.kernel.org, corbet@lwn.net,
 pasic@linux.ibm.com, jgg@nvidia.com, borntraeger@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, jjherne@linux.ibm.com,
 farman@linux.ibm.com, jchrist@linux.ibm.com, gor@linux.ibm.com,
 hca@linux.ibm.com, jani.nikula@linux.intel.com, alex.williamson@redhat.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 tvrtko.ursulin@linux.intel.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 svens@linux.ibm.com, daniel@ffwll.ch
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Jun 16, 2022 at 04:52:09PM -0700, Nicolin Chen wrote:
> +	ret = vfio_unpin_pages(&vgpu->vfio_device, gfn << PAGE_SHIFT, npage);
> +	drm_WARN_ON(&i915->drm, ret != npage);

The shifting of gfn seems to happen bother here and in the callers.

Also this is the only caller that does anything withthe vfio_unpin_pages
return value.  Given that you touch the API here we might as well
not return any value, and turn the debug checks that can return errors
into WARN_ON_ONCE calls the vfio/iommu_type1 code.

> +extern int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
>  			  int npage, int prot, unsigned long *phys_pfn);
> -extern int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> +extern int vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova,
>  			    int npage);

This will clash with the extern removal patch that Alex has sent.
