Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6370F4A3DB8
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 31 Jan 2022 07:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39A310E248;
	Mon, 31 Jan 2022 06:38:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCE810E248;
 Mon, 31 Jan 2022 06:38:07 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E502468AFE; Mon, 31 Jan 2022 07:38:03 +0100 (CET)
Date: Mon, 31 Jan 2022 07:38:03 +0100
From: Christoph Hellwig <hch@lst.de>
To: Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH 2/3] i915/gvt: save the initial HW state snapshot in i915.
Message-ID: <20220131063803.GB4390@lst.de>
References: <20220127120508.11330-1-zhi.a.wang@intel.com>
 <20220127120508.11330-2-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127120508.11330-2-zhi.a.wang@intel.com>
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

On Thu, Jan 27, 2022 at 07:05:07AM -0500, Zhi Wang wrote:
> +static void save_mmio(struct intel_gvt_mmio_table_iter *iter, u32 offset,
> +		      u32 size)
> +{
> +	struct drm_i915_private *dev_priv = iter->i915;
> +	void *mmio = iter->data;
> +	u32 start, end, i;
> +
> +	start = offset;
> +	end = offset + size;
> +
> +	for (i = start; i < end; i += 4) {
> +		*(u32 *)(mmio + i) = intel_uncore_read_notrace(
> +				to_gt(dev_priv)->uncore, _MMIO(offset));
> +	}
> +}

This can be simplified to:

static void intel_gvt_save_mmio(struct intel_gvt_mmio_table_iter *iter,
		u32 offset, u32 size)
{
	struct drm_i915_private *dev_priv = iter->i915;
	u32 *mmio = iter->data, i;

	for (i = offset; i < offset + size; i += 4) {
		mmio[i] = intel_uncore_read_notrace(to_gt(dev_priv)->uncore,
						    _MMIO(offset));
	}
}

> +	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
> +	struct intel_gvt_device_info info;
> +	struct i915_virtual_gpu *vgpu = &dev_priv->vgpu;
> +	struct intel_gvt_mmio_table_iter iter;
> +	void *mem;
> +	int i, ret;
> +
> +	intel_gvt_init_device_info(dev_priv, &info);

There is no real need for this call.

> +
> +	mem = kzalloc(info.cfg_space_size, GFP_KERNEL);
> +	if (!mem)
> +		return -ENOMEM;

info.cfg_space_size is always PCI_CFG_SPACE_EXP_SIZE, and the code relies
onb that just a few lines below.

> +	mem = vzalloc(info.mmio_size);

And info.mmio_size is a constant that can just use a define.
