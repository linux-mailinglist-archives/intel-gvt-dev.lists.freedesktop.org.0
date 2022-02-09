Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 225D94AEB2E
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Feb 2022 08:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8526E10E43E;
	Wed,  9 Feb 2022 07:36:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F6E10E41F;
 Wed,  9 Feb 2022 07:36:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 96FD468AFE; Wed,  9 Feb 2022 08:36:44 +0100 (CET)
Date: Wed, 9 Feb 2022 08:36:44 +0100
From: Christoph Hellwig <hch@lst.de>
To: Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH v6 1/3] i915/gvt: Introduce the mmio table to support
 VFIO new mdev API
Message-ID: <20220209073644.GD9050@lst.de>
References: <20220208111151.13115-1-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208111151.13115-1-zhi.a.wang@intel.com>
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
 Terrence Xu <terrence.xu@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 Vivi Rodrigo <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 hch@lst.de, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

A cover letter with the changelog, the base and maybe a pointer to a git
tree would be nice.

> +static int handle_mmio_cb(struct intel_gvt_mmio_table_iter *iter, u32 offset,
> +			  u32 device, u32 size)
> +{
> +	if (size < 1024 || offset == i915_mmio_reg_offset(GEN9_GFX_MOCS(0)))
> +		return handle_mmio(iter, offset, device, size);
> +	else
> +		return handle_mmio_block(iter, offset, device, size);
> +}

No need for an else statement after a return statement.

> +/* XXX FIXME i915 has changed PP_XXX definition */

Btw, can someone explain this comment?  I has always puzzled me.
