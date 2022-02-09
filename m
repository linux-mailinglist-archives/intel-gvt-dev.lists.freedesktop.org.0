Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4343E4AEB12
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Feb 2022 08:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A2D10E3E4;
	Wed,  9 Feb 2022 07:32:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B059510E1D2;
 Wed,  9 Feb 2022 07:32:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id EE25668BFE; Wed,  9 Feb 2022 08:32:24 +0100 (CET)
Date: Wed, 9 Feb 2022 08:32:23 +0100
From: Christoph Hellwig <hch@lst.de>
To: Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH v6 3/3] i915/gvt: Use the initial HW state snapshot
 saved in i915
Message-ID: <20220209073223.GC9050@lst.de>
References: <20220208111151.13115-1-zhi.a.wang@intel.com>
 <20220208111151.13115-3-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208111151.13115-3-zhi.a.wang@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, jani.nikula@linux.intel.com,
 Zhenyu Wang <zhenyuw@linux.intel.com>, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, Vivi Rodrigo <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, hch@lst.de,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Feb 08, 2022 at 06:11:51AM -0500, Zhi Wang wrote:
> The code of saving initial HW state snapshot has been moved into i915.
> Let the GVT-g core logic use that snapshot.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
