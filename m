Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B08938D3F7
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 22 May 2021 08:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D1E6E02B;
	Sat, 22 May 2021 06:43:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EE16E02B;
 Sat, 22 May 2021 06:43:45 +0000 (UTC)
IronPort-SDR: HugEfyoBB8Q76fiWxgml7LsI79Z0jkP4HpBuFo3540yK1qP+4bK5ebqxFtUutHCzxFqyPV9ijR
 QCn0/3CSsfpA==
X-IronPort-AV: E=McAfee;i="6200,9189,9991"; a="201349042"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="201349042"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 23:43:44 -0700
IronPort-SDR: GlQGZStD1slqBsM3opU0AVqJQIGCS+687LngFRPw+dz0QOvSbZ2tlLswklhAioRaLMFBZkTLDR
 IxED6jRKrEcg==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="474885441"
Received: from nfreij-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.254.33.58])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 23:43:44 -0700
Date: Fri, 21 May 2021 23:43:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gvt: Add missing macro name changes
Message-ID: <20210522064343.teeezbynuk4k7nm3@ldmartin-desk2>
References: <20210521174047.3861-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210521174047.3861-1-anusha.srivatsa@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 10:40:47AM -0700, Anusha Srivatsa wrote:
>Propogate changes to macros name containing CSR_*
>to DMC_* from display side.
>
>Fixes: 0633cdcbaa77 ("drm/i915/dmc: Rename macro names containing csr")
>Cc: intel-gvt-dev@lists.freedesktop.org
>Cc: Jani Nikula <jani.nikula@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/gvt/handlers.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
>index dda320749c65..33496397a74f 100644
>--- a/drivers/gpu/drm/i915/gvt/handlers.c
>+++ b/drivers/gpu/drm/i915/gvt/handlers.c
>@@ -3342,9 +3342,9 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
> 	MMIO_D(_MMIO(_PLANE_SURF_3_A), D_SKL_PLUS);
> 	MMIO_D(_MMIO(_PLANE_SURF_3_B), D_SKL_PLUS);
>
>-	MMIO_D(CSR_SSP_BASE, D_SKL_PLUS);
>-	MMIO_D(CSR_HTP_SKL, D_SKL_PLUS);
>-	MMIO_D(CSR_LAST_WRITE, D_SKL_PLUS);
>+	MMIO_D(DMC_SSP_BASE, D_SKL_PLUS);
>+	MMIO_D(DMC_HTP_SKL, D_SKL_PLUS);
>+	MMIO_D(DMC_LAST_WRITE, D_SKL_PLUS);
>
> 	MMIO_DFH(BDW_SCRATCH1, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>
>@@ -3655,7 +3655,7 @@ void intel_gvt_clean_mmio_info(struct intel_gvt *gvt)
>  * otherwise, need to update cmd_reg_handler in cmd_parser.c
>  */
> static struct gvt_mmio_block mmio_blocks[] = {
>-	{D_SKL_PLUS, _MMIO(CSR_MMIO_START_RANGE), 0x3000, NULL, NULL},
>+	{D_SKL_PLUS, _MMIO(DMC_MMIO_START_RANGE), 0x3000, NULL, NULL},
> 	{D_ALL, _MMIO(MCHBAR_MIRROR_BASE_SNB), 0x40000, NULL, NULL},
> 	{D_ALL, _MMIO(VGT_PVINFO_PAGE), VGT_PVINFO_SIZE,
> 		pvinfo_mmio_read, pvinfo_mmio_write},
>-- 
>2.25.0
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
