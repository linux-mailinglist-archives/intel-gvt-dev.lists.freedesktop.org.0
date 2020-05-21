Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E581DC38A
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 May 2020 02:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362876E8C7;
	Thu, 21 May 2020 00:24:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F686E8C7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 May 2020 00:24:26 +0000 (UTC)
IronPort-SDR: 8Y8wY5RumwUFOg4yRuqPcuZnnwtzN4hLrQR+LHe85Su20qdZTBnqbLHnyjzBlnZrl1ZQejFhAx
 8Sh+1MSXTzyA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 17:24:25 -0700
IronPort-SDR: IjkYVgcMkGdbcLMmEQlq54GeAJ/sZR8JTc4rTyiq1bcU+nKSTnI/Ft1CYVqj7F5s1gT9+SlqO1
 PBrCXpCOkJSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,415,1583222400"; d="scan'208";a="300620859"
Received: from unknown (HELO [10.239.160.120]) ([10.239.160.120])
 by orsmga008.jf.intel.com with ESMTP; 20 May 2020 17:24:23 -0700
Subject: Re: [PATCH] drm/i915/gvt: Enable GVT vGPU enabled guest S3 and resume
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20200518061910.147299-1-colin.xu@intel.com>
 <20200518103211.GW18545@zhen-hp.sh.intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <ca5f78c7-0ba8-342a-6dc8-33b233fd159c@intel.com>
Date: Thu, 21 May 2020 08:24:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518103211.GW18545@zhen-hp.sh.intel.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


On 2020-05-18 18:32, Zhenyu Wang wrote:
> On 2020.05.18 14:19:10 +0800, Colin Xu wrote:
>> This patch enables GVT vGPU enabled guest enter and resume from S3.
>> During S3, QEMU process is still active so all ppgtt still in memory
>> thus no need to invalidate them. However current ppgtt invalidation and
>> destroy logic happens in dmlr, this operation happens during both boot
>> and resuming. Thus we need differ these different power states for
>> proper handling.
>> vCPU PCI cfg space is a modified copy from host. If PM cap is supported
>> on host, vGPU cfg space will also report the capability and handle read
>> or write request on PMCSR register. On receiving PCI_D3hot when enter S3,
>> vGPU will track current PM status. During dmlr, gvt will check if current
>> dmrl is during normal boot or S3 resume. If S3 resume, skip the ppgtt mm
>> invalidation and destroy so that they can be re-used, then clear the PM
>> status flag. PCI_D0 is set prior to dmlr so can't depend on it to skip
>> the ppgtt invalidation and destroy operation.
>>
>> To test this feature, make sure S3 is enabled in QEMU parameters:
>> i440fx: PIIX4_PM.disable_s3=0
>> q35: ICH9-LPC.disable_s3=0
>> Also need enable sleep option in guest OS if it's disabled.
>>
>> With all required options enabled and proper GFX driver installed, user
>> can enter S3 from guest OS, and resume from QEMU monitor using
>> system_wakeup.
>>
>> Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
>> Signed-off-by: Colin Xu <colin.xu@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gvt/cfg_space.c | 24 ++++++++++++++++++++++++
>>   drivers/gpu/drm/i915/gvt/gtt.c       |  2 +-
>>   drivers/gpu/drm/i915/gvt/gtt.h       |  2 ++
>>   drivers/gpu/drm/i915/gvt/gvt.h       |  3 +++
>>   drivers/gpu/drm/i915/gvt/vgpu.c      | 21 ++++++++++++++++++---
>>   5 files changed, 48 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/gvt/cfg_space.c
>> index 072725a448db..ad86c5eb5bba 100644
>> --- a/drivers/gpu/drm/i915/gvt/cfg_space.c
>> +++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
>> @@ -70,6 +70,7 @@ static void vgpu_pci_cfg_mem_write(struct intel_vgpu *vgpu, unsigned int off,
>>   {
>>   	u8 *cfg_base = vgpu_cfg_space(vgpu);
>>   	u8 mask, new, old;
>> +	pci_power_t pwr;
>>   	int i = 0;
>>   
>>   	for (; i < bytes && (off + i < sizeof(pci_cfg_space_rw_bmp)); i++) {
>> @@ -91,6 +92,15 @@ static void vgpu_pci_cfg_mem_write(struct intel_vgpu *vgpu, unsigned int off,
>>   	/* For other configuration space directly copy as it is. */
>>   	if (i < bytes)
>>   		memcpy(cfg_base + off + i, src + i, bytes - i);
>> +
>> +	if (off == vgpu->cfg_space.pmcsr_off && vgpu->cfg_space.pmcsr_off) {
>> +		pwr = (pci_power_t __force)(*(u16*)(&vgpu_cfg_space(vgpu)[off])
>> +			& PCI_PM_CTRL_STATE_MASK);
>> +		if (pwr == PCI_D3hot)
>> +			vgpu->d3_entered = true;
>> +		gvt_dbg_core("vgpu-%d power status changed to %d\n",
>> +			     vgpu->id, pwr);
>> +	}
> Good for tracking PM state, that's exactly what I expected. But how about
> other Dx state? e.g if guest wants to do suspend-to-idle, would it hit same
> penalty for ppgtt invalidate?

According to www.kernel.org/doc/Documentation/power/states.txt 
<https://www.kernel.org/doc/Documentation/power/states.txt>

S2I is purely software driven while it's ACPI state is S0, unlike S3 
(Suspend-to-RAM). So If my understanding is correct, vGPU only handles 
the device ACPI state change D0-D3.

>>   }
>>   
>>   /**
>> @@ -366,6 +376,7 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu *vgpu,
>>   	struct intel_gvt *gvt = vgpu->gvt;
>>   	const struct intel_gvt_device_info *info = &gvt->device_info;
>>   	u16 *gmch_ctl;
>> +	u8 next;
>>   
>>   	memcpy(vgpu_cfg_space(vgpu), gvt->firmware.cfg_space,
>>   	       info->cfg_space_size);
>> @@ -401,6 +412,19 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu *vgpu,
>>   		pci_resource_len(gvt->gt->i915->drm.pdev, 2);
>>   
>>   	memset(vgpu_cfg_space(vgpu) + PCI_ROM_ADDRESS, 0, 4);
>> +
>> +	/* PM Support */
>> +	vgpu->cfg_space.pmcsr_off = 0;
>> +	if (vgpu_cfg_space(vgpu)[PCI_STATUS] & PCI_STATUS_CAP_LIST) {
>> +		next = vgpu_cfg_space(vgpu)[PCI_CAPABILITY_LIST];
>> +		do {
>> +			if (vgpu_cfg_space(vgpu)[next + PCI_CAP_LIST_ID] == PCI_CAP_ID_PM) {
>> +				vgpu->cfg_space.pmcsr_off = next + PCI_PM_CTRL;
>> +				break;
>> +			}
>> +			next = vgpu_cfg_space(vgpu)[next + PCI_CAP_LIST_NEXT];
>> +		} while (next);
>> +	}
>>   }
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
>> index 210016192ce7..a3a4305eda01 100644
>> --- a/drivers/gpu/drm/i915/gvt/gtt.c
>> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
>> @@ -2501,7 +2501,7 @@ int intel_vgpu_init_gtt(struct intel_vgpu *vgpu)
>>   	return create_scratch_page_tree(vgpu);
>>   }
>>   
>> -static void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu)
>> +void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu)
>>   {
>>   	struct list_head *pos, *n;
>>   	struct intel_vgpu_mm *mm;
>> diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gtt.h
>> index 320b8d6ad92f..52d0d88abd86 100644
>> --- a/drivers/gpu/drm/i915/gvt/gtt.h
>> +++ b/drivers/gpu/drm/i915/gvt/gtt.h
>> @@ -279,4 +279,6 @@ int intel_vgpu_emulate_ggtt_mmio_read(struct intel_vgpu *vgpu,
>>   int intel_vgpu_emulate_ggtt_mmio_write(struct intel_vgpu *vgpu,
>>   	unsigned int off, void *p_data, unsigned int bytes);
>>   
>> +void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu);
>> +
>>   #endif /* _GVT_GTT_H_ */
>> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
>> index a4a6db6b7f90..ff7f2515a6fe 100644
>> --- a/drivers/gpu/drm/i915/gvt/gvt.h
>> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
>> @@ -106,6 +106,7 @@ struct intel_vgpu_pci_bar {
>>   struct intel_vgpu_cfg_space {
>>   	unsigned char virtual_cfg_space[PCI_CFG_SPACE_EXP_SIZE];
>>   	struct intel_vgpu_pci_bar bar[INTEL_GVT_MAX_BAR_NUM];
>> +	u32 pmcsr_off;
>>   };
>>   
>>   #define vgpu_cfg_space(vgpu) ((vgpu)->cfg_space.virtual_cfg_space)
>> @@ -198,6 +199,8 @@ struct intel_vgpu {
>>   	struct intel_vgpu_submission submission;
>>   	struct radix_tree_root page_track_tree;
>>   	u32 hws_pga[I915_NUM_ENGINES];
>> +	/* Set on PCI_D3, reset on DMLR, not reflecting the actual PM state */
>> +	bool d3_entered;
>>   
>>   	struct dentry *debugfs;
>>   
>> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
>> index 1d5ff88078bd..3779f9f28061 100644
>> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
>> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
>> @@ -257,7 +257,9 @@ void intel_gvt_release_vgpu(struct intel_vgpu *vgpu)
>>   	intel_gvt_deactivate_vgpu(vgpu);
>>   
>>   	mutex_lock(&vgpu->vgpu_lock);
>> +	vgpu->d3_entered = false;
>>   	intel_vgpu_clean_workloads(vgpu, ALL_ENGINES);
>> +	intel_vgpu_destroy_all_ppgtt_mm(vgpu);
> I think this is good to do when release vGPU, but should be in a split patch.
Thanks, I'll split this one to another patch.
>
>>   	intel_vgpu_dmabuf_cleanup(vgpu);
>>   	mutex_unlock(&vgpu->vgpu_lock);
>>   }
>> @@ -393,6 +395,7 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
>>   	INIT_RADIX_TREE(&vgpu->page_track_tree, GFP_KERNEL);
>>   	idr_init(&vgpu->object_idr);
>>   	intel_vgpu_init_cfg_space(vgpu, param->primary);
>> +	vgpu->d3_entered = false;
>>   
>>   	ret = intel_vgpu_init_mmio(vgpu);
>>   	if (ret)
>> @@ -557,10 +560,15 @@ void intel_gvt_reset_vgpu_locked(struct intel_vgpu *vgpu, bool dmlr,
>>   	/* full GPU reset or device model level reset */
>>   	if (engine_mask == ALL_ENGINES || dmlr) {
>>   		intel_vgpu_select_submission_ops(vgpu, ALL_ENGINES, 0);
>> -		intel_vgpu_invalidate_ppgtt(vgpu);
>> +		if (engine_mask == ALL_ENGINES)
>> +			intel_vgpu_invalidate_ppgtt(vgpu);
>>   		/*fence will not be reset during virtual reset */
>>   		if (dmlr) {
>> -			intel_vgpu_reset_gtt(vgpu);
>> +			if(!vgpu->d3_entered) {
>> +				intel_vgpu_invalidate_ppgtt(vgpu);
>> +				intel_vgpu_destroy_all_ppgtt_mm(vgpu);
>> +			}
>> +			intel_vgpu_reset_ggtt(vgpu, true);
>>   			intel_vgpu_reset_resource(vgpu);
>>   		}
>>   
>> @@ -572,7 +580,14 @@ void intel_gvt_reset_vgpu_locked(struct intel_vgpu *vgpu, bool dmlr,
>>   			intel_vgpu_reset_cfg_space(vgpu);
>>   			/* only reset the failsafe mode when dmlr reset */
>>   			vgpu->failsafe = false;
>> -			vgpu->pv_notified = false;
>> +			/*
>> +			 * PCI_D0 is set before dmlr, so reset d3_entered here
>> +			 * after done using.
>> +			 */
>> +			if(vgpu->d3_entered)
>> +				vgpu->d3_entered = false;
>> +			else
>> +				vgpu->pv_notified = false;
>>   		}
>>   	}
>>   
>> -- 
>> 2.26.2
>>
>> _______________________________________________
>> intel-gvt-dev mailing list
>> intel-gvt-dev@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

-- 
Best Regards,
Colin Xu

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
