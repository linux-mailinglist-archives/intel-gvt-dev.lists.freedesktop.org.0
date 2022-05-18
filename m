Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD8052B3AD
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 May 2022 09:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEE5113E17;
	Wed, 18 May 2022 07:39:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1343F1124FA;
 Wed, 18 May 2022 07:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=P5UqBAHM0WQnE0g9GWkUw6qeNdkfJBe6hJymXR6R360=; b=zP2u3zx4Nqx82fjyBoNHLz6AOY
 fHpXQJ24sWyjJtbHiAfCUHkKqWlu+/N5+S0QbL3dxp8min4ZnwWiMdlFcvfoW1l3rHL6lvSU8JyPu
 tI3TV57NNnj4Bq/keqxZOTeeF9+9ZA4sWjS7BtUPWhT9DC+xFJLcsYPpuaji0p2/Oxwir7jvsuX/U
 y9dpkmCJOjq2ER5XK5/faIeJxiQU9bZ+mnUsplo/ChCMm+unL1KWLS94bBjJDlzxjHqeD1l6dxzdJ
 VudQgLy9jb8GOsrg3Fazw16gK5iNYGZFgwlNxo8CYGkPD+FAuZ8uZSZp9jKMhuX8XVLWsUSQokF10
 K34xQl0g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nrEHV-00084D-Sx; Wed, 18 May 2022 07:39:41 +0000
Date: Wed, 18 May 2022 00:39:41 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 1/1] vfio: remove VFIO_GROUP_NOTIFY_SET_KVM
Message-ID: <YoSivTU7nivO9FMD@infradead.org>
References: <20220517180851.166538-1-mjrosato@linux.ibm.com>
 <20220517180851.166538-2-mjrosato@linux.ibm.com>
 <20220517185643.GY1343366@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517185643.GY1343366@nvidia.com>
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
Cc: jjherne@linux.ibm.com, akrowiak@linux.ibm.com, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, hch@infradead.org,
 linux-s390@vger.kernel.org, intel-gfx@lists.freedesktop.org, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com, pasic@linux.ibm.com,
 alex.williamson@redhat.com, borntraeger@linux.ibm.com,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

>  	if (device->ops->flags & VFIO_DEVICE_NEEDS_KVM)
>  	{

Nit: this is not the normal brace placement.

But what is you diff against anyway?  The one Matthew sent did away
with the VFIO_DEVICE_NEEDS_KVM flags, which does the wrong thing for
zpci, so it can't be that..

Also if we want to do major code movement, it really needs to go into
a separate patch or patches, as the combinations of all these moves
with actual code changes is almost unreadable.
