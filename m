Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0966E2657A1
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Sep 2020 05:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4D36E287;
	Fri, 11 Sep 2020 03:41:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E1E6E287
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Sep 2020 03:41:34 +0000 (UTC)
IronPort-SDR: nB1ygOD4a3UTdNp5doFAdEeD2rClCj78mNUHaTX6lDjGTmKLHGVgLu1u+uVaH93Dz4fh4GXNWq
 GdcPEjZ2Lz0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="156085496"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="156085496"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 20:41:33 -0700
IronPort-SDR: GUwm926iYz+WX+7VV6329qmO/aKV0EYKf0De8949hixYCDzS7zhMqbiZ8w2a+AKW2Wp04mxrMx
 sMBOkoCzAWiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="506064043"
Received: from unknown (HELO [10.239.160.21]) ([10.239.160.21])
 by fmsmga005.fm.intel.com with ESMTP; 10 Sep 2020 20:41:32 -0700
Subject: Re: [PATCH] drm/i915/gvt: Skip writing 0 to HWSP during D3 resume
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20200819010953.55350-1-colin.xu@intel.com>
 <20200908091518.GE1426@zhen-hp.sh.intel.com>
 <7c369be0-d2bb-692b-e207-fd042fd11380@intel.com>
 <20200909020420.GE28614@zhen-hp.sh.intel.com>
 <da21010d-c366-b69b-1045-8ab840e646e5@intel.com>
 <20200909024133.GG28614@zhen-hp.sh.intel.com>
 <64ac9381-714d-0c1d-dcf9-a06037cdfded@intel.com>
 <1a743924-b9e8-7835-6902-3f5e07f73bb1@intel.com>
 <20200911024435.GP28614@zhen-hp.sh.intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <a38dd706-3b03-057a-a5a9-5125b0a0c3a8@intel.com>
Date: Fri, 11 Sep 2020 11:41:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200911024435.GP28614@zhen-hp.sh.intel.com>
Content-Language: en-US
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
Reply-To: Colin.Xu@intel.com
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 2020-09-11 10:44, Zhenyu Wang wrote:
> On 2020.09.11 10:26:21 +0800, Colin Xu wrote:
>> Maybe we still need this change or a similar one. The HWSP zero out fail=
ure
>> will result in to mmio write fail and guest then enters failsafe mode. F=
rom
>> guest perspective, it will fail to resume and enter reset cycle.
>>
>>
>>>>> Trigger system_wakeup in qemu monitor
>> [=A0 753.165063] gvt: vgpu 2: write invalid HWSP address, reg:0x2080,
>> value:0x0
>> [=A0 753.165065] gvt: vgpu 2: fail to emulate MMIO write 00002080 len 4
>> [=A0 753.165206] gvt: vgpu 2: write invalid HWSP address, reg:0x12080,
>> value:0x0
>> [=A0 753.165207] gvt: vgpu 2: fail to emulate MMIO write 00012080 len 4
>> [=A0 753.165247] gvt: vgpu 2: write invalid HWSP address, reg:0x22080,
>> value:0x0
>> [=A0 753.165248] gvt: vgpu 2: fail to emulate MMIO write 00022080 len 4
>> [=A0 753.165295] gvt: vgpu 2: write invalid HWSP address, reg:0x1a080,
>> value:0x0
>> [=A0 753.165297] gvt: vgpu 2: fail to emulate MMIO write 0001a080 len 4
>> [=A0 753.165645] Detected your guest driver doesn't support GVT-g.
>> [=A0 753.165646] Now vgpu 2 will enter failsafe mode.
>>
> Maybe we just take that 0 address as special case and not return
> failure, as it's a valid setting from device driver point of view.
It makes sense. I'll cook a patch to allow 0 addr, and also move the err =

msg to dbg.
>
>> On 2020-09-09 11:05, Colin Xu wrote:
>>> On 2020-09-09 10:41, Zhenyu Wang wrote:
>>>> On 2020.09.09 10:51:04 +0800, Colin Xu wrote:
>>>>> On 2020-09-09 10:04, Zhenyu Wang wrote:
>>>>>> On 2020.09.09 08:37:53 +0800, Colin Xu wrote:
>>>>>>> On 2020-09-08 17:15, Zhenyu Wang wrote:
>>>>>>>> On 2020.08.19 09:09:53 +0800, Colin Xu wrote:
>>>>>>>>> Guest driver may reset HWSP to 0 as init value during D3->D0:
>>>>>>>>> The full sequence is:
>>>>>>>>> - Boot ->D0
>>>>>>>>> - Update HWSP
>>>>>>>>> - D0->D3
>>>>>>>>> - ...In D3 state...
>>>>>>>>> - D3->D0
>>>>>>>>> - DMLR reset.
>>>>>>>>> - Set engine HWSP to 0.
>>>>>>>>> - Set engine ring mode to 0.
>>>>>>>>> - Set engine HWSP to correct value.
>>>>>>>>> - Set engine ring mode to correct value.
>>>>>>>>> Ring mode is masked register so set 0 won't take effect.
>>>>>>>>> However HWPS addr 0 is considered as invalid
>>>>>>>>> GGTT address which will
>>>>>>>>> report error like:
>>>>>>>>> gvt: vgpu 1: write invalid HWSP address, reg:0x2080, value:0x0
>>>>>>>>>
>>>>>>>> So looks this is to handle that wrong error message but function is
>>>>>>>> still same, right?
>>>>>>> Yes that's right. Current logic can guarantee that only
>>>>>>> correct HWSP write
>>>>>>> from guest are accepted by GVT. Invalid HWSP address
>>>>>>> will be dropped and
>>>>>>> won't be submitted to HW. During resume, correct HWSP will be updat=
ed
>>>>>>> eventually updated. If pv_notified is set, the
>>>>>>> intermediate HWSP zero-out
>>>>>>> can be ignored until hit next reset.
>>>>>> Might just move that error into debug message instead of putting
>>>>>> effort on tracking guest state without much gain..
>>>>> Sometimes such invalid HWSP addr write msg may still be helpful.
>>>>> If put them
>>>>> into gvt_dbg_mmio without considering different case, may miss the
>>>>> information. So this change put real error into gvt_vgpu_err, but put
>>>>> expected zero out to gvt_dbg_mmio.
>>>> Could you elaborate what would be helpful? The current error message
>>>> doesn't really help end user I think, but only for developer, so it
>>>> makes more sense to turn into debug.
>>> For developer or user consideration, yes distinguish the msg is useless
>>> for end user. Developer can tell the state and find out the HWSP addr is
>>> really valid or just zero-out during resuming.
>>>
>>> If so I think we can move this msg to gvt_dbg in next cleanup.
>>>
>>>>>>>>> During vGPU in D3, per-engine HWSP gpa remains valid so we can sk=
ip
>>>>>>>>> update HWSP in this case.
>>>>>>>>> Check both pv_notified and previous engine HWSP gpa, if pv already
>>>>>>>>> notified and previous HWSP gpa is valid, we skip this HWSP init a=
nd
>>>>>>>>> let later HWSP write update the correct value.
>>>>>>>>> We also need zero out
>>>>>>>>> per-engine HWSP gpa on engine reset to make sure hws_pga is valid.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Colin Xu <colin.xu@intel.com>
>>>>>>>>> ---
>>>>>>>>>  =A0=A0=A0 drivers/gpu/drm/i915/gvt/handlers.c | 30
>>>>>>>>> ++++++++++++++++++++---------
>>>>>>>>>  =A0=A0=A0 drivers/gpu/drm/i915/gvt/vgpu.c=A0=A0=A0=A0 |=A0 7 +++=
++++
>>>>>>>>>  =A0=A0=A0 2 files changed, 28 insertions(+), 9 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c
>>>>>>>>> b/drivers/gpu/drm/i915/gvt/handlers.c
>>>>>>>>> index 840572add2d4..72860aaf1656 100644
>>>>>>>>> --- a/drivers/gpu/drm/i915/gvt/handlers.c
>>>>>>>>> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
>>>>>>>>> @@ -1489,12 +1489,6 @@ static int
>>>>>>>>> hws_pga_write(struct intel_vgpu *vgpu, unsigned
>>>>>>>>> int offset,
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0 const struct intel_engine_cs *engine =3D
>>>>>>>>> intel_gvt_render_mmio_to_engine(vgpu->gvt, offset);
>>>>>>>>> -=A0=A0=A0 if (!intel_gvt_ggtt_validate_range(vgpu,
>>>>>>>>> value, I915_GTT_PAGE_SIZE)) {
>>>>>>>>> -=A0=A0=A0=A0=A0=A0=A0 gvt_vgpu_err("write invalid HWSP
>>>>>>>>> address, reg:0x%x, value:0x%x\n",
>>>>>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 offset, valu=
e);
>>>>>>>>> -=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
>>>>>>>>> -=A0=A0=A0 }
>>>>>>>>> -
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0 /*
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0 * Need to emulate all the HWSP register
>>>>>>>>> write to ensure host can
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0 * update the VM CSB status correctly.
>>>>>>>>> Here listed registers can
>>>>>>>>> @@ -1505,9 +1499,27 @@ static int
>>>>>>>>> hws_pga_write(struct intel_vgpu *vgpu, unsigned
>>>>>>>>> int offset,
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 off=
set);
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0 }
>>>>>>>>> -=A0=A0=A0 vgpu->hws_pga[engine->id] =3D value;
>>>>>>>>> -=A0=A0=A0 gvt_dbg_mmio("VM(%d) write: 0x%x to HWSP: 0x%x\n",
>>>>>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vgpu->id, value, offset);
>>>>>>>>> +
>>>>>>>>> +=A0=A0=A0 if (!intel_gvt_ggtt_validate_range(vgpu,
>>>>>>>>> value, I915_GTT_PAGE_SIZE)) {
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 u32 old =3D vgpu->hws_pga[engine->id];
>>>>>>>>> +
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 /* Skip zero out RING_HWS_PGA during D3 re=
sume */
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 if (vgpu->pv_notified && value =3D=3D 0 &&
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 intel_gvt_ggtt_validate_range(=
vgpu, old,
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 I915_GTT_PAGE_SIZE)) {
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gvt_dbg_mmio("Skip zero out HW=
SP address, reg:0x%x, "
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "va=
lue:0x%x\n", offset, value);
>>>>>>>>> +
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 } else {
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gvt_vgpu_err("write invalid HW=
SP address, reg:0x%x, "
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "va=
lue:0x%x\n", offset, value);
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 }
>>>>>>>>> +=A0=A0=A0 } else {
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 vgpu->hws_pga[engine->id] =3D value;
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 gvt_dbg_mmio("VM(%d) write: 0x%x to HWSP: =
0x%x\n",
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vgpu->id, value=
, offset);
>>>>>>>>> +=A0=A0=A0 }
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0 return
>>>>>>>>> intel_vgpu_default_mmio_write(vgpu, offset,
>>>>>>>>> &value, bytes);
>>>>>>>>>  =A0=A0=A0 }
>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c
>>>>>>>>> b/drivers/gpu/drm/i915/gvt/vgpu.c
>>>>>>>>> index 8fa9b31a2484..e0e073045d83 100644
>>>>>>>>> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
>>>>>>>>> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
>>>>>>>>> @@ -558,6 +558,9 @@ void
>>>>>>>>> intel_gvt_reset_vgpu_locked(struct intel_vgpu
>>>>>>>>> *vgpu, bool dmlr,
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0 intel_vgpu_reset_submission(vgpu, resettin=
g_eng);
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0 /* full GPU reset or device model level re=
set */
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0 if (engine_mask =3D=3D ALL_ENGINES || dmlr=
) {
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 struct intel_engine_cs *engine;
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 intel_engine_mask_t tmp;
>>>>>>>>> +
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 intel_vgpu_select_submission_o=
ps(vgpu, ALL_ENGINES, 0);
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (engine_mask =3D=3D ALL_ENG=
INES)
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 intel_vgpu_invalid=
ate_ppgtt(vgpu);
>>>>>>>>> @@ -588,6 +591,10 @@ void
>>>>>>>>> intel_gvt_reset_vgpu_locked(struct intel_vgpu
>>>>>>>>> *vgpu, bool dmlr,
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 else
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vgpu->=
pv_notified =3D false;
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
>>>>>>>>> +
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 for_each_engine_masked(engine, gvt->gt,
>>>>>>>>> engine_mask, tmp) {
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vgpu->hws_pga[engine->id] =3D =
0;
>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 }
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0 }
>>>>>>>>>  =A0=A0=A0=A0=A0=A0=A0 vgpu->resetting_eng =3D 0;
>>>>>>>>> -- =

>>>>>>>>> 2.28.0
>>>>>>>>>
>>>>>>>>> _______________________________________________
>>>>>>>>> intel-gvt-dev mailing list
>>>>>>>>> intel-gvt-dev@lists.freedesktop.org
>>>>>>>>> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
>>>>>>> -- =

>>>>>>> Best Regards,
>>>>>>> Colin Xu
>>>>>>>
>>>>> -- =

>>>>> Best Regards,
>>>>> Colin Xu
>>>>>
>> -- =

>> Best Regards,
>> Colin Xu
>>
-- =

Best Regards,
Colin Xu

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
