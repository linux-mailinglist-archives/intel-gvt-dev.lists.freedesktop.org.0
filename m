Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CF638E32B
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 May 2021 11:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7CE6E14F;
	Mon, 24 May 2021 09:20:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57336E14D;
 Mon, 24 May 2021 09:19:59 +0000 (UTC)
IronPort-SDR: FYDRtQ2MEggsCpuVDgsK5bco0PcI/cxE35ETCRAkiJ/W/Ka3SqZxXxT5J3/xHlVcjyc1uOLNRY
 +zqzCUvGNYGw==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="263103132"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="263103132"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 02:19:58 -0700
IronPort-SDR: WcOKkElVoZiQONFyph23T9mIjolGOlOI04OeLs+MSMqvLzDZFNoFhjbq3gIoiKy9ojYaKOAMGz
 A/vHChwo7EVw==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="475772761"
Received: from jaherrex-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.50.169])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 02:19:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gvt: Add missing macro name changes
In-Reply-To: <CAPM=9tyA-akmALJEZegkKLgDc+c7MOeb7v3mVA1xqoBoxUyRkg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210521174047.3861-1-anusha.srivatsa@intel.com>
 <20210522064343.teeezbynuk4k7nm3@ldmartin-desk2>
 <CAPM=9tyA-akmALJEZegkKLgDc+c7MOeb7v3mVA1xqoBoxUyRkg@mail.gmail.com>
Date: Mon, 24 May 2021 12:19:52 +0300
Message-ID: <87mtskcwuf.fsf@intel.com>
MIME-Version: 1.0
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

On Mon, 24 May 2021, Dave Airlie <airlied@gmail.com> wrote:
> Can someone land this in drm-intel-next asap? it's breaking drm-tip development.

Pushed, sorry for the hiccup. Need to get CONFIG_DRM_I915_GVT=y enabled
in CI.

BR,
Jani.


>
> Dave.
>
> On Sat, 22 May 2021 at 16:44, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>
>> On Fri, May 21, 2021 at 10:40:47AM -0700, Anusha Srivatsa wrote:
>> >Propogate changes to macros name containing CSR_*
>> >to DMC_* from display side.
>> >
>> >Fixes: 0633cdcbaa77 ("drm/i915/dmc: Rename macro names containing csr")
>> >Cc: intel-gvt-dev@lists.freedesktop.org
>> >Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> >Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>>
>>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> Lucas De Marchi
>>
>> >---
>> > drivers/gpu/drm/i915/gvt/handlers.c | 8 ++++----
>> > 1 file changed, 4 insertions(+), 4 deletions(-)
>> >
>> >diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
>> >index dda320749c65..33496397a74f 100644
>> >--- a/drivers/gpu/drm/i915/gvt/handlers.c
>> >+++ b/drivers/gpu/drm/i915/gvt/handlers.c
>> >@@ -3342,9 +3342,9 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
>> >       MMIO_D(_MMIO(_PLANE_SURF_3_A), D_SKL_PLUS);
>> >       MMIO_D(_MMIO(_PLANE_SURF_3_B), D_SKL_PLUS);
>> >
>> >-      MMIO_D(CSR_SSP_BASE, D_SKL_PLUS);
>> >-      MMIO_D(CSR_HTP_SKL, D_SKL_PLUS);
>> >-      MMIO_D(CSR_LAST_WRITE, D_SKL_PLUS);
>> >+      MMIO_D(DMC_SSP_BASE, D_SKL_PLUS);
>> >+      MMIO_D(DMC_HTP_SKL, D_SKL_PLUS);
>> >+      MMIO_D(DMC_LAST_WRITE, D_SKL_PLUS);
>> >
>> >       MMIO_DFH(BDW_SCRATCH1, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>> >
>> >@@ -3655,7 +3655,7 @@ void intel_gvt_clean_mmio_info(struct intel_gvt *gvt)
>> >  * otherwise, need to update cmd_reg_handler in cmd_parser.c
>> >  */
>> > static struct gvt_mmio_block mmio_blocks[] = {
>> >-      {D_SKL_PLUS, _MMIO(CSR_MMIO_START_RANGE), 0x3000, NULL, NULL},
>> >+      {D_SKL_PLUS, _MMIO(DMC_MMIO_START_RANGE), 0x3000, NULL, NULL},
>> >       {D_ALL, _MMIO(MCHBAR_MIRROR_BASE_SNB), 0x40000, NULL, NULL},
>> >       {D_ALL, _MMIO(VGT_PVINFO_PAGE), VGT_PVINFO_SIZE,
>> >               pvinfo_mmio_read, pvinfo_mmio_write},
>> >--
>> >2.25.0
>> >
>> >_______________________________________________
>> >Intel-gfx mailing list
>> >Intel-gfx@lists.freedesktop.org
>> >https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
