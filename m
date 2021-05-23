Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA0E38DC91
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 23 May 2021 21:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4F289C9C;
	Sun, 23 May 2021 19:17:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0675889C93;
 Sun, 23 May 2021 19:17:49 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id h16so29347686edr.6;
 Sun, 23 May 2021 12:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AUsaJ1MPUZq2hTmtjAVAKhDL5Z3IOSNfaE4fSpX2PxU=;
 b=e+GH9IQhVxEy6hn5UpIbb3/yRtVsaGagXQWKeaIp4C+RayuWJ2jJEVJLMjLLTnbkZ9
 9uKKZ4qiRTFItpb4HWQ/yoM5KGsB3HeFeGq9xlcaUAjTBllZNv36cDzimZRyV6n96zmj
 QnBqDKY6KMYkql3xjfeNTzqpAOjgFJRjfzSkaNY+ZovgnRMtlOTLhJEX1mcwgQP45VfT
 sSjpEpCHx+/a/oUjyN8L4dAirLwayFlKSoNSqZ0B3ZGtvK9IdUH07R3ES8fgvCIHILFJ
 XMwluLMqLlP01MZiNDUa0VAWU2rNyYvwZFusfb54dgw8DFQJnuU0sb1gfbL8xDxmEfw/
 H9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AUsaJ1MPUZq2hTmtjAVAKhDL5Z3IOSNfaE4fSpX2PxU=;
 b=jr4ngzITNE/Mlh3x/mvBVNYzJlvXBY/gXfFu8mMe532qyQsszs/qoxKNXTzzjSJo18
 EL81kiXSpC52BvecGhxpPq1xoOGKX/NpbwrBBmzj/JRhn+GGGGwuD/PIK2JOvcXD38SD
 IAlRvXQ5U0tvz8DbShljpnTwMm0K6xBT9eh5IFlRHm1xQIygaRuA36LId8TerCokRQGa
 Jb8wKKEEMdlZ9sda4q+J0p2Cic2EHI9IFrCiemg20C1vMI3tnGK8a+HNnIHS5NQS9VZ/
 ghn+pYTuVeqZq9T0xxznra7KFofzIhgeBQFNDmOk25VSFDxmEeWzm4Llp3Zt/XYeuzj1
 Fkjw==
X-Gm-Message-State: AOAM532AJZsb+QcDNS7WT/NNgyHxtEBdPb70rbMWsluHI3HP4EslLb2R
 D2efNGIBW6ht34DnGZ4lKGAw4h32r1JXLSJKYks=
X-Google-Smtp-Source: ABdhPJyxT1dFBQ7OraCENc2Bbu3N8jp6h/9bZ0kPzGpsZMFsGH5prpu2XM/Jzk6fgBYhIVDUGVJP1Yf47dvoekHF4hU=
X-Received: by 2002:a05:6402:1d39:: with SMTP id
 dh25mr21986375edb.113.1621797467861; 
 Sun, 23 May 2021 12:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210521174047.3861-1-anusha.srivatsa@intel.com>
 <20210522064343.teeezbynuk4k7nm3@ldmartin-desk2>
In-Reply-To: <20210522064343.teeezbynuk4k7nm3@ldmartin-desk2>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 24 May 2021 05:17:36 +1000
Message-ID: <CAPM=9tyA-akmALJEZegkKLgDc+c7MOeb7v3mVA1xqoBoxUyRkg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gvt: Add missing macro name changes
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Can someone land this in drm-intel-next asap? it's breaking drm-tip development.

Dave.

On Sat, 22 May 2021 at 16:44, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> On Fri, May 21, 2021 at 10:40:47AM -0700, Anusha Srivatsa wrote:
> >Propogate changes to macros name containing CSR_*
> >to DMC_* from display side.
> >
> >Fixes: 0633cdcbaa77 ("drm/i915/dmc: Rename macro names containing csr")
> >Cc: intel-gvt-dev@lists.freedesktop.org
> >Cc: Jani Nikula <jani.nikula@linux.intel.com>
> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> Lucas De Marchi
>
> >---
> > drivers/gpu/drm/i915/gvt/handlers.c | 8 ++++----
> > 1 file changed, 4 insertions(+), 4 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
> >index dda320749c65..33496397a74f 100644
> >--- a/drivers/gpu/drm/i915/gvt/handlers.c
> >+++ b/drivers/gpu/drm/i915/gvt/handlers.c
> >@@ -3342,9 +3342,9 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
> >       MMIO_D(_MMIO(_PLANE_SURF_3_A), D_SKL_PLUS);
> >       MMIO_D(_MMIO(_PLANE_SURF_3_B), D_SKL_PLUS);
> >
> >-      MMIO_D(CSR_SSP_BASE, D_SKL_PLUS);
> >-      MMIO_D(CSR_HTP_SKL, D_SKL_PLUS);
> >-      MMIO_D(CSR_LAST_WRITE, D_SKL_PLUS);
> >+      MMIO_D(DMC_SSP_BASE, D_SKL_PLUS);
> >+      MMIO_D(DMC_HTP_SKL, D_SKL_PLUS);
> >+      MMIO_D(DMC_LAST_WRITE, D_SKL_PLUS);
> >
> >       MMIO_DFH(BDW_SCRATCH1, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> >
> >@@ -3655,7 +3655,7 @@ void intel_gvt_clean_mmio_info(struct intel_gvt *gvt)
> >  * otherwise, need to update cmd_reg_handler in cmd_parser.c
> >  */
> > static struct gvt_mmio_block mmio_blocks[] = {
> >-      {D_SKL_PLUS, _MMIO(CSR_MMIO_START_RANGE), 0x3000, NULL, NULL},
> >+      {D_SKL_PLUS, _MMIO(DMC_MMIO_START_RANGE), 0x3000, NULL, NULL},
> >       {D_ALL, _MMIO(MCHBAR_MIRROR_BASE_SNB), 0x40000, NULL, NULL},
> >       {D_ALL, _MMIO(VGT_PVINFO_PAGE), VGT_PVINFO_SIZE,
> >               pvinfo_mmio_read, pvinfo_mmio_write},
> >--
> >2.25.0
> >
> >_______________________________________________
> >Intel-gfx mailing list
> >Intel-gfx@lists.freedesktop.org
> >https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
