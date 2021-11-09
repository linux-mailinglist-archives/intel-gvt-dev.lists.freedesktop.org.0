Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E441744A809
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  9 Nov 2021 09:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845C16E4BA;
	Tue,  9 Nov 2021 08:00:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E2A6E4BA;
 Tue,  9 Nov 2021 07:59:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5D03968AA6; Tue,  9 Nov 2021 08:59:57 +0100 (CET)
Date: Tue, 9 Nov 2021 08:59:57 +0100
From: Christoph Hellwig <hch@lst.de>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v2
Message-ID: <20211109075957.GC27339@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
 <163603075885.4807.880888219859400958@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163603075885.4807.880888219859400958@jlahtine-mobl.ger.corp.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Nov 04, 2021 at 02:59:18PM +0200, Joonas Lahtinen wrote:
> The minimal we should do is to eliminate the double underscore
> prefixed functions. But I would prefer to have the symbol exports by
> default so that we can enable the functionality just by loading the
> module.

I'm fine with exporting by default, but just loading won't really work
even with that:

 - there are a bunch of IS_ENABLED conditionals in the i915 (although
   they look like minor optimizations to me).
 - the enable_gvt needs to be set, although after this refactor this
   option is completely pointless and should probably be enabled
 - the enable_guc option needs to be disable for gvt to work.
