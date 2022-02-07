Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C69674ABE2C
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  7 Feb 2022 13:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0CA10F643;
	Mon,  7 Feb 2022 12:06:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6C010F60C;
 Mon,  7 Feb 2022 12:06:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B19FC68AA6; Mon,  7 Feb 2022 13:06:47 +0100 (CET)
Date: Mon, 7 Feb 2022 13:06:47 +0100
From: Christoph Hellwig <hch@lst.de>
To: Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH 1/3] i915/gvt: Introduce the mmio_table.c to support
 VFIO new mdev API
Message-ID: <20220207120647.GA28851@lst.de>
References: <20220127120508.11330-1-zhi.a.wang@intel.com>
 <20220207073247.GA24327@lst.de>
 <DM4PR11MB5549FE45F8098368114ADE75CA2C9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20220207083535.GA25345@lst.de> <877da7rlzr.fsf@intel.com>
 <5c916187-8a8c-323a-adb4-8bce141180cc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c916187-8a8c-323a-adb4-8bce141180cc@gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, "Xu,
 Terrence" <terrence.xu@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Feb 07, 2022 at 06:57:13AM -0500, Zhi Wang wrote:
> Hi Christoph and Jani:
>
> Thanks for the comments. It would be nice that people can achieve a 
> agreement. I am OK with both of the options and also moving some files into 
> different folders doesn't needs me to do the full test run again. :)

The way I understood Jani he agrees that the mmio table, which needs to
be part of the core i915 module should not be under the gvt/ subdiretory.
I.e. it could be drivers/gpu/drm/i915/intel_gvt_mmio_table.c.  The
declarations could then go either into drivers/gpu/drm/i915/intel_gvt.h
or drivers/gpu/drm/i915/intel_gvt_mmio_table.h.
