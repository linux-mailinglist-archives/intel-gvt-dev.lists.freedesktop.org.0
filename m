Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C87A902007
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 10 Jun 2024 12:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E01B10E423;
	Mon, 10 Jun 2024 10:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n4SwjMK/";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59CC10E047;
 Mon, 10 Jun 2024 10:57:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4F879602F4;
 Mon, 10 Jun 2024 10:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5A8C2BBFC;
 Mon, 10 Jun 2024 10:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718017058;
 bh=OyngCyAdVbJJ9aXbB7rYVh1NHsHu3QHIUIy6zmeJQ+k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=n4SwjMK/jKBHYSKkesk6fL9w8o5osnpsarNAGbxFTkdm73x54FuukhIS6GwDNutcx
 iWXOAoHF3UPykAydaU8b/SGFbL4FATiDVgvswDx0H0VOQlhDpg9EHMePQVrkxAAgl+
 n18JOWQc1IG1+nM06cnO9ScgdldFq/dyJsqqXkN5IRVlH/Q+l1qjVZ9hn+0Nv/kGLV
 zBXqQjxY5e73uQg1ZnOHRFu2yQz5BFJvNrhoSVFGGtMTIs7h+UU9hn2Ejld7O7z/W+
 Gh+7cBuAdC8BhfjKm2b1dws1quY6zdsYlLYbmhEHzCD7w/M7CYwKrHLIIVldlMSf3k
 AFBdrb9JiV/lA==
Date: Mon, 10 Jun 2024 13:57:33 +0300
From: Zhi Wang <zhiwang@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH v2 3/6] drm/i915/gvt: rename range variable to stride
Message-ID: <20240610135733.0000272d.zhiwang@kernel.org>
In-Reply-To: <8b8d4acee15da07845ed1779d6856d5c3f50a132.1717773890.git.jani.nikula@intel.com>
References: <cover.1717773890.git.jani.nikula@intel.com>
 <8b8d4acee15da07845ed1779d6856d5c3f50a132.1717773890.git.jani.nikula@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri,  7 Jun 2024 18:25:37 +0300
Jani Nikula <jani.nikula@intel.com> wrote:

> Range is a bit odd name for what really is stride. Rename. Switch to
> u32 while at it.
> 
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.wang.linux@gmail.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c
> b/drivers/gpu/drm/i915/gvt/handlers.c index
> b005ab0104ee..f79dd6cfc75b 100644 ---
> a/drivers/gpu/drm/i915/gvt/handlers.c +++
> b/drivers/gpu/drm/i915/gvt/handlers.c @@ -887,12 +887,12 @@ static
> unsigned int calc_index(unsigned int offset, i915_reg_t _start, u32
> start = i915_mmio_reg_offset(_start); u32 next =
> i915_mmio_reg_offset(_next); u32 end = i915_mmio_reg_offset(_end);
> -	unsigned int range = next - start;
> +	u32 stride = next - start;
>  
>  	if (offset < start || offset > end)
>  		return INVALID_INDEX;
>  	offset -= start;
> -	return offset / range;
> +	return offset / stride;
>  }
>  
>  #define FDI_RX_CTL_TO_PIPE(offset) \

Reviewed-by: Zhi Wang <zhiwang@kernel.org>
