Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8206D550FCD
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 20 Jun 2022 07:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DF911300E;
	Mon, 20 Jun 2022 05:52:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C70112FF4;
 Mon, 20 Jun 2022 05:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VPvTLYT4uzXPfly43nDQkm0acKhpjiwhyQSa4N3bkPQ=; b=s32C9QgmMV+/otPhxM8zXJJw+v
 Em8xVLshpM2FqxP+P5EHTZDNiUYGS6Jex39ihiv9qZvjzQ5xNJO5z6nbHiqvP1hPZpc/LeUBhYshv
 P4Q3TkuK406IQAVZ8s6qfODMXDtzkna4LJq/Scexutww/2+kySLFHZJz3vjrIv41Mr+0SAYAsYJiq
 wcWkrjQM9GjHnYgAQ22xDvw6IWyVa/MIEDXEm8x89NAIQzhJCQ0xwbOamqarOnfk9rH0Ob8QaCZQ6
 dOp+FXjqG8saetQMpK5RSll0DDODyXG84oR9ClL4GHF7TGTgj3pmkihVuvOD5CHgGe9CqYMgP+TOM
 ymh1DruA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o3AKB-00GLAc-2w; Mon, 20 Jun 2022 05:51:47 +0000
Date: Sun, 19 Jun 2022 22:51:47 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFT][PATCH v1 6/6] vfio: Replace phys_pfn with phys_page for
 vfio_pin_pages()
Message-ID: <YrAK87zjdOqUF6gB@infradead.org>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
 <20220616235212.15185-7-nicolinc@nvidia.com>
 <YqxBLbu8yPJiwK6Z@infradead.org> <20220620030046.GB5219@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620030046.GB5219@nvidia.com>
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
 pasic@linux.ibm.com, kvm@vger.kernel.org, corbet@lwn.net,
 Christoph Hellwig <hch@infradead.org>, Nicolin Chen <nicolinc@nvidia.com>,
 borntraeger@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 zhi.a.wang@intel.com, jjherne@linux.ibm.com, farman@linux.ibm.com,
 jchrist@linux.ibm.com, gor@linux.ibm.com, linux-s390@vger.kernel.org,
 hca@linux.ibm.com, jani.nikula@linux.intel.com, alex.williamson@redhat.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 tvrtko.ursulin@linux.intel.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 svens@linux.ibm.com, daniel@ffwll.ch
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Jun 20, 2022 at 12:00:46AM -0300, Jason Gunthorpe wrote:
> On Fri, Jun 17, 2022 at 01:54:05AM -0700, Christoph Hellwig wrote:
> > There is a bunch of code an comments in the iommu type1 code that
> > suggest we can pin memory that is not page backed.  
> 
> AFAIK you can.. The whole follow_pte() mechanism allows raw PFNs to be
> loaded into the type1 maps and the pin API will happily return
> them. This happens in almost every qemu scenario because PCI MMIO BAR
> memory ends up routed down this path.

Indeed, my read wasn't deep enough.  Which means that we can't change
the ->pin_pages interface to return a struct pages array, as we don't
have one for those.
