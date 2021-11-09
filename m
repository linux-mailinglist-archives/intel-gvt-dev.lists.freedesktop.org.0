Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7E544AB5C
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  9 Nov 2021 11:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92296E8AC;
	Tue,  9 Nov 2021 10:20:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D12A6E8AA;
 Tue,  9 Nov 2021 10:20:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="213149115"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="213149115"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 02:20:31 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="491608187"
Received: from stkachen-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.251.216.106])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 02:20:26 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Wang\, Zhi A" <zhi.a.wang@intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 "joonas.lahtinen\@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "zhenyuw\@linux.intel.com" <zhenyuw@linux.intel.com>,
 "jgg\@nvidia.com" <jgg@nvidia.com>,
 "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev\@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "dri-devel\@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hch\@lst.de" <hch@lst.de>
Subject: Re: [PATCH 1/3] i915/gvt: seperate tracked MMIO table from handlers.c
In-Reply-To: <5dd106e7-e62f-dfcd-bfa1-3f92794b8e3e@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211108212718.10576-1-zhi.a.wang@intel.com>
 <875yt17qzs.fsf@intel.com> <5dd106e7-e62f-dfcd-bfa1-3f92794b8e3e@intel.com>
Date: Tue, 09 Nov 2021 12:20:24 +0200
Message-ID: <87o86t636f.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 09 Nov 2021, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
> On 11/9/2021 9:00 AM, Jani Nikula wrote:
>> On Mon, 08 Nov 2021, Zhi Wang <zhi.wang.linux@gmail.com> wrote:
>>> From: Zhi Wang <zhi.wang.linux@gmail.com>
>>>
>>> To support the new mdev interfaces and the re-factor patches from
>>> Christoph, which moves the GVT-g code into a dedicated module, the GVT-g
>>> MMIO snapshot still needs to be saved in i915 so that the inital clean =
HW
>>> state can be used for the further vGPU. Seperate the tracked MMIO table
>>> from GVT-g, so that GVT-g and i915 can both use it.
>> Do you really have to both put code in a header and then include that in
>> multiple places?
>>
>> I think you may need to rethink the whole approach, maybe make them
>> actual tables instead of code.
>>
> Hi Jani:
>
> Sadly we can't not use a static-defined struct for a MMIO table. (That's=
=20
> actually how the code was before) Because:
>
> 1) We use the register defininations from i915.
>
> 2) Every MMIO register definiation in i915 is not a number. It's a macro=
=20
> _MMIO(r), which can't be put in the static-defined struct. That's how=20
> the code has been modified like this when it was merged upstream. The=20
> MMIO table has to be created dynamically.

Right.

> The MMIO table in the current GVT-g contains handlers in GVT-g code,=20
> which shouldn't be built into i915 after it was moved into a dedicated=20
> module. That's the reason I think putting it in a common header would be=
=20
> better.
>
> It would be nice to have some better ideas.=C2=A0 Currently what in my mi=
nd=20
> is: 1) Start a new .c file in gvt which contains the code to build MMIO=20
> table and let it be used both by i915 and gvt. 2) i915 builds the table=20
> and only use it for HW state saving. GVT-g builds a superior table and=20
> attach the handlers. Does that sounds better?

Having the functions defined in a single .c file and called (perhaps via
just one or two entry points) sounds much better than including code.

Perhaps you could pass in the function to call (new_mmio_info) as a
parameter in different situations instead of macro magic, to make the
code more readable?

Basically I want more clarity in the interfaces between the compilation
units everywhere in i915.


BR,
Jani.


>
> Thanks,
>
> Zhi.
>
>> BR,
>> Jani.
>>
>>
>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
>>> Cc: Zhi Wang <zhi.a.wang@intel.com>
>>> Cc: Christoph Hellwig <hch@lst.de>
>>> Cc: Jason Gunthorpe <jgg@nvidia.com>
>>> Signed-off-by: Zhi Wang <zhi.wang.linux@gmail.com>
>>> ---
>>>   drivers/gpu/drm/i915/gvt/handlers.c   | 1539 +-----------------------
>>>   drivers/gpu/drm/i915/gvt/mmio_table.h | 1570 +++++++++++++++++++++++++
>>>   drivers/gpu/drm/i915/gvt/reg.h        |    6 +
>>>   drivers/gpu/drm/i915/intel_gvt.c      |   11 +
>>>   4 files changed, 1592 insertions(+), 1534 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/i915/gvt/mmio_table.h
>>>
>>> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915=
/gvt/handlers.c
>>> index cde0a477fb49..6a08d362bf66 100644
>>> --- a/drivers/gpu/drm/i915/gvt/handlers.c
>>> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
>>> @@ -41,13 +41,6 @@
>>>   #include "i915_pvinfo.h"
>>>   #include "display/intel_display_types.h"
>>>=20=20=20
>>> -/* XXX FIXME i915 has changed PP_XXX definition */
>>> -#define PCH_PP_STATUS  _MMIO(0xc7200)
>>> -#define PCH_PP_CONTROL _MMIO(0xc7204)
>>> -#define PCH_PP_ON_DELAYS _MMIO(0xc7208)
>>> -#define PCH_PP_OFF_DELAYS _MMIO(0xc720c)
>>> -#define PCH_PP_DIVISOR _MMIO(0xc7210)
>>> -
>>>   unsigned long intel_gvt_get_device_type(struct intel_gvt *gvt)
>>>   {
>>>   	struct drm_i915_private *i915 =3D gvt->gt->i915;
>>> @@ -2131,1501 +2124,7 @@ static int csfe_chicken1_mmio_write(struct int=
el_vgpu *vgpu,
>>>   	return 0;
>>>   }
>>>=20=20=20
>>> -#define MMIO_F(reg, s, f, am, rm, d, r, w) do { \
>>> -	ret =3D new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
>>> -		f, s, am, rm, d, r, w); \
>>> -	if (ret) \
>>> -		return ret; \
>>> -} while (0)
>>> -
>>> -#define MMIO_D(reg, d) \
>>> -	MMIO_F(reg, 4, 0, 0, 0, d, NULL, NULL)
>>> -
>>> -#define MMIO_DH(reg, d, r, w) \
>>> -	MMIO_F(reg, 4, 0, 0, 0, d, r, w)
>>> -
>>> -#define MMIO_DFH(reg, d, f, r, w) \
>>> -	MMIO_F(reg, 4, f, 0, 0, d, r, w)
>>> -
>>> -#define MMIO_GM(reg, d, r, w) \
>>> -	MMIO_F(reg, 4, F_GMADR, 0xFFFFF000, 0, d, r, w)
>>> -
>>> -#define MMIO_GM_RDR(reg, d, r, w) \
>>> -	MMIO_F(reg, 4, F_GMADR | F_CMD_ACCESS, 0xFFFFF000, 0, d, r, w)
>>> -
>>> -#define MMIO_RO(reg, d, f, rm, r, w) \
>>> -	MMIO_F(reg, 4, F_RO | f, 0, rm, d, r, w)
>>> -
>>> -#define MMIO_RING_F(prefix, s, f, am, rm, d, r, w) do { \
>>> -	MMIO_F(prefix(RENDER_RING_BASE), s, f, am, rm, d, r, w); \
>>> -	MMIO_F(prefix(BLT_RING_BASE), s, f, am, rm, d, r, w); \
>>> -	MMIO_F(prefix(GEN6_BSD_RING_BASE), s, f, am, rm, d, r, w); \
>>> -	MMIO_F(prefix(VEBOX_RING_BASE), s, f, am, rm, d, r, w); \
>>> -	if (HAS_ENGINE(gvt->gt, VCS1)) \
>>> -		MMIO_F(prefix(GEN8_BSD2_RING_BASE), s, f, am, rm, d, r, w); \
>>> -} while (0)
>>> -
>>> -#define MMIO_RING_D(prefix, d) \
>>> -	MMIO_RING_F(prefix, 4, 0, 0, 0, d, NULL, NULL)
>>> -
>>> -#define MMIO_RING_DFH(prefix, d, f, r, w) \
>>> -	MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
>>> -
>>> -#define MMIO_RING_GM(prefix, d, r, w) \
>>> -	MMIO_RING_F(prefix, 4, F_GMADR, 0xFFFF0000, 0, d, r, w)
>>> -
>>> -#define MMIO_RING_GM_RDR(prefix, d, r, w) \
>>> -	MMIO_RING_F(prefix, 4, F_GMADR | F_CMD_ACCESS, 0xFFFF0000, 0, d, r, w)
>>> -
>>> -#define MMIO_RING_RO(prefix, d, f, rm, r, w) \
>>> -	MMIO_RING_F(prefix, 4, F_RO | f, 0, rm, d, r, w)
>>> -
>>> -static int init_generic_mmio_info(struct intel_gvt *gvt)
>>> -{
>>> -	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
>>> -	int ret;
>>> -
>>> -	MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
>>> -		intel_vgpu_reg_imr_handler);
>>> -
>>> -	MMIO_DFH(SDEIMR, D_ALL, 0, NULL, intel_vgpu_reg_imr_handler);
>>> -	MMIO_DFH(SDEIER, D_ALL, 0, NULL, intel_vgpu_reg_ier_handler);
>>> -	MMIO_DFH(SDEIIR, D_ALL, 0, NULL, intel_vgpu_reg_iir_handler);
>>> -	MMIO_D(SDEISR, D_ALL);
>>> -
>>> -	MMIO_RING_DFH(RING_HWSTAM, D_ALL, 0, NULL, NULL);
>>> -
>>> -
>>> -	MMIO_DH(GEN8_GAMW_ECO_DEV_RW_IA, D_BDW_PLUS, NULL,
>>> -		gamw_echo_dev_rw_ia_write);
>>> -
>>> -	MMIO_GM_RDR(BSD_HWS_PGA_GEN7, D_ALL, NULL, NULL);
>>> -	MMIO_GM_RDR(BLT_HWS_PGA_GEN7, D_ALL, NULL, NULL);
>>> -	MMIO_GM_RDR(VEBOX_HWS_PGA_GEN7, D_ALL, NULL, NULL);
>>> -
>>> -#define RING_REG(base) _MMIO((base) + 0x28)
>>> -	MMIO_RING_DFH(RING_REG, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -#undef RING_REG
>>> -
>>> -#define RING_REG(base) _MMIO((base) + 0x134)
>>> -	MMIO_RING_DFH(RING_REG, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -#undef RING_REG
>>> -
>>> -#define RING_REG(base) _MMIO((base) + 0x6c)
>>> -	MMIO_RING_DFH(RING_REG, D_ALL, 0, mmio_read_from_hw, NULL);
>>> -#undef RING_REG
>>> -	MMIO_DH(GEN7_SC_INSTDONE, D_BDW_PLUS, mmio_read_from_hw, NULL);
>>> -
>>> -	MMIO_GM_RDR(_MMIO(0x2148), D_ALL, NULL, NULL);
>>> -	MMIO_GM_RDR(CCID(RENDER_RING_BASE), D_ALL, NULL, NULL);
>>> -	MMIO_GM_RDR(_MMIO(0x12198), D_ALL, NULL, NULL);
>>> -	MMIO_D(GEN7_CXT_SIZE, D_ALL);
>>> -
>>> -	MMIO_RING_DFH(RING_TAIL, D_ALL, 0, NULL, NULL);
>>> -	MMIO_RING_DFH(RING_HEAD, D_ALL, 0, NULL, NULL);
>>> -	MMIO_RING_DFH(RING_CTL, D_ALL, 0, NULL, NULL);
>>> -	MMIO_RING_DFH(RING_ACTHD, D_ALL, 0, mmio_read_from_hw, NULL);
>>> -	MMIO_RING_GM(RING_START, D_ALL, NULL, NULL);
>>> -
>>> -	/* RING MODE */
>>> -#define RING_REG(base) _MMIO((base) + 0x29c)
>>> -	MMIO_RING_DFH(RING_REG, D_ALL,
>>> -		F_MODE_MASK | F_CMD_ACCESS | F_CMD_WRITE_PATCH, NULL,
>>> -		ring_mode_mmio_write);
>>> -#undef RING_REG
>>> -
>>> -	MMIO_RING_DFH(RING_MI_MODE, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
>>> -		NULL, NULL);
>>> -	MMIO_RING_DFH(RING_INSTPM, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
>>> -			NULL, NULL);
>>> -	MMIO_RING_DFH(RING_TIMESTAMP, D_ALL, F_CMD_ACCESS,
>>> -			mmio_read_from_hw, NULL);
>>> -	MMIO_RING_DFH(RING_TIMESTAMP_UDW, D_ALL, F_CMD_ACCESS,
>>> -			mmio_read_from_hw, NULL);
>>> -
>>> -	MMIO_DFH(GEN7_GT_MODE, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(CACHE_MODE_0_GEN7, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
>>> -		NULL, NULL);
>>> -	MMIO_DFH(CACHE_MODE_1, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(CACHE_MODE_0, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x2124), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL=
);
>>> -
>>> -	MMIO_DFH(_MMIO(0x20dc), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL=
);
>>> -	MMIO_DFH(_3D_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x2088), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL=
);
>>> -	MMIO_DFH(FF_SLICE_CS_CHICKEN2, D_ALL,
>>> -		 F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x2470), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL=
);
>>> -	MMIO_DFH(GAM_ECOCHK, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(GEN7_COMMON_SLICE_CHICKEN1, D_ALL, F_MODE_MASK | F_CMD_ACCES=
S,
>>> -		NULL, NULL);
>>> -	MMIO_DFH(COMMON_SLICE_CHICKEN2, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
>>> -		 NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x9030), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x20a0), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x2420), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x2430), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x2434), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x2438), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x243c), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x7018), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL=
);
>>> -	MMIO_DFH(HALF_SLICE_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL=
, NULL);
>>> -	MMIO_DFH(GEN7_HALF_SLICE_CHICKEN1, D_ALL, F_MODE_MASK | F_CMD_ACCESS,=
 NULL, NULL);
>>> -
>>> -	/* display */
>>> -	MMIO_F(_MMIO(0x60220), 0x20, 0, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_D(_MMIO(0x602a0), D_ALL);
>>> -
>>> -	MMIO_D(_MMIO(0x65050), D_ALL);
>>> -	MMIO_D(_MMIO(0x650b4), D_ALL);
>>> -
>>> -	MMIO_D(_MMIO(0xc4040), D_ALL);
>>> -	MMIO_D(DERRMR, D_ALL);
>>> -
>>> -	MMIO_D(PIPEDSL(PIPE_A), D_ALL);
>>> -	MMIO_D(PIPEDSL(PIPE_B), D_ALL);
>>> -	MMIO_D(PIPEDSL(PIPE_C), D_ALL);
>>> -	MMIO_D(PIPEDSL(_PIPE_EDP), D_ALL);
>>> -
>>> -	MMIO_DH(PIPECONF(PIPE_A), D_ALL, NULL, pipeconf_mmio_write);
>>> -	MMIO_DH(PIPECONF(PIPE_B), D_ALL, NULL, pipeconf_mmio_write);
>>> -	MMIO_DH(PIPECONF(PIPE_C), D_ALL, NULL, pipeconf_mmio_write);
>>> -	MMIO_DH(PIPECONF(_PIPE_EDP), D_ALL, NULL, pipeconf_mmio_write);
>>> -
>>> -	MMIO_D(PIPESTAT(PIPE_A), D_ALL);
>>> -	MMIO_D(PIPESTAT(PIPE_B), D_ALL);
>>> -	MMIO_D(PIPESTAT(PIPE_C), D_ALL);
>>> -	MMIO_D(PIPESTAT(_PIPE_EDP), D_ALL);
>>> -
>>> -	MMIO_D(PIPE_FLIPCOUNT_G4X(PIPE_A), D_ALL);
>>> -	MMIO_D(PIPE_FLIPCOUNT_G4X(PIPE_B), D_ALL);
>>> -	MMIO_D(PIPE_FLIPCOUNT_G4X(PIPE_C), D_ALL);
>>> -	MMIO_D(PIPE_FLIPCOUNT_G4X(_PIPE_EDP), D_ALL);
>>> -
>>> -	MMIO_D(PIPE_FRMCOUNT_G4X(PIPE_A), D_ALL);
>>> -	MMIO_D(PIPE_FRMCOUNT_G4X(PIPE_B), D_ALL);
>>> -	MMIO_D(PIPE_FRMCOUNT_G4X(PIPE_C), D_ALL);
>>> -	MMIO_D(PIPE_FRMCOUNT_G4X(_PIPE_EDP), D_ALL);
>>> -
>>> -	MMIO_D(CURCNTR(PIPE_A), D_ALL);
>>> -	MMIO_D(CURCNTR(PIPE_B), D_ALL);
>>> -	MMIO_D(CURCNTR(PIPE_C), D_ALL);
>>> -
>>> -	MMIO_D(CURPOS(PIPE_A), D_ALL);
>>> -	MMIO_D(CURPOS(PIPE_B), D_ALL);
>>> -	MMIO_D(CURPOS(PIPE_C), D_ALL);
>>> -
>>> -	MMIO_D(CURBASE(PIPE_A), D_ALL);
>>> -	MMIO_D(CURBASE(PIPE_B), D_ALL);
>>> -	MMIO_D(CURBASE(PIPE_C), D_ALL);
>>> -
>>> -	MMIO_D(CUR_FBC_CTL(PIPE_A), D_ALL);
>>> -	MMIO_D(CUR_FBC_CTL(PIPE_B), D_ALL);
>>> -	MMIO_D(CUR_FBC_CTL(PIPE_C), D_ALL);
>>> -
>>> -	MMIO_D(_MMIO(0x700ac), D_ALL);
>>> -	MMIO_D(_MMIO(0x710ac), D_ALL);
>>> -	MMIO_D(_MMIO(0x720ac), D_ALL);
>>> -
>>> -	MMIO_D(_MMIO(0x70090), D_ALL);
>>> -	MMIO_D(_MMIO(0x70094), D_ALL);
>>> -	MMIO_D(_MMIO(0x70098), D_ALL);
>>> -	MMIO_D(_MMIO(0x7009c), D_ALL);
>>> -
>>> -	MMIO_D(DSPCNTR(PIPE_A), D_ALL);
>>> -	MMIO_D(DSPADDR(PIPE_A), D_ALL);
>>> -	MMIO_D(DSPSTRIDE(PIPE_A), D_ALL);
>>> -	MMIO_D(DSPPOS(PIPE_A), D_ALL);
>>> -	MMIO_D(DSPSIZE(PIPE_A), D_ALL);
>>> -	MMIO_DH(DSPSURF(PIPE_A), D_ALL, NULL, pri_surf_mmio_write);
>>> -	MMIO_D(DSPOFFSET(PIPE_A), D_ALL);
>>> -	MMIO_D(DSPSURFLIVE(PIPE_A), D_ALL);
>>> -	MMIO_DH(REG_50080(PIPE_A, PLANE_PRIMARY), D_ALL, NULL,
>>> -		reg50080_mmio_write);
>>> -
>>> -	MMIO_D(DSPCNTR(PIPE_B), D_ALL);
>>> -	MMIO_D(DSPADDR(PIPE_B), D_ALL);
>>> -	MMIO_D(DSPSTRIDE(PIPE_B), D_ALL);
>>> -	MMIO_D(DSPPOS(PIPE_B), D_ALL);
>>> -	MMIO_D(DSPSIZE(PIPE_B), D_ALL);
>>> -	MMIO_DH(DSPSURF(PIPE_B), D_ALL, NULL, pri_surf_mmio_write);
>>> -	MMIO_D(DSPOFFSET(PIPE_B), D_ALL);
>>> -	MMIO_D(DSPSURFLIVE(PIPE_B), D_ALL);
>>> -	MMIO_DH(REG_50080(PIPE_B, PLANE_PRIMARY), D_ALL, NULL,
>>> -		reg50080_mmio_write);
>>> -
>>> -	MMIO_D(DSPCNTR(PIPE_C), D_ALL);
>>> -	MMIO_D(DSPADDR(PIPE_C), D_ALL);
>>> -	MMIO_D(DSPSTRIDE(PIPE_C), D_ALL);
>>> -	MMIO_D(DSPPOS(PIPE_C), D_ALL);
>>> -	MMIO_D(DSPSIZE(PIPE_C), D_ALL);
>>> -	MMIO_DH(DSPSURF(PIPE_C), D_ALL, NULL, pri_surf_mmio_write);
>>> -	MMIO_D(DSPOFFSET(PIPE_C), D_ALL);
>>> -	MMIO_D(DSPSURFLIVE(PIPE_C), D_ALL);
>>> -	MMIO_DH(REG_50080(PIPE_C, PLANE_PRIMARY), D_ALL, NULL,
>>> -		reg50080_mmio_write);
>>> -
>>> -	MMIO_D(SPRCTL(PIPE_A), D_ALL);
>>> -	MMIO_D(SPRLINOFF(PIPE_A), D_ALL);
>>> -	MMIO_D(SPRSTRIDE(PIPE_A), D_ALL);
>>> -	MMIO_D(SPRPOS(PIPE_A), D_ALL);
>>> -	MMIO_D(SPRSIZE(PIPE_A), D_ALL);
>>> -	MMIO_D(SPRKEYVAL(PIPE_A), D_ALL);
>>> -	MMIO_D(SPRKEYMSK(PIPE_A), D_ALL);
>>> -	MMIO_DH(SPRSURF(PIPE_A), D_ALL, NULL, spr_surf_mmio_write);
>>> -	MMIO_D(SPRKEYMAX(PIPE_A), D_ALL);
>>> -	MMIO_D(SPROFFSET(PIPE_A), D_ALL);
>>> -	MMIO_D(SPRSCALE(PIPE_A), D_ALL);
>>> -	MMIO_D(SPRSURFLIVE(PIPE_A), D_ALL);
>>> -	MMIO_DH(REG_50080(PIPE_A, PLANE_SPRITE0), D_ALL, NULL,
>>> -		reg50080_mmio_write);
>>> -
>>> -	MMIO_D(SPRCTL(PIPE_B), D_ALL);
>>> -	MMIO_D(SPRLINOFF(PIPE_B), D_ALL);
>>> -	MMIO_D(SPRSTRIDE(PIPE_B), D_ALL);
>>> -	MMIO_D(SPRPOS(PIPE_B), D_ALL);
>>> -	MMIO_D(SPRSIZE(PIPE_B), D_ALL);
>>> -	MMIO_D(SPRKEYVAL(PIPE_B), D_ALL);
>>> -	MMIO_D(SPRKEYMSK(PIPE_B), D_ALL);
>>> -	MMIO_DH(SPRSURF(PIPE_B), D_ALL, NULL, spr_surf_mmio_write);
>>> -	MMIO_D(SPRKEYMAX(PIPE_B), D_ALL);
>>> -	MMIO_D(SPROFFSET(PIPE_B), D_ALL);
>>> -	MMIO_D(SPRSCALE(PIPE_B), D_ALL);
>>> -	MMIO_D(SPRSURFLIVE(PIPE_B), D_ALL);
>>> -	MMIO_DH(REG_50080(PIPE_B, PLANE_SPRITE0), D_ALL, NULL,
>>> -		reg50080_mmio_write);
>>> -
>>> -	MMIO_D(SPRCTL(PIPE_C), D_ALL);
>>> -	MMIO_D(SPRLINOFF(PIPE_C), D_ALL);
>>> -	MMIO_D(SPRSTRIDE(PIPE_C), D_ALL);
>>> -	MMIO_D(SPRPOS(PIPE_C), D_ALL);
>>> -	MMIO_D(SPRSIZE(PIPE_C), D_ALL);
>>> -	MMIO_D(SPRKEYVAL(PIPE_C), D_ALL);
>>> -	MMIO_D(SPRKEYMSK(PIPE_C), D_ALL);
>>> -	MMIO_DH(SPRSURF(PIPE_C), D_ALL, NULL, spr_surf_mmio_write);
>>> -	MMIO_D(SPRKEYMAX(PIPE_C), D_ALL);
>>> -	MMIO_D(SPROFFSET(PIPE_C), D_ALL);
>>> -	MMIO_D(SPRSCALE(PIPE_C), D_ALL);
>>> -	MMIO_D(SPRSURFLIVE(PIPE_C), D_ALL);
>>> -	MMIO_DH(REG_50080(PIPE_C, PLANE_SPRITE0), D_ALL, NULL,
>>> -		reg50080_mmio_write);
>>> -
>>> -	MMIO_D(HTOTAL(TRANSCODER_A), D_ALL);
>>> -	MMIO_D(HBLANK(TRANSCODER_A), D_ALL);
>>> -	MMIO_D(HSYNC(TRANSCODER_A), D_ALL);
>>> -	MMIO_D(VTOTAL(TRANSCODER_A), D_ALL);
>>> -	MMIO_D(VBLANK(TRANSCODER_A), D_ALL);
>>> -	MMIO_D(VSYNC(TRANSCODER_A), D_ALL);
>>> -	MMIO_D(BCLRPAT(TRANSCODER_A), D_ALL);
>>> -	MMIO_D(VSYNCSHIFT(TRANSCODER_A), D_ALL);
>>> -	MMIO_D(PIPESRC(TRANSCODER_A), D_ALL);
>>> -
>>> -	MMIO_D(HTOTAL(TRANSCODER_B), D_ALL);
>>> -	MMIO_D(HBLANK(TRANSCODER_B), D_ALL);
>>> -	MMIO_D(HSYNC(TRANSCODER_B), D_ALL);
>>> -	MMIO_D(VTOTAL(TRANSCODER_B), D_ALL);
>>> -	MMIO_D(VBLANK(TRANSCODER_B), D_ALL);
>>> -	MMIO_D(VSYNC(TRANSCODER_B), D_ALL);
>>> -	MMIO_D(BCLRPAT(TRANSCODER_B), D_ALL);
>>> -	MMIO_D(VSYNCSHIFT(TRANSCODER_B), D_ALL);
>>> -	MMIO_D(PIPESRC(TRANSCODER_B), D_ALL);
>>> -
>>> -	MMIO_D(HTOTAL(TRANSCODER_C), D_ALL);
>>> -	MMIO_D(HBLANK(TRANSCODER_C), D_ALL);
>>> -	MMIO_D(HSYNC(TRANSCODER_C), D_ALL);
>>> -	MMIO_D(VTOTAL(TRANSCODER_C), D_ALL);
>>> -	MMIO_D(VBLANK(TRANSCODER_C), D_ALL);
>>> -	MMIO_D(VSYNC(TRANSCODER_C), D_ALL);
>>> -	MMIO_D(BCLRPAT(TRANSCODER_C), D_ALL);
>>> -	MMIO_D(VSYNCSHIFT(TRANSCODER_C), D_ALL);
>>> -	MMIO_D(PIPESRC(TRANSCODER_C), D_ALL);
>>> -
>>> -	MMIO_D(HTOTAL(TRANSCODER_EDP), D_ALL);
>>> -	MMIO_D(HBLANK(TRANSCODER_EDP), D_ALL);
>>> -	MMIO_D(HSYNC(TRANSCODER_EDP), D_ALL);
>>> -	MMIO_D(VTOTAL(TRANSCODER_EDP), D_ALL);
>>> -	MMIO_D(VBLANK(TRANSCODER_EDP), D_ALL);
>>> -	MMIO_D(VSYNC(TRANSCODER_EDP), D_ALL);
>>> -	MMIO_D(BCLRPAT(TRANSCODER_EDP), D_ALL);
>>> -	MMIO_D(VSYNCSHIFT(TRANSCODER_EDP), D_ALL);
>>> -
>>> -	MMIO_D(PIPE_DATA_M1(TRANSCODER_A), D_ALL);
>>> -	MMIO_D(PIPE_DATA_N1(TRANSCODER_A), D_ALL);
>>> -	MMIO_D(PIPE_DATA_M2(TRANSCODER_A), D_ALL);
>>> -	MMIO_D(PIPE_DATA_N2(TRANSCODER_A), D_ALL);
>>> -	MMIO_D(PIPE_LINK_M1(TRANSCODER_A), D_ALL);
>>> -	MMIO_D(PIPE_LINK_N1(TRANSCODER_A), D_ALL);
>>> -	MMIO_D(PIPE_LINK_M2(TRANSCODER_A), D_ALL);
>>> -	MMIO_D(PIPE_LINK_N2(TRANSCODER_A), D_ALL);
>>> -
>>> -	MMIO_D(PIPE_DATA_M1(TRANSCODER_B), D_ALL);
>>> -	MMIO_D(PIPE_DATA_N1(TRANSCODER_B), D_ALL);
>>> -	MMIO_D(PIPE_DATA_M2(TRANSCODER_B), D_ALL);
>>> -	MMIO_D(PIPE_DATA_N2(TRANSCODER_B), D_ALL);
>>> -	MMIO_D(PIPE_LINK_M1(TRANSCODER_B), D_ALL);
>>> -	MMIO_D(PIPE_LINK_N1(TRANSCODER_B), D_ALL);
>>> -	MMIO_D(PIPE_LINK_M2(TRANSCODER_B), D_ALL);
>>> -	MMIO_D(PIPE_LINK_N2(TRANSCODER_B), D_ALL);
>>> -
>>> -	MMIO_D(PIPE_DATA_M1(TRANSCODER_C), D_ALL);
>>> -	MMIO_D(PIPE_DATA_N1(TRANSCODER_C), D_ALL);
>>> -	MMIO_D(PIPE_DATA_M2(TRANSCODER_C), D_ALL);
>>> -	MMIO_D(PIPE_DATA_N2(TRANSCODER_C), D_ALL);
>>> -	MMIO_D(PIPE_LINK_M1(TRANSCODER_C), D_ALL);
>>> -	MMIO_D(PIPE_LINK_N1(TRANSCODER_C), D_ALL);
>>> -	MMIO_D(PIPE_LINK_M2(TRANSCODER_C), D_ALL);
>>> -	MMIO_D(PIPE_LINK_N2(TRANSCODER_C), D_ALL);
>>> -
>>> -	MMIO_D(PIPE_DATA_M1(TRANSCODER_EDP), D_ALL);
>>> -	MMIO_D(PIPE_DATA_N1(TRANSCODER_EDP), D_ALL);
>>> -	MMIO_D(PIPE_DATA_M2(TRANSCODER_EDP), D_ALL);
>>> -	MMIO_D(PIPE_DATA_N2(TRANSCODER_EDP), D_ALL);
>>> -	MMIO_D(PIPE_LINK_M1(TRANSCODER_EDP), D_ALL);
>>> -	MMIO_D(PIPE_LINK_N1(TRANSCODER_EDP), D_ALL);
>>> -	MMIO_D(PIPE_LINK_M2(TRANSCODER_EDP), D_ALL);
>>> -	MMIO_D(PIPE_LINK_N2(TRANSCODER_EDP), D_ALL);
>>> -
>>> -	MMIO_D(PF_CTL(PIPE_A), D_ALL);
>>> -	MMIO_D(PF_WIN_SZ(PIPE_A), D_ALL);
>>> -	MMIO_D(PF_WIN_POS(PIPE_A), D_ALL);
>>> -	MMIO_D(PF_VSCALE(PIPE_A), D_ALL);
>>> -	MMIO_D(PF_HSCALE(PIPE_A), D_ALL);
>>> -
>>> -	MMIO_D(PF_CTL(PIPE_B), D_ALL);
>>> -	MMIO_D(PF_WIN_SZ(PIPE_B), D_ALL);
>>> -	MMIO_D(PF_WIN_POS(PIPE_B), D_ALL);
>>> -	MMIO_D(PF_VSCALE(PIPE_B), D_ALL);
>>> -	MMIO_D(PF_HSCALE(PIPE_B), D_ALL);
>>> -
>>> -	MMIO_D(PF_CTL(PIPE_C), D_ALL);
>>> -	MMIO_D(PF_WIN_SZ(PIPE_C), D_ALL);
>>> -	MMIO_D(PF_WIN_POS(PIPE_C), D_ALL);
>>> -	MMIO_D(PF_VSCALE(PIPE_C), D_ALL);
>>> -	MMIO_D(PF_HSCALE(PIPE_C), D_ALL);
>>> -
>>> -	MMIO_D(WM0_PIPE_ILK(PIPE_A), D_ALL);
>>> -	MMIO_D(WM0_PIPE_ILK(PIPE_B), D_ALL);
>>> -	MMIO_D(WM0_PIPE_ILK(PIPE_C), D_ALL);
>>> -	MMIO_D(WM1_LP_ILK, D_ALL);
>>> -	MMIO_D(WM2_LP_ILK, D_ALL);
>>> -	MMIO_D(WM3_LP_ILK, D_ALL);
>>> -	MMIO_D(WM1S_LP_ILK, D_ALL);
>>> -	MMIO_D(WM2S_LP_IVB, D_ALL);
>>> -	MMIO_D(WM3S_LP_IVB, D_ALL);
>>> -
>>> -	MMIO_D(BLC_PWM_CPU_CTL2, D_ALL);
>>> -	MMIO_D(BLC_PWM_CPU_CTL, D_ALL);
>>> -	MMIO_D(BLC_PWM_PCH_CTL1, D_ALL);
>>> -	MMIO_D(BLC_PWM_PCH_CTL2, D_ALL);
>>> -
>>> -	MMIO_D(_MMIO(0x48268), D_ALL);
>>> -
>>> -	MMIO_F(PCH_GMBUS0, 4 * 4, 0, 0, 0, D_ALL, gmbus_mmio_read,
>>> -		gmbus_mmio_write);
>>> -	MMIO_F(PCH_GPIO_BASE, 6 * 4, F_UNALIGN, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(_MMIO(0xe4f00), 0x28, 0, 0, 0, D_ALL, NULL, NULL);
>>> -
>>> -	MMIO_F(_MMIO(_PCH_DPB_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_PRE_SKL, NULL,
>>> -		dp_aux_ch_ctl_mmio_write);
>>> -	MMIO_F(_MMIO(_PCH_DPC_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_PRE_SKL, NULL,
>>> -		dp_aux_ch_ctl_mmio_write);
>>> -	MMIO_F(_MMIO(_PCH_DPD_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_PRE_SKL, NULL,
>>> -		dp_aux_ch_ctl_mmio_write);
>>> -
>>> -	MMIO_DH(PCH_ADPA, D_PRE_SKL, NULL, pch_adpa_mmio_write);
>>> -
>>> -	MMIO_DH(_MMIO(_PCH_TRANSACONF), D_ALL, NULL, transconf_mmio_write);
>>> -	MMIO_DH(_MMIO(_PCH_TRANSBCONF), D_ALL, NULL, transconf_mmio_write);
>>> -
>>> -	MMIO_DH(FDI_RX_IIR(PIPE_A), D_ALL, NULL, fdi_rx_iir_mmio_write);
>>> -	MMIO_DH(FDI_RX_IIR(PIPE_B), D_ALL, NULL, fdi_rx_iir_mmio_write);
>>> -	MMIO_DH(FDI_RX_IIR(PIPE_C), D_ALL, NULL, fdi_rx_iir_mmio_write);
>>> -	MMIO_DH(FDI_RX_IMR(PIPE_A), D_ALL, NULL, update_fdi_rx_iir_status);
>>> -	MMIO_DH(FDI_RX_IMR(PIPE_B), D_ALL, NULL, update_fdi_rx_iir_status);
>>> -	MMIO_DH(FDI_RX_IMR(PIPE_C), D_ALL, NULL, update_fdi_rx_iir_status);
>>> -	MMIO_DH(FDI_RX_CTL(PIPE_A), D_ALL, NULL, update_fdi_rx_iir_status);
>>> -	MMIO_DH(FDI_RX_CTL(PIPE_B), D_ALL, NULL, update_fdi_rx_iir_status);
>>> -	MMIO_DH(FDI_RX_CTL(PIPE_C), D_ALL, NULL, update_fdi_rx_iir_status);
>>> -
>>> -	MMIO_D(_MMIO(_PCH_TRANS_HTOTAL_A), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANS_HBLANK_A), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANS_HSYNC_A), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANS_VTOTAL_A), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANS_VBLANK_A), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANS_VSYNC_A), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANS_VSYNCSHIFT_A), D_ALL);
>>> -
>>> -	MMIO_D(_MMIO(_PCH_TRANS_HTOTAL_B), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANS_HBLANK_B), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANS_HSYNC_B), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANS_VTOTAL_B), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANS_VBLANK_B), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANS_VSYNC_B), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANS_VSYNCSHIFT_B), D_ALL);
>>> -
>>> -	MMIO_D(_MMIO(_PCH_TRANSA_DATA_M1), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANSA_DATA_N1), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANSA_DATA_M2), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANSA_DATA_N2), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANSA_LINK_M1), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANSA_LINK_N1), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANSA_LINK_M2), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_TRANSA_LINK_N2), D_ALL);
>>> -
>>> -	MMIO_D(TRANS_DP_CTL(PIPE_A), D_ALL);
>>> -	MMIO_D(TRANS_DP_CTL(PIPE_B), D_ALL);
>>> -	MMIO_D(TRANS_DP_CTL(PIPE_C), D_ALL);
>>> -
>>> -	MMIO_D(TVIDEO_DIP_CTL(PIPE_A), D_ALL);
>>> -	MMIO_D(TVIDEO_DIP_DATA(PIPE_A), D_ALL);
>>> -	MMIO_D(TVIDEO_DIP_GCP(PIPE_A), D_ALL);
>>> -
>>> -	MMIO_D(TVIDEO_DIP_CTL(PIPE_B), D_ALL);
>>> -	MMIO_D(TVIDEO_DIP_DATA(PIPE_B), D_ALL);
>>> -	MMIO_D(TVIDEO_DIP_GCP(PIPE_B), D_ALL);
>>> -
>>> -	MMIO_D(TVIDEO_DIP_CTL(PIPE_C), D_ALL);
>>> -	MMIO_D(TVIDEO_DIP_DATA(PIPE_C), D_ALL);
>>> -	MMIO_D(TVIDEO_DIP_GCP(PIPE_C), D_ALL);
>>> -
>>> -	MMIO_D(_MMIO(_FDI_RXA_MISC), D_ALL);
>>> -	MMIO_D(_MMIO(_FDI_RXB_MISC), D_ALL);
>>> -	MMIO_D(_MMIO(_FDI_RXA_TUSIZE1), D_ALL);
>>> -	MMIO_D(_MMIO(_FDI_RXA_TUSIZE2), D_ALL);
>>> -	MMIO_D(_MMIO(_FDI_RXB_TUSIZE1), D_ALL);
>>> -	MMIO_D(_MMIO(_FDI_RXB_TUSIZE2), D_ALL);
>>> -
>>> -	MMIO_DH(PCH_PP_CONTROL, D_ALL, NULL, pch_pp_control_mmio_write);
>>> -	MMIO_D(PCH_PP_DIVISOR, D_ALL);
>>> -	MMIO_D(PCH_PP_STATUS,  D_ALL);
>>> -	MMIO_D(PCH_LVDS, D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_DPLL_A), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_DPLL_B), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_FPA0), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_FPA1), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_FPB0), D_ALL);
>>> -	MMIO_D(_MMIO(_PCH_FPB1), D_ALL);
>>> -	MMIO_D(PCH_DREF_CONTROL, D_ALL);
>>> -	MMIO_D(PCH_RAWCLK_FREQ, D_ALL);
>>> -	MMIO_D(PCH_DPLL_SEL, D_ALL);
>>> -
>>> -	MMIO_D(_MMIO(0x61208), D_ALL);
>>> -	MMIO_D(_MMIO(0x6120c), D_ALL);
>>> -	MMIO_D(PCH_PP_ON_DELAYS, D_ALL);
>>> -	MMIO_D(PCH_PP_OFF_DELAYS, D_ALL);
>>> -
>>> -	MMIO_DH(_MMIO(0xe651c), D_ALL, dpy_reg_mmio_read, NULL);
>>> -	MMIO_DH(_MMIO(0xe661c), D_ALL, dpy_reg_mmio_read, NULL);
>>> -	MMIO_DH(_MMIO(0xe671c), D_ALL, dpy_reg_mmio_read, NULL);
>>> -	MMIO_DH(_MMIO(0xe681c), D_ALL, dpy_reg_mmio_read, NULL);
>>> -	MMIO_DH(_MMIO(0xe6c04), D_ALL, dpy_reg_mmio_read, NULL);
>>> -	MMIO_DH(_MMIO(0xe6e1c), D_ALL, dpy_reg_mmio_read, NULL);
>>> -
>>> -	MMIO_RO(PCH_PORT_HOTPLUG, D_ALL, 0,
>>> -		PORTA_HOTPLUG_STATUS_MASK
>>> -		| PORTB_HOTPLUG_STATUS_MASK
>>> -		| PORTC_HOTPLUG_STATUS_MASK
>>> -		| PORTD_HOTPLUG_STATUS_MASK,
>>> -		NULL, NULL);
>>> -
>>> -	MMIO_DH(LCPLL_CTL, D_ALL, NULL, lcpll_ctl_mmio_write);
>>> -	MMIO_D(FUSE_STRAP, D_ALL);
>>> -	MMIO_D(DIGITAL_PORT_HOTPLUG_CNTRL, D_ALL);
>>> -
>>> -	MMIO_D(DISP_ARB_CTL, D_ALL);
>>> -	MMIO_D(DISP_ARB_CTL2, D_ALL);
>>> -
>>> -	MMIO_D(ILK_DISPLAY_CHICKEN1, D_ALL);
>>> -	MMIO_D(ILK_DISPLAY_CHICKEN2, D_ALL);
>>> -	MMIO_D(ILK_DSPCLK_GATE_D, D_ALL);
>>> -
>>> -	MMIO_D(SOUTH_CHICKEN1, D_ALL);
>>> -	MMIO_DH(SOUTH_CHICKEN2, D_ALL, NULL, south_chicken2_mmio_write);
>>> -	MMIO_D(_MMIO(_TRANSA_CHICKEN1), D_ALL);
>>> -	MMIO_D(_MMIO(_TRANSB_CHICKEN1), D_ALL);
>>> -	MMIO_D(SOUTH_DSPCLK_GATE_D, D_ALL);
>>> -	MMIO_D(_MMIO(_TRANSA_CHICKEN2), D_ALL);
>>> -	MMIO_D(_MMIO(_TRANSB_CHICKEN2), D_ALL);
>>> -
>>> -	MMIO_D(ILK_DPFC_CB_BASE, D_ALL);
>>> -	MMIO_D(ILK_DPFC_CONTROL, D_ALL);
>>> -	MMIO_D(ILK_DPFC_RECOMP_CTL, D_ALL);
>>> -	MMIO_D(ILK_DPFC_STATUS, D_ALL);
>>> -	MMIO_D(ILK_DPFC_FENCE_YOFF, D_ALL);
>>> -	MMIO_D(ILK_DPFC_CHICKEN, D_ALL);
>>> -	MMIO_D(ILK_FBC_RT_BASE, D_ALL);
>>> -
>>> -	MMIO_D(IPS_CTL, D_ALL);
>>> -
>>> -	MMIO_D(PIPE_CSC_COEFF_RY_GY(PIPE_A), D_ALL);
>>> -	MMIO_D(PIPE_CSC_COEFF_BY(PIPE_A), D_ALL);
>>> -	MMIO_D(PIPE_CSC_COEFF_RU_GU(PIPE_A), D_ALL);
>>> -	MMIO_D(PIPE_CSC_COEFF_BU(PIPE_A), D_ALL);
>>> -	MMIO_D(PIPE_CSC_COEFF_RV_GV(PIPE_A), D_ALL);
>>> -	MMIO_D(PIPE_CSC_COEFF_BV(PIPE_A), D_ALL);
>>> -	MMIO_D(PIPE_CSC_MODE(PIPE_A), D_ALL);
>>> -	MMIO_D(PIPE_CSC_PREOFF_HI(PIPE_A), D_ALL);
>>> -	MMIO_D(PIPE_CSC_PREOFF_ME(PIPE_A), D_ALL);
>>> -	MMIO_D(PIPE_CSC_PREOFF_LO(PIPE_A), D_ALL);
>>> -	MMIO_D(PIPE_CSC_POSTOFF_HI(PIPE_A), D_ALL);
>>> -	MMIO_D(PIPE_CSC_POSTOFF_ME(PIPE_A), D_ALL);
>>> -	MMIO_D(PIPE_CSC_POSTOFF_LO(PIPE_A), D_ALL);
>>> -
>>> -	MMIO_D(PIPE_CSC_COEFF_RY_GY(PIPE_B), D_ALL);
>>> -	MMIO_D(PIPE_CSC_COEFF_BY(PIPE_B), D_ALL);
>>> -	MMIO_D(PIPE_CSC_COEFF_RU_GU(PIPE_B), D_ALL);
>>> -	MMIO_D(PIPE_CSC_COEFF_BU(PIPE_B), D_ALL);
>>> -	MMIO_D(PIPE_CSC_COEFF_RV_GV(PIPE_B), D_ALL);
>>> -	MMIO_D(PIPE_CSC_COEFF_BV(PIPE_B), D_ALL);
>>> -	MMIO_D(PIPE_CSC_MODE(PIPE_B), D_ALL);
>>> -	MMIO_D(PIPE_CSC_PREOFF_HI(PIPE_B), D_ALL);
>>> -	MMIO_D(PIPE_CSC_PREOFF_ME(PIPE_B), D_ALL);
>>> -	MMIO_D(PIPE_CSC_PREOFF_LO(PIPE_B), D_ALL);
>>> -	MMIO_D(PIPE_CSC_POSTOFF_HI(PIPE_B), D_ALL);
>>> -	MMIO_D(PIPE_CSC_POSTOFF_ME(PIPE_B), D_ALL);
>>> -	MMIO_D(PIPE_CSC_POSTOFF_LO(PIPE_B), D_ALL);
>>> -
>>> -	MMIO_D(PIPE_CSC_COEFF_RY_GY(PIPE_C), D_ALL);
>>> -	MMIO_D(PIPE_CSC_COEFF_BY(PIPE_C), D_ALL);
>>> -	MMIO_D(PIPE_CSC_COEFF_RU_GU(PIPE_C), D_ALL);
>>> -	MMIO_D(PIPE_CSC_COEFF_BU(PIPE_C), D_ALL);
>>> -	MMIO_D(PIPE_CSC_COEFF_RV_GV(PIPE_C), D_ALL);
>>> -	MMIO_D(PIPE_CSC_COEFF_BV(PIPE_C), D_ALL);
>>> -	MMIO_D(PIPE_CSC_MODE(PIPE_C), D_ALL);
>>> -	MMIO_D(PIPE_CSC_PREOFF_HI(PIPE_C), D_ALL);
>>> -	MMIO_D(PIPE_CSC_PREOFF_ME(PIPE_C), D_ALL);
>>> -	MMIO_D(PIPE_CSC_PREOFF_LO(PIPE_C), D_ALL);
>>> -	MMIO_D(PIPE_CSC_POSTOFF_HI(PIPE_C), D_ALL);
>>> -	MMIO_D(PIPE_CSC_POSTOFF_ME(PIPE_C), D_ALL);
>>> -	MMIO_D(PIPE_CSC_POSTOFF_LO(PIPE_C), D_ALL);
>>> -
>>> -	MMIO_D(PREC_PAL_INDEX(PIPE_A), D_ALL);
>>> -	MMIO_D(PREC_PAL_DATA(PIPE_A), D_ALL);
>>> -	MMIO_F(PREC_PAL_GC_MAX(PIPE_A, 0), 4 * 3, 0, 0, 0, D_ALL, NULL, NULL);
>>> -
>>> -	MMIO_D(PREC_PAL_INDEX(PIPE_B), D_ALL);
>>> -	MMIO_D(PREC_PAL_DATA(PIPE_B), D_ALL);
>>> -	MMIO_F(PREC_PAL_GC_MAX(PIPE_B, 0), 4 * 3, 0, 0, 0, D_ALL, NULL, NULL);
>>> -
>>> -	MMIO_D(PREC_PAL_INDEX(PIPE_C), D_ALL);
>>> -	MMIO_D(PREC_PAL_DATA(PIPE_C), D_ALL);
>>> -	MMIO_F(PREC_PAL_GC_MAX(PIPE_C, 0), 4 * 3, 0, 0, 0, D_ALL, NULL, NULL);
>>> -
>>> -	MMIO_D(_MMIO(0x60110), D_ALL);
>>> -	MMIO_D(_MMIO(0x61110), D_ALL);
>>> -	MMIO_F(_MMIO(0x70400), 0x40, 0, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(_MMIO(0x71400), 0x40, 0, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(_MMIO(0x72400), 0x40, 0, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(_MMIO(0x70440), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
>>> -	MMIO_F(_MMIO(0x71440), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
>>> -	MMIO_F(_MMIO(0x72440), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
>>> -	MMIO_F(_MMIO(0x7044c), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
>>> -	MMIO_F(_MMIO(0x7144c), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
>>> -	MMIO_F(_MMIO(0x7244c), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
>>> -
>>> -	MMIO_D(WM_LINETIME(PIPE_A), D_ALL);
>>> -	MMIO_D(WM_LINETIME(PIPE_B), D_ALL);
>>> -	MMIO_D(WM_LINETIME(PIPE_C), D_ALL);
>>> -	MMIO_D(SPLL_CTL, D_ALL);
>>> -	MMIO_D(_MMIO(_WRPLL_CTL1), D_ALL);
>>> -	MMIO_D(_MMIO(_WRPLL_CTL2), D_ALL);
>>> -	MMIO_D(PORT_CLK_SEL(PORT_A), D_ALL);
>>> -	MMIO_D(PORT_CLK_SEL(PORT_B), D_ALL);
>>> -	MMIO_D(PORT_CLK_SEL(PORT_C), D_ALL);
>>> -	MMIO_D(PORT_CLK_SEL(PORT_D), D_ALL);
>>> -	MMIO_D(PORT_CLK_SEL(PORT_E), D_ALL);
>>> -	MMIO_D(TRANS_CLK_SEL(TRANSCODER_A), D_ALL);
>>> -	MMIO_D(TRANS_CLK_SEL(TRANSCODER_B), D_ALL);
>>> -	MMIO_D(TRANS_CLK_SEL(TRANSCODER_C), D_ALL);
>>> -
>>> -	MMIO_D(HSW_NDE_RSTWRN_OPT, D_ALL);
>>> -	MMIO_D(_MMIO(0x46508), D_ALL);
>>> -
>>> -	MMIO_D(_MMIO(0x49080), D_ALL);
>>> -	MMIO_D(_MMIO(0x49180), D_ALL);
>>> -	MMIO_D(_MMIO(0x49280), D_ALL);
>>> -
>>> -	MMIO_F(_MMIO(0x49090), 0x14, 0, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(_MMIO(0x49190), 0x14, 0, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(_MMIO(0x49290), 0x14, 0, 0, 0, D_ALL, NULL, NULL);
>>> -
>>> -	MMIO_D(GAMMA_MODE(PIPE_A), D_ALL);
>>> -	MMIO_D(GAMMA_MODE(PIPE_B), D_ALL);
>>> -	MMIO_D(GAMMA_MODE(PIPE_C), D_ALL);
>>> -
>>> -	MMIO_D(PIPE_MULT(PIPE_A), D_ALL);
>>> -	MMIO_D(PIPE_MULT(PIPE_B), D_ALL);
>>> -	MMIO_D(PIPE_MULT(PIPE_C), D_ALL);
>>> -
>>> -	MMIO_D(HSW_TVIDEO_DIP_CTL(TRANSCODER_A), D_ALL);
>>> -	MMIO_D(HSW_TVIDEO_DIP_CTL(TRANSCODER_B), D_ALL);
>>> -	MMIO_D(HSW_TVIDEO_DIP_CTL(TRANSCODER_C), D_ALL);
>>> -
>>> -	MMIO_DH(SFUSE_STRAP, D_ALL, NULL, NULL);
>>> -	MMIO_D(SBI_ADDR, D_ALL);
>>> -	MMIO_DH(SBI_DATA, D_ALL, sbi_data_mmio_read, NULL);
>>> -	MMIO_DH(SBI_CTL_STAT, D_ALL, NULL, sbi_ctl_mmio_write);
>>> -	MMIO_D(PIXCLK_GATE, D_ALL);
>>> -
>>> -	MMIO_F(_MMIO(_DPA_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_ALL, NULL,
>>> -		dp_aux_ch_ctl_mmio_write);
>>> -
>>> -	MMIO_DH(DDI_BUF_CTL(PORT_A), D_ALL, NULL, ddi_buf_ctl_mmio_write);
>>> -	MMIO_DH(DDI_BUF_CTL(PORT_B), D_ALL, NULL, ddi_buf_ctl_mmio_write);
>>> -	MMIO_DH(DDI_BUF_CTL(PORT_C), D_ALL, NULL, ddi_buf_ctl_mmio_write);
>>> -	MMIO_DH(DDI_BUF_CTL(PORT_D), D_ALL, NULL, ddi_buf_ctl_mmio_write);
>>> -	MMIO_DH(DDI_BUF_CTL(PORT_E), D_ALL, NULL, ddi_buf_ctl_mmio_write);
>>> -
>>> -	MMIO_DH(DP_TP_CTL(PORT_A), D_ALL, NULL, dp_tp_ctl_mmio_write);
>>> -	MMIO_DH(DP_TP_CTL(PORT_B), D_ALL, NULL, dp_tp_ctl_mmio_write);
>>> -	MMIO_DH(DP_TP_CTL(PORT_C), D_ALL, NULL, dp_tp_ctl_mmio_write);
>>> -	MMIO_DH(DP_TP_CTL(PORT_D), D_ALL, NULL, dp_tp_ctl_mmio_write);
>>> -	MMIO_DH(DP_TP_CTL(PORT_E), D_ALL, NULL, dp_tp_ctl_mmio_write);
>>> -
>>> -	MMIO_DH(DP_TP_STATUS(PORT_A), D_ALL, NULL, dp_tp_status_mmio_write);
>>> -	MMIO_DH(DP_TP_STATUS(PORT_B), D_ALL, NULL, dp_tp_status_mmio_write);
>>> -	MMIO_DH(DP_TP_STATUS(PORT_C), D_ALL, NULL, dp_tp_status_mmio_write);
>>> -	MMIO_DH(DP_TP_STATUS(PORT_D), D_ALL, NULL, dp_tp_status_mmio_write);
>>> -	MMIO_DH(DP_TP_STATUS(PORT_E), D_ALL, NULL, NULL);
>>> -
>>> -	MMIO_F(_MMIO(_DDI_BUF_TRANS_A), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(_MMIO(0x64e60), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(_MMIO(0x64eC0), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(_MMIO(0x64f20), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(_MMIO(0x64f80), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
>>> -
>>> -	MMIO_D(HSW_AUD_CFG(PIPE_A), D_ALL);
>>> -	MMIO_D(HSW_AUD_PIN_ELD_CP_VLD, D_ALL);
>>> -	MMIO_D(HSW_AUD_MISC_CTRL(PIPE_A), D_ALL);
>>> -
>>> -	MMIO_DH(_MMIO(_TRANS_DDI_FUNC_CTL_A), D_ALL, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_TRANS_DDI_FUNC_CTL_B), D_ALL, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_TRANS_DDI_FUNC_CTL_C), D_ALL, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_TRANS_DDI_FUNC_CTL_EDP), D_ALL, NULL, NULL);
>>> -
>>> -	MMIO_D(_MMIO(_TRANSA_MSA_MISC), D_ALL);
>>> -	MMIO_D(_MMIO(_TRANSB_MSA_MISC), D_ALL);
>>> -	MMIO_D(_MMIO(_TRANSC_MSA_MISC), D_ALL);
>>> -	MMIO_D(_MMIO(_TRANS_EDP_MSA_MISC), D_ALL);
>>> -
>>> -	MMIO_DH(FORCEWAKE, D_ALL, NULL, NULL);
>>> -	MMIO_D(FORCEWAKE_ACK, D_ALL);
>>> -	MMIO_D(GEN6_GT_CORE_STATUS, D_ALL);
>>> -	MMIO_D(GEN6_GT_THREAD_STATUS_REG, D_ALL);
>>> -	MMIO_DFH(GTFIFODBG, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(GTFIFOCTL, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DH(FORCEWAKE_MT, D_PRE_SKL, NULL, mul_force_wake_write);
>>> -	MMIO_DH(FORCEWAKE_ACK_HSW, D_BDW, NULL, NULL);
>>> -	MMIO_D(ECOBUS, D_ALL);
>>> -	MMIO_DH(GEN6_RC_CONTROL, D_ALL, NULL, NULL);
>>> -	MMIO_DH(GEN6_RC_STATE, D_ALL, NULL, NULL);
>>> -	MMIO_D(GEN6_RPNSWREQ, D_ALL);
>>> -	MMIO_D(GEN6_RC_VIDEO_FREQ, D_ALL);
>>> -	MMIO_D(GEN6_RP_DOWN_TIMEOUT, D_ALL);
>>> -	MMIO_D(GEN6_RP_INTERRUPT_LIMITS, D_ALL);
>>> -	MMIO_D(GEN6_RPSTAT1, D_ALL);
>>> -	MMIO_D(GEN6_RP_CONTROL, D_ALL);
>>> -	MMIO_D(GEN6_RP_UP_THRESHOLD, D_ALL);
>>> -	MMIO_D(GEN6_RP_DOWN_THRESHOLD, D_ALL);
>>> -	MMIO_D(GEN6_RP_CUR_UP_EI, D_ALL);
>>> -	MMIO_D(GEN6_RP_CUR_UP, D_ALL);
>>> -	MMIO_D(GEN6_RP_PREV_UP, D_ALL);
>>> -	MMIO_D(GEN6_RP_CUR_DOWN_EI, D_ALL);
>>> -	MMIO_D(GEN6_RP_CUR_DOWN, D_ALL);
>>> -	MMIO_D(GEN6_RP_PREV_DOWN, D_ALL);
>>> -	MMIO_D(GEN6_RP_UP_EI, D_ALL);
>>> -	MMIO_D(GEN6_RP_DOWN_EI, D_ALL);
>>> -	MMIO_D(GEN6_RP_IDLE_HYSTERSIS, D_ALL);
>>> -	MMIO_D(GEN6_RC1_WAKE_RATE_LIMIT, D_ALL);
>>> -	MMIO_D(GEN6_RC6_WAKE_RATE_LIMIT, D_ALL);
>>> -	MMIO_D(GEN6_RC6pp_WAKE_RATE_LIMIT, D_ALL);
>>> -	MMIO_D(GEN6_RC_EVALUATION_INTERVAL, D_ALL);
>>> -	MMIO_D(GEN6_RC_IDLE_HYSTERSIS, D_ALL);
>>> -	MMIO_D(GEN6_RC_SLEEP, D_ALL);
>>> -	MMIO_D(GEN6_RC1e_THRESHOLD, D_ALL);
>>> -	MMIO_D(GEN6_RC6_THRESHOLD, D_ALL);
>>> -	MMIO_D(GEN6_RC6p_THRESHOLD, D_ALL);
>>> -	MMIO_D(GEN6_RC6pp_THRESHOLD, D_ALL);
>>> -	MMIO_D(GEN6_PMINTRMSK, D_ALL);
>>> -	MMIO_DH(HSW_PWR_WELL_CTL1, D_BDW, NULL, power_well_ctl_mmio_write);
>>> -	MMIO_DH(HSW_PWR_WELL_CTL2, D_BDW, NULL, power_well_ctl_mmio_write);
>>> -	MMIO_DH(HSW_PWR_WELL_CTL3, D_BDW, NULL, power_well_ctl_mmio_write);
>>> -	MMIO_DH(HSW_PWR_WELL_CTL4, D_BDW, NULL, power_well_ctl_mmio_write);
>>> -	MMIO_DH(HSW_PWR_WELL_CTL5, D_BDW, NULL, power_well_ctl_mmio_write);
>>> -	MMIO_DH(HSW_PWR_WELL_CTL6, D_BDW, NULL, power_well_ctl_mmio_write);
>>> -
>>> -	MMIO_D(RSTDBYCTL, D_ALL);
>>> -
>>> -	MMIO_DH(GEN6_GDRST, D_ALL, NULL, gdrst_mmio_write);
>>> -	MMIO_F(FENCE_REG_GEN6_LO(0), 0x80, 0, 0, 0, D_ALL, fence_mmio_read, f=
ence_mmio_write);
>>> -	MMIO_DH(CPU_VGACNTRL, D_ALL, NULL, vga_control_mmio_write);
>>> -
>>> -	MMIO_D(TILECTL, D_ALL);
>>> -
>>> -	MMIO_D(GEN6_UCGCTL1, D_ALL);
>>> -	MMIO_D(GEN6_UCGCTL2, D_ALL);
>>> -
>>> -	MMIO_F(_MMIO(0x4f000), 0x90, 0, 0, 0, D_ALL, NULL, NULL);
>>> -
>>> -	MMIO_D(GEN6_PCODE_DATA, D_ALL);
>>> -	MMIO_D(_MMIO(0x13812c), D_ALL);
>>> -	MMIO_DH(GEN7_ERR_INT, D_ALL, NULL, NULL);
>>> -	MMIO_D(HSW_EDRAM_CAP, D_ALL);
>>> -	MMIO_D(HSW_IDICR, D_ALL);
>>> -	MMIO_DH(GFX_FLSH_CNTL_GEN6, D_ALL, NULL, NULL);
>>> -
>>> -	MMIO_D(_MMIO(0x3c), D_ALL);
>>> -	MMIO_D(_MMIO(0x860), D_ALL);
>>> -	MMIO_D(ECOSKPD, D_ALL);
>>> -	MMIO_D(_MMIO(0x121d0), D_ALL);
>>> -	MMIO_D(GEN6_BLITTER_ECOSKPD, D_ALL);
>>> -	MMIO_D(_MMIO(0x41d0), D_ALL);
>>> -	MMIO_D(GAC_ECO_BITS, D_ALL);
>>> -	MMIO_D(_MMIO(0x6200), D_ALL);
>>> -	MMIO_D(_MMIO(0x6204), D_ALL);
>>> -	MMIO_D(_MMIO(0x6208), D_ALL);
>>> -	MMIO_D(_MMIO(0x7118), D_ALL);
>>> -	MMIO_D(_MMIO(0x7180), D_ALL);
>>> -	MMIO_D(_MMIO(0x7408), D_ALL);
>>> -	MMIO_D(_MMIO(0x7c00), D_ALL);
>>> -	MMIO_DH(GEN6_MBCTL, D_ALL, NULL, mbctl_write);
>>> -	MMIO_D(_MMIO(0x911c), D_ALL);
>>> -	MMIO_D(_MMIO(0x9120), D_ALL);
>>> -	MMIO_DFH(GEN7_UCGCTL4, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -
>>> -	MMIO_D(GAB_CTL, D_ALL);
>>> -	MMIO_D(_MMIO(0x48800), D_ALL);
>>> -	MMIO_D(_MMIO(0xce044), D_ALL);
>>> -	MMIO_D(_MMIO(0xe6500), D_ALL);
>>> -	MMIO_D(_MMIO(0xe6504), D_ALL);
>>> -	MMIO_D(_MMIO(0xe6600), D_ALL);
>>> -	MMIO_D(_MMIO(0xe6604), D_ALL);
>>> -	MMIO_D(_MMIO(0xe6700), D_ALL);
>>> -	MMIO_D(_MMIO(0xe6704), D_ALL);
>>> -	MMIO_D(_MMIO(0xe6800), D_ALL);
>>> -	MMIO_D(_MMIO(0xe6804), D_ALL);
>>> -	MMIO_D(PCH_GMBUS4, D_ALL);
>>> -	MMIO_D(PCH_GMBUS5, D_ALL);
>>> -
>>> -	MMIO_D(_MMIO(0x902c), D_ALL);
>>> -	MMIO_D(_MMIO(0xec008), D_ALL);
>>> -	MMIO_D(_MMIO(0xec00c), D_ALL);
>>> -	MMIO_D(_MMIO(0xec008 + 0x18), D_ALL);
>>> -	MMIO_D(_MMIO(0xec00c + 0x18), D_ALL);
>>> -	MMIO_D(_MMIO(0xec008 + 0x18 * 2), D_ALL);
>>> -	MMIO_D(_MMIO(0xec00c + 0x18 * 2), D_ALL);
>>> -	MMIO_D(_MMIO(0xec008 + 0x18 * 3), D_ALL);
>>> -	MMIO_D(_MMIO(0xec00c + 0x18 * 3), D_ALL);
>>> -	MMIO_D(_MMIO(0xec408), D_ALL);
>>> -	MMIO_D(_MMIO(0xec40c), D_ALL);
>>> -	MMIO_D(_MMIO(0xec408 + 0x18), D_ALL);
>>> -	MMIO_D(_MMIO(0xec40c + 0x18), D_ALL);
>>> -	MMIO_D(_MMIO(0xec408 + 0x18 * 2), D_ALL);
>>> -	MMIO_D(_MMIO(0xec40c + 0x18 * 2), D_ALL);
>>> -	MMIO_D(_MMIO(0xec408 + 0x18 * 3), D_ALL);
>>> -	MMIO_D(_MMIO(0xec40c + 0x18 * 3), D_ALL);
>>> -	MMIO_D(_MMIO(0xfc810), D_ALL);
>>> -	MMIO_D(_MMIO(0xfc81c), D_ALL);
>>> -	MMIO_D(_MMIO(0xfc828), D_ALL);
>>> -	MMIO_D(_MMIO(0xfc834), D_ALL);
>>> -	MMIO_D(_MMIO(0xfcc00), D_ALL);
>>> -	MMIO_D(_MMIO(0xfcc0c), D_ALL);
>>> -	MMIO_D(_MMIO(0xfcc18), D_ALL);
>>> -	MMIO_D(_MMIO(0xfcc24), D_ALL);
>>> -	MMIO_D(_MMIO(0xfd000), D_ALL);
>>> -	MMIO_D(_MMIO(0xfd00c), D_ALL);
>>> -	MMIO_D(_MMIO(0xfd018), D_ALL);
>>> -	MMIO_D(_MMIO(0xfd024), D_ALL);
>>> -	MMIO_D(_MMIO(0xfd034), D_ALL);
>>> -
>>> -	MMIO_DH(FPGA_DBG, D_ALL, NULL, fpga_dbg_mmio_write);
>>> -	MMIO_D(_MMIO(0x2054), D_ALL);
>>> -	MMIO_D(_MMIO(0x12054), D_ALL);
>>> -	MMIO_D(_MMIO(0x22054), D_ALL);
>>> -	MMIO_D(_MMIO(0x1a054), D_ALL);
>>> -
>>> -	MMIO_D(_MMIO(0x44070), D_ALL);
>>> -	MMIO_DFH(_MMIO(0x215c), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x2178), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x217c), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x12178), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x1217c), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -
>>> -	MMIO_F(_MMIO(0x2290), 8, F_CMD_ACCESS, 0, 0, D_BDW_PLUS, NULL, NULL);
>>> -	MMIO_D(_MMIO(0x2b00), D_BDW_PLUS);
>>> -	MMIO_D(_MMIO(0x2360), D_BDW_PLUS);
>>> -	MMIO_F(_MMIO(0x5200), 32, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(_MMIO(0x5240), 32, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(_MMIO(0x5280), 16, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> -
>>> -	MMIO_DFH(_MMIO(0x1c17c), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x1c178), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(BCS_SWCTRL, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -
>>> -	MMIO_F(HS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(DS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(IA_VERTICES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(IA_PRIMITIVES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(VS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(GS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(GS_PRIMITIVES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(CL_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(CL_PRIMITIVES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(PS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_F(PS_DEPTH_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> -	MMIO_DH(_MMIO(0x4260), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
>>> -	MMIO_DH(_MMIO(0x4264), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
>>> -	MMIO_DH(_MMIO(0x4268), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
>>> -	MMIO_DH(_MMIO(0x426c), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
>>> -	MMIO_DH(_MMIO(0x4270), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
>>> -	MMIO_DFH(_MMIO(0x4094), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -
>>> -	MMIO_DFH(ARB_MODE, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_RING_GM(RING_BBADDR, D_ALL, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x2220), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x12220), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x22220), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_RING_DFH(RING_SYNC_1, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_RING_DFH(RING_SYNC_0, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x22178), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x1a178), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x1a17c), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x2217c), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -
>>> -	MMIO_DH(EDP_PSR_IMR, D_BDW_PLUS, NULL, edp_psr_imr_iir_write);
>>> -	MMIO_DH(EDP_PSR_IIR, D_BDW_PLUS, NULL, edp_psr_imr_iir_write);
>>> -	MMIO_DH(GUC_STATUS, D_ALL, guc_status_read, NULL);
>>> -
>>> -	return 0;
>>> -}
>>> -
>>> -static int init_bdw_mmio_info(struct intel_gvt *gvt)
>>> -{
>>> -	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
>>> -	int ret;
>>> -
>>> -	MMIO_DH(GEN8_GT_IMR(0), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
>>> -	MMIO_DH(GEN8_GT_IER(0), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
>>> -	MMIO_DH(GEN8_GT_IIR(0), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
>>> -	MMIO_D(GEN8_GT_ISR(0), D_BDW_PLUS);
>>> -
>>> -	MMIO_DH(GEN8_GT_IMR(1), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
>>> -	MMIO_DH(GEN8_GT_IER(1), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
>>> -	MMIO_DH(GEN8_GT_IIR(1), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
>>> -	MMIO_D(GEN8_GT_ISR(1), D_BDW_PLUS);
>>> -
>>> -	MMIO_DH(GEN8_GT_IMR(2), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
>>> -	MMIO_DH(GEN8_GT_IER(2), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
>>> -	MMIO_DH(GEN8_GT_IIR(2), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
>>> -	MMIO_D(GEN8_GT_ISR(2), D_BDW_PLUS);
>>> -
>>> -	MMIO_DH(GEN8_GT_IMR(3), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
>>> -	MMIO_DH(GEN8_GT_IER(3), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
>>> -	MMIO_DH(GEN8_GT_IIR(3), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
>>> -	MMIO_D(GEN8_GT_ISR(3), D_BDW_PLUS);
>>> -
>>> -	MMIO_DH(GEN8_DE_PIPE_IMR(PIPE_A), D_BDW_PLUS, NULL,
>>> -		intel_vgpu_reg_imr_handler);
>>> -	MMIO_DH(GEN8_DE_PIPE_IER(PIPE_A), D_BDW_PLUS, NULL,
>>> -		intel_vgpu_reg_ier_handler);
>>> -	MMIO_DH(GEN8_DE_PIPE_IIR(PIPE_A), D_BDW_PLUS, NULL,
>>> -		intel_vgpu_reg_iir_handler);
>>> -	MMIO_D(GEN8_DE_PIPE_ISR(PIPE_A), D_BDW_PLUS);
>>> -
>>> -	MMIO_DH(GEN8_DE_PIPE_IMR(PIPE_B), D_BDW_PLUS, NULL,
>>> -		intel_vgpu_reg_imr_handler);
>>> -	MMIO_DH(GEN8_DE_PIPE_IER(PIPE_B), D_BDW_PLUS, NULL,
>>> -		intel_vgpu_reg_ier_handler);
>>> -	MMIO_DH(GEN8_DE_PIPE_IIR(PIPE_B), D_BDW_PLUS, NULL,
>>> -		intel_vgpu_reg_iir_handler);
>>> -	MMIO_D(GEN8_DE_PIPE_ISR(PIPE_B), D_BDW_PLUS);
>>> -
>>> -	MMIO_DH(GEN8_DE_PIPE_IMR(PIPE_C), D_BDW_PLUS, NULL,
>>> -		intel_vgpu_reg_imr_handler);
>>> -	MMIO_DH(GEN8_DE_PIPE_IER(PIPE_C), D_BDW_PLUS, NULL,
>>> -		intel_vgpu_reg_ier_handler);
>>> -	MMIO_DH(GEN8_DE_PIPE_IIR(PIPE_C), D_BDW_PLUS, NULL,
>>> -		intel_vgpu_reg_iir_handler);
>>> -	MMIO_D(GEN8_DE_PIPE_ISR(PIPE_C), D_BDW_PLUS);
>>> -
>>> -	MMIO_DH(GEN8_DE_PORT_IMR, D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handle=
r);
>>> -	MMIO_DH(GEN8_DE_PORT_IER, D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handle=
r);
>>> -	MMIO_DH(GEN8_DE_PORT_IIR, D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handle=
r);
>>> -	MMIO_D(GEN8_DE_PORT_ISR, D_BDW_PLUS);
>>> -
>>> -	MMIO_DH(GEN8_DE_MISC_IMR, D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handle=
r);
>>> -	MMIO_DH(GEN8_DE_MISC_IER, D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handle=
r);
>>> -	MMIO_DH(GEN8_DE_MISC_IIR, D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handle=
r);
>>> -	MMIO_D(GEN8_DE_MISC_ISR, D_BDW_PLUS);
>>> -
>>> -	MMIO_DH(GEN8_PCU_IMR, D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
>>> -	MMIO_DH(GEN8_PCU_IER, D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
>>> -	MMIO_DH(GEN8_PCU_IIR, D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
>>> -	MMIO_D(GEN8_PCU_ISR, D_BDW_PLUS);
>>> -
>>> -	MMIO_DH(GEN8_MASTER_IRQ, D_BDW_PLUS, NULL,
>>> -		intel_vgpu_reg_master_irq_handler);
>>> -
>>> -	MMIO_RING_DFH(RING_ACTHD_UDW, D_BDW_PLUS, 0,
>>> -		mmio_read_from_hw, NULL);
>>> -
>>> -#define RING_REG(base) _MMIO((base) + 0xd0)
>>> -	MMIO_RING_F(RING_REG, 4, F_RO, 0,
>>> -		~_MASKED_BIT_ENABLE(RESET_CTL_REQUEST_RESET), D_BDW_PLUS, NULL,
>>> -		ring_reset_ctl_write);
>>> -#undef RING_REG
>>> -
>>> -#define RING_REG(base) _MMIO((base) + 0x230)
>>> -	MMIO_RING_DFH(RING_REG, D_BDW_PLUS, 0, NULL, elsp_mmio_write);
>>> -#undef RING_REG
>>> -
>>> -#define RING_REG(base) _MMIO((base) + 0x234)
>>> -	MMIO_RING_F(RING_REG, 8, F_RO, 0, ~0, D_BDW_PLUS,
>>> -		NULL, NULL);
>>> -#undef RING_REG
>>> -
>>> -#define RING_REG(base) _MMIO((base) + 0x244)
>>> -	MMIO_RING_DFH(RING_REG, D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -#undef RING_REG
>>> -
>>> -#define RING_REG(base) _MMIO((base) + 0x370)
>>> -	MMIO_RING_F(RING_REG, 48, F_RO, 0, ~0, D_BDW_PLUS, NULL, NULL);
>>> -#undef RING_REG
>>> -
>>> -#define RING_REG(base) _MMIO((base) + 0x3a0)
>>> -	MMIO_RING_DFH(RING_REG, D_BDW_PLUS, F_MODE_MASK, NULL, NULL);
>>> -#undef RING_REG
>>> -
>>> -	MMIO_D(PIPEMISC(PIPE_A), D_BDW_PLUS);
>>> -	MMIO_D(PIPEMISC(PIPE_B), D_BDW_PLUS);
>>> -	MMIO_D(PIPEMISC(PIPE_C), D_BDW_PLUS);
>>> -	MMIO_D(_MMIO(0x1c1d0), D_BDW_PLUS);
>>> -	MMIO_D(GEN6_MBCUNIT_SNPCR, D_BDW_PLUS);
>>> -	MMIO_D(GEN7_MISCCPCTL, D_BDW_PLUS);
>>> -	MMIO_D(_MMIO(0x1c054), D_BDW_PLUS);
>>> -
>>> -	MMIO_DH(GEN6_PCODE_MAILBOX, D_BDW_PLUS, NULL, mailbox_write);
>>> -
>>> -	MMIO_D(GEN8_PRIVATE_PAT_LO, D_BDW_PLUS & ~D_BXT);
>>> -	MMIO_D(GEN8_PRIVATE_PAT_HI, D_BDW_PLUS);
>>> -
>>> -	MMIO_D(GAMTARBMODE, D_BDW_PLUS);
>>> -
>>> -#define RING_REG(base) _MMIO((base) + 0x270)
>>> -	MMIO_RING_F(RING_REG, 32, F_CMD_ACCESS, 0, 0, D_BDW_PLUS, NULL, NULL);
>>> -#undef RING_REG
>>> -
>>> -	MMIO_RING_GM(RING_HWS_PGA, D_BDW_PLUS, NULL, hws_pga_write);
>>> -
>>> -	MMIO_DFH(HDC_CHICKEN0, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, =
NULL);
>>> -
>>> -	MMIO_D(CHICKEN_PIPESL_1(PIPE_A), D_BDW_PLUS);
>>> -	MMIO_D(CHICKEN_PIPESL_1(PIPE_B), D_BDW_PLUS);
>>> -	MMIO_D(CHICKEN_PIPESL_1(PIPE_C), D_BDW_PLUS);
>>> -
>>> -	MMIO_D(WM_MISC, D_BDW);
>>> -	MMIO_D(_MMIO(_SRD_CTL_EDP), D_BDW);
>>> -
>>> -	MMIO_D(_MMIO(0x6671c), D_BDW_PLUS);
>>> -	MMIO_D(_MMIO(0x66c00), D_BDW_PLUS);
>>> -	MMIO_D(_MMIO(0x66c04), D_BDW_PLUS);
>>> -
>>> -	MMIO_D(HSW_GTT_CACHE_EN, D_BDW_PLUS);
>>> -
>>> -	MMIO_D(GEN8_EU_DISABLE0, D_BDW_PLUS);
>>> -	MMIO_D(GEN8_EU_DISABLE1, D_BDW_PLUS);
>>> -	MMIO_D(GEN8_EU_DISABLE2, D_BDW_PLUS);
>>> -
>>> -	MMIO_D(_MMIO(0xfdc), D_BDW_PLUS);
>>> -	MMIO_DFH(GEN8_ROW_CHICKEN, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>>> -		NULL, NULL);
>>> -	MMIO_DFH(GEN7_ROW_CHICKEN2, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>>> -		NULL, NULL);
>>> -	MMIO_DFH(GEN8_UCGCTL6, D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -
>>> -	MMIO_DFH(_MMIO(0xb1f0), D_BDW, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0xb1c0), D_BDW, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(GEN8_L3SQCREG4, D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0xb100), D_BDW, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0xb10c), D_BDW, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_D(_MMIO(0xb110), D_BDW);
>>> -	MMIO_D(GEN9_SCRATCH_LNCF1, D_BDW_PLUS);
>>> -
>>> -	MMIO_F(_MMIO(0x24d0), 48, F_CMD_ACCESS | F_CMD_WRITE_PATCH, 0, 0,
>>> -		D_BDW_PLUS, NULL, force_nonpriv_write);
>>> -
>>> -	MMIO_D(_MMIO(0x44484), D_BDW_PLUS);
>>> -	MMIO_D(_MMIO(0x4448c), D_BDW_PLUS);
>>> -
>>> -	MMIO_DFH(_MMIO(0x83a4), D_BDW, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_D(GEN8_L3_LRA_1_GPGPU, D_BDW_PLUS);
>>> -
>>> -	MMIO_DFH(_MMIO(0x8430), D_BDW, F_CMD_ACCESS, NULL, NULL);
>>> -
>>> -	MMIO_D(_MMIO(0x110000), D_BDW_PLUS);
>>> -
>>> -	MMIO_D(_MMIO(0x48400), D_BDW_PLUS);
>>> -
>>> -	MMIO_D(_MMIO(0x6e570), D_BDW_PLUS);
>>> -	MMIO_D(_MMIO(0x65f10), D_BDW_PLUS);
>>> -
>>> -	MMIO_DFH(_MMIO(0xe194), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL,=
 NULL);
>>> -	MMIO_DFH(_MMIO(0xe188), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL,=
 NULL);
>>> -	MMIO_DFH(HALF_SLICE_CHICKEN2, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS,=
 NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x2580), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL,=
 NULL);
>>> -
>>> -	MMIO_DFH(_MMIO(0x2248), D_BDW, F_CMD_ACCESS, NULL, NULL);
>>> -
>>> -	MMIO_DFH(_MMIO(0xe220), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0xe230), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0xe240), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0xe260), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0xe270), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0xe280), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0xe2a0), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0xe2b0), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0xe2c0), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x21f0), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	return 0;
>>> -}
>>> -
>>> -static int init_skl_mmio_info(struct intel_gvt *gvt)
>>> -{
>>> -	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
>>> -	int ret;
>>> -
>>> -	MMIO_DH(FORCEWAKE_RENDER_GEN9, D_SKL_PLUS, NULL, mul_force_wake_write=
);
>>> -	MMIO_DH(FORCEWAKE_ACK_RENDER_GEN9, D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(FORCEWAKE_GT_GEN9, D_SKL_PLUS, NULL, mul_force_wake_write);
>>> -	MMIO_DH(FORCEWAKE_ACK_GT_GEN9, D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(FORCEWAKE_MEDIA_GEN9, D_SKL_PLUS, NULL, mul_force_wake_write);
>>> -	MMIO_DH(FORCEWAKE_ACK_MEDIA_GEN9, D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_F(DP_AUX_CH_CTL(AUX_CH_B), 6 * 4, 0, 0, 0, D_SKL_PLUS, NULL,
>>> -						dp_aux_ch_ctl_mmio_write);
>>> -	MMIO_F(DP_AUX_CH_CTL(AUX_CH_C), 6 * 4, 0, 0, 0, D_SKL_PLUS, NULL,
>>> -						dp_aux_ch_ctl_mmio_write);
>>> -	MMIO_F(DP_AUX_CH_CTL(AUX_CH_D), 6 * 4, 0, 0, 0, D_SKL_PLUS, NULL,
>>> -						dp_aux_ch_ctl_mmio_write);
>>> -
>>> -	MMIO_D(HSW_PWR_WELL_CTL1, D_SKL_PLUS);
>>> -	MMIO_DH(HSW_PWR_WELL_CTL2, D_SKL_PLUS, NULL, skl_power_well_ctl_write=
);
>>> -
>>> -	MMIO_DH(DBUF_CTL_S(0), D_SKL_PLUS, NULL, gen9_dbuf_ctl_mmio_write);
>>> -
>>> -	MMIO_D(GEN9_PG_ENABLE, D_SKL_PLUS);
>>> -	MMIO_D(GEN9_MEDIA_PG_IDLE_HYSTERESIS, D_SKL_PLUS);
>>> -	MMIO_D(GEN9_RENDER_PG_IDLE_HYSTERESIS, D_SKL_PLUS);
>>> -	MMIO_DFH(GEN9_GAMT_ECO_REG_RW_IA, D_SKL_PLUS, F_CMD_ACCESS, NULL, NUL=
L);
>>> -	MMIO_DFH(MMCD_MISC_CTRL, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DH(CHICKEN_PAR1_1, D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_D(DC_STATE_EN, D_SKL_PLUS);
>>> -	MMIO_D(DC_STATE_DEBUG, D_SKL_PLUS);
>>> -	MMIO_D(CDCLK_CTL, D_SKL_PLUS);
>>> -	MMIO_DH(LCPLL1_CTL, D_SKL_PLUS, NULL, skl_lcpll_write);
>>> -	MMIO_DH(LCPLL2_CTL, D_SKL_PLUS, NULL, skl_lcpll_write);
>>> -	MMIO_D(_MMIO(_DPLL1_CFGCR1), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(_DPLL2_CFGCR1), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(_DPLL3_CFGCR1), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(_DPLL1_CFGCR2), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(_DPLL2_CFGCR2), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(_DPLL3_CFGCR2), D_SKL_PLUS);
>>> -	MMIO_D(DPLL_CTRL1, D_SKL_PLUS);
>>> -	MMIO_D(DPLL_CTRL2, D_SKL_PLUS);
>>> -	MMIO_DH(DPLL_STATUS, D_SKL_PLUS, dpll_status_read, NULL);
>>> -
>>> -	MMIO_DH(SKL_PS_WIN_POS(PIPE_A, 0), D_SKL_PLUS, NULL, pf_write);
>>> -	MMIO_DH(SKL_PS_WIN_POS(PIPE_A, 1), D_SKL_PLUS, NULL, pf_write);
>>> -	MMIO_DH(SKL_PS_WIN_POS(PIPE_B, 0), D_SKL_PLUS, NULL, pf_write);
>>> -	MMIO_DH(SKL_PS_WIN_POS(PIPE_B, 1), D_SKL_PLUS, NULL, pf_write);
>>> -	MMIO_DH(SKL_PS_WIN_POS(PIPE_C, 0), D_SKL_PLUS, NULL, pf_write);
>>> -	MMIO_DH(SKL_PS_WIN_POS(PIPE_C, 1), D_SKL_PLUS, NULL, pf_write);
>>> -
>>> -	MMIO_DH(SKL_PS_WIN_SZ(PIPE_A, 0), D_SKL_PLUS, NULL, pf_write);
>>> -	MMIO_DH(SKL_PS_WIN_SZ(PIPE_A, 1), D_SKL_PLUS, NULL, pf_write);
>>> -	MMIO_DH(SKL_PS_WIN_SZ(PIPE_B, 0), D_SKL_PLUS, NULL, pf_write);
>>> -	MMIO_DH(SKL_PS_WIN_SZ(PIPE_B, 1), D_SKL_PLUS, NULL, pf_write);
>>> -	MMIO_DH(SKL_PS_WIN_SZ(PIPE_C, 0), D_SKL_PLUS, NULL, pf_write);
>>> -	MMIO_DH(SKL_PS_WIN_SZ(PIPE_C, 1), D_SKL_PLUS, NULL, pf_write);
>>> -
>>> -	MMIO_DH(SKL_PS_CTRL(PIPE_A, 0), D_SKL_PLUS, NULL, pf_write);
>>> -	MMIO_DH(SKL_PS_CTRL(PIPE_A, 1), D_SKL_PLUS, NULL, pf_write);
>>> -	MMIO_DH(SKL_PS_CTRL(PIPE_B, 0), D_SKL_PLUS, NULL, pf_write);
>>> -	MMIO_DH(SKL_PS_CTRL(PIPE_B, 1), D_SKL_PLUS, NULL, pf_write);
>>> -	MMIO_DH(SKL_PS_CTRL(PIPE_C, 0), D_SKL_PLUS, NULL, pf_write);
>>> -	MMIO_DH(SKL_PS_CTRL(PIPE_C, 1), D_SKL_PLUS, NULL, pf_write);
>>> -
>>> -	MMIO_DH(PLANE_BUF_CFG(PIPE_A, 0), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_BUF_CFG(PIPE_A, 1), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_BUF_CFG(PIPE_A, 2), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_BUF_CFG(PIPE_A, 3), D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_DH(PLANE_BUF_CFG(PIPE_B, 0), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_BUF_CFG(PIPE_B, 1), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_BUF_CFG(PIPE_B, 2), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_BUF_CFG(PIPE_B, 3), D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_DH(PLANE_BUF_CFG(PIPE_C, 0), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_BUF_CFG(PIPE_C, 1), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_BUF_CFG(PIPE_C, 2), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_BUF_CFG(PIPE_C, 3), D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_DH(CUR_BUF_CFG(PIPE_A), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(CUR_BUF_CFG(PIPE_B), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(CUR_BUF_CFG(PIPE_C), D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_F(PLANE_WM(PIPE_A, 0, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> -	MMIO_F(PLANE_WM(PIPE_A, 1, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> -	MMIO_F(PLANE_WM(PIPE_A, 2, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> -
>>> -	MMIO_F(PLANE_WM(PIPE_B, 0, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> -	MMIO_F(PLANE_WM(PIPE_B, 1, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> -	MMIO_F(PLANE_WM(PIPE_B, 2, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> -
>>> -	MMIO_F(PLANE_WM(PIPE_C, 0, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> -	MMIO_F(PLANE_WM(PIPE_C, 1, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> -	MMIO_F(PLANE_WM(PIPE_C, 2, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> -
>>> -	MMIO_F(CUR_WM(PIPE_A, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_F(CUR_WM(PIPE_B, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_F(CUR_WM(PIPE_C, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_DH(PLANE_WM_TRANS(PIPE_A, 0), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_WM_TRANS(PIPE_A, 1), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_WM_TRANS(PIPE_A, 2), D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_DH(PLANE_WM_TRANS(PIPE_B, 0), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_WM_TRANS(PIPE_B, 1), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_WM_TRANS(PIPE_B, 2), D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_DH(PLANE_WM_TRANS(PIPE_C, 0), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_WM_TRANS(PIPE_C, 1), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_WM_TRANS(PIPE_C, 2), D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_DH(CUR_WM_TRANS(PIPE_A), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(CUR_WM_TRANS(PIPE_B), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(CUR_WM_TRANS(PIPE_C), D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_A, 0), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_A, 1), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_A, 2), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_A, 3), D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_B, 0), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_B, 1), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_B, 2), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_B, 3), D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_C, 0), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_C, 1), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_C, 2), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_C, 3), D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_DH(_MMIO(_REG_701C0(PIPE_A, 1)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C0(PIPE_A, 2)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C0(PIPE_A, 3)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C0(PIPE_A, 4)), D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_DH(_MMIO(_REG_701C0(PIPE_B, 1)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C0(PIPE_B, 2)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C0(PIPE_B, 3)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C0(PIPE_B, 4)), D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_DH(_MMIO(_REG_701C0(PIPE_C, 1)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C0(PIPE_C, 2)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C0(PIPE_C, 3)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C0(PIPE_C, 4)), D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_DH(_MMIO(_REG_701C4(PIPE_A, 1)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C4(PIPE_A, 2)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C4(PIPE_A, 3)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C4(PIPE_A, 4)), D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_DH(_MMIO(_REG_701C4(PIPE_B, 1)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C4(PIPE_B, 2)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C4(PIPE_B, 3)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C4(PIPE_B, 4)), D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_DH(_MMIO(_REG_701C4(PIPE_C, 1)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C4(PIPE_C, 2)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C4(PIPE_C, 3)), D_SKL_PLUS, NULL, NULL);
>>> -	MMIO_DH(_MMIO(_REG_701C4(PIPE_C, 4)), D_SKL_PLUS, NULL, NULL);
>>> -
>>> -	MMIO_D(_MMIO(_PLANE_CTL_3_A), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(_PLANE_CTL_3_B), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(0x72380), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(0x7239c), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(_PLANE_SURF_3_A), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(_PLANE_SURF_3_B), D_SKL_PLUS);
>>> -
>>> -	MMIO_D(DMC_SSP_BASE, D_SKL_PLUS);
>>> -	MMIO_D(DMC_HTP_SKL, D_SKL_PLUS);
>>> -	MMIO_D(DMC_LAST_WRITE, D_SKL_PLUS);
>>> -
>>> -	MMIO_DFH(BDW_SCRATCH1, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -
>>> -	MMIO_D(SKL_DFSM, D_SKL_PLUS);
>>> -	MMIO_D(DISPIO_CR_TX_BMU_CR0, D_SKL_PLUS);
>>> -
>>> -	MMIO_F(GEN9_GFX_MOCS(0), 0x7f8, F_CMD_ACCESS, 0, 0, D_SKL_PLUS,
>>> -		NULL, NULL);
>>> -	MMIO_F(GEN7_L3CNTLREG2, 0x80, F_CMD_ACCESS, 0, 0, D_SKL_PLUS,
>>> -		NULL, NULL);
>>> -
>>> -	MMIO_D(RPM_CONFIG0, D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(0xd08), D_SKL_PLUS);
>>> -	MMIO_D(RC6_LOCATION, D_SKL_PLUS);
>>> -	MMIO_DFH(GEN7_FF_SLICE_CS_CHICKEN1, D_SKL_PLUS,
>>> -		 F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(GEN9_CS_DEBUG_MODE1, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>>> -		NULL, NULL);
>>> -
>>> -	/* TRTT */
>>> -	MMIO_DFH(TRVATTL3PTRDW(0), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(TRVATTL3PTRDW(1), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(TRVATTL3PTRDW(2), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(TRVATTL3PTRDW(3), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(TRVADR, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(TRTTE, D_SKL_PLUS, F_CMD_ACCESS | F_PM_SAVE,
>>> -		 NULL, gen9_trtte_write);
>>> -	MMIO_DFH(_MMIO(0x4dfc), D_SKL_PLUS, F_PM_SAVE,
>>> -		 NULL, gen9_trtt_chicken_write);
>>> -
>>> -	MMIO_D(_MMIO(0x46430), D_SKL_PLUS);
>>> -
>>> -	MMIO_D(_MMIO(0x46520), D_SKL_PLUS);
>>> -
>>> -	MMIO_D(_MMIO(0xc403c), D_SKL_PLUS);
>>> -	MMIO_DFH(GEN8_GARBCNTL, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DH(DMA_CTRL, D_SKL_PLUS, NULL, dma_ctrl_write);
>>> -
>>> -	MMIO_D(_MMIO(0x65900), D_SKL_PLUS);
>>> -	MMIO_D(GEN6_STOLEN_RESERVED, D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(0x4068), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(0x67054), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(0x6e560), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(0x6e554), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(0x2b20), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(0x65f00), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(0x65f08), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(0x320f0), D_SKL_PLUS);
>>> -
>>> -	MMIO_D(_MMIO(0x70034), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(0x71034), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(0x72034), D_SKL_PLUS);
>>> -
>>> -	MMIO_D(_MMIO(_PLANE_KEYVAL_1(PIPE_A)), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(_PLANE_KEYVAL_1(PIPE_B)), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(_PLANE_KEYVAL_1(PIPE_C)), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(_PLANE_KEYMAX_1(PIPE_A)), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(_PLANE_KEYMAX_1(PIPE_B)), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(_PLANE_KEYMAX_1(PIPE_C)), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(_PLANE_KEYMSK_1(PIPE_A)), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(_PLANE_KEYMSK_1(PIPE_B)), D_SKL_PLUS);
>>> -	MMIO_D(_MMIO(_PLANE_KEYMSK_1(PIPE_C)), D_SKL_PLUS);
>>> -
>>> -	MMIO_D(_MMIO(0x44500), D_SKL_PLUS);
>>> -#define CSFE_CHICKEN1_REG(base) _MMIO((base) + 0xD4)
>>> -	MMIO_RING_DFH(CSFE_CHICKEN1_REG, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCE=
SS,
>>> -		      NULL, csfe_chicken1_mmio_write);
>>> -#undef CSFE_CHICKEN1_REG
>>> -	MMIO_DFH(GEN8_HDC_CHICKEN1, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>>> -		 NULL, NULL);
>>> -	MMIO_DFH(GEN9_WM_CHICKEN3, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>>> -		 NULL, NULL);
>>> -
>>> -	MMIO_DFH(GAMT_CHKN_BIT_REG, D_KBL | D_CFL, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS & ~D_BXT);
>>> -
>>> -	return 0;
>>> -}
>>> -
>>> -static int init_bxt_mmio_info(struct intel_gvt *gvt)
>>> -{
>>> -	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
>>> -	int ret;
>>> -
>>> -	MMIO_F(_MMIO(0x80000), 0x3000, 0, 0, 0, D_BXT, NULL, NULL);
>>> -
>>> -	MMIO_D(GEN7_SAMPLER_INSTDONE, D_BXT);
>>> -	MMIO_D(GEN7_ROW_INSTDONE, D_BXT);
>>> -	MMIO_D(GEN8_FAULT_TLB_DATA0, D_BXT);
>>> -	MMIO_D(GEN8_FAULT_TLB_DATA1, D_BXT);
>>> -	MMIO_D(ERROR_GEN6, D_BXT);
>>> -	MMIO_D(DONE_REG, D_BXT);
>>> -	MMIO_D(EIR, D_BXT);
>>> -	MMIO_D(PGTBL_ER, D_BXT);
>>> -	MMIO_D(_MMIO(0x4194), D_BXT);
>>> -	MMIO_D(_MMIO(0x4294), D_BXT);
>>> -	MMIO_D(_MMIO(0x4494), D_BXT);
>>> -
>>> -	MMIO_RING_D(RING_PSMI_CTL, D_BXT);
>>> -	MMIO_RING_D(RING_DMA_FADD, D_BXT);
>>> -	MMIO_RING_D(RING_DMA_FADD_UDW, D_BXT);
>>> -	MMIO_RING_D(RING_IPEHR, D_BXT);
>>> -	MMIO_RING_D(RING_INSTPS, D_BXT);
>>> -	MMIO_RING_D(RING_BBADDR_UDW, D_BXT);
>>> -	MMIO_RING_D(RING_BBSTATE, D_BXT);
>>> -	MMIO_RING_D(RING_IPEIR, D_BXT);
>>> -
>>> -	MMIO_F(SOFT_SCRATCH(0), 16 * 4, 0, 0, 0, D_BXT, NULL, NULL);
>>> -
>>> -	MMIO_DH(BXT_P_CR_GT_DISP_PWRON, D_BXT, NULL, bxt_gt_disp_pwron_write);
>>> -	MMIO_D(BXT_RP_STATE_CAP, D_BXT);
>>> -	MMIO_DH(BXT_PHY_CTL_FAMILY(DPIO_PHY0), D_BXT,
>>> -		NULL, bxt_phy_ctl_family_write);
>>> -	MMIO_DH(BXT_PHY_CTL_FAMILY(DPIO_PHY1), D_BXT,
>>> -		NULL, bxt_phy_ctl_family_write);
>>> -	MMIO_D(BXT_PHY_CTL(PORT_A), D_BXT);
>>> -	MMIO_D(BXT_PHY_CTL(PORT_B), D_BXT);
>>> -	MMIO_D(BXT_PHY_CTL(PORT_C), D_BXT);
>>> -	MMIO_DH(BXT_PORT_PLL_ENABLE(PORT_A), D_BXT,
>>> -		NULL, bxt_port_pll_enable_write);
>>> -	MMIO_DH(BXT_PORT_PLL_ENABLE(PORT_B), D_BXT,
>>> -		NULL, bxt_port_pll_enable_write);
>>> -	MMIO_DH(BXT_PORT_PLL_ENABLE(PORT_C), D_BXT, NULL,
>>> -		bxt_port_pll_enable_write);
>>> -
>>> -	MMIO_D(BXT_PORT_CL1CM_DW0(DPIO_PHY0), D_BXT);
>>> -	MMIO_D(BXT_PORT_CL1CM_DW9(DPIO_PHY0), D_BXT);
>>> -	MMIO_D(BXT_PORT_CL1CM_DW10(DPIO_PHY0), D_BXT);
>>> -	MMIO_D(BXT_PORT_CL1CM_DW28(DPIO_PHY0), D_BXT);
>>> -	MMIO_D(BXT_PORT_CL1CM_DW30(DPIO_PHY0), D_BXT);
>>> -	MMIO_D(BXT_PORT_CL2CM_DW6(DPIO_PHY0), D_BXT);
>>> -	MMIO_D(BXT_PORT_REF_DW3(DPIO_PHY0), D_BXT);
>>> -	MMIO_D(BXT_PORT_REF_DW6(DPIO_PHY0), D_BXT);
>>> -	MMIO_D(BXT_PORT_REF_DW8(DPIO_PHY0), D_BXT);
>>> -
>>> -	MMIO_D(BXT_PORT_CL1CM_DW0(DPIO_PHY1), D_BXT);
>>> -	MMIO_D(BXT_PORT_CL1CM_DW9(DPIO_PHY1), D_BXT);
>>> -	MMIO_D(BXT_PORT_CL1CM_DW10(DPIO_PHY1), D_BXT);
>>> -	MMIO_D(BXT_PORT_CL1CM_DW28(DPIO_PHY1), D_BXT);
>>> -	MMIO_D(BXT_PORT_CL1CM_DW30(DPIO_PHY1), D_BXT);
>>> -	MMIO_D(BXT_PORT_CL2CM_DW6(DPIO_PHY1), D_BXT);
>>> -	MMIO_D(BXT_PORT_REF_DW3(DPIO_PHY1), D_BXT);
>>> -	MMIO_D(BXT_PORT_REF_DW6(DPIO_PHY1), D_BXT);
>>> -	MMIO_D(BXT_PORT_REF_DW8(DPIO_PHY1), D_BXT);
>>> -
>>> -	MMIO_D(BXT_PORT_PLL_EBB_0(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL_EBB_4(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_PCS_DW10_LN01(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_PCS_DW10_GRP(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_PCS_DW12_LN01(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_PCS_DW12_LN23(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> -	MMIO_DH(BXT_PORT_PCS_DW12_GRP(DPIO_PHY0, DPIO_CH0), D_BXT,
>>> -		NULL, bxt_pcs_dw12_grp_write);
>>> -	MMIO_D(BXT_PORT_TX_DW2_LN0(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW2_GRP(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> -	MMIO_DH(BXT_PORT_TX_DW3_LN0(DPIO_PHY0, DPIO_CH0), D_BXT,
>>> -		bxt_port_tx_dw3_read, NULL);
>>> -	MMIO_D(BXT_PORT_TX_DW3_GRP(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW4_LN0(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW4_GRP(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH0, 0), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH0, 1), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH0, 2), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH0, 3), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 0), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 1), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 2), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 3), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 6), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 8), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 9), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 10), D_BXT);
>>> -
>>> -	MMIO_D(BXT_PORT_PLL_EBB_0(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL_EBB_4(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> -	MMIO_D(BXT_PORT_PCS_DW10_LN01(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> -	MMIO_D(BXT_PORT_PCS_DW10_GRP(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> -	MMIO_D(BXT_PORT_PCS_DW12_LN01(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> -	MMIO_D(BXT_PORT_PCS_DW12_LN23(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> -	MMIO_DH(BXT_PORT_PCS_DW12_GRP(DPIO_PHY0, DPIO_CH1), D_BXT,
>>> -		NULL, bxt_pcs_dw12_grp_write);
>>> -	MMIO_D(BXT_PORT_TX_DW2_LN0(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW2_GRP(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> -	MMIO_DH(BXT_PORT_TX_DW3_LN0(DPIO_PHY0, DPIO_CH1), D_BXT,
>>> -		bxt_port_tx_dw3_read, NULL);
>>> -	MMIO_D(BXT_PORT_TX_DW3_GRP(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW4_LN0(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW4_GRP(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH1, 0), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH1, 1), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH1, 2), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH1, 3), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 0), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 1), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 2), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 3), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 6), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 8), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 9), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 10), D_BXT);
>>> -
>>> -	MMIO_D(BXT_PORT_PLL_EBB_0(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL_EBB_4(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_PCS_DW10_LN01(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_PCS_DW10_GRP(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_PCS_DW12_LN01(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_PCS_DW12_LN23(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> -	MMIO_DH(BXT_PORT_PCS_DW12_GRP(DPIO_PHY1, DPIO_CH0), D_BXT,
>>> -		NULL, bxt_pcs_dw12_grp_write);
>>> -	MMIO_D(BXT_PORT_TX_DW2_LN0(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW2_GRP(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> -	MMIO_DH(BXT_PORT_TX_DW3_LN0(DPIO_PHY1, DPIO_CH0), D_BXT,
>>> -		bxt_port_tx_dw3_read, NULL);
>>> -	MMIO_D(BXT_PORT_TX_DW3_GRP(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW4_LN0(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW4_GRP(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY1, DPIO_CH0, 0), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY1, DPIO_CH0, 1), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY1, DPIO_CH0, 2), D_BXT);
>>> -	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY1, DPIO_CH0, 3), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 0), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 1), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 2), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 3), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 6), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 8), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 9), D_BXT);
>>> -	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 10), D_BXT);
>>> -
>>> -	MMIO_D(BXT_DE_PLL_CTL, D_BXT);
>>> -	MMIO_DH(BXT_DE_PLL_ENABLE, D_BXT, NULL, bxt_de_pll_enable_write);
>>> -	MMIO_D(BXT_DSI_PLL_CTL, D_BXT);
>>> -	MMIO_D(BXT_DSI_PLL_ENABLE, D_BXT);
>>> -
>>> -	MMIO_D(GEN9_CLKGATE_DIS_0, D_BXT);
>>> -	MMIO_D(GEN9_CLKGATE_DIS_4, D_BXT);
>>> -
>>> -	MMIO_D(HSW_TVIDEO_DIP_GCP(TRANSCODER_A), D_BXT);
>>> -	MMIO_D(HSW_TVIDEO_DIP_GCP(TRANSCODER_B), D_BXT);
>>> -	MMIO_D(HSW_TVIDEO_DIP_GCP(TRANSCODER_C), D_BXT);
>>> -
>>> -	MMIO_D(RC6_CTX_BASE, D_BXT);
>>> -
>>> -	MMIO_D(GEN8_PUSHBUS_CONTROL, D_BXT);
>>> -	MMIO_D(GEN8_PUSHBUS_ENABLE, D_BXT);
>>> -	MMIO_D(GEN8_PUSHBUS_SHIFT, D_BXT);
>>> -	MMIO_D(GEN6_GFXPAUSE, D_BXT);
>>> -	MMIO_DFH(GEN8_L3SQCREG1, D_BXT, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(GEN8_L3CNTLREG, D_BXT, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_DFH(_MMIO(0x20D8), D_BXT, F_CMD_ACCESS, NULL, NULL);
>>> -	MMIO_F(GEN8_RING_CS_GPR(RENDER_RING_BASE, 0), 0x40, F_CMD_ACCESS,
>>> -	       0, 0, D_BXT, NULL, NULL);
>>> -	MMIO_F(GEN8_RING_CS_GPR(GEN6_BSD_RING_BASE, 0), 0x40, F_CMD_ACCESS,
>>> -	       0, 0, D_BXT, NULL, NULL);
>>> -	MMIO_F(GEN8_RING_CS_GPR(BLT_RING_BASE, 0), 0x40, F_CMD_ACCESS,
>>> -	       0, 0, D_BXT, NULL, NULL);
>>> -	MMIO_F(GEN8_RING_CS_GPR(VEBOX_RING_BASE, 0), 0x40, F_CMD_ACCESS,
>>> -	       0, 0, D_BXT, NULL, NULL);
>>> -
>>> -	MMIO_DFH(GEN9_CTX_PREEMPT_REG, D_BXT, F_CMD_ACCESS, NULL, NULL);
>>> -
>>> -	MMIO_DH(GEN8_PRIVATE_PAT_LO, D_BXT, NULL, bxt_ppat_low_write);
>>> -
>>> -	return 0;
>>> -}
>>> +#include "mmio_table.h"
>>>=20=20=20
>>>   static struct gvt_mmio_block *find_mmio_block(struct intel_gvt *gvt,
>>>   					      unsigned int offset)
>>> @@ -3693,7 +2192,6 @@ static struct gvt_mmio_block mmio_blocks[] =3D {
>>>   int intel_gvt_setup_mmio_info(struct intel_gvt *gvt)
>>>   {
>>>   	struct intel_gvt_device_info *info =3D &gvt->device_info;
>>> -	struct drm_i915_private *i915 =3D gvt->gt->i915;
>>>   	int size =3D info->mmio_size / 4 * sizeof(*gvt->mmio.mmio_attribute);
>>>   	int ret;
>>>=20=20=20
>>> @@ -3701,43 +2199,16 @@ int intel_gvt_setup_mmio_info(struct intel_gvt =
*gvt)
>>>   	if (!gvt->mmio.mmio_attribute)
>>>   		return -ENOMEM;
>>>=20=20=20
>>> -	ret =3D init_generic_mmio_info(gvt);
>>> -	if (ret)
>>> -		goto err;
>>> -
>>> -	if (IS_BROADWELL(i915)) {
>>> -		ret =3D init_bdw_mmio_info(gvt);
>>> -		if (ret)
>>> -			goto err;
>>> -	} else if (IS_SKYLAKE(i915) ||
>>> -		   IS_KABYLAKE(i915) ||
>>> -		   IS_COFFEELAKE(i915) ||
>>> -		   IS_COMETLAKE(i915)) {
>>> -		ret =3D init_bdw_mmio_info(gvt);
>>> -		if (ret)
>>> -			goto err;
>>> -		ret =3D init_skl_mmio_info(gvt);
>>> -		if (ret)
>>> -			goto err;
>>> -	} else if (IS_BROXTON(i915)) {
>>> -		ret =3D init_bdw_mmio_info(gvt);
>>> -		if (ret)
>>> -			goto err;
>>> -		ret =3D init_skl_mmio_info(gvt);
>>> -		if (ret)
>>> -			goto err;
>>> -		ret =3D init_bxt_mmio_info(gvt);
>>> -		if (ret)
>>> -			goto err;
>>> +	ret =3D intel_gvt_init_mmio_info(gvt);
>>> +	if (ret) {
>>> +		intel_gvt_clean_mmio_info(gvt);
>>> +		return ret;
>>>   	}
>>>=20=20=20
>>>   	gvt->mmio.mmio_block =3D mmio_blocks;
>>>   	gvt->mmio.num_mmio_block =3D ARRAY_SIZE(mmio_blocks);
>>>=20=20=20
>>>   	return 0;
>>> -err:
>>> -	intel_gvt_clean_mmio_info(gvt);
>>> -	return ret;
>>>   }
>>>=20=20=20
>>>   /**
>>> diff --git a/drivers/gpu/drm/i915/gvt/mmio_table.h b/drivers/gpu/drm/i9=
15/gvt/mmio_table.h
>>> new file mode 100644
>>> index 000000000000..39a4cb59695a
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/i915/gvt/mmio_table.h
>>> @@ -0,0 +1,1570 @@
>>> +/*
>>> + * Copyright =C2=A9 2021 Intel Corporation
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaini=
ng a
>>> + * copy of this software and associated documentation files (the "Soft=
ware"),
>>> + * to deal in the Software without restriction, including without limi=
tation
>>> + * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
>>> + * and/or sell copies of the Software, and to permit persons to whom t=
he
>>> + * Software is furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice (including th=
e next
>>> + * paragraph) shall be included in all copies or substantial portions =
of the
>>> + * Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING
>>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER=
 DEALINGS
>>> + * IN THE SOFTWARE.
>>> + *
>>> + */
>>> +
>>> +#ifndef _GVT_MMIO_TABLE_H_
>>> +#define _GVT_MMIO_TABLE_H_
>>> +
>>> +#ifdef GENERATE_MMIO_TABLE_IN_I915
>>> +#define MMIO_F(reg, s, f, am, rm, d, r, w) do { \
>>> +	ret =3D new_mmio_info(gvt, i915_mmio_reg_offset(reg)); \
>>> +	if (ret) \
>>> +		return ret; \
>>> +} while (0)
>>> +#else
>>> +#define MMIO_F(reg, s, f, am, rm, d, r, w) do { \
>>> +	ret =3D new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
>>> +		f, s, am, rm, d, r, w); \
>>> +	if (ret) \
>>> +		return ret; \
>>> +} while (0)
>>> +#endif
>>> +
>>> +#define MMIO_D(reg, d) \
>>> +	MMIO_F(reg, 4, 0, 0, 0, d, NULL, NULL)
>>> +
>>> +#define MMIO_DH(reg, d, r, w) \
>>> +	MMIO_F(reg, 4, 0, 0, 0, d, r, w)
>>> +
>>> +#define MMIO_DFH(reg, d, f, r, w) \
>>> +	MMIO_F(reg, 4, f, 0, 0, d, r, w)
>>> +
>>> +#define MMIO_GM(reg, d, r, w) \
>>> +	MMIO_F(reg, 4, F_GMADR, 0xFFFFF000, 0, d, r, w)
>>> +
>>> +#define MMIO_GM_RDR(reg, d, r, w) \
>>> +	MMIO_F(reg, 4, F_GMADR | F_CMD_ACCESS, 0xFFFFF000, 0, d, r, w)
>>> +
>>> +#define MMIO_RO(reg, d, f, rm, r, w) \
>>> +	MMIO_F(reg, 4, F_RO | f, 0, rm, d, r, w)
>>> +
>>> +#define MMIO_RING_F(prefix, s, f, am, rm, d, r, w) do { \
>>> +	MMIO_F(prefix(RENDER_RING_BASE), s, f, am, rm, d, r, w); \
>>> +	MMIO_F(prefix(BLT_RING_BASE), s, f, am, rm, d, r, w); \
>>> +	MMIO_F(prefix(GEN6_BSD_RING_BASE), s, f, am, rm, d, r, w); \
>>> +	MMIO_F(prefix(VEBOX_RING_BASE), s, f, am, rm, d, r, w); \
>>> +	if (HAS_ENGINE(gvt->gt, VCS1)) \
>>> +		MMIO_F(prefix(GEN8_BSD2_RING_BASE), s, f, am, rm, d, r, w); \
>>> +} while (0)
>>> +
>>> +#define MMIO_RING_D(prefix, d) \
>>> +	MMIO_RING_F(prefix, 4, 0, 0, 0, d, NULL, NULL)
>>> +
>>> +#define MMIO_RING_DFH(prefix, d, f, r, w) \
>>> +	MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
>>> +
>>> +#define MMIO_RING_GM(prefix, d, r, w) \
>>> +	MMIO_RING_F(prefix, 4, F_GMADR, 0xFFFF0000, 0, d, r, w)
>>> +
>>> +#define MMIO_RING_GM_RDR(prefix, d, r, w) \
>>> +	MMIO_RING_F(prefix, 4, F_GMADR | F_CMD_ACCESS, 0xFFFF0000, 0, d, r, w)
>>> +
>>> +#define MMIO_RING_RO(prefix, d, f, rm, r, w) \
>>> +	MMIO_RING_F(prefix, 4, F_RO | f, 0, rm, d, r, w)
>>> +
>>> +static int intel_gvt_init_generic_mmio_info(struct intel_gvt *gvt)
>>> +{
>>> +	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
>>> +
>>> +	int ret;
>>> +
>>> +	MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
>>> +		intel_vgpu_reg_imr_handler);
>>> +
>>> +	MMIO_DFH(SDEIMR, D_ALL, 0, NULL, intel_vgpu_reg_imr_handler);
>>> +	MMIO_DFH(SDEIER, D_ALL, 0, NULL, intel_vgpu_reg_ier_handler);
>>> +	MMIO_DFH(SDEIIR, D_ALL, 0, NULL, intel_vgpu_reg_iir_handler);
>>> +	MMIO_D(SDEISR, D_ALL);
>>> +
>>> +	MMIO_RING_DFH(RING_HWSTAM, D_ALL, 0, NULL, NULL);
>>> +
>>> +
>>> +	MMIO_DH(GEN8_GAMW_ECO_DEV_RW_IA, D_BDW_PLUS, NULL,
>>> +		gamw_echo_dev_rw_ia_write);
>>> +
>>> +	MMIO_GM_RDR(BSD_HWS_PGA_GEN7, D_ALL, NULL, NULL);
>>> +	MMIO_GM_RDR(BLT_HWS_PGA_GEN7, D_ALL, NULL, NULL);
>>> +	MMIO_GM_RDR(VEBOX_HWS_PGA_GEN7, D_ALL, NULL, NULL);
>>> +
>>> +#define RING_REG(base) _MMIO((base) + 0x28)
>>> +	MMIO_RING_DFH(RING_REG, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +#undef RING_REG
>>> +
>>> +#define RING_REG(base) _MMIO((base) + 0x134)
>>> +	MMIO_RING_DFH(RING_REG, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +#undef RING_REG
>>> +
>>> +#define RING_REG(base) _MMIO((base) + 0x6c)
>>> +	MMIO_RING_DFH(RING_REG, D_ALL, 0, mmio_read_from_hw, NULL);
>>> +#undef RING_REG
>>> +	MMIO_DH(GEN7_SC_INSTDONE, D_BDW_PLUS, mmio_read_from_hw, NULL);
>>> +
>>> +	MMIO_GM_RDR(_MMIO(0x2148), D_ALL, NULL, NULL);
>>> +	MMIO_GM_RDR(CCID(RENDER_RING_BASE), D_ALL, NULL, NULL);
>>> +	MMIO_GM_RDR(_MMIO(0x12198), D_ALL, NULL, NULL);
>>> +	MMIO_D(GEN7_CXT_SIZE, D_ALL);
>>> +
>>> +	MMIO_RING_DFH(RING_TAIL, D_ALL, 0, NULL, NULL);
>>> +	MMIO_RING_DFH(RING_HEAD, D_ALL, 0, NULL, NULL);
>>> +	MMIO_RING_DFH(RING_CTL, D_ALL, 0, NULL, NULL);
>>> +	MMIO_RING_DFH(RING_ACTHD, D_ALL, 0, mmio_read_from_hw, NULL);
>>> +	MMIO_RING_GM(RING_START, D_ALL, NULL, NULL);
>>> +
>>> +	/* RING MODE */
>>> +#define RING_REG(base) _MMIO((base) + 0x29c)
>>> +	MMIO_RING_DFH(RING_REG, D_ALL,
>>> +		F_MODE_MASK | F_CMD_ACCESS | F_CMD_WRITE_PATCH, NULL,
>>> +		ring_mode_mmio_write);
>>> +#undef RING_REG
>>> +
>>> +	MMIO_RING_DFH(RING_MI_MODE, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
>>> +		NULL, NULL);
>>> +	MMIO_RING_DFH(RING_INSTPM, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
>>> +			NULL, NULL);
>>> +	MMIO_RING_DFH(RING_TIMESTAMP, D_ALL, F_CMD_ACCESS,
>>> +			mmio_read_from_hw, NULL);
>>> +	MMIO_RING_DFH(RING_TIMESTAMP_UDW, D_ALL, F_CMD_ACCESS,
>>> +			mmio_read_from_hw, NULL);
>>> +
>>> +	MMIO_DFH(GEN7_GT_MODE, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(CACHE_MODE_0_GEN7, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
>>> +		NULL, NULL);
>>> +	MMIO_DFH(CACHE_MODE_1, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(CACHE_MODE_0, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x2124), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL=
);
>>> +
>>> +	MMIO_DFH(_MMIO(0x20dc), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL=
);
>>> +	MMIO_DFH(_3D_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x2088), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL=
);
>>> +	MMIO_DFH(FF_SLICE_CS_CHICKEN2, D_ALL,
>>> +		 F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x2470), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL=
);
>>> +	MMIO_DFH(GAM_ECOCHK, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(GEN7_COMMON_SLICE_CHICKEN1, D_ALL, F_MODE_MASK | F_CMD_ACCES=
S,
>>> +		NULL, NULL);
>>> +	MMIO_DFH(COMMON_SLICE_CHICKEN2, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
>>> +		 NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x9030), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x20a0), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x2420), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x2430), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x2434), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x2438), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x243c), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x7018), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL=
);
>>> +	MMIO_DFH(HALF_SLICE_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL=
, NULL);
>>> +	MMIO_DFH(GEN7_HALF_SLICE_CHICKEN1, D_ALL, F_MODE_MASK | F_CMD_ACCESS,=
 NULL, NULL);
>>> +
>>> +	/* display */
>>> +	MMIO_F(_MMIO(0x60220), 0x20, 0, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_D(_MMIO(0x602a0), D_ALL);
>>> +
>>> +	MMIO_D(_MMIO(0x65050), D_ALL);
>>> +	MMIO_D(_MMIO(0x650b4), D_ALL);
>>> +
>>> +	MMIO_D(_MMIO(0xc4040), D_ALL);
>>> +	MMIO_D(DERRMR, D_ALL);
>>> +
>>> +	MMIO_D(PIPEDSL(PIPE_A), D_ALL);
>>> +	MMIO_D(PIPEDSL(PIPE_B), D_ALL);
>>> +	MMIO_D(PIPEDSL(PIPE_C), D_ALL);
>>> +	MMIO_D(PIPEDSL(_PIPE_EDP), D_ALL);
>>> +
>>> +	MMIO_DH(PIPECONF(PIPE_A), D_ALL, NULL, pipeconf_mmio_write);
>>> +	MMIO_DH(PIPECONF(PIPE_B), D_ALL, NULL, pipeconf_mmio_write);
>>> +	MMIO_DH(PIPECONF(PIPE_C), D_ALL, NULL, pipeconf_mmio_write);
>>> +	MMIO_DH(PIPECONF(_PIPE_EDP), D_ALL, NULL, pipeconf_mmio_write);
>>> +
>>> +	MMIO_D(PIPESTAT(PIPE_A), D_ALL);
>>> +	MMIO_D(PIPESTAT(PIPE_B), D_ALL);
>>> +	MMIO_D(PIPESTAT(PIPE_C), D_ALL);
>>> +	MMIO_D(PIPESTAT(_PIPE_EDP), D_ALL);
>>> +
>>> +	MMIO_D(PIPE_FLIPCOUNT_G4X(PIPE_A), D_ALL);
>>> +	MMIO_D(PIPE_FLIPCOUNT_G4X(PIPE_B), D_ALL);
>>> +	MMIO_D(PIPE_FLIPCOUNT_G4X(PIPE_C), D_ALL);
>>> +	MMIO_D(PIPE_FLIPCOUNT_G4X(_PIPE_EDP), D_ALL);
>>> +
>>> +	MMIO_D(PIPE_FRMCOUNT_G4X(PIPE_A), D_ALL);
>>> +	MMIO_D(PIPE_FRMCOUNT_G4X(PIPE_B), D_ALL);
>>> +	MMIO_D(PIPE_FRMCOUNT_G4X(PIPE_C), D_ALL);
>>> +	MMIO_D(PIPE_FRMCOUNT_G4X(_PIPE_EDP), D_ALL);
>>> +
>>> +	MMIO_D(CURCNTR(PIPE_A), D_ALL);
>>> +	MMIO_D(CURCNTR(PIPE_B), D_ALL);
>>> +	MMIO_D(CURCNTR(PIPE_C), D_ALL);
>>> +
>>> +	MMIO_D(CURPOS(PIPE_A), D_ALL);
>>> +	MMIO_D(CURPOS(PIPE_B), D_ALL);
>>> +	MMIO_D(CURPOS(PIPE_C), D_ALL);
>>> +
>>> +	MMIO_D(CURBASE(PIPE_A), D_ALL);
>>> +	MMIO_D(CURBASE(PIPE_B), D_ALL);
>>> +	MMIO_D(CURBASE(PIPE_C), D_ALL);
>>> +
>>> +	MMIO_D(CUR_FBC_CTL(PIPE_A), D_ALL);
>>> +	MMIO_D(CUR_FBC_CTL(PIPE_B), D_ALL);
>>> +	MMIO_D(CUR_FBC_CTL(PIPE_C), D_ALL);
>>> +
>>> +	MMIO_D(_MMIO(0x700ac), D_ALL);
>>> +	MMIO_D(_MMIO(0x710ac), D_ALL);
>>> +	MMIO_D(_MMIO(0x720ac), D_ALL);
>>> +
>>> +	MMIO_D(_MMIO(0x70090), D_ALL);
>>> +	MMIO_D(_MMIO(0x70094), D_ALL);
>>> +	MMIO_D(_MMIO(0x70098), D_ALL);
>>> +	MMIO_D(_MMIO(0x7009c), D_ALL);
>>> +
>>> +	MMIO_D(DSPCNTR(PIPE_A), D_ALL);
>>> +	MMIO_D(DSPADDR(PIPE_A), D_ALL);
>>> +	MMIO_D(DSPSTRIDE(PIPE_A), D_ALL);
>>> +	MMIO_D(DSPPOS(PIPE_A), D_ALL);
>>> +	MMIO_D(DSPSIZE(PIPE_A), D_ALL);
>>> +	MMIO_DH(DSPSURF(PIPE_A), D_ALL, NULL, pri_surf_mmio_write);
>>> +	MMIO_D(DSPOFFSET(PIPE_A), D_ALL);
>>> +	MMIO_D(DSPSURFLIVE(PIPE_A), D_ALL);
>>> +	MMIO_DH(REG_50080(PIPE_A, PLANE_PRIMARY), D_ALL, NULL,
>>> +		reg50080_mmio_write);
>>> +
>>> +	MMIO_D(DSPCNTR(PIPE_B), D_ALL);
>>> +	MMIO_D(DSPADDR(PIPE_B), D_ALL);
>>> +	MMIO_D(DSPSTRIDE(PIPE_B), D_ALL);
>>> +	MMIO_D(DSPPOS(PIPE_B), D_ALL);
>>> +	MMIO_D(DSPSIZE(PIPE_B), D_ALL);
>>> +	MMIO_DH(DSPSURF(PIPE_B), D_ALL, NULL, pri_surf_mmio_write);
>>> +	MMIO_D(DSPOFFSET(PIPE_B), D_ALL);
>>> +	MMIO_D(DSPSURFLIVE(PIPE_B), D_ALL);
>>> +	MMIO_DH(REG_50080(PIPE_B, PLANE_PRIMARY), D_ALL, NULL,
>>> +		reg50080_mmio_write);
>>> +
>>> +	MMIO_D(DSPCNTR(PIPE_C), D_ALL);
>>> +	MMIO_D(DSPADDR(PIPE_C), D_ALL);
>>> +	MMIO_D(DSPSTRIDE(PIPE_C), D_ALL);
>>> +	MMIO_D(DSPPOS(PIPE_C), D_ALL);
>>> +	MMIO_D(DSPSIZE(PIPE_C), D_ALL);
>>> +	MMIO_DH(DSPSURF(PIPE_C), D_ALL, NULL, pri_surf_mmio_write);
>>> +	MMIO_D(DSPOFFSET(PIPE_C), D_ALL);
>>> +	MMIO_D(DSPSURFLIVE(PIPE_C), D_ALL);
>>> +	MMIO_DH(REG_50080(PIPE_C, PLANE_PRIMARY), D_ALL, NULL,
>>> +		reg50080_mmio_write);
>>> +
>>> +	MMIO_D(SPRCTL(PIPE_A), D_ALL);
>>> +	MMIO_D(SPRLINOFF(PIPE_A), D_ALL);
>>> +	MMIO_D(SPRSTRIDE(PIPE_A), D_ALL);
>>> +	MMIO_D(SPRPOS(PIPE_A), D_ALL);
>>> +	MMIO_D(SPRSIZE(PIPE_A), D_ALL);
>>> +	MMIO_D(SPRKEYVAL(PIPE_A), D_ALL);
>>> +	MMIO_D(SPRKEYMSK(PIPE_A), D_ALL);
>>> +	MMIO_DH(SPRSURF(PIPE_A), D_ALL, NULL, spr_surf_mmio_write);
>>> +	MMIO_D(SPRKEYMAX(PIPE_A), D_ALL);
>>> +	MMIO_D(SPROFFSET(PIPE_A), D_ALL);
>>> +	MMIO_D(SPRSCALE(PIPE_A), D_ALL);
>>> +	MMIO_D(SPRSURFLIVE(PIPE_A), D_ALL);
>>> +	MMIO_DH(REG_50080(PIPE_A, PLANE_SPRITE0), D_ALL, NULL,
>>> +		reg50080_mmio_write);
>>> +
>>> +	MMIO_D(SPRCTL(PIPE_B), D_ALL);
>>> +	MMIO_D(SPRLINOFF(PIPE_B), D_ALL);
>>> +	MMIO_D(SPRSTRIDE(PIPE_B), D_ALL);
>>> +	MMIO_D(SPRPOS(PIPE_B), D_ALL);
>>> +	MMIO_D(SPRSIZE(PIPE_B), D_ALL);
>>> +	MMIO_D(SPRKEYVAL(PIPE_B), D_ALL);
>>> +	MMIO_D(SPRKEYMSK(PIPE_B), D_ALL);
>>> +	MMIO_DH(SPRSURF(PIPE_B), D_ALL, NULL, spr_surf_mmio_write);
>>> +	MMIO_D(SPRKEYMAX(PIPE_B), D_ALL);
>>> +	MMIO_D(SPROFFSET(PIPE_B), D_ALL);
>>> +	MMIO_D(SPRSCALE(PIPE_B), D_ALL);
>>> +	MMIO_D(SPRSURFLIVE(PIPE_B), D_ALL);
>>> +	MMIO_DH(REG_50080(PIPE_B, PLANE_SPRITE0), D_ALL, NULL,
>>> +		reg50080_mmio_write);
>>> +
>>> +	MMIO_D(SPRCTL(PIPE_C), D_ALL);
>>> +	MMIO_D(SPRLINOFF(PIPE_C), D_ALL);
>>> +	MMIO_D(SPRSTRIDE(PIPE_C), D_ALL);
>>> +	MMIO_D(SPRPOS(PIPE_C), D_ALL);
>>> +	MMIO_D(SPRSIZE(PIPE_C), D_ALL);
>>> +	MMIO_D(SPRKEYVAL(PIPE_C), D_ALL);
>>> +	MMIO_D(SPRKEYMSK(PIPE_C), D_ALL);
>>> +	MMIO_DH(SPRSURF(PIPE_C), D_ALL, NULL, spr_surf_mmio_write);
>>> +	MMIO_D(SPRKEYMAX(PIPE_C), D_ALL);
>>> +	MMIO_D(SPROFFSET(PIPE_C), D_ALL);
>>> +	MMIO_D(SPRSCALE(PIPE_C), D_ALL);
>>> +	MMIO_D(SPRSURFLIVE(PIPE_C), D_ALL);
>>> +	MMIO_DH(REG_50080(PIPE_C, PLANE_SPRITE0), D_ALL, NULL,
>>> +		reg50080_mmio_write);
>>> +
>>> +	MMIO_D(HTOTAL(TRANSCODER_A), D_ALL);
>>> +	MMIO_D(HBLANK(TRANSCODER_A), D_ALL);
>>> +	MMIO_D(HSYNC(TRANSCODER_A), D_ALL);
>>> +	MMIO_D(VTOTAL(TRANSCODER_A), D_ALL);
>>> +	MMIO_D(VBLANK(TRANSCODER_A), D_ALL);
>>> +	MMIO_D(VSYNC(TRANSCODER_A), D_ALL);
>>> +	MMIO_D(BCLRPAT(TRANSCODER_A), D_ALL);
>>> +	MMIO_D(VSYNCSHIFT(TRANSCODER_A), D_ALL);
>>> +	MMIO_D(PIPESRC(TRANSCODER_A), D_ALL);
>>> +
>>> +	MMIO_D(HTOTAL(TRANSCODER_B), D_ALL);
>>> +	MMIO_D(HBLANK(TRANSCODER_B), D_ALL);
>>> +	MMIO_D(HSYNC(TRANSCODER_B), D_ALL);
>>> +	MMIO_D(VTOTAL(TRANSCODER_B), D_ALL);
>>> +	MMIO_D(VBLANK(TRANSCODER_B), D_ALL);
>>> +	MMIO_D(VSYNC(TRANSCODER_B), D_ALL);
>>> +	MMIO_D(BCLRPAT(TRANSCODER_B), D_ALL);
>>> +	MMIO_D(VSYNCSHIFT(TRANSCODER_B), D_ALL);
>>> +	MMIO_D(PIPESRC(TRANSCODER_B), D_ALL);
>>> +
>>> +	MMIO_D(HTOTAL(TRANSCODER_C), D_ALL);
>>> +	MMIO_D(HBLANK(TRANSCODER_C), D_ALL);
>>> +	MMIO_D(HSYNC(TRANSCODER_C), D_ALL);
>>> +	MMIO_D(VTOTAL(TRANSCODER_C), D_ALL);
>>> +	MMIO_D(VBLANK(TRANSCODER_C), D_ALL);
>>> +	MMIO_D(VSYNC(TRANSCODER_C), D_ALL);
>>> +	MMIO_D(BCLRPAT(TRANSCODER_C), D_ALL);
>>> +	MMIO_D(VSYNCSHIFT(TRANSCODER_C), D_ALL);
>>> +	MMIO_D(PIPESRC(TRANSCODER_C), D_ALL);
>>> +
>>> +	MMIO_D(HTOTAL(TRANSCODER_EDP), D_ALL);
>>> +	MMIO_D(HBLANK(TRANSCODER_EDP), D_ALL);
>>> +	MMIO_D(HSYNC(TRANSCODER_EDP), D_ALL);
>>> +	MMIO_D(VTOTAL(TRANSCODER_EDP), D_ALL);
>>> +	MMIO_D(VBLANK(TRANSCODER_EDP), D_ALL);
>>> +	MMIO_D(VSYNC(TRANSCODER_EDP), D_ALL);
>>> +	MMIO_D(BCLRPAT(TRANSCODER_EDP), D_ALL);
>>> +	MMIO_D(VSYNCSHIFT(TRANSCODER_EDP), D_ALL);
>>> +
>>> +	MMIO_D(PIPE_DATA_M1(TRANSCODER_A), D_ALL);
>>> +	MMIO_D(PIPE_DATA_N1(TRANSCODER_A), D_ALL);
>>> +	MMIO_D(PIPE_DATA_M2(TRANSCODER_A), D_ALL);
>>> +	MMIO_D(PIPE_DATA_N2(TRANSCODER_A), D_ALL);
>>> +	MMIO_D(PIPE_LINK_M1(TRANSCODER_A), D_ALL);
>>> +	MMIO_D(PIPE_LINK_N1(TRANSCODER_A), D_ALL);
>>> +	MMIO_D(PIPE_LINK_M2(TRANSCODER_A), D_ALL);
>>> +	MMIO_D(PIPE_LINK_N2(TRANSCODER_A), D_ALL);
>>> +
>>> +	MMIO_D(PIPE_DATA_M1(TRANSCODER_B), D_ALL);
>>> +	MMIO_D(PIPE_DATA_N1(TRANSCODER_B), D_ALL);
>>> +	MMIO_D(PIPE_DATA_M2(TRANSCODER_B), D_ALL);
>>> +	MMIO_D(PIPE_DATA_N2(TRANSCODER_B), D_ALL);
>>> +	MMIO_D(PIPE_LINK_M1(TRANSCODER_B), D_ALL);
>>> +	MMIO_D(PIPE_LINK_N1(TRANSCODER_B), D_ALL);
>>> +	MMIO_D(PIPE_LINK_M2(TRANSCODER_B), D_ALL);
>>> +	MMIO_D(PIPE_LINK_N2(TRANSCODER_B), D_ALL);
>>> +
>>> +	MMIO_D(PIPE_DATA_M1(TRANSCODER_C), D_ALL);
>>> +	MMIO_D(PIPE_DATA_N1(TRANSCODER_C), D_ALL);
>>> +	MMIO_D(PIPE_DATA_M2(TRANSCODER_C), D_ALL);
>>> +	MMIO_D(PIPE_DATA_N2(TRANSCODER_C), D_ALL);
>>> +	MMIO_D(PIPE_LINK_M1(TRANSCODER_C), D_ALL);
>>> +	MMIO_D(PIPE_LINK_N1(TRANSCODER_C), D_ALL);
>>> +	MMIO_D(PIPE_LINK_M2(TRANSCODER_C), D_ALL);
>>> +	MMIO_D(PIPE_LINK_N2(TRANSCODER_C), D_ALL);
>>> +
>>> +	MMIO_D(PIPE_DATA_M1(TRANSCODER_EDP), D_ALL);
>>> +	MMIO_D(PIPE_DATA_N1(TRANSCODER_EDP), D_ALL);
>>> +	MMIO_D(PIPE_DATA_M2(TRANSCODER_EDP), D_ALL);
>>> +	MMIO_D(PIPE_DATA_N2(TRANSCODER_EDP), D_ALL);
>>> +	MMIO_D(PIPE_LINK_M1(TRANSCODER_EDP), D_ALL);
>>> +	MMIO_D(PIPE_LINK_N1(TRANSCODER_EDP), D_ALL);
>>> +	MMIO_D(PIPE_LINK_M2(TRANSCODER_EDP), D_ALL);
>>> +	MMIO_D(PIPE_LINK_N2(TRANSCODER_EDP), D_ALL);
>>> +
>>> +	MMIO_D(PF_CTL(PIPE_A), D_ALL);
>>> +	MMIO_D(PF_WIN_SZ(PIPE_A), D_ALL);
>>> +	MMIO_D(PF_WIN_POS(PIPE_A), D_ALL);
>>> +	MMIO_D(PF_VSCALE(PIPE_A), D_ALL);
>>> +	MMIO_D(PF_HSCALE(PIPE_A), D_ALL);
>>> +
>>> +	MMIO_D(PF_CTL(PIPE_B), D_ALL);
>>> +	MMIO_D(PF_WIN_SZ(PIPE_B), D_ALL);
>>> +	MMIO_D(PF_WIN_POS(PIPE_B), D_ALL);
>>> +	MMIO_D(PF_VSCALE(PIPE_B), D_ALL);
>>> +	MMIO_D(PF_HSCALE(PIPE_B), D_ALL);
>>> +
>>> +	MMIO_D(PF_CTL(PIPE_C), D_ALL);
>>> +	MMIO_D(PF_WIN_SZ(PIPE_C), D_ALL);
>>> +	MMIO_D(PF_WIN_POS(PIPE_C), D_ALL);
>>> +	MMIO_D(PF_VSCALE(PIPE_C), D_ALL);
>>> +	MMIO_D(PF_HSCALE(PIPE_C), D_ALL);
>>> +
>>> +	MMIO_D(WM0_PIPE_ILK(PIPE_A), D_ALL);
>>> +	MMIO_D(WM0_PIPE_ILK(PIPE_B), D_ALL);
>>> +	MMIO_D(WM0_PIPE_ILK(PIPE_C), D_ALL);
>>> +	MMIO_D(WM1_LP_ILK, D_ALL);
>>> +	MMIO_D(WM2_LP_ILK, D_ALL);
>>> +	MMIO_D(WM3_LP_ILK, D_ALL);
>>> +	MMIO_D(WM1S_LP_ILK, D_ALL);
>>> +	MMIO_D(WM2S_LP_IVB, D_ALL);
>>> +	MMIO_D(WM3S_LP_IVB, D_ALL);
>>> +
>>> +	MMIO_D(BLC_PWM_CPU_CTL2, D_ALL);
>>> +	MMIO_D(BLC_PWM_CPU_CTL, D_ALL);
>>> +	MMIO_D(BLC_PWM_PCH_CTL1, D_ALL);
>>> +	MMIO_D(BLC_PWM_PCH_CTL2, D_ALL);
>>> +
>>> +	MMIO_D(_MMIO(0x48268), D_ALL);
>>> +
>>> +	MMIO_F(PCH_GMBUS0, 4 * 4, 0, 0, 0, D_ALL, gmbus_mmio_read,
>>> +		gmbus_mmio_write);
>>> +	MMIO_F(PCH_GPIO_BASE, 6 * 4, F_UNALIGN, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(_MMIO(0xe4f00), 0x28, 0, 0, 0, D_ALL, NULL, NULL);
>>> +
>>> +	MMIO_F(_MMIO(_PCH_DPB_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_PRE_SKL, NULL,
>>> +		dp_aux_ch_ctl_mmio_write);
>>> +	MMIO_F(_MMIO(_PCH_DPC_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_PRE_SKL, NULL,
>>> +		dp_aux_ch_ctl_mmio_write);
>>> +	MMIO_F(_MMIO(_PCH_DPD_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_PRE_SKL, NULL,
>>> +		dp_aux_ch_ctl_mmio_write);
>>> +
>>> +	MMIO_DH(PCH_ADPA, D_PRE_SKL, NULL, pch_adpa_mmio_write);
>>> +
>>> +	MMIO_DH(_MMIO(_PCH_TRANSACONF), D_ALL, NULL, transconf_mmio_write);
>>> +	MMIO_DH(_MMIO(_PCH_TRANSBCONF), D_ALL, NULL, transconf_mmio_write);
>>> +
>>> +	MMIO_DH(FDI_RX_IIR(PIPE_A), D_ALL, NULL, fdi_rx_iir_mmio_write);
>>> +	MMIO_DH(FDI_RX_IIR(PIPE_B), D_ALL, NULL, fdi_rx_iir_mmio_write);
>>> +	MMIO_DH(FDI_RX_IIR(PIPE_C), D_ALL, NULL, fdi_rx_iir_mmio_write);
>>> +	MMIO_DH(FDI_RX_IMR(PIPE_A), D_ALL, NULL, update_fdi_rx_iir_status);
>>> +	MMIO_DH(FDI_RX_IMR(PIPE_B), D_ALL, NULL, update_fdi_rx_iir_status);
>>> +	MMIO_DH(FDI_RX_IMR(PIPE_C), D_ALL, NULL, update_fdi_rx_iir_status);
>>> +	MMIO_DH(FDI_RX_CTL(PIPE_A), D_ALL, NULL, update_fdi_rx_iir_status);
>>> +	MMIO_DH(FDI_RX_CTL(PIPE_B), D_ALL, NULL, update_fdi_rx_iir_status);
>>> +	MMIO_DH(FDI_RX_CTL(PIPE_C), D_ALL, NULL, update_fdi_rx_iir_status);
>>> +
>>> +	MMIO_D(_MMIO(_PCH_TRANS_HTOTAL_A), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANS_HBLANK_A), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANS_HSYNC_A), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANS_VTOTAL_A), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANS_VBLANK_A), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANS_VSYNC_A), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANS_VSYNCSHIFT_A), D_ALL);
>>> +
>>> +	MMIO_D(_MMIO(_PCH_TRANS_HTOTAL_B), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANS_HBLANK_B), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANS_HSYNC_B), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANS_VTOTAL_B), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANS_VBLANK_B), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANS_VSYNC_B), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANS_VSYNCSHIFT_B), D_ALL);
>>> +
>>> +	MMIO_D(_MMIO(_PCH_TRANSA_DATA_M1), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANSA_DATA_N1), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANSA_DATA_M2), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANSA_DATA_N2), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANSA_LINK_M1), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANSA_LINK_N1), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANSA_LINK_M2), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_TRANSA_LINK_N2), D_ALL);
>>> +
>>> +	MMIO_D(TRANS_DP_CTL(PIPE_A), D_ALL);
>>> +	MMIO_D(TRANS_DP_CTL(PIPE_B), D_ALL);
>>> +	MMIO_D(TRANS_DP_CTL(PIPE_C), D_ALL);
>>> +
>>> +	MMIO_D(TVIDEO_DIP_CTL(PIPE_A), D_ALL);
>>> +	MMIO_D(TVIDEO_DIP_DATA(PIPE_A), D_ALL);
>>> +	MMIO_D(TVIDEO_DIP_GCP(PIPE_A), D_ALL);
>>> +
>>> +	MMIO_D(TVIDEO_DIP_CTL(PIPE_B), D_ALL);
>>> +	MMIO_D(TVIDEO_DIP_DATA(PIPE_B), D_ALL);
>>> +	MMIO_D(TVIDEO_DIP_GCP(PIPE_B), D_ALL);
>>> +
>>> +	MMIO_D(TVIDEO_DIP_CTL(PIPE_C), D_ALL);
>>> +	MMIO_D(TVIDEO_DIP_DATA(PIPE_C), D_ALL);
>>> +	MMIO_D(TVIDEO_DIP_GCP(PIPE_C), D_ALL);
>>> +
>>> +	MMIO_D(_MMIO(_FDI_RXA_MISC), D_ALL);
>>> +	MMIO_D(_MMIO(_FDI_RXB_MISC), D_ALL);
>>> +	MMIO_D(_MMIO(_FDI_RXA_TUSIZE1), D_ALL);
>>> +	MMIO_D(_MMIO(_FDI_RXA_TUSIZE2), D_ALL);
>>> +	MMIO_D(_MMIO(_FDI_RXB_TUSIZE1), D_ALL);
>>> +	MMIO_D(_MMIO(_FDI_RXB_TUSIZE2), D_ALL);
>>> +
>>> +	MMIO_DH(PCH_PP_CONTROL, D_ALL, NULL, pch_pp_control_mmio_write);
>>> +	MMIO_D(PCH_PP_DIVISOR, D_ALL);
>>> +	MMIO_D(PCH_PP_STATUS,  D_ALL);
>>> +	MMIO_D(PCH_LVDS, D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_DPLL_A), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_DPLL_B), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_FPA0), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_FPA1), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_FPB0), D_ALL);
>>> +	MMIO_D(_MMIO(_PCH_FPB1), D_ALL);
>>> +	MMIO_D(PCH_DREF_CONTROL, D_ALL);
>>> +	MMIO_D(PCH_RAWCLK_FREQ, D_ALL);
>>> +	MMIO_D(PCH_DPLL_SEL, D_ALL);
>>> +
>>> +	MMIO_D(_MMIO(0x61208), D_ALL);
>>> +	MMIO_D(_MMIO(0x6120c), D_ALL);
>>> +	MMIO_D(PCH_PP_ON_DELAYS, D_ALL);
>>> +	MMIO_D(PCH_PP_OFF_DELAYS, D_ALL);
>>> +
>>> +	MMIO_DH(_MMIO(0xe651c), D_ALL, dpy_reg_mmio_read, NULL);
>>> +	MMIO_DH(_MMIO(0xe661c), D_ALL, dpy_reg_mmio_read, NULL);
>>> +	MMIO_DH(_MMIO(0xe671c), D_ALL, dpy_reg_mmio_read, NULL);
>>> +	MMIO_DH(_MMIO(0xe681c), D_ALL, dpy_reg_mmio_read, NULL);
>>> +	MMIO_DH(_MMIO(0xe6c04), D_ALL, dpy_reg_mmio_read, NULL);
>>> +	MMIO_DH(_MMIO(0xe6e1c), D_ALL, dpy_reg_mmio_read, NULL);
>>> +
>>> +	MMIO_RO(PCH_PORT_HOTPLUG, D_ALL, 0,
>>> +		PORTA_HOTPLUG_STATUS_MASK
>>> +		| PORTB_HOTPLUG_STATUS_MASK
>>> +		| PORTC_HOTPLUG_STATUS_MASK
>>> +		| PORTD_HOTPLUG_STATUS_MASK,
>>> +		NULL, NULL);
>>> +
>>> +	MMIO_DH(LCPLL_CTL, D_ALL, NULL, lcpll_ctl_mmio_write);
>>> +	MMIO_D(FUSE_STRAP, D_ALL);
>>> +	MMIO_D(DIGITAL_PORT_HOTPLUG_CNTRL, D_ALL);
>>> +
>>> +	MMIO_D(DISP_ARB_CTL, D_ALL);
>>> +	MMIO_D(DISP_ARB_CTL2, D_ALL);
>>> +
>>> +	MMIO_D(ILK_DISPLAY_CHICKEN1, D_ALL);
>>> +	MMIO_D(ILK_DISPLAY_CHICKEN2, D_ALL);
>>> +	MMIO_D(ILK_DSPCLK_GATE_D, D_ALL);
>>> +
>>> +	MMIO_D(SOUTH_CHICKEN1, D_ALL);
>>> +	MMIO_DH(SOUTH_CHICKEN2, D_ALL, NULL, south_chicken2_mmio_write);
>>> +	MMIO_D(_MMIO(_TRANSA_CHICKEN1), D_ALL);
>>> +	MMIO_D(_MMIO(_TRANSB_CHICKEN1), D_ALL);
>>> +	MMIO_D(SOUTH_DSPCLK_GATE_D, D_ALL);
>>> +	MMIO_D(_MMIO(_TRANSA_CHICKEN2), D_ALL);
>>> +	MMIO_D(_MMIO(_TRANSB_CHICKEN2), D_ALL);
>>> +
>>> +	MMIO_D(ILK_DPFC_CB_BASE, D_ALL);
>>> +	MMIO_D(ILK_DPFC_CONTROL, D_ALL);
>>> +	MMIO_D(ILK_DPFC_RECOMP_CTL, D_ALL);
>>> +	MMIO_D(ILK_DPFC_STATUS, D_ALL);
>>> +	MMIO_D(ILK_DPFC_FENCE_YOFF, D_ALL);
>>> +	MMIO_D(ILK_DPFC_CHICKEN, D_ALL);
>>> +	MMIO_D(ILK_FBC_RT_BASE, D_ALL);
>>> +
>>> +	MMIO_D(IPS_CTL, D_ALL);
>>> +
>>> +	MMIO_D(PIPE_CSC_COEFF_RY_GY(PIPE_A), D_ALL);
>>> +	MMIO_D(PIPE_CSC_COEFF_BY(PIPE_A), D_ALL);
>>> +	MMIO_D(PIPE_CSC_COEFF_RU_GU(PIPE_A), D_ALL);
>>> +	MMIO_D(PIPE_CSC_COEFF_BU(PIPE_A), D_ALL);
>>> +	MMIO_D(PIPE_CSC_COEFF_RV_GV(PIPE_A), D_ALL);
>>> +	MMIO_D(PIPE_CSC_COEFF_BV(PIPE_A), D_ALL);
>>> +	MMIO_D(PIPE_CSC_MODE(PIPE_A), D_ALL);
>>> +	MMIO_D(PIPE_CSC_PREOFF_HI(PIPE_A), D_ALL);
>>> +	MMIO_D(PIPE_CSC_PREOFF_ME(PIPE_A), D_ALL);
>>> +	MMIO_D(PIPE_CSC_PREOFF_LO(PIPE_A), D_ALL);
>>> +	MMIO_D(PIPE_CSC_POSTOFF_HI(PIPE_A), D_ALL);
>>> +	MMIO_D(PIPE_CSC_POSTOFF_ME(PIPE_A), D_ALL);
>>> +	MMIO_D(PIPE_CSC_POSTOFF_LO(PIPE_A), D_ALL);
>>> +
>>> +	MMIO_D(PIPE_CSC_COEFF_RY_GY(PIPE_B), D_ALL);
>>> +	MMIO_D(PIPE_CSC_COEFF_BY(PIPE_B), D_ALL);
>>> +	MMIO_D(PIPE_CSC_COEFF_RU_GU(PIPE_B), D_ALL);
>>> +	MMIO_D(PIPE_CSC_COEFF_BU(PIPE_B), D_ALL);
>>> +	MMIO_D(PIPE_CSC_COEFF_RV_GV(PIPE_B), D_ALL);
>>> +	MMIO_D(PIPE_CSC_COEFF_BV(PIPE_B), D_ALL);
>>> +	MMIO_D(PIPE_CSC_MODE(PIPE_B), D_ALL);
>>> +	MMIO_D(PIPE_CSC_PREOFF_HI(PIPE_B), D_ALL);
>>> +	MMIO_D(PIPE_CSC_PREOFF_ME(PIPE_B), D_ALL);
>>> +	MMIO_D(PIPE_CSC_PREOFF_LO(PIPE_B), D_ALL);
>>> +	MMIO_D(PIPE_CSC_POSTOFF_HI(PIPE_B), D_ALL);
>>> +	MMIO_D(PIPE_CSC_POSTOFF_ME(PIPE_B), D_ALL);
>>> +	MMIO_D(PIPE_CSC_POSTOFF_LO(PIPE_B), D_ALL);
>>> +
>>> +	MMIO_D(PIPE_CSC_COEFF_RY_GY(PIPE_C), D_ALL);
>>> +	MMIO_D(PIPE_CSC_COEFF_BY(PIPE_C), D_ALL);
>>> +	MMIO_D(PIPE_CSC_COEFF_RU_GU(PIPE_C), D_ALL);
>>> +	MMIO_D(PIPE_CSC_COEFF_BU(PIPE_C), D_ALL);
>>> +	MMIO_D(PIPE_CSC_COEFF_RV_GV(PIPE_C), D_ALL);
>>> +	MMIO_D(PIPE_CSC_COEFF_BV(PIPE_C), D_ALL);
>>> +	MMIO_D(PIPE_CSC_MODE(PIPE_C), D_ALL);
>>> +	MMIO_D(PIPE_CSC_PREOFF_HI(PIPE_C), D_ALL);
>>> +	MMIO_D(PIPE_CSC_PREOFF_ME(PIPE_C), D_ALL);
>>> +	MMIO_D(PIPE_CSC_PREOFF_LO(PIPE_C), D_ALL);
>>> +	MMIO_D(PIPE_CSC_POSTOFF_HI(PIPE_C), D_ALL);
>>> +	MMIO_D(PIPE_CSC_POSTOFF_ME(PIPE_C), D_ALL);
>>> +	MMIO_D(PIPE_CSC_POSTOFF_LO(PIPE_C), D_ALL);
>>> +
>>> +	MMIO_D(PREC_PAL_INDEX(PIPE_A), D_ALL);
>>> +	MMIO_D(PREC_PAL_DATA(PIPE_A), D_ALL);
>>> +	MMIO_F(PREC_PAL_GC_MAX(PIPE_A, 0), 4 * 3, 0, 0, 0, D_ALL, NULL, NULL);
>>> +
>>> +	MMIO_D(PREC_PAL_INDEX(PIPE_B), D_ALL);
>>> +	MMIO_D(PREC_PAL_DATA(PIPE_B), D_ALL);
>>> +	MMIO_F(PREC_PAL_GC_MAX(PIPE_B, 0), 4 * 3, 0, 0, 0, D_ALL, NULL, NULL);
>>> +
>>> +	MMIO_D(PREC_PAL_INDEX(PIPE_C), D_ALL);
>>> +	MMIO_D(PREC_PAL_DATA(PIPE_C), D_ALL);
>>> +	MMIO_F(PREC_PAL_GC_MAX(PIPE_C, 0), 4 * 3, 0, 0, 0, D_ALL, NULL, NULL);
>>> +
>>> +	MMIO_D(_MMIO(0x60110), D_ALL);
>>> +	MMIO_D(_MMIO(0x61110), D_ALL);
>>> +	MMIO_F(_MMIO(0x70400), 0x40, 0, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(_MMIO(0x71400), 0x40, 0, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(_MMIO(0x72400), 0x40, 0, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(_MMIO(0x70440), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
>>> +	MMIO_F(_MMIO(0x71440), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
>>> +	MMIO_F(_MMIO(0x72440), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
>>> +	MMIO_F(_MMIO(0x7044c), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
>>> +	MMIO_F(_MMIO(0x7144c), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
>>> +	MMIO_F(_MMIO(0x7244c), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
>>> +
>>> +	MMIO_D(WM_LINETIME(PIPE_A), D_ALL);
>>> +	MMIO_D(WM_LINETIME(PIPE_B), D_ALL);
>>> +	MMIO_D(WM_LINETIME(PIPE_C), D_ALL);
>>> +	MMIO_D(SPLL_CTL, D_ALL);
>>> +	MMIO_D(_MMIO(_WRPLL_CTL1), D_ALL);
>>> +	MMIO_D(_MMIO(_WRPLL_CTL2), D_ALL);
>>> +	MMIO_D(PORT_CLK_SEL(PORT_A), D_ALL);
>>> +	MMIO_D(PORT_CLK_SEL(PORT_B), D_ALL);
>>> +	MMIO_D(PORT_CLK_SEL(PORT_C), D_ALL);
>>> +	MMIO_D(PORT_CLK_SEL(PORT_D), D_ALL);
>>> +	MMIO_D(PORT_CLK_SEL(PORT_E), D_ALL);
>>> +	MMIO_D(TRANS_CLK_SEL(TRANSCODER_A), D_ALL);
>>> +	MMIO_D(TRANS_CLK_SEL(TRANSCODER_B), D_ALL);
>>> +	MMIO_D(TRANS_CLK_SEL(TRANSCODER_C), D_ALL);
>>> +
>>> +	MMIO_D(HSW_NDE_RSTWRN_OPT, D_ALL);
>>> +	MMIO_D(_MMIO(0x46508), D_ALL);
>>> +
>>> +	MMIO_D(_MMIO(0x49080), D_ALL);
>>> +	MMIO_D(_MMIO(0x49180), D_ALL);
>>> +	MMIO_D(_MMIO(0x49280), D_ALL);
>>> +
>>> +	MMIO_F(_MMIO(0x49090), 0x14, 0, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(_MMIO(0x49190), 0x14, 0, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(_MMIO(0x49290), 0x14, 0, 0, 0, D_ALL, NULL, NULL);
>>> +
>>> +	MMIO_D(GAMMA_MODE(PIPE_A), D_ALL);
>>> +	MMIO_D(GAMMA_MODE(PIPE_B), D_ALL);
>>> +	MMIO_D(GAMMA_MODE(PIPE_C), D_ALL);
>>> +
>>> +	MMIO_D(PIPE_MULT(PIPE_A), D_ALL);
>>> +	MMIO_D(PIPE_MULT(PIPE_B), D_ALL);
>>> +	MMIO_D(PIPE_MULT(PIPE_C), D_ALL);
>>> +
>>> +	MMIO_D(HSW_TVIDEO_DIP_CTL(TRANSCODER_A), D_ALL);
>>> +	MMIO_D(HSW_TVIDEO_DIP_CTL(TRANSCODER_B), D_ALL);
>>> +	MMIO_D(HSW_TVIDEO_DIP_CTL(TRANSCODER_C), D_ALL);
>>> +
>>> +	MMIO_DH(SFUSE_STRAP, D_ALL, NULL, NULL);
>>> +	MMIO_D(SBI_ADDR, D_ALL);
>>> +	MMIO_DH(SBI_DATA, D_ALL, sbi_data_mmio_read, NULL);
>>> +	MMIO_DH(SBI_CTL_STAT, D_ALL, NULL, sbi_ctl_mmio_write);
>>> +	MMIO_D(PIXCLK_GATE, D_ALL);
>>> +
>>> +	MMIO_F(_MMIO(_DPA_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_ALL, NULL,
>>> +		dp_aux_ch_ctl_mmio_write);
>>> +
>>> +	MMIO_DH(DDI_BUF_CTL(PORT_A), D_ALL, NULL, ddi_buf_ctl_mmio_write);
>>> +	MMIO_DH(DDI_BUF_CTL(PORT_B), D_ALL, NULL, ddi_buf_ctl_mmio_write);
>>> +	MMIO_DH(DDI_BUF_CTL(PORT_C), D_ALL, NULL, ddi_buf_ctl_mmio_write);
>>> +	MMIO_DH(DDI_BUF_CTL(PORT_D), D_ALL, NULL, ddi_buf_ctl_mmio_write);
>>> +	MMIO_DH(DDI_BUF_CTL(PORT_E), D_ALL, NULL, ddi_buf_ctl_mmio_write);
>>> +
>>> +	MMIO_DH(DP_TP_CTL(PORT_A), D_ALL, NULL, dp_tp_ctl_mmio_write);
>>> +	MMIO_DH(DP_TP_CTL(PORT_B), D_ALL, NULL, dp_tp_ctl_mmio_write);
>>> +	MMIO_DH(DP_TP_CTL(PORT_C), D_ALL, NULL, dp_tp_ctl_mmio_write);
>>> +	MMIO_DH(DP_TP_CTL(PORT_D), D_ALL, NULL, dp_tp_ctl_mmio_write);
>>> +	MMIO_DH(DP_TP_CTL(PORT_E), D_ALL, NULL, dp_tp_ctl_mmio_write);
>>> +
>>> +	MMIO_DH(DP_TP_STATUS(PORT_A), D_ALL, NULL, dp_tp_status_mmio_write);
>>> +	MMIO_DH(DP_TP_STATUS(PORT_B), D_ALL, NULL, dp_tp_status_mmio_write);
>>> +	MMIO_DH(DP_TP_STATUS(PORT_C), D_ALL, NULL, dp_tp_status_mmio_write);
>>> +	MMIO_DH(DP_TP_STATUS(PORT_D), D_ALL, NULL, dp_tp_status_mmio_write);
>>> +	MMIO_DH(DP_TP_STATUS(PORT_E), D_ALL, NULL, NULL);
>>> +
>>> +	MMIO_F(_MMIO(_DDI_BUF_TRANS_A), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(_MMIO(0x64e60), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(_MMIO(0x64eC0), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(_MMIO(0x64f20), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(_MMIO(0x64f80), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
>>> +
>>> +	MMIO_D(HSW_AUD_CFG(PIPE_A), D_ALL);
>>> +	MMIO_D(HSW_AUD_PIN_ELD_CP_VLD, D_ALL);
>>> +	MMIO_D(HSW_AUD_MISC_CTRL(PIPE_A), D_ALL);
>>> +
>>> +	MMIO_DH(_MMIO(_TRANS_DDI_FUNC_CTL_A), D_ALL, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_TRANS_DDI_FUNC_CTL_B), D_ALL, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_TRANS_DDI_FUNC_CTL_C), D_ALL, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_TRANS_DDI_FUNC_CTL_EDP), D_ALL, NULL, NULL);
>>> +
>>> +	MMIO_D(_MMIO(_TRANSA_MSA_MISC), D_ALL);
>>> +	MMIO_D(_MMIO(_TRANSB_MSA_MISC), D_ALL);
>>> +	MMIO_D(_MMIO(_TRANSC_MSA_MISC), D_ALL);
>>> +	MMIO_D(_MMIO(_TRANS_EDP_MSA_MISC), D_ALL);
>>> +
>>> +	MMIO_DH(FORCEWAKE, D_ALL, NULL, NULL);
>>> +	MMIO_D(FORCEWAKE_ACK, D_ALL);
>>> +	MMIO_D(GEN6_GT_CORE_STATUS, D_ALL);
>>> +	MMIO_D(GEN6_GT_THREAD_STATUS_REG, D_ALL);
>>> +	MMIO_DFH(GTFIFODBG, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(GTFIFOCTL, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DH(FORCEWAKE_MT, D_PRE_SKL, NULL, mul_force_wake_write);
>>> +	MMIO_DH(FORCEWAKE_ACK_HSW, D_BDW, NULL, NULL);
>>> +	MMIO_D(ECOBUS, D_ALL);
>>> +	MMIO_DH(GEN6_RC_CONTROL, D_ALL, NULL, NULL);
>>> +	MMIO_DH(GEN6_RC_STATE, D_ALL, NULL, NULL);
>>> +	MMIO_D(GEN6_RPNSWREQ, D_ALL);
>>> +	MMIO_D(GEN6_RC_VIDEO_FREQ, D_ALL);
>>> +	MMIO_D(GEN6_RP_DOWN_TIMEOUT, D_ALL);
>>> +	MMIO_D(GEN6_RP_INTERRUPT_LIMITS, D_ALL);
>>> +	MMIO_D(GEN6_RPSTAT1, D_ALL);
>>> +	MMIO_D(GEN6_RP_CONTROL, D_ALL);
>>> +	MMIO_D(GEN6_RP_UP_THRESHOLD, D_ALL);
>>> +	MMIO_D(GEN6_RP_DOWN_THRESHOLD, D_ALL);
>>> +	MMIO_D(GEN6_RP_CUR_UP_EI, D_ALL);
>>> +	MMIO_D(GEN6_RP_CUR_UP, D_ALL);
>>> +	MMIO_D(GEN6_RP_PREV_UP, D_ALL);
>>> +	MMIO_D(GEN6_RP_CUR_DOWN_EI, D_ALL);
>>> +	MMIO_D(GEN6_RP_CUR_DOWN, D_ALL);
>>> +	MMIO_D(GEN6_RP_PREV_DOWN, D_ALL);
>>> +	MMIO_D(GEN6_RP_UP_EI, D_ALL);
>>> +	MMIO_D(GEN6_RP_DOWN_EI, D_ALL);
>>> +	MMIO_D(GEN6_RP_IDLE_HYSTERSIS, D_ALL);
>>> +	MMIO_D(GEN6_RC1_WAKE_RATE_LIMIT, D_ALL);
>>> +	MMIO_D(GEN6_RC6_WAKE_RATE_LIMIT, D_ALL);
>>> +	MMIO_D(GEN6_RC6pp_WAKE_RATE_LIMIT, D_ALL);
>>> +	MMIO_D(GEN6_RC_EVALUATION_INTERVAL, D_ALL);
>>> +	MMIO_D(GEN6_RC_IDLE_HYSTERSIS, D_ALL);
>>> +	MMIO_D(GEN6_RC_SLEEP, D_ALL);
>>> +	MMIO_D(GEN6_RC1e_THRESHOLD, D_ALL);
>>> +	MMIO_D(GEN6_RC6_THRESHOLD, D_ALL);
>>> +	MMIO_D(GEN6_RC6p_THRESHOLD, D_ALL);
>>> +	MMIO_D(GEN6_RC6pp_THRESHOLD, D_ALL);
>>> +	MMIO_D(GEN6_PMINTRMSK, D_ALL);
>>> +	MMIO_DH(HSW_PWR_WELL_CTL1, D_BDW, NULL, power_well_ctl_mmio_write);
>>> +	MMIO_DH(HSW_PWR_WELL_CTL2, D_BDW, NULL, power_well_ctl_mmio_write);
>>> +	MMIO_DH(HSW_PWR_WELL_CTL3, D_BDW, NULL, power_well_ctl_mmio_write);
>>> +	MMIO_DH(HSW_PWR_WELL_CTL4, D_BDW, NULL, power_well_ctl_mmio_write);
>>> +	MMIO_DH(HSW_PWR_WELL_CTL5, D_BDW, NULL, power_well_ctl_mmio_write);
>>> +	MMIO_DH(HSW_PWR_WELL_CTL6, D_BDW, NULL, power_well_ctl_mmio_write);
>>> +
>>> +	MMIO_D(RSTDBYCTL, D_ALL);
>>> +
>>> +	MMIO_DH(GEN6_GDRST, D_ALL, NULL, gdrst_mmio_write);
>>> +	MMIO_F(FENCE_REG_GEN6_LO(0), 0x80, 0, 0, 0, D_ALL, fence_mmio_read, f=
ence_mmio_write);
>>> +	MMIO_DH(CPU_VGACNTRL, D_ALL, NULL, vga_control_mmio_write);
>>> +
>>> +	MMIO_D(TILECTL, D_ALL);
>>> +
>>> +	MMIO_D(GEN6_UCGCTL1, D_ALL);
>>> +	MMIO_D(GEN6_UCGCTL2, D_ALL);
>>> +
>>> +	MMIO_F(_MMIO(0x4f000), 0x90, 0, 0, 0, D_ALL, NULL, NULL);
>>> +
>>> +	MMIO_D(GEN6_PCODE_DATA, D_ALL);
>>> +	MMIO_D(_MMIO(0x13812c), D_ALL);
>>> +	MMIO_DH(GEN7_ERR_INT, D_ALL, NULL, NULL);
>>> +	MMIO_D(HSW_EDRAM_CAP, D_ALL);
>>> +	MMIO_D(HSW_IDICR, D_ALL);
>>> +	MMIO_DH(GFX_FLSH_CNTL_GEN6, D_ALL, NULL, NULL);
>>> +
>>> +	MMIO_D(_MMIO(0x3c), D_ALL);
>>> +	MMIO_D(_MMIO(0x860), D_ALL);
>>> +	MMIO_D(ECOSKPD, D_ALL);
>>> +	MMIO_D(_MMIO(0x121d0), D_ALL);
>>> +	MMIO_D(GEN6_BLITTER_ECOSKPD, D_ALL);
>>> +	MMIO_D(_MMIO(0x41d0), D_ALL);
>>> +	MMIO_D(GAC_ECO_BITS, D_ALL);
>>> +	MMIO_D(_MMIO(0x6200), D_ALL);
>>> +	MMIO_D(_MMIO(0x6204), D_ALL);
>>> +	MMIO_D(_MMIO(0x6208), D_ALL);
>>> +	MMIO_D(_MMIO(0x7118), D_ALL);
>>> +	MMIO_D(_MMIO(0x7180), D_ALL);
>>> +	MMIO_D(_MMIO(0x7408), D_ALL);
>>> +	MMIO_D(_MMIO(0x7c00), D_ALL);
>>> +	MMIO_DH(GEN6_MBCTL, D_ALL, NULL, mbctl_write);
>>> +	MMIO_D(_MMIO(0x911c), D_ALL);
>>> +	MMIO_D(_MMIO(0x9120), D_ALL);
>>> +	MMIO_DFH(GEN7_UCGCTL4, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +
>>> +	MMIO_D(GAB_CTL, D_ALL);
>>> +	MMIO_D(_MMIO(0x48800), D_ALL);
>>> +	MMIO_D(_MMIO(0xce044), D_ALL);
>>> +	MMIO_D(_MMIO(0xe6500), D_ALL);
>>> +	MMIO_D(_MMIO(0xe6504), D_ALL);
>>> +	MMIO_D(_MMIO(0xe6600), D_ALL);
>>> +	MMIO_D(_MMIO(0xe6604), D_ALL);
>>> +	MMIO_D(_MMIO(0xe6700), D_ALL);
>>> +	MMIO_D(_MMIO(0xe6704), D_ALL);
>>> +	MMIO_D(_MMIO(0xe6800), D_ALL);
>>> +	MMIO_D(_MMIO(0xe6804), D_ALL);
>>> +	MMIO_D(PCH_GMBUS4, D_ALL);
>>> +	MMIO_D(PCH_GMBUS5, D_ALL);
>>> +
>>> +	MMIO_D(_MMIO(0x902c), D_ALL);
>>> +	MMIO_D(_MMIO(0xec008), D_ALL);
>>> +	MMIO_D(_MMIO(0xec00c), D_ALL);
>>> +	MMIO_D(_MMIO(0xec008 + 0x18), D_ALL);
>>> +	MMIO_D(_MMIO(0xec00c + 0x18), D_ALL);
>>> +	MMIO_D(_MMIO(0xec008 + 0x18 * 2), D_ALL);
>>> +	MMIO_D(_MMIO(0xec00c + 0x18 * 2), D_ALL);
>>> +	MMIO_D(_MMIO(0xec008 + 0x18 * 3), D_ALL);
>>> +	MMIO_D(_MMIO(0xec00c + 0x18 * 3), D_ALL);
>>> +	MMIO_D(_MMIO(0xec408), D_ALL);
>>> +	MMIO_D(_MMIO(0xec40c), D_ALL);
>>> +	MMIO_D(_MMIO(0xec408 + 0x18), D_ALL);
>>> +	MMIO_D(_MMIO(0xec40c + 0x18), D_ALL);
>>> +	MMIO_D(_MMIO(0xec408 + 0x18 * 2), D_ALL);
>>> +	MMIO_D(_MMIO(0xec40c + 0x18 * 2), D_ALL);
>>> +	MMIO_D(_MMIO(0xec408 + 0x18 * 3), D_ALL);
>>> +	MMIO_D(_MMIO(0xec40c + 0x18 * 3), D_ALL);
>>> +	MMIO_D(_MMIO(0xfc810), D_ALL);
>>> +	MMIO_D(_MMIO(0xfc81c), D_ALL);
>>> +	MMIO_D(_MMIO(0xfc828), D_ALL);
>>> +	MMIO_D(_MMIO(0xfc834), D_ALL);
>>> +	MMIO_D(_MMIO(0xfcc00), D_ALL);
>>> +	MMIO_D(_MMIO(0xfcc0c), D_ALL);
>>> +	MMIO_D(_MMIO(0xfcc18), D_ALL);
>>> +	MMIO_D(_MMIO(0xfcc24), D_ALL);
>>> +	MMIO_D(_MMIO(0xfd000), D_ALL);
>>> +	MMIO_D(_MMIO(0xfd00c), D_ALL);
>>> +	MMIO_D(_MMIO(0xfd018), D_ALL);
>>> +	MMIO_D(_MMIO(0xfd024), D_ALL);
>>> +	MMIO_D(_MMIO(0xfd034), D_ALL);
>>> +
>>> +	MMIO_DH(FPGA_DBG, D_ALL, NULL, fpga_dbg_mmio_write);
>>> +	MMIO_D(_MMIO(0x2054), D_ALL);
>>> +	MMIO_D(_MMIO(0x12054), D_ALL);
>>> +	MMIO_D(_MMIO(0x22054), D_ALL);
>>> +	MMIO_D(_MMIO(0x1a054), D_ALL);
>>> +
>>> +	MMIO_D(_MMIO(0x44070), D_ALL);
>>> +	MMIO_DFH(_MMIO(0x215c), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x2178), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x217c), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x12178), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x1217c), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +
>>> +	MMIO_F(_MMIO(0x2290), 8, F_CMD_ACCESS, 0, 0, D_BDW_PLUS, NULL, NULL);
>>> +	MMIO_D(_MMIO(0x2b00), D_BDW_PLUS);
>>> +	MMIO_D(_MMIO(0x2360), D_BDW_PLUS);
>>> +	MMIO_F(_MMIO(0x5200), 32, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(_MMIO(0x5240), 32, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(_MMIO(0x5280), 16, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> +
>>> +	MMIO_DFH(_MMIO(0x1c17c), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x1c178), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(BCS_SWCTRL, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +
>>> +	MMIO_F(HS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(DS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(IA_VERTICES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(IA_PRIMITIVES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(VS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(GS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(GS_PRIMITIVES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(CL_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(CL_PRIMITIVES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(PS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_F(PS_DEPTH_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
>>> +	MMIO_DH(_MMIO(0x4260), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
>>> +	MMIO_DH(_MMIO(0x4264), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
>>> +	MMIO_DH(_MMIO(0x4268), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
>>> +	MMIO_DH(_MMIO(0x426c), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
>>> +	MMIO_DH(_MMIO(0x4270), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
>>> +	MMIO_DFH(_MMIO(0x4094), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +
>>> +	MMIO_DFH(ARB_MODE, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_RING_GM(RING_BBADDR, D_ALL, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x2220), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x12220), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x22220), D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_RING_DFH(RING_SYNC_1, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_RING_DFH(RING_SYNC_0, D_ALL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x22178), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x1a178), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x1a17c), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x2217c), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +
>>> +	MMIO_DH(EDP_PSR_IMR, D_BDW_PLUS, NULL, edp_psr_imr_iir_write);
>>> +	MMIO_DH(EDP_PSR_IIR, D_BDW_PLUS, NULL, edp_psr_imr_iir_write);
>>> +	MMIO_DH(GUC_STATUS, D_ALL, guc_status_read, NULL);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int intel_gvt_init_bdw_mmio_info(struct intel_gvt *gvt)
>>> +{
>>> +	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
>>> +	int ret;
>>> +
>>> +	MMIO_DH(GEN8_GT_IMR(0), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
>>> +	MMIO_DH(GEN8_GT_IER(0), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
>>> +	MMIO_DH(GEN8_GT_IIR(0), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
>>> +	MMIO_D(GEN8_GT_ISR(0), D_BDW_PLUS);
>>> +
>>> +	MMIO_DH(GEN8_GT_IMR(1), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
>>> +	MMIO_DH(GEN8_GT_IER(1), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
>>> +	MMIO_DH(GEN8_GT_IIR(1), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
>>> +	MMIO_D(GEN8_GT_ISR(1), D_BDW_PLUS);
>>> +
>>> +	MMIO_DH(GEN8_GT_IMR(2), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
>>> +	MMIO_DH(GEN8_GT_IER(2), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
>>> +	MMIO_DH(GEN8_GT_IIR(2), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
>>> +	MMIO_D(GEN8_GT_ISR(2), D_BDW_PLUS);
>>> +
>>> +	MMIO_DH(GEN8_GT_IMR(3), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
>>> +	MMIO_DH(GEN8_GT_IER(3), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
>>> +	MMIO_DH(GEN8_GT_IIR(3), D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
>>> +	MMIO_D(GEN8_GT_ISR(3), D_BDW_PLUS);
>>> +
>>> +	MMIO_DH(GEN8_DE_PIPE_IMR(PIPE_A), D_BDW_PLUS, NULL,
>>> +		intel_vgpu_reg_imr_handler);
>>> +	MMIO_DH(GEN8_DE_PIPE_IER(PIPE_A), D_BDW_PLUS, NULL,
>>> +		intel_vgpu_reg_ier_handler);
>>> +	MMIO_DH(GEN8_DE_PIPE_IIR(PIPE_A), D_BDW_PLUS, NULL,
>>> +		intel_vgpu_reg_iir_handler);
>>> +	MMIO_D(GEN8_DE_PIPE_ISR(PIPE_A), D_BDW_PLUS);
>>> +
>>> +	MMIO_DH(GEN8_DE_PIPE_IMR(PIPE_B), D_BDW_PLUS, NULL,
>>> +		intel_vgpu_reg_imr_handler);
>>> +	MMIO_DH(GEN8_DE_PIPE_IER(PIPE_B), D_BDW_PLUS, NULL,
>>> +		intel_vgpu_reg_ier_handler);
>>> +	MMIO_DH(GEN8_DE_PIPE_IIR(PIPE_B), D_BDW_PLUS, NULL,
>>> +		intel_vgpu_reg_iir_handler);
>>> +	MMIO_D(GEN8_DE_PIPE_ISR(PIPE_B), D_BDW_PLUS);
>>> +
>>> +	MMIO_DH(GEN8_DE_PIPE_IMR(PIPE_C), D_BDW_PLUS, NULL,
>>> +		intel_vgpu_reg_imr_handler);
>>> +	MMIO_DH(GEN8_DE_PIPE_IER(PIPE_C), D_BDW_PLUS, NULL,
>>> +		intel_vgpu_reg_ier_handler);
>>> +	MMIO_DH(GEN8_DE_PIPE_IIR(PIPE_C), D_BDW_PLUS, NULL,
>>> +		intel_vgpu_reg_iir_handler);
>>> +	MMIO_D(GEN8_DE_PIPE_ISR(PIPE_C), D_BDW_PLUS);
>>> +
>>> +	MMIO_DH(GEN8_DE_PORT_IMR, D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handle=
r);
>>> +	MMIO_DH(GEN8_DE_PORT_IER, D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handle=
r);
>>> +	MMIO_DH(GEN8_DE_PORT_IIR, D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handle=
r);
>>> +	MMIO_D(GEN8_DE_PORT_ISR, D_BDW_PLUS);
>>> +
>>> +	MMIO_DH(GEN8_DE_MISC_IMR, D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handle=
r);
>>> +	MMIO_DH(GEN8_DE_MISC_IER, D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handle=
r);
>>> +	MMIO_DH(GEN8_DE_MISC_IIR, D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handle=
r);
>>> +	MMIO_D(GEN8_DE_MISC_ISR, D_BDW_PLUS);
>>> +
>>> +	MMIO_DH(GEN8_PCU_IMR, D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
>>> +	MMIO_DH(GEN8_PCU_IER, D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
>>> +	MMIO_DH(GEN8_PCU_IIR, D_BDW_PLUS, NULL, intel_vgpu_reg_iir_handler);
>>> +	MMIO_D(GEN8_PCU_ISR, D_BDW_PLUS);
>>> +
>>> +	MMIO_DH(GEN8_MASTER_IRQ, D_BDW_PLUS, NULL,
>>> +		intel_vgpu_reg_master_irq_handler);
>>> +
>>> +	MMIO_RING_DFH(RING_ACTHD_UDW, D_BDW_PLUS, 0,
>>> +		mmio_read_from_hw, NULL);
>>> +
>>> +#define RING_REG(base) _MMIO((base) + 0xd0)
>>> +	MMIO_RING_F(RING_REG, 4, F_RO, 0,
>>> +		~_MASKED_BIT_ENABLE(RESET_CTL_REQUEST_RESET), D_BDW_PLUS, NULL,
>>> +		ring_reset_ctl_write);
>>> +#undef RING_REG
>>> +
>>> +#define RING_REG(base) _MMIO((base) + 0x230)
>>> +	MMIO_RING_DFH(RING_REG, D_BDW_PLUS, 0, NULL, elsp_mmio_write);
>>> +#undef RING_REG
>>> +
>>> +#define RING_REG(base) _MMIO((base) + 0x234)
>>> +	MMIO_RING_F(RING_REG, 8, F_RO, 0, ~0, D_BDW_PLUS,
>>> +		NULL, NULL);
>>> +#undef RING_REG
>>> +
>>> +#define RING_REG(base) _MMIO((base) + 0x244)
>>> +	MMIO_RING_DFH(RING_REG, D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +#undef RING_REG
>>> +
>>> +#define RING_REG(base) _MMIO((base) + 0x370)
>>> +	MMIO_RING_F(RING_REG, 48, F_RO, 0, ~0, D_BDW_PLUS, NULL, NULL);
>>> +#undef RING_REG
>>> +
>>> +#define RING_REG(base) _MMIO((base) + 0x3a0)
>>> +	MMIO_RING_DFH(RING_REG, D_BDW_PLUS, F_MODE_MASK, NULL, NULL);
>>> +#undef RING_REG
>>> +
>>> +	MMIO_D(PIPEMISC(PIPE_A), D_BDW_PLUS);
>>> +	MMIO_D(PIPEMISC(PIPE_B), D_BDW_PLUS);
>>> +	MMIO_D(PIPEMISC(PIPE_C), D_BDW_PLUS);
>>> +	MMIO_D(_MMIO(0x1c1d0), D_BDW_PLUS);
>>> +	MMIO_D(GEN6_MBCUNIT_SNPCR, D_BDW_PLUS);
>>> +	MMIO_D(GEN7_MISCCPCTL, D_BDW_PLUS);
>>> +	MMIO_D(_MMIO(0x1c054), D_BDW_PLUS);
>>> +
>>> +	MMIO_DH(GEN6_PCODE_MAILBOX, D_BDW_PLUS, NULL, mailbox_write);
>>> +
>>> +	MMIO_D(GEN8_PRIVATE_PAT_LO, D_BDW_PLUS & ~D_BXT);
>>> +	MMIO_D(GEN8_PRIVATE_PAT_HI, D_BDW_PLUS);
>>> +
>>> +	MMIO_D(GAMTARBMODE, D_BDW_PLUS);
>>> +
>>> +#define RING_REG(base) _MMIO((base) + 0x270)
>>> +	MMIO_RING_F(RING_REG, 32, F_CMD_ACCESS, 0, 0, D_BDW_PLUS, NULL, NULL);
>>> +#undef RING_REG
>>> +
>>> +	MMIO_RING_GM(RING_HWS_PGA, D_BDW_PLUS, NULL, hws_pga_write);
>>> +
>>> +	MMIO_DFH(HDC_CHICKEN0, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, =
NULL);
>>> +
>>> +	MMIO_D(CHICKEN_PIPESL_1(PIPE_A), D_BDW_PLUS);
>>> +	MMIO_D(CHICKEN_PIPESL_1(PIPE_B), D_BDW_PLUS);
>>> +	MMIO_D(CHICKEN_PIPESL_1(PIPE_C), D_BDW_PLUS);
>>> +
>>> +	MMIO_D(WM_MISC, D_BDW);
>>> +	MMIO_D(_MMIO(_SRD_CTL_EDP), D_BDW);
>>> +
>>> +	MMIO_D(_MMIO(0x6671c), D_BDW_PLUS);
>>> +	MMIO_D(_MMIO(0x66c00), D_BDW_PLUS);
>>> +	MMIO_D(_MMIO(0x66c04), D_BDW_PLUS);
>>> +
>>> +	MMIO_D(HSW_GTT_CACHE_EN, D_BDW_PLUS);
>>> +
>>> +	MMIO_D(GEN8_EU_DISABLE0, D_BDW_PLUS);
>>> +	MMIO_D(GEN8_EU_DISABLE1, D_BDW_PLUS);
>>> +	MMIO_D(GEN8_EU_DISABLE2, D_BDW_PLUS);
>>> +
>>> +	MMIO_D(_MMIO(0xfdc), D_BDW_PLUS);
>>> +	MMIO_DFH(GEN8_ROW_CHICKEN, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>>> +		NULL, NULL);
>>> +	MMIO_DFH(GEN7_ROW_CHICKEN2, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>>> +		NULL, NULL);
>>> +	MMIO_DFH(GEN8_UCGCTL6, D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +
>>> +	MMIO_DFH(_MMIO(0xb1f0), D_BDW, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0xb1c0), D_BDW, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(GEN8_L3SQCREG4, D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0xb100), D_BDW, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0xb10c), D_BDW, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_D(_MMIO(0xb110), D_BDW);
>>> +	MMIO_D(GEN9_SCRATCH_LNCF1, D_BDW_PLUS);
>>> +
>>> +	MMIO_F(_MMIO(0x24d0), 48, F_CMD_ACCESS | F_CMD_WRITE_PATCH, 0, 0,
>>> +		D_BDW_PLUS, NULL, force_nonpriv_write);
>>> +
>>> +	MMIO_D(_MMIO(0x44484), D_BDW_PLUS);
>>> +	MMIO_D(_MMIO(0x4448c), D_BDW_PLUS);
>>> +
>>> +	MMIO_DFH(_MMIO(0x83a4), D_BDW, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_D(GEN8_L3_LRA_1_GPGPU, D_BDW_PLUS);
>>> +
>>> +	MMIO_DFH(_MMIO(0x8430), D_BDW, F_CMD_ACCESS, NULL, NULL);
>>> +
>>> +	MMIO_D(_MMIO(0x110000), D_BDW_PLUS);
>>> +
>>> +	MMIO_D(_MMIO(0x48400), D_BDW_PLUS);
>>> +
>>> +	MMIO_D(_MMIO(0x6e570), D_BDW_PLUS);
>>> +	MMIO_D(_MMIO(0x65f10), D_BDW_PLUS);
>>> +
>>> +	MMIO_DFH(_MMIO(0xe194), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL,=
 NULL);
>>> +	MMIO_DFH(_MMIO(0xe188), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL,=
 NULL);
>>> +	MMIO_DFH(HALF_SLICE_CHICKEN2, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS,=
 NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x2580), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL,=
 NULL);
>>> +
>>> +	MMIO_DFH(_MMIO(0x2248), D_BDW, F_CMD_ACCESS, NULL, NULL);
>>> +
>>> +	MMIO_DFH(_MMIO(0xe220), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0xe230), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0xe240), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0xe260), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0xe270), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0xe280), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0xe2a0), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0xe2b0), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0xe2c0), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x21f0), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	return 0;
>>> +}
>>> +
>>> +static int intel_gvt_init_skl_mmio_info(struct intel_gvt *gvt)
>>> +{
>>> +	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
>>> +	int ret;
>>> +
>>> +	MMIO_DH(FORCEWAKE_RENDER_GEN9, D_SKL_PLUS, NULL, mul_force_wake_write=
);
>>> +	MMIO_DH(FORCEWAKE_ACK_RENDER_GEN9, D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(FORCEWAKE_GT_GEN9, D_SKL_PLUS, NULL, mul_force_wake_write);
>>> +	MMIO_DH(FORCEWAKE_ACK_GT_GEN9, D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(FORCEWAKE_MEDIA_GEN9, D_SKL_PLUS, NULL, mul_force_wake_write);
>>> +	MMIO_DH(FORCEWAKE_ACK_MEDIA_GEN9, D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_F(DP_AUX_CH_CTL(AUX_CH_B), 6 * 4, 0, 0, 0, D_SKL_PLUS, NULL,
>>> +						dp_aux_ch_ctl_mmio_write);
>>> +	MMIO_F(DP_AUX_CH_CTL(AUX_CH_C), 6 * 4, 0, 0, 0, D_SKL_PLUS, NULL,
>>> +						dp_aux_ch_ctl_mmio_write);
>>> +	MMIO_F(DP_AUX_CH_CTL(AUX_CH_D), 6 * 4, 0, 0, 0, D_SKL_PLUS, NULL,
>>> +						dp_aux_ch_ctl_mmio_write);
>>> +
>>> +	MMIO_D(HSW_PWR_WELL_CTL1, D_SKL_PLUS);
>>> +	MMIO_DH(HSW_PWR_WELL_CTL2, D_SKL_PLUS, NULL, skl_power_well_ctl_write=
);
>>> +
>>> +	MMIO_DH(DBUF_CTL_S(0), D_SKL_PLUS, NULL, gen9_dbuf_ctl_mmio_write);
>>> +
>>> +	MMIO_D(GEN9_PG_ENABLE, D_SKL_PLUS);
>>> +	MMIO_D(GEN9_MEDIA_PG_IDLE_HYSTERESIS, D_SKL_PLUS);
>>> +	MMIO_D(GEN9_RENDER_PG_IDLE_HYSTERESIS, D_SKL_PLUS);
>>> +	MMIO_DFH(GEN9_GAMT_ECO_REG_RW_IA, D_SKL_PLUS, F_CMD_ACCESS, NULL, NUL=
L);
>>> +	MMIO_DFH(MMCD_MISC_CTRL, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DH(CHICKEN_PAR1_1, D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_D(DC_STATE_EN, D_SKL_PLUS);
>>> +	MMIO_D(DC_STATE_DEBUG, D_SKL_PLUS);
>>> +	MMIO_D(CDCLK_CTL, D_SKL_PLUS);
>>> +	MMIO_DH(LCPLL1_CTL, D_SKL_PLUS, NULL, skl_lcpll_write);
>>> +	MMIO_DH(LCPLL2_CTL, D_SKL_PLUS, NULL, skl_lcpll_write);
>>> +	MMIO_D(_MMIO(_DPLL1_CFGCR1), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(_DPLL2_CFGCR1), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(_DPLL3_CFGCR1), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(_DPLL1_CFGCR2), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(_DPLL2_CFGCR2), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(_DPLL3_CFGCR2), D_SKL_PLUS);
>>> +	MMIO_D(DPLL_CTRL1, D_SKL_PLUS);
>>> +	MMIO_D(DPLL_CTRL2, D_SKL_PLUS);
>>> +	MMIO_DH(DPLL_STATUS, D_SKL_PLUS, dpll_status_read, NULL);
>>> +
>>> +	MMIO_DH(SKL_PS_WIN_POS(PIPE_A, 0), D_SKL_PLUS, NULL, pf_write);
>>> +	MMIO_DH(SKL_PS_WIN_POS(PIPE_A, 1), D_SKL_PLUS, NULL, pf_write);
>>> +	MMIO_DH(SKL_PS_WIN_POS(PIPE_B, 0), D_SKL_PLUS, NULL, pf_write);
>>> +	MMIO_DH(SKL_PS_WIN_POS(PIPE_B, 1), D_SKL_PLUS, NULL, pf_write);
>>> +	MMIO_DH(SKL_PS_WIN_POS(PIPE_C, 0), D_SKL_PLUS, NULL, pf_write);
>>> +	MMIO_DH(SKL_PS_WIN_POS(PIPE_C, 1), D_SKL_PLUS, NULL, pf_write);
>>> +
>>> +	MMIO_DH(SKL_PS_WIN_SZ(PIPE_A, 0), D_SKL_PLUS, NULL, pf_write);
>>> +	MMIO_DH(SKL_PS_WIN_SZ(PIPE_A, 1), D_SKL_PLUS, NULL, pf_write);
>>> +	MMIO_DH(SKL_PS_WIN_SZ(PIPE_B, 0), D_SKL_PLUS, NULL, pf_write);
>>> +	MMIO_DH(SKL_PS_WIN_SZ(PIPE_B, 1), D_SKL_PLUS, NULL, pf_write);
>>> +	MMIO_DH(SKL_PS_WIN_SZ(PIPE_C, 0), D_SKL_PLUS, NULL, pf_write);
>>> +	MMIO_DH(SKL_PS_WIN_SZ(PIPE_C, 1), D_SKL_PLUS, NULL, pf_write);
>>> +
>>> +	MMIO_DH(SKL_PS_CTRL(PIPE_A, 0), D_SKL_PLUS, NULL, pf_write);
>>> +	MMIO_DH(SKL_PS_CTRL(PIPE_A, 1), D_SKL_PLUS, NULL, pf_write);
>>> +	MMIO_DH(SKL_PS_CTRL(PIPE_B, 0), D_SKL_PLUS, NULL, pf_write);
>>> +	MMIO_DH(SKL_PS_CTRL(PIPE_B, 1), D_SKL_PLUS, NULL, pf_write);
>>> +	MMIO_DH(SKL_PS_CTRL(PIPE_C, 0), D_SKL_PLUS, NULL, pf_write);
>>> +	MMIO_DH(SKL_PS_CTRL(PIPE_C, 1), D_SKL_PLUS, NULL, pf_write);
>>> +
>>> +	MMIO_DH(PLANE_BUF_CFG(PIPE_A, 0), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_BUF_CFG(PIPE_A, 1), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_BUF_CFG(PIPE_A, 2), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_BUF_CFG(PIPE_A, 3), D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_DH(PLANE_BUF_CFG(PIPE_B, 0), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_BUF_CFG(PIPE_B, 1), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_BUF_CFG(PIPE_B, 2), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_BUF_CFG(PIPE_B, 3), D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_DH(PLANE_BUF_CFG(PIPE_C, 0), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_BUF_CFG(PIPE_C, 1), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_BUF_CFG(PIPE_C, 2), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_BUF_CFG(PIPE_C, 3), D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_DH(CUR_BUF_CFG(PIPE_A), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(CUR_BUF_CFG(PIPE_B), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(CUR_BUF_CFG(PIPE_C), D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_F(PLANE_WM(PIPE_A, 0, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> +	MMIO_F(PLANE_WM(PIPE_A, 1, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> +	MMIO_F(PLANE_WM(PIPE_A, 2, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> +
>>> +	MMIO_F(PLANE_WM(PIPE_B, 0, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> +	MMIO_F(PLANE_WM(PIPE_B, 1, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> +	MMIO_F(PLANE_WM(PIPE_B, 2, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> +
>>> +	MMIO_F(PLANE_WM(PIPE_C, 0, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> +	MMIO_F(PLANE_WM(PIPE_C, 1, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> +	MMIO_F(PLANE_WM(PIPE_C, 2, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL=
);
>>> +
>>> +	MMIO_F(CUR_WM(PIPE_A, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_F(CUR_WM(PIPE_B, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_F(CUR_WM(PIPE_C, 0), 4 * 8, 0, 0, 0, D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_DH(PLANE_WM_TRANS(PIPE_A, 0), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_WM_TRANS(PIPE_A, 1), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_WM_TRANS(PIPE_A, 2), D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_DH(PLANE_WM_TRANS(PIPE_B, 0), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_WM_TRANS(PIPE_B, 1), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_WM_TRANS(PIPE_B, 2), D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_DH(PLANE_WM_TRANS(PIPE_C, 0), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_WM_TRANS(PIPE_C, 1), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_WM_TRANS(PIPE_C, 2), D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_DH(CUR_WM_TRANS(PIPE_A), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(CUR_WM_TRANS(PIPE_B), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(CUR_WM_TRANS(PIPE_C), D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_A, 0), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_A, 1), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_A, 2), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_A, 3), D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_B, 0), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_B, 1), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_B, 2), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_B, 3), D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_C, 0), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_C, 1), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_C, 2), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(PLANE_NV12_BUF_CFG(PIPE_C, 3), D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_DH(_MMIO(_REG_701C0(PIPE_A, 1)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C0(PIPE_A, 2)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C0(PIPE_A, 3)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C0(PIPE_A, 4)), D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_DH(_MMIO(_REG_701C0(PIPE_B, 1)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C0(PIPE_B, 2)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C0(PIPE_B, 3)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C0(PIPE_B, 4)), D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_DH(_MMIO(_REG_701C0(PIPE_C, 1)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C0(PIPE_C, 2)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C0(PIPE_C, 3)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C0(PIPE_C, 4)), D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_DH(_MMIO(_REG_701C4(PIPE_A, 1)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C4(PIPE_A, 2)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C4(PIPE_A, 3)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C4(PIPE_A, 4)), D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_DH(_MMIO(_REG_701C4(PIPE_B, 1)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C4(PIPE_B, 2)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C4(PIPE_B, 3)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C4(PIPE_B, 4)), D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_DH(_MMIO(_REG_701C4(PIPE_C, 1)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C4(PIPE_C, 2)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C4(PIPE_C, 3)), D_SKL_PLUS, NULL, NULL);
>>> +	MMIO_DH(_MMIO(_REG_701C4(PIPE_C, 4)), D_SKL_PLUS, NULL, NULL);
>>> +
>>> +	MMIO_D(_MMIO(_PLANE_CTL_3_A), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(_PLANE_CTL_3_B), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(0x72380), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(0x7239c), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(_PLANE_SURF_3_A), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(_PLANE_SURF_3_B), D_SKL_PLUS);
>>> +
>>> +	MMIO_D(DMC_SSP_BASE, D_SKL_PLUS);
>>> +	MMIO_D(DMC_HTP_SKL, D_SKL_PLUS);
>>> +	MMIO_D(DMC_LAST_WRITE, D_SKL_PLUS);
>>> +
>>> +	MMIO_DFH(BDW_SCRATCH1, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +
>>> +	MMIO_D(SKL_DFSM, D_SKL_PLUS);
>>> +	MMIO_D(DISPIO_CR_TX_BMU_CR0, D_SKL_PLUS);
>>> +
>>> +	MMIO_F(GEN9_GFX_MOCS(0), 0x7f8, F_CMD_ACCESS, 0, 0, D_SKL_PLUS,
>>> +		NULL, NULL);
>>> +	MMIO_F(GEN7_L3CNTLREG2, 0x80, F_CMD_ACCESS, 0, 0, D_SKL_PLUS,
>>> +		NULL, NULL);
>>> +
>>> +	MMIO_D(RPM_CONFIG0, D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(0xd08), D_SKL_PLUS);
>>> +	MMIO_D(RC6_LOCATION, D_SKL_PLUS);
>>> +	MMIO_DFH(GEN7_FF_SLICE_CS_CHICKEN1, D_SKL_PLUS,
>>> +		 F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(GEN9_CS_DEBUG_MODE1, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>>> +		NULL, NULL);
>>> +
>>> +	/* TRTT */
>>> +	MMIO_DFH(TRVATTL3PTRDW(0), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(TRVATTL3PTRDW(1), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(TRVATTL3PTRDW(2), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(TRVATTL3PTRDW(3), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(TRVADR, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(TRTTE, D_SKL_PLUS, F_CMD_ACCESS | F_PM_SAVE,
>>> +		 NULL, gen9_trtte_write);
>>> +	MMIO_DFH(_MMIO(0x4dfc), D_SKL_PLUS, F_PM_SAVE,
>>> +		 NULL, gen9_trtt_chicken_write);
>>> +
>>> +	MMIO_D(_MMIO(0x46430), D_SKL_PLUS);
>>> +
>>> +	MMIO_D(_MMIO(0x46520), D_SKL_PLUS);
>>> +
>>> +	MMIO_D(_MMIO(0xc403c), D_SKL_PLUS);
>>> +	MMIO_DFH(GEN8_GARBCNTL, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DH(DMA_CTRL, D_SKL_PLUS, NULL, dma_ctrl_write);
>>> +
>>> +	MMIO_D(_MMIO(0x65900), D_SKL_PLUS);
>>> +	MMIO_D(GEN6_STOLEN_RESERVED, D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(0x4068), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(0x67054), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(0x6e560), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(0x6e554), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(0x2b20), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(0x65f00), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(0x65f08), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(0x320f0), D_SKL_PLUS);
>>> +
>>> +	MMIO_D(_MMIO(0x70034), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(0x71034), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(0x72034), D_SKL_PLUS);
>>> +
>>> +	MMIO_D(_MMIO(_PLANE_KEYVAL_1(PIPE_A)), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(_PLANE_KEYVAL_1(PIPE_B)), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(_PLANE_KEYVAL_1(PIPE_C)), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(_PLANE_KEYMAX_1(PIPE_A)), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(_PLANE_KEYMAX_1(PIPE_B)), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(_PLANE_KEYMAX_1(PIPE_C)), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(_PLANE_KEYMSK_1(PIPE_A)), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(_PLANE_KEYMSK_1(PIPE_B)), D_SKL_PLUS);
>>> +	MMIO_D(_MMIO(_PLANE_KEYMSK_1(PIPE_C)), D_SKL_PLUS);
>>> +
>>> +	MMIO_D(_MMIO(0x44500), D_SKL_PLUS);
>>> +#define CSFE_CHICKEN1_REG(base) _MMIO((base) + 0xD4)
>>> +	MMIO_RING_DFH(CSFE_CHICKEN1_REG, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCE=
SS,
>>> +		      NULL, csfe_chicken1_mmio_write);
>>> +#undef CSFE_CHICKEN1_REG
>>> +	MMIO_DFH(GEN8_HDC_CHICKEN1, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>>> +		 NULL, NULL);
>>> +	MMIO_DFH(GEN9_WM_CHICKEN3, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>>> +		 NULL, NULL);
>>> +
>>> +	MMIO_DFH(GAMT_CHKN_BIT_REG, D_KBL | D_CFL, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS & ~D_BXT);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int intel_gvt_init_bxt_mmio_info(struct intel_gvt *gvt)
>>> +{
>>> +	struct drm_i915_private *dev_priv =3D gvt->gt->i915;
>>> +	int ret;
>>> +
>>> +	MMIO_F(_MMIO(0x80000), 0x3000, 0, 0, 0, D_BXT, NULL, NULL);
>>> +
>>> +	MMIO_D(GEN7_SAMPLER_INSTDONE, D_BXT);
>>> +	MMIO_D(GEN7_ROW_INSTDONE, D_BXT);
>>> +	MMIO_D(GEN8_FAULT_TLB_DATA0, D_BXT);
>>> +	MMIO_D(GEN8_FAULT_TLB_DATA1, D_BXT);
>>> +	MMIO_D(ERROR_GEN6, D_BXT);
>>> +	MMIO_D(DONE_REG, D_BXT);
>>> +	MMIO_D(EIR, D_BXT);
>>> +	MMIO_D(PGTBL_ER, D_BXT);
>>> +	MMIO_D(_MMIO(0x4194), D_BXT);
>>> +	MMIO_D(_MMIO(0x4294), D_BXT);
>>> +	MMIO_D(_MMIO(0x4494), D_BXT);
>>> +
>>> +	MMIO_RING_D(RING_PSMI_CTL, D_BXT);
>>> +	MMIO_RING_D(RING_DMA_FADD, D_BXT);
>>> +	MMIO_RING_D(RING_DMA_FADD_UDW, D_BXT);
>>> +	MMIO_RING_D(RING_IPEHR, D_BXT);
>>> +	MMIO_RING_D(RING_INSTPS, D_BXT);
>>> +	MMIO_RING_D(RING_BBADDR_UDW, D_BXT);
>>> +	MMIO_RING_D(RING_BBSTATE, D_BXT);
>>> +	MMIO_RING_D(RING_IPEIR, D_BXT);
>>> +
>>> +	MMIO_F(SOFT_SCRATCH(0), 16 * 4, 0, 0, 0, D_BXT, NULL, NULL);
>>> +
>>> +	MMIO_DH(BXT_P_CR_GT_DISP_PWRON, D_BXT, NULL, bxt_gt_disp_pwron_write);
>>> +	MMIO_D(BXT_RP_STATE_CAP, D_BXT);
>>> +	MMIO_DH(BXT_PHY_CTL_FAMILY(DPIO_PHY0), D_BXT,
>>> +		NULL, bxt_phy_ctl_family_write);
>>> +	MMIO_DH(BXT_PHY_CTL_FAMILY(DPIO_PHY1), D_BXT,
>>> +		NULL, bxt_phy_ctl_family_write);
>>> +	MMIO_D(BXT_PHY_CTL(PORT_A), D_BXT);
>>> +	MMIO_D(BXT_PHY_CTL(PORT_B), D_BXT);
>>> +	MMIO_D(BXT_PHY_CTL(PORT_C), D_BXT);
>>> +	MMIO_DH(BXT_PORT_PLL_ENABLE(PORT_A), D_BXT,
>>> +		NULL, bxt_port_pll_enable_write);
>>> +	MMIO_DH(BXT_PORT_PLL_ENABLE(PORT_B), D_BXT,
>>> +		NULL, bxt_port_pll_enable_write);
>>> +	MMIO_DH(BXT_PORT_PLL_ENABLE(PORT_C), D_BXT, NULL,
>>> +		bxt_port_pll_enable_write);
>>> +
>>> +	MMIO_D(BXT_PORT_CL1CM_DW0(DPIO_PHY0), D_BXT);
>>> +	MMIO_D(BXT_PORT_CL1CM_DW9(DPIO_PHY0), D_BXT);
>>> +	MMIO_D(BXT_PORT_CL1CM_DW10(DPIO_PHY0), D_BXT);
>>> +	MMIO_D(BXT_PORT_CL1CM_DW28(DPIO_PHY0), D_BXT);
>>> +	MMIO_D(BXT_PORT_CL1CM_DW30(DPIO_PHY0), D_BXT);
>>> +	MMIO_D(BXT_PORT_CL2CM_DW6(DPIO_PHY0), D_BXT);
>>> +	MMIO_D(BXT_PORT_REF_DW3(DPIO_PHY0), D_BXT);
>>> +	MMIO_D(BXT_PORT_REF_DW6(DPIO_PHY0), D_BXT);
>>> +	MMIO_D(BXT_PORT_REF_DW8(DPIO_PHY0), D_BXT);
>>> +
>>> +	MMIO_D(BXT_PORT_CL1CM_DW0(DPIO_PHY1), D_BXT);
>>> +	MMIO_D(BXT_PORT_CL1CM_DW9(DPIO_PHY1), D_BXT);
>>> +	MMIO_D(BXT_PORT_CL1CM_DW10(DPIO_PHY1), D_BXT);
>>> +	MMIO_D(BXT_PORT_CL1CM_DW28(DPIO_PHY1), D_BXT);
>>> +	MMIO_D(BXT_PORT_CL1CM_DW30(DPIO_PHY1), D_BXT);
>>> +	MMIO_D(BXT_PORT_CL2CM_DW6(DPIO_PHY1), D_BXT);
>>> +	MMIO_D(BXT_PORT_REF_DW3(DPIO_PHY1), D_BXT);
>>> +	MMIO_D(BXT_PORT_REF_DW6(DPIO_PHY1), D_BXT);
>>> +	MMIO_D(BXT_PORT_REF_DW8(DPIO_PHY1), D_BXT);
>>> +
>>> +	MMIO_D(BXT_PORT_PLL_EBB_0(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL_EBB_4(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_PCS_DW10_LN01(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_PCS_DW10_GRP(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_PCS_DW12_LN01(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_PCS_DW12_LN23(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> +	MMIO_DH(BXT_PORT_PCS_DW12_GRP(DPIO_PHY0, DPIO_CH0), D_BXT,
>>> +		NULL, bxt_pcs_dw12_grp_write);
>>> +	MMIO_D(BXT_PORT_TX_DW2_LN0(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW2_GRP(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> +	MMIO_DH(BXT_PORT_TX_DW3_LN0(DPIO_PHY0, DPIO_CH0), D_BXT,
>>> +		bxt_port_tx_dw3_read, NULL);
>>> +	MMIO_D(BXT_PORT_TX_DW3_GRP(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW4_LN0(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW4_GRP(DPIO_PHY0, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH0, 0), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH0, 1), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH0, 2), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH0, 3), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 0), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 1), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 2), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 3), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 6), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 8), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 9), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH0, 10), D_BXT);
>>> +
>>> +	MMIO_D(BXT_PORT_PLL_EBB_0(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL_EBB_4(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> +	MMIO_D(BXT_PORT_PCS_DW10_LN01(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> +	MMIO_D(BXT_PORT_PCS_DW10_GRP(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> +	MMIO_D(BXT_PORT_PCS_DW12_LN01(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> +	MMIO_D(BXT_PORT_PCS_DW12_LN23(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> +	MMIO_DH(BXT_PORT_PCS_DW12_GRP(DPIO_PHY0, DPIO_CH1), D_BXT,
>>> +		NULL, bxt_pcs_dw12_grp_write);
>>> +	MMIO_D(BXT_PORT_TX_DW2_LN0(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW2_GRP(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> +	MMIO_DH(BXT_PORT_TX_DW3_LN0(DPIO_PHY0, DPIO_CH1), D_BXT,
>>> +		bxt_port_tx_dw3_read, NULL);
>>> +	MMIO_D(BXT_PORT_TX_DW3_GRP(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW4_LN0(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW4_GRP(DPIO_PHY0, DPIO_CH1), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH1, 0), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH1, 1), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH1, 2), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY0, DPIO_CH1, 3), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 0), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 1), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 2), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 3), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 6), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 8), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 9), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY0, DPIO_CH1, 10), D_BXT);
>>> +
>>> +	MMIO_D(BXT_PORT_PLL_EBB_0(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL_EBB_4(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_PCS_DW10_LN01(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_PCS_DW10_GRP(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_PCS_DW12_LN01(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_PCS_DW12_LN23(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> +	MMIO_DH(BXT_PORT_PCS_DW12_GRP(DPIO_PHY1, DPIO_CH0), D_BXT,
>>> +		NULL, bxt_pcs_dw12_grp_write);
>>> +	MMIO_D(BXT_PORT_TX_DW2_LN0(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW2_GRP(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> +	MMIO_DH(BXT_PORT_TX_DW3_LN0(DPIO_PHY1, DPIO_CH0), D_BXT,
>>> +		bxt_port_tx_dw3_read, NULL);
>>> +	MMIO_D(BXT_PORT_TX_DW3_GRP(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW4_LN0(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW4_GRP(DPIO_PHY1, DPIO_CH0), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY1, DPIO_CH0, 0), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY1, DPIO_CH0, 1), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY1, DPIO_CH0, 2), D_BXT);
>>> +	MMIO_D(BXT_PORT_TX_DW14_LN(DPIO_PHY1, DPIO_CH0, 3), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 0), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 1), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 2), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 3), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 6), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 8), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 9), D_BXT);
>>> +	MMIO_D(BXT_PORT_PLL(DPIO_PHY1, DPIO_CH0, 10), D_BXT);
>>> +
>>> +	MMIO_D(BXT_DE_PLL_CTL, D_BXT);
>>> +	MMIO_DH(BXT_DE_PLL_ENABLE, D_BXT, NULL, bxt_de_pll_enable_write);
>>> +	MMIO_D(BXT_DSI_PLL_CTL, D_BXT);
>>> +	MMIO_D(BXT_DSI_PLL_ENABLE, D_BXT);
>>> +
>>> +	MMIO_D(GEN9_CLKGATE_DIS_0, D_BXT);
>>> +	MMIO_D(GEN9_CLKGATE_DIS_4, D_BXT);
>>> +
>>> +	MMIO_D(HSW_TVIDEO_DIP_GCP(TRANSCODER_A), D_BXT);
>>> +	MMIO_D(HSW_TVIDEO_DIP_GCP(TRANSCODER_B), D_BXT);
>>> +	MMIO_D(HSW_TVIDEO_DIP_GCP(TRANSCODER_C), D_BXT);
>>> +
>>> +	MMIO_D(RC6_CTX_BASE, D_BXT);
>>> +
>>> +	MMIO_D(GEN8_PUSHBUS_CONTROL, D_BXT);
>>> +	MMIO_D(GEN8_PUSHBUS_ENABLE, D_BXT);
>>> +	MMIO_D(GEN8_PUSHBUS_SHIFT, D_BXT);
>>> +	MMIO_D(GEN6_GFXPAUSE, D_BXT);
>>> +	MMIO_DFH(GEN8_L3SQCREG1, D_BXT, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(GEN8_L3CNTLREG, D_BXT, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_DFH(_MMIO(0x20D8), D_BXT, F_CMD_ACCESS, NULL, NULL);
>>> +	MMIO_F(GEN8_RING_CS_GPR(RENDER_RING_BASE, 0), 0x40, F_CMD_ACCESS,
>>> +	       0, 0, D_BXT, NULL, NULL);
>>> +	MMIO_F(GEN8_RING_CS_GPR(GEN6_BSD_RING_BASE, 0), 0x40, F_CMD_ACCESS,
>>> +	       0, 0, D_BXT, NULL, NULL);
>>> +	MMIO_F(GEN8_RING_CS_GPR(BLT_RING_BASE, 0), 0x40, F_CMD_ACCESS,
>>> +	       0, 0, D_BXT, NULL, NULL);
>>> +	MMIO_F(GEN8_RING_CS_GPR(VEBOX_RING_BASE, 0), 0x40, F_CMD_ACCESS,
>>> +	       0, 0, D_BXT, NULL, NULL);
>>> +
>>> +	MMIO_DFH(GEN9_CTX_PREEMPT_REG, D_BXT, F_CMD_ACCESS, NULL, NULL);
>>> +
>>> +	MMIO_DH(GEN8_PRIVATE_PAT_LO, D_BXT, NULL, bxt_ppat_low_write);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static inline int intel_gvt_init_mmio_info(struct intel_gvt *gvt)
>>> +{
>>> +	struct drm_i915_private *i915 =3D gvt->gt->i915;
>>> +	int ret;
>>> +
>>> +	ret =3D intel_gvt_init_generic_mmio_info(gvt);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (IS_BROADWELL(i915)) {
>>> +		ret =3D intel_gvt_init_bdw_mmio_info(gvt);
>>> +		if (ret)
>>> +			return ret;
>>> +	} else if (IS_SKYLAKE(i915) ||
>>> +		   IS_KABYLAKE(i915) ||
>>> +		   IS_COFFEELAKE(i915) ||
>>> +		   IS_COMETLAKE(i915)) {
>>> +		ret =3D intel_gvt_init_bdw_mmio_info(gvt);
>>> +		if (ret)
>>> +			return ret;
>>> +		ret =3D intel_gvt_init_skl_mmio_info(gvt);
>>> +		if (ret)
>>> +			return ret;
>>> +	} else if (IS_BROXTON(i915)) {
>>> +		ret =3D intel_gvt_init_bdw_mmio_info(gvt);
>>> +		if (ret)
>>> +			return ret;
>>> +		ret =3D intel_gvt_init_skl_mmio_info(gvt);
>>> +		if (ret)
>>> +			return ret;
>>> +		ret =3D intel_gvt_init_bxt_mmio_info(gvt);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +#endif
>>> diff --git a/drivers/gpu/drm/i915/gvt/reg.h b/drivers/gpu/drm/i915/gvt/=
reg.h
>>> index 244cc7320b54..05bd2f8e9d94 100644
>>> --- a/drivers/gpu/drm/i915/gvt/reg.h
>>> +++ b/drivers/gpu/drm/i915/gvt/reg.h
>>> @@ -133,6 +133,12 @@
>>>   #define RING_GFX_MODE(base)	_MMIO((base) + 0x29c)
>>>   #define VF_GUARDBAND		_MMIO(0x83a4)
>>>=20=20=20
>>> +/* XXX FIXME i915 has changed PP_XXX definition */
>>> +#define PCH_PP_STATUS  _MMIO(0xc7200)
>>> +#define PCH_PP_CONTROL _MMIO(0xc7204)
>>> +#define PCH_PP_ON_DELAYS _MMIO(0xc7208)
>>> +#define PCH_PP_OFF_DELAYS _MMIO(0xc720c)
>>> +#define PCH_PP_DIVISOR _MMIO(0xc7210)
>>>=20=20=20
>>>   #define BCS_TILE_REGISTER_VAL_OFFSET (0x43*4)
>>>   #endif
>>> diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/in=
tel_gvt.c
>>> index 4e70c1a9ef2e..64846d9bff0b 100644
>>> --- a/drivers/gpu/drm/i915/intel_gvt.c
>>> +++ b/drivers/gpu/drm/i915/intel_gvt.c
>>> @@ -86,6 +86,17 @@ void intel_gvt_sanitize_options(struct drm_i915_priv=
ate *dev_priv)
>>>   	dev_priv->params.enable_gvt =3D 0;
>>>   }
>>>=20=20=20
>>> +#define GENERATE_MMIO_TABLE_IN_I915
>>> +static int new_mmio_info(struct intel_gvt *gvt, u64 offset)
>>> +{
>>> +	return 0;
>>> +}
>>> +
>>> +#include "gvt/reg.h"
>>> +#include "gvt/mmio_table.h"
>>> +#undef GENERATE_MMIO_TABLE_IN_I915
>>> +
>>> +
>>>   /**
>>>    * intel_gvt_init - initialize GVT components
>>>    * @dev_priv: drm i915 private data
>
>

--=20
Jani Nikula, Intel Open Source Graphics Center
