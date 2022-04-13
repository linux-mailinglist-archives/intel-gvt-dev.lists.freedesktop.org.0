Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CCE4FFA98
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 13 Apr 2022 17:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC74E10E501;
	Wed, 13 Apr 2022 15:46:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F98A10E24C;
 Wed, 13 Apr 2022 15:46:45 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3E90868BEB; Wed, 13 Apr 2022 17:46:42 +0200 (CEST)
Date: Wed, 13 Apr 2022 17:46:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v3
Message-ID: <20220413154642.GA28095@lst.de>
References: <20220411141403.86980-1-hch@lst.de>
 <82c13d8e-1cb4-2873-86e9-16fd38e15b27@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82c13d8e-1cb4-2873-86e9-16fd38e15b27@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 01:47:05PM +0000, Wang, Zhi A wrote:
> > the GVT code in the i915 is a bit of a mess right now due to strange
> > abstractions and lots of indirect calls.  This series refactors various
> > bits to clean that up.  The main user visible change is that almost all
> > of the GVT code moves out of the main i915 driver and into the kvmgt
> > module.
> 
> Hi Christoph:
> 
> Do you want me to merge the GVT-g patches in this series? Or you want them to get merged from your side?

The two option here are drm tree via gvt and i915 trees or the vfio
tree, neither of which really is my tree.

We already have a fair bit of vfio changes at the tail end of the series,
and Jason has some more that should sit on top of it, and I have some
more that I haven't sent yet.

So if we could get the MMIO table and Makefile cleanups into a topic
branch that we could pull into the vfio tree and merge it through that
that would seem easiest to me, assuming that is ok with the i915, drm
and vfio maintainers.
