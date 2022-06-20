Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE9D55105A
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 20 Jun 2022 08:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270A110E60D;
	Mon, 20 Jun 2022 06:32:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A35010E5A9;
 Mon, 20 Jun 2022 06:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oft8FlbmjHBjJqlnhBPI4YswqmZIF+Cnzz/NNEVVT+E=; b=1XYMUd/2v7vTlQnwMxOtngE7gl
 uwvrBST6y4aRz4Rgyvs1Y/GfkVLkbhk9d65Dd91y++7i+PqcFe6tCmlR+p33CmdHLdA35CWJYcePw
 582xxxz0W6kCtRcoz/CEhxGuRbDDcLtU6Xk48x6+/+sT1PImmNtk7swPaJ7QXb98J/ksnWRhgjRlN
 JYADWPL56pc3Z65TUqHDycWlrfcK4kbex92PdAEcrOUaRvRPjKi6OC3quFJwvaTFkQYZYwAljpqer
 nFr7/BVhfFvNN0DndogwkjF/DFNbwsRgdmzo1VzYU85R2BQGpzVo1k8icWLT0CF2BbVKoScyfRHZo
 1mM1DdVg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o3AxD-00GRZI-Uf; Mon, 20 Jun 2022 06:32:07 +0000
Date: Sun, 19 Jun 2022 23:32:07 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFT][PATCH v1 5/6] vfio/ccw: Add kmap_local_page() for memcpy
Message-ID: <YrAUZ7hXy2FcZcjl@infradead.org>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
 <20220616235212.15185-6-nicolinc@nvidia.com>
 <Yqw+7gM3Lz96UFdz@infradead.org> <20220620025726.GA5219@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620025726.GA5219@nvidia.com>
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

On Sun, Jun 19, 2022 at 11:57:26PM -0300, Jason Gunthorpe wrote:
> The remark about io memory is because on s390 memcpy() will crash even
> on ioremapped memory, you have to use the memcpy_to/fromio() which
> uses the special s390 io access instructions.

Yes.  The same is true for various other architectures, inluding arm64
under the right circumstances.

> This helps because we now block io memory from ever getting into these
> call paths. I'm pretty sure this is a serious security bug, but would
> let the IBM folks remark as I don't know it all that well..

Prevent as in crash when trying to convert it to a page?

> As for the kmap, I thought it was standard practice even if it is a
> non-highmem? Aren't people trying to use this for other security
> stuff these days?

Ira has been lookin into the protection keys, although they don't
apply to s390.  Either way I don't object to using kmap, but the
commit log doesn't make much sense to me.
