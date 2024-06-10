Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511A9902002
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 10 Jun 2024 12:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B1C10E423;
	Mon, 10 Jun 2024 10:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NfRUcMrk";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658F410E414;
 Mon, 10 Jun 2024 10:56:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6D6ED602F4;
 Mon, 10 Jun 2024 10:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7234AC2BBFC;
 Mon, 10 Jun 2024 10:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718017008;
 bh=fn3+dF5BergUxD/MzB7+KabvDgnE5nUXXDjR0d0NSRQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NfRUcMrkceHGrJXveqcQsWrbHUTKQZCQS7UWGSzyuOzW8mBoITpYm118BqivhubLy
 jhrvUImgEkBamPZbRPYIRaVgWhJn6rphqNJVfKrdATnKdf3XFmF+KLy+98vzAisgz+
 MDyp/88gyFnRh/66KrzY+amPheBBbobmEUy+3JwomRGBcWJ4eTxH7BHBDB+LNtHLmC
 SF/VkoMIs4mBy/paa5IoPCfz7iJuXBxb73Q2WfQWNrS3UnSdwQnBTMRD7IAx054Ba4
 gGeTCxUpMwVldNb/8yqQVsuAzp9dRd+70kQIufietUoFDtafA65Dps4R4SG0bfDQ/S
 oX9yeB07I9pFw==
Date: Mon, 10 Jun 2024 13:56:43 +0300
From: Zhi Wang <zhiwang@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH v2 2/6] drm/i915/gvt: use proper i915_reg_t for
 calc_index() parameters
Message-ID: <20240610135643.00006d0a.zhiwang@kernel.org>
In-Reply-To: <282b19c44d83c96b52c261cfc7218e7e54076cba.1717773890.git.jani.nikula@intel.com>
References: <cover.1717773890.git.jani.nikula@intel.com>
 <282b19c44d83c96b52c261cfc7218e7e54076cba.1717773890.git.jani.nikula@intel.com>
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

On Fri,  7 Jun 2024 18:25:36 +0300
Jani Nikula <jani.nikula@intel.com> wrote:

> In order to be able to use the proper register macros instead of the
> underscore prefixed ones, pass i915_reg_t for the calc_index()
> parameters.
> 
> Side note: DSPSURF is really about planes, not pipes. Fixed stride
> doesn't work for plane C for CHV (but that's okay for gvt). This
> doesn't support planes beyond C either. But all that is unrelated to
> the change at hand.
> 
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.wang.linux@gmail.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c
> b/drivers/gpu/drm/i915/gvt/handlers.c index
> a2e9d24d646e..b005ab0104ee 100644 ---
> a/drivers/gpu/drm/i915/gvt/handlers.c +++
> b/drivers/gpu/drm/i915/gvt/handlers.c @@ -881,9 +881,11 @@ static int
> check_fdi_rx_train_status(struct intel_vgpu *vgpu, 
>  #define INVALID_INDEX (~0U)
>  
> -static unsigned int calc_index(unsigned int offset, unsigned int
> start,
> -			       unsigned int next, i915_reg_t _end)
> +static unsigned int calc_index(unsigned int offset, i915_reg_t
> _start,
> +			       i915_reg_t _next, i915_reg_t _end)
>  {
> +	u32 start = i915_mmio_reg_offset(_start);
> +	u32 next = i915_mmio_reg_offset(_next);
>  	u32 end = i915_mmio_reg_offset(_end);
>  	unsigned int range = next - start;
>  
> @@ -894,13 +896,13 @@ static unsigned int calc_index(unsigned int
> offset, unsigned int start, }
>  
>  #define FDI_RX_CTL_TO_PIPE(offset) \
> -	calc_index(offset, _FDI_RXA_CTL, _FDI_RXB_CTL,
> FDI_RX_CTL(PIPE_C))
> +	calc_index(offset, FDI_RX_CTL(PIPE_A), FDI_RX_CTL(PIPE_B),
> FDI_RX_CTL(PIPE_C)) 
>  #define FDI_TX_CTL_TO_PIPE(offset) \
> -	calc_index(offset, _FDI_TXA_CTL, _FDI_TXB_CTL,
> FDI_TX_CTL(PIPE_C))
> +	calc_index(offset, FDI_TX_CTL(PIPE_A), FDI_TX_CTL(PIPE_B),
> FDI_TX_CTL(PIPE_C)) 
>  #define FDI_RX_IMR_TO_PIPE(offset) \
> -	calc_index(offset, _FDI_RXA_IMR, _FDI_RXB_IMR,
> FDI_RX_IMR(PIPE_C))
> +	calc_index(offset, FDI_RX_IMR(PIPE_A), FDI_RX_IMR(PIPE_B),
> FDI_RX_IMR(PIPE_C)) 
>  static int update_fdi_rx_iir_status(struct intel_vgpu *vgpu,
>  		unsigned int offset, void *p_data, unsigned int
> bytes) @@ -944,7 +946,7 @@ static int update_fdi_rx_iir_status(struct
> intel_vgpu *vgpu, }
>  
>  #define DP_TP_CTL_TO_PORT(offset) \
> -	calc_index(offset, _DP_TP_CTL_A, _DP_TP_CTL_B,
> DP_TP_CTL(PORT_E))
> +	calc_index(offset, DP_TP_CTL(PORT_A), DP_TP_CTL(PORT_B),
> DP_TP_CTL(PORT_E)) 
>  static int dp_tp_ctl_mmio_write(struct intel_vgpu *vgpu, unsigned
> int offset, void *p_data, unsigned int bytes)
> @@ -1008,7 +1010,7 @@ static int south_chicken2_mmio_write(struct
> intel_vgpu *vgpu, }
>  
>  #define DSPSURF_TO_PIPE(offset) \
> -	calc_index(offset, _DSPASURF, _DSPBSURF, DSPSURF(dev_priv,
> PIPE_C))
> +	calc_index(offset, DSPSURF(dev_priv, PIPE_A),
> DSPSURF(dev_priv, PIPE_B), DSPSURF(dev_priv, PIPE_C)) 
>  static int pri_surf_mmio_write(struct intel_vgpu *vgpu, unsigned int
> offset, void *p_data, unsigned int bytes)
> @@ -1031,7 +1033,7 @@ static int pri_surf_mmio_write(struct
> intel_vgpu *vgpu, unsigned int offset, }
>  
>  #define SPRSURF_TO_PIPE(offset) \
> -	calc_index(offset, _SPRA_SURF, _SPRB_SURF, SPRSURF(PIPE_C))
> +	calc_index(offset, SPRSURF(PIPE_A), SPRSURF(PIPE_B),
> SPRSURF(PIPE_C)) 
>  static int spr_surf_mmio_write(struct intel_vgpu *vgpu, unsigned int
> offset, void *p_data, unsigned int bytes)

Reviwed-by: Zhi Wang <zhiwang@kernel.org>
