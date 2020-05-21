Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BB51DC781
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 May 2020 09:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42086E138;
	Thu, 21 May 2020 07:23:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7D86E138
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 May 2020 07:23:10 +0000 (UTC)
IronPort-SDR: JyzqvT9E+Po/BY6X4GcyH5Mcip8DZmn7oN6ayTwp/xtVtd3p6wN6tgisEL3n4DY8vDSN/XBMlk
 fPAqkzBxRpOw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2020 00:23:09 -0700
IronPort-SDR: A2Gvo+MKxI20oe+6Vve1WPx9EwvSwO7g5YLnmcOQSXdcfrUyb/dEtl1xSy5NFhgp3PlmC9jBbX
 JyXmG0sqEJyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,417,1583222400"; d="scan'208";a="374331189"
Received: from unknown (HELO [10.239.160.120]) ([10.239.160.120])
 by fmsmga001.fm.intel.com with ESMTP; 21 May 2020 00:23:08 -0700
Subject: Re: [PATCH] drm/i915/gvt: Enable GVT vGPU enabled guest S3 and resume
To: "Tian, Kevin" <kevin.tian@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
References: <20200518061910.147299-1-colin.xu@intel.com>
 <MWHPR11MB1645336A8739A57AFF12FC908CB70@MWHPR11MB1645.namprd11.prod.outlook.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <c8d929cd-62a0-77b6-7a7c-7f6edfb701be@intel.com>
Date: Thu, 21 May 2020 15:23:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1645336A8739A57AFF12FC908CB70@MWHPR11MB1645.namprd11.prod.outlook.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Thanks Kevin for the valuable comments. I'll revise and update the 
commit message in V2.

On 2020-05-21 14:38, Tian, Kevin wrote:
>> From: Colin Xu
>> Sent: Monday, May 18, 2020 2:19 PM
>>
> I feel the patch description is unclear here. Device doesn't know sleep states.
> Also from your actual code change you just try to support D3hot. Then please
> update the subject line to reflect that. Generally speaking, S3 is just one
> usage of D3hot. There could be run-time device power management in S0
> too.
>
>> This patch enables GVT vGPU enabled guest enter and resume from S3.
>> During S3, QEMU process is still active so all ppgtt still in memory
> We should not assume QEMU behavior. Instead, please stick to the
> expected behavior of guest S3.
>
>> thus no need to invalidate them. However current ppgtt invalidation and
>> destroy logic happens in dmlr, this operation happens during both boot
> what is dmlr? later you also used dmrl? which one is correct?
>
>> and resuming. Thus we need differ these different power states for
>> proper handling.
>> vCPU PCI cfg space is a modified copy from host. If PM cap is supported
> vCPU->vGPU
>
>> on host, vGPU cfg space will also report the capability and handle read
>> or write request on PMCSR register. On receiving PCI_D3hot when enter S3,
>> vGPU will track current PM status. During dmlr, gvt will check if current
>> dmrl is during normal boot or S3 resume. If S3 resume, skip the ppgtt mm
> how can GVT tell whether it's normal boot or S3 resume?
>
>> invalidation and destroy so that they can be re-used, then clear the PM
>> status flag. PCI_D0 is set prior to dmlr so can't depend on it to skip
>> the ppgtt invalidation and destroy operation.
> As said, above is very confusing about what this patch tries to do. You
> need describe clearly the purpose (D3hot), what is the expected
> behavior on physical GPU, and then how it should be managed for vGPU.
>
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
>> diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c
>> b/drivers/gpu/drm/i915/gvt/cfg_space.c
>> index 072725a448db..ad86c5eb5bba 100644
>> --- a/drivers/gpu/drm/i915/gvt/cfg_space.c
>> +++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
>> @@ -70,6 +70,7 @@ static void vgpu_pci_cfg_mem_write(struct intel_vgpu
>> *vgpu, unsigned int off,
>>   {
>>   u8 *cfg_base = vgpu_cfg_space(vgpu);
>>   u8 mask, new, old;
>> +pci_power_t pwr;
>>   int i = 0;
>>
>>   for (; i < bytes && (off + i < sizeof(pci_cfg_space_rw_bmp)); i++) {
>> @@ -91,6 +92,15 @@ static void vgpu_pci_cfg_mem_write(struct intel_vgpu
>> *vgpu, unsigned int off,
>>   /* For other configuration space directly copy as it is. */
>>   if (i < bytes)
>>   memcpy(cfg_base + off + i, src + i, bytes - i);
>> +
>> +if (off == vgpu->cfg_space.pmcsr_off && vgpu->cfg_space.pmcsr_off)
>> {
>> +pwr = (pci_power_t
>> __force)(*(u16*)(&vgpu_cfg_space(vgpu)[off])
>> +& PCI_PM_CTRL_STATE_MASK);
>> +if (pwr == PCI_D3hot)
>> +vgpu->d3_entered = true;
>> +gvt_dbg_core("vgpu-%d power status changed to %d\n",
>> +     vgpu->id, pwr);
>> +}
>>   }
>>
>>   /**
>> @@ -366,6 +376,7 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu
>> *vgpu,
>>   struct intel_gvt *gvt = vgpu->gvt;
>>   const struct intel_gvt_device_info *info = &gvt->device_info;
>>   u16 *gmch_ctl;
>> +u8 next;
>>
>>   memcpy(vgpu_cfg_space(vgpu), gvt->firmware.cfg_space,
>>          info->cfg_space_size);
>> @@ -401,6 +412,19 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu
>> *vgpu,
>>   pci_resource_len(gvt->gt->i915->drm.pdev, 2);
>>
>>   memset(vgpu_cfg_space(vgpu) + PCI_ROM_ADDRESS, 0, 4);
>> +
>> +/* PM Support */
>> +vgpu->cfg_space.pmcsr_off = 0;
>> +if (vgpu_cfg_space(vgpu)[PCI_STATUS] & PCI_STATUS_CAP_LIST) {
>> +next = vgpu_cfg_space(vgpu)[PCI_CAPABILITY_LIST];
>> +do {
>> +if (vgpu_cfg_space(vgpu)[next + PCI_CAP_LIST_ID] ==
>> PCI_CAP_ID_PM) {
>> +vgpu->cfg_space.pmcsr_off = next +
>> PCI_PM_CTRL;
>> +break;
>> +}
>> +next = vgpu_cfg_space(vgpu)[next +
>> PCI_CAP_LIST_NEXT];
>> +} while (next);
>> +}
>>   }
>>
>>   /**
>> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
>> index 210016192ce7..a3a4305eda01 100644
>> --- a/drivers/gpu/drm/i915/gvt/gtt.c
>> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
>> @@ -2501,7 +2501,7 @@ int intel_vgpu_init_gtt(struct intel_vgpu *vgpu)
>>   return create_scratch_page_tree(vgpu);
>>   }
>>
>> -static void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu)
>> +void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu)
>>   {
>>   struct list_head *pos, *n;
>>   struct intel_vgpu_mm *mm;
>> diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gtt.h
>> index 320b8d6ad92f..52d0d88abd86 100644
>> --- a/drivers/gpu/drm/i915/gvt/gtt.h
>> +++ b/drivers/gpu/drm/i915/gvt/gtt.h
>> @@ -279,4 +279,6 @@ int intel_vgpu_emulate_ggtt_mmio_read(struct
>> intel_vgpu *vgpu,
>>   int intel_vgpu_emulate_ggtt_mmio_write(struct intel_vgpu *vgpu,
>>   unsigned int off, void *p_data, unsigned int bytes);
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
>>   unsigned char virtual_cfg_space[PCI_CFG_SPACE_EXP_SIZE];
>>   struct intel_vgpu_pci_bar bar[INTEL_GVT_MAX_BAR_NUM];
>> +u32 pmcsr_off;
>>   };
>>
>>   #define vgpu_cfg_space(vgpu) ((vgpu)->cfg_space.virtual_cfg_space)
>> @@ -198,6 +199,8 @@ struct intel_vgpu {
>>   struct intel_vgpu_submission submission;
>>   struct radix_tree_root page_track_tree;
>>   u32 hws_pga[I915_NUM_ENGINES];
>> +/* Set on PCI_D3, reset on DMLR, not reflecting the actual PM state
>> */
>> +bool d3_entered;
>>
>>   struct dentry *debugfs;
>>
>> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c
>> b/drivers/gpu/drm/i915/gvt/vgpu.c
>> index 1d5ff88078bd..3779f9f28061 100644
>> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
>> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
>> @@ -257,7 +257,9 @@ void intel_gvt_release_vgpu(struct intel_vgpu *vgpu)
>>   intel_gvt_deactivate_vgpu(vgpu);
>>
>>   mutex_lock(&vgpu->vgpu_lock);
>> +vgpu->d3_entered = false;
>>   intel_vgpu_clean_workloads(vgpu, ALL_ENGINES);
>> +intel_vgpu_destroy_all_ppgtt_mm(vgpu);
>>   intel_vgpu_dmabuf_cleanup(vgpu);
>>   mutex_unlock(&vgpu->vgpu_lock);
>>   }
>> @@ -393,6 +395,7 @@ static struct intel_vgpu
>> *__intel_gvt_create_vgpu(struct intel_gvt *gvt,
>>   INIT_RADIX_TREE(&vgpu->page_track_tree, GFP_KERNEL);
>>   idr_init(&vgpu->object_idr);
>>   intel_vgpu_init_cfg_space(vgpu, param->primary);
>> +vgpu->d3_entered = false;
>>
>>   ret = intel_vgpu_init_mmio(vgpu);
>>   if (ret)
>> @@ -557,10 +560,15 @@ void intel_gvt_reset_vgpu_locked(struct intel_vgpu
>> *vgpu, bool dmlr,
>>   /* full GPU reset or device model level reset */
>>   if (engine_mask == ALL_ENGINES || dmlr) {
>>   intel_vgpu_select_submission_ops(vgpu, ALL_ENGINES, 0);
>> -intel_vgpu_invalidate_ppgtt(vgpu);
>> +if (engine_mask == ALL_ENGINES)
>> +intel_vgpu_invalidate_ppgtt(vgpu);
>>   /*fence will not be reset during virtual reset */
>>   if (dmlr) {
>> -intel_vgpu_reset_gtt(vgpu);
>> +if(!vgpu->d3_entered) {
>> +intel_vgpu_invalidate_ppgtt(vgpu);
>> +intel_vgpu_destroy_all_ppgtt_mm(vgpu);
>> +}
>> +intel_vgpu_reset_ggtt(vgpu, true);
>>   intel_vgpu_reset_resource(vgpu);
>>   }
>>
>> @@ -572,7 +580,14 @@ void intel_gvt_reset_vgpu_locked(struct intel_vgpu
>> *vgpu, bool dmlr,
>>   intel_vgpu_reset_cfg_space(vgpu);
>>   /* only reset the failsafe mode when dmlr reset */
>>   vgpu->failsafe = false;
>> -vgpu->pv_notified = false;
>> +/*
>> + * PCI_D0 is set before dmlr, so reset d3_entered
>> here
>> + * after done using.
>> + */
>> +if(vgpu->d3_entered)
>> +vgpu->d3_entered = false;
>> +else
>> +vgpu->pv_notified = false;
>>   }
>>   }
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
