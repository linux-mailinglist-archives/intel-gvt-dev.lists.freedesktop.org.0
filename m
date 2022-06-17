Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5E554F3A9
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Jun 2022 10:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F422411AB72;
	Fri, 17 Jun 2022 08:54:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3000F11AACB;
 Fri, 17 Jun 2022 08:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8nZ1ta+BsGc00ew4rYHJjg70RdBuVGkJ01/aKd/F76M=; b=22UofexgYSmp52aMwe+HIOOhvH
 HYrP5hQF/Y99IdWt/OJ7frq9bDlj6D/Gp2E2LfXGLyDec9bdW3ElpSca05pMX63lDBDkaRyZilvm3
 s0jUbrt1CiiZKRQ7vdxJZ9yVK90jEAwy2ITMbKKpviGKsecKQDJYrt7hAOD3RKzBVjb7fHmOaLxxP
 cWKZd5500xnwfiechgxDSX2HIctMCobu1VuwMbdK3f6uiymnj2Jg8g0IZBPG77/wBQcXmkLcVlGR6
 ssra39uhQZxgkJ+zs68oXh47Qe6h+fzmWqqiKHEwunXSUDLK/l3ieRfYn9Q5bYSjpMZjludDm3YY1
 UaH6OBmw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o27jx-006UvK-VQ; Fri, 17 Jun 2022 08:54:05 +0000
Date: Fri, 17 Jun 2022 01:54:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFT][PATCH v1 6/6] vfio: Replace phys_pfn with phys_page for
 vfio_pin_pages()
Message-ID: <YqxBLbu8yPJiwK6Z@infradead.org>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
 <20220616235212.15185-7-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616235212.15185-7-nicolinc@nvidia.com>
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

There is a bunch of code an comments in the iommu type1 code that
suggest we can pin memory that is not page backed.  

>  int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
> +		   int npage, int prot, struct page **phys_page)

I don't think phys_page makes much sense as an argument name.
I'd just call this pages.

> +			phys_page[i] = pfn_to_page(vpfn->pfn);

Please store the actual page pointer in the vfio_pfn structure.

>  		remote_vaddr = dma->vaddr + (iova - dma->iova);
> -		ret = vfio_pin_page_external(dma, remote_vaddr, &phys_pfn[i],
> +		ret = vfio_pin_page_external(dma, remote_vaddr, &phys_pfn,
>  					     do_accounting);

Please just return the actual page from vaddr_get_pfns through
vfio_pin_pages_remote and vfio_pin_page_external, maybe even as a prep
patch as that is a fair amount of churn.
