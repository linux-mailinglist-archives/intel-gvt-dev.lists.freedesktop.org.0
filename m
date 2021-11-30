Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CF8463C31
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 30 Nov 2021 17:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B8D6E487;
	Tue, 30 Nov 2021 16:46:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64746E487;
 Tue, 30 Nov 2021 16:46:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1EC9D68B05; Tue, 30 Nov 2021 17:46:23 +0100 (CET)
Date: Tue, 30 Nov 2021 17:46:22 +0100
From: Christoph Hellwig <hch@lst.de>
To: Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH v4 1/2] i915/gvt: Introduce the mmio_info_table.c to
 support VFIO new mdev API
Message-ID: <20211130164622.GA15150@lst.de>
References: <20211129123832.105196-1-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129123832.105196-1-zhi.a.wang@intel.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Terrence Xu <terrence.xu@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

I still think this goes into the wrong direction.

Something closer to your first version that also saves away the
gvt->mmio.mmio_attribute flags in the core i915 module, and which
splits the MMIO table into one that contains just the offset, size
and flags (core i915) and one that has the read-only mask and handlers
(gvt) would be much simpler and not create this super-tight coupling
between core i915 and gvt.

Bonus points for moving your new intel_gvt_hw_state structure out
of struct intel_gvt and into struct i915_virtual_gpu.
