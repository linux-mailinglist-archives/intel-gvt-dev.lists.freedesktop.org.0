Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482BE90200B
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 10 Jun 2024 12:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C33A10E423;
	Mon, 10 Jun 2024 10:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a9NrDOE3";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D1110E423;
 Mon, 10 Jun 2024 10:58:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6941360110;
 Mon, 10 Jun 2024 10:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADCCC2BBFC;
 Mon, 10 Jun 2024 10:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718017106;
 bh=U2BQxaCbCdvBApTviumotR70MUH6BIorGgDJyvcbF0M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=a9NrDOE3pv5bOO/6/gjtClajo0BwQPPSUuCT1tAVsXzKBiDxM/PUj/jNYAjX9YAZ/
 kAfGX3XuH1n/sJ0d3HYdo+5MoCFjvRAz0nkTiLkid7JtPw6pamzaFC7VjD5HLncoIO
 ZZTEzRZySNglXzFWzkJWy4ENZQ4mWpSrLbVTlBEC2W3Cnp8ll61i9fY94v002er679
 +lQ7PaoLEqv2FuUM8lM0fgWr4xBA7fq28m51+CLM4KzBs+l/grnwJ9xHmL/o17ezNR
 uerOSPDO6rtBTbMLTGNBhYcbjx+g02JS6ROCAZmt1b7/tjS82oR6IGRItkkx2A2Zzi
 dWPl7rOFrAryA==
Date: Mon, 10 Jun 2024 13:58:21 +0300
From: Zhi Wang <zhiwang@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH v2 4/6] drm/i915/gvt: do not use implict dev_priv in
 DSPSURF_TO_PIPE()
Message-ID: <20240610135821.00000861.zhiwang@kernel.org>
In-Reply-To: <2ff78ebd0dc84178f5feacee7ef2a6cb4132b9ae.1717773890.git.jani.nikula@intel.com>
References: <cover.1717773890.git.jani.nikula@intel.com>
 <2ff78ebd0dc84178f5feacee7ef2a6cb4132b9ae.1717773890.git.jani.nikula@intel.com>
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

On Fri,  7 Jun 2024 18:25:38 +0300
Jani Nikula <jani.nikula@intel.com> wrote:

> Do not rely on having dev_priv local variable, pass it to the macro.
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
> f79dd6cfc75b..0f09344d3c20 100644 ---
> a/drivers/gpu/drm/i915/gvt/handlers.c +++
> b/drivers/gpu/drm/i915/gvt/handlers.c @@ -1009,14 +1009,14 @@ static
> int south_chicken2_mmio_write(struct intel_vgpu *vgpu, return 0;
>  }
>  
> -#define DSPSURF_TO_PIPE(offset) \
> +#define DSPSURF_TO_PIPE(dev_priv, offset) \
>  	calc_index(offset, DSPSURF(dev_priv, PIPE_A),
> DSPSURF(dev_priv, PIPE_B), DSPSURF(dev_priv, PIPE_C)) 
>  static int pri_surf_mmio_write(struct intel_vgpu *vgpu, unsigned int
> offset, void *p_data, unsigned int bytes)
>  {
>  	struct drm_i915_private *dev_priv = vgpu->gvt->gt->i915;
> -	u32 pipe = DSPSURF_TO_PIPE(offset);
> +	u32 pipe = DSPSURF_TO_PIPE(dev_priv, offset);
>  	int event = SKL_FLIP_EVENT(pipe, PLANE_PRIMARY);
>  
>  	write_vreg(vgpu, offset, p_data, bytes);

Reviewed-by: Zhi Wang <zhiwang@kernel.org>
