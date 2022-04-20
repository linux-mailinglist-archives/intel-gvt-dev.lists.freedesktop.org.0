Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA445081B8
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 20 Apr 2022 09:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D0210F1A5;
	Wed, 20 Apr 2022 07:08:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C38510F195;
 Wed, 20 Apr 2022 07:08:04 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 36FFD68AFE; Wed, 20 Apr 2022 09:08:01 +0200 (CEST)
Date: Wed, 20 Apr 2022 09:08:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v3
Message-ID: <20220420070800.GB4417@lst.de>
References: <20220413154642.GA28095@lst.de> <871qy1geko.fsf@intel.com>
 <5af7726e-920e-603a-bad3-8adb09d2ba89@intel.com>
 <20220413232053.GA2120790@nvidia.com>
 <1c3aaab9-3bd4-95d4-9f9f-4be9e10e6516@intel.com>
 <20220414133427.GB2120790@nvidia.com> <87ilrbeqbo.fsf@intel.com>
 <20220414134321.GD2120790@nvidia.com>
 <abc0a953-8527-ba25-9987-d2f1284a7430@intel.com>
 <20220414143859.GE368031@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220414143859.GE368031@nvidia.com>
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
 Jani Nikula <jani.nikula@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 11:38:59AM -0300, Jason Gunthorpe wrote:
> pull requests can flow through more than one tree concurrently. The
> purpose of the topic branch is to allow all the commits to be in all
> the trees they need to be in at once.
> 
> So you should send this branch as a PR to the next logical upstream
> tree gvt patches normally go through, in the usual way that you send
> PRs. Especially in this case where there is a small merge conflict
> internal to DRM to resolve. I'm assuming this is the drm-intel-next
> tree?
> 
> Once DRM is internally happy then VFIO can merge it as well. You can
> view VFIO as the secondary path to Linus, DRM as primary. Alex will
> mention in his pull request that VFIO has a 'shared branch with DRM
> for gvt'.

Where do we stand here?  The (somewhat misnamed) topic/for-christoph
branch looks fine to me now except for the mіssing "static inline" on
the intel_gvt_iterate_mmio_table stub.

When can we expect it in the i915 tree and linux-next?
