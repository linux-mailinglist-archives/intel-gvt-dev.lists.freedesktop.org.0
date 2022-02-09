Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15AB4AEB09
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Feb 2022 08:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAE910E3DB;
	Wed,  9 Feb 2022 07:32:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C415D10E1D2;
 Wed,  9 Feb 2022 07:32:05 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C80E668B05; Wed,  9 Feb 2022 08:32:01 +0100 (CET)
Date: Wed, 9 Feb 2022 08:32:01 +0100
From: Christoph Hellwig <hch@lst.de>
To: Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH v6 2/3] i915/gvt: Save the initial HW state snapshot in
 i915
Message-ID: <20220209073201.GB9050@lst.de>
References: <20220208111151.13115-1-zhi.a.wang@intel.com>
 <20220208111151.13115-2-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208111151.13115-2-zhi.a.wang@intel.com>
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

On Tue, Feb 08, 2022 at 06:11:50AM -0500, Zhi Wang wrote:
> +	struct drm_i915_private *dev_priv = iter->i915;
> +	u32 *mmio, i;
> +
> +	for (i = offset; i < offset + size; i += 4) {
> +		mmio = iter->data + i;
> +		*mmio = intel_uncore_read_notrace(to_gt(dev_priv)->uncore,
> +						  _MMIO(i));

This reads much stranger than:

	u32 *mmio = iter->data;

	for (i = offset; i < offset + size; i += 4) {
		mmio[i] = intel_uncore_read_notrace(to_gt(dev_priv)->uncore,
						    _MMIO(i));
	}

> +static int handle_mmio(struct intel_gvt_mmio_table_iter *iter,
> +		       u32 offset, u32 device, u32 size)
> +{
> +	if (WARN_ON(!IS_ALIGNED(offset, 4)))
> +		return -EINVAL;

Shouldn't this be in the caller of the method?

> +	save_mmio(iter, offset, size);
> +	return 0;

Now that the block callback is gone save_mmio and handle_mmio
can be merged.

> +	mem = vzalloc(2 * SZ_1M);

Don't we want a driver-wide constant for this instead of a magic number?
