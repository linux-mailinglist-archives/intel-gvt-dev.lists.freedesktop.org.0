Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DB15508D9
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 19 Jun 2022 08:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE5F10FB92;
	Sun, 19 Jun 2022 06:18:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C5310FB92;
 Sun, 19 Jun 2022 06:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=j/JBNwa/VyqAIaEnsFXpkXodHo6vqnGAI1xYD1tiqZo=; b=jLy3lF1kmifcevO6HwuwLb2bFh
 cICoOWdEb52iimiuzsyFdgSGbDfBBC787zRztZfYBUzRkU3DbiisicNQha2BbgsLDASZAqlpbDqX+
 CayphOqce8z+TfP2HkVcrHrm2hHTIy8TWjnWp29vlBJQCVPNbRwYvTisXiVrym+4d8fsSzlTNF8jG
 7w53PIyh2fuPAL/nVK5V2AB0RS2rivSUMvoExuxG5X4NfK3QTjdT3ES8S5RwQ+x+hewyZrG6fZzsL
 FfoWD4w/eycsn6U0AMNoWXmZphF8mWTSvbeuLBmDvLOr81ZFwgR3gAHlhSrhrZyPWZinA3hRHEMd4
 Eklp6K+Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o2oGH-00DL70-A1; Sun, 19 Jun 2022 06:18:17 +0000
Date: Sat, 18 Jun 2022 23:18:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFT][PATCH v1 6/6] vfio: Replace phys_pfn with phys_page for
 vfio_pin_pages()
Message-ID: <Yq6/qS+AE1LfO+/q@infradead.org>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
 <20220616235212.15185-7-nicolinc@nvidia.com>
 <YqxBLbu8yPJiwK6Z@infradead.org> <Yqz64VK1IQ0QzXEe@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yqz64VK1IQ0QzXEe@Asurada-Nvidia>
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
 Christoph Hellwig <hch@infradead.org>, jgg@nvidia.com,
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

On Fri, Jun 17, 2022 at 03:06:25PM -0700, Nicolin Chen wrote:
> On Fri, Jun 17, 2022 at 01:54:05AM -0700, Christoph Hellwig wrote:
> > There is a bunch of code an comments in the iommu type1 code that
> > suggest we can pin memory that is not page backed.  
> 
> Would you mind explaining the use case for pinning memory that
> isn't page backed? And do we have such use case so far?

Sorry, I should have deleted that sentence.  I wrote it before spending
some more time to dig through the code and all the locked memory has
page backing.  There just seem to be a lot of checks left inbetween
if a pfn is page backed, mostly due to the pfn based calling convetions.

> I can do that. I tried once, but there were just too much changes
> inside type1 code that felt like a chain reaction. If we plan to
> eventually replace with IOMMUFD implementations, these changes in
> type1 might not be necessary, I thought.

To make sure we keep full compatibility I suspect the final iommufd
implementation has to be gradutally created from the existing code
anyway.
