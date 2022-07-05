Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 099D156693E
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  5 Jul 2022 13:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619FB10F05F;
	Tue,  5 Jul 2022 11:29:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BFA10E021
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  5 Jul 2022 08:02:39 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B786868AA6; Tue,  5 Jul 2022 10:02:34 +0200 (CEST)
Date: Tue, 5 Jul 2022 10:02:34 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 02/14] drm/i915/gvt: simplify vgpu configuration management
Message-ID: <20220705080234.GA17663@lst.de>
References: <20220704125144.157288-1-hch@lst.de>
 <20220704125144.157288-3-hch@lst.de> <20220704141536.GB1423020@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704141536.GB1423020@nvidia.com>
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Jul 04, 2022 at 11:15:36AM -0300, Jason Gunthorpe wrote:
> > +		if (conf->weight < 1 || conf->weight > VGPU_MAX_WEIGHT)
> >  			goto out_free_types;
> 
> This is now clearly impossible right? Maybe a BUILD_BUG_ON is all that
> is needed:

It is not possible right now, but an incorrect addition to the array
can easily add the condition.  A BUILD_BUG_ON would be nice, but my
gcc doesn't see the expressons as const enough for that to actually work.

> 
>   #define VGPU_WEIGHT(vgpu_num)	\
>          (VGPU_MAX_WEIGHT + BUILD_BUG_ON_ZERO((vgpu_num) > VGPU_MAX_WEIGHT) / (vgpu_num))
> 
> > +		sprintf(gvt->types[i].name, "GVTg_V%u_%s",
> > +			GRAPHICS_VER(gvt->gt->i915) == 8 ? 4 : 5, conf->name);
> > +		gvt->types->conf = conf;
> > +		gvt->types[i].avail_instance = min(low_avail / conf->low_mm,
> > +						   high_avail / conf->high_mm);
> 
> snprintf and check for failure?

I'd rather just leave it as-is. intead of messing with these unrelated
bit.
