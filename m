Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3482454F34F
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Jun 2022 10:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D630011AAD2;
	Fri, 17 Jun 2022 08:44:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C95111AAD2;
 Fri, 17 Jun 2022 08:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cRcPliFH8a5nYGYbcpuAxJdVHyV2ltCZ23v97rgf1A4=; b=KiuwHF6aDNvC5t/LWv3aUEPzwE
 KBgvUpfkf5qDI6GElmlPwqGlCsWtGNTsSld0WuZewPo0/4mkHtzAiWM6dEK1eY4RySKpAlhO65R1D
 WAwqSuEBlSHCf5DkNowUItxtdZkM4ZA/lqbf20XRt3tR3vQic1RG+gSiipHa082lrFeJntOO3nL6y
 th0tSkAnySXos78OuuOupQOTbIqiHOC5RM5RDCtt86BUATvPwCygEQGPiY1c2rMXDglxq26ZxUHjd
 msVefU68/GFcLY3Vs1Mt7LyDHUYqx6nUIuYz/IWEJAxO+kEDCvTyVrRF9ed8BsbP8AEHXp6NHAjQ4
 s9lEnYkg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o27ag-006QLd-PI; Fri, 17 Jun 2022 08:44:30 +0000
Date: Fri, 17 Jun 2022 01:44:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFT][PATCH v1 5/6] vfio/ccw: Add kmap_local_page() for memcpy
Message-ID: <Yqw+7gM3Lz96UFdz@infradead.org>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
 <20220616235212.15185-6-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616235212.15185-6-nicolinc@nvidia.com>
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

On Thu, Jun 16, 2022 at 04:52:11PM -0700, Nicolin Chen wrote:
> The pinned PFN list returned from vfio_pin_pages() is simply converted
> using page_to_pfn() without protection, so direct access via memcpy()
> will crash on S390 if the PFN is an IO PFN. Instead, the pages should
> be touched using kmap_local_page().

I don't see how this helps.  kmap_local_page only works for either
pages in the kernel direct map or highmem, but not for memory that needs
to be ioremapped.  And there is no highmem on s390.
