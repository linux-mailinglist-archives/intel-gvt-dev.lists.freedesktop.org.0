Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83941E1B0B
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 May 2020 08:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329BB89CB5;
	Tue, 26 May 2020 06:12:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBCF89CB5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 26 May 2020 06:12:23 +0000 (UTC)
IronPort-SDR: 98THKn/Bp4m6y3s/E8X3srLpocvk+6103yQDC5zfq+M1rMyPuBpCN4qjsdMVT6Ys9HgxDWpt+M
 HuYB7zvWc/LA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2020 23:12:23 -0700
IronPort-SDR: wei3B0B4UldaRH5EYLgeoAC6MzU8fHM3hFT/Opep7AC+mZ6jhhV4hU1yhrHdsSkwOKgofY/SIC
 yVmSuUUKKh6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,436,1583222400"; d="scan'208";a="468175826"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by fmsmga005.fm.intel.com with ESMTP; 25 May 2020 23:12:21 -0700
Date: Tue, 26 May 2020 02:02:29 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: Semantics of dma_{map,pin,unmap}_guest_page
Message-ID: <20200526060229.GA19560@joy-OptiPlex-7040>
References: <98f001ecef5644f945e36585ac04ba31093e6a2e.camel@cyberus-technology.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98f001ecef5644f945e36585ac04ba31093e6a2e.camel@cyberus-technology.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, May 25, 2020 at 05:32:39PM +0200, Julian Stecklina wrote:
> Hello,
> 
> as you know we are writing a hypervisor backend for i915/gvt. We were wondering
> about the semantics of dma_map_guest_page, dma_pin_guest_page, and
> dma_unmap_guest_page from intel_gvt_ops.
> 
> My current understanding is this: Map creates a new DMA mapping with a reference
> count of 1. Pin increases the reference count by one. Unmap decreases the
> reference count by 1 and if it reaches zero, removes the DMA mapping. Pretty
> straight forward.
>
yes, that's right.

guest modifications to GGTT/ppgtt would trigger calls to Map/Unmap to
pin/unpin guest pages and create/remove DMA mapping.


> I would also expect that after I call `intel_gvt_ops->vgpu_destroy`, all DMA
> mappings are released by the mediator with the appropriate number of unmap
> calls. This doesn't seem to be the case, as I see many DMA mappings that are
> still alive after the vGPU is destroyed.
>
as the Unmap calls are triggered from guest page table modification, its
count does not necessarily match to that of Map calls.
But unpon vGPU is destroyed, gvt_cache_destroy() would be called by
kvmgt_guest_exit() and would remove all DMA mappings which might be still
alive regardless of its ref count.


> At this point, I'm a bit unsure what to do with these mappings, because they
> might still be in use. So the options are to either free them (and risk memory
> corruption) or keep them around leak memory.
> 
> Do I have a flaw in my assumptions or is it expected behavior to clean up some
> mappings that still have a reference count >0 after the vGPU is destroyed?
> 
>
as with the presence of gvt_cache_destroy(), I did not observe the
mentioned leak. if you do encounter it, could you details the
reproducing procedures? so we can check if it's a bug unnoticed.

Thanks
Yan

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
