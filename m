Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96002646C6
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Sep 2020 15:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A83D6E922;
	Thu, 10 Sep 2020 13:20:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692E16E922;
 Thu, 10 Sep 2020 13:20:25 +0000 (UTC)
IronPort-SDR: uzemQjCrT2llopDT5XPQBeIvTCVhQ7Rk0tvm4x1zQx7SNb00w/P3FCkz03wO6kMiZhlYiyguKt
 u+lz8DBMUn5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="158565440"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="158565440"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 06:20:24 -0700
IronPort-SDR: mcWpcfWqCs7rxD1k7oPVmtcplqd/YzzYP7eO3kWzKW5Fn8rIbJLBDFQGq3dBcmN8eXwp1td6NF
 JC6zQLx0M8yw==
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="480886575"
Received: from nfhickey-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.81.64])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 06:20:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v1 03/12] drm/i915: vgpu pv command buffer
 transport protocol
In-Reply-To: <1599236505-9086-4-git-send-email-xiaolin.zhang@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1599236505-9086-1-git-send-email-xiaolin.zhang@intel.com>
 <1599236505-9086-4-git-send-email-xiaolin.zhang@intel.com>
Date: Thu, 10 Sep 2020 16:20:24 +0300
Message-ID: <87lfhh22g7.fsf@intel.com>
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
Cc: zhiyuan.lv@intel.com, chris@chris-wilson.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Sat, 05 Sep 2020, Xiaolin Zhang <xiaolin.zhang@intel.com> wrote:
> based on the common shared memory, vgpu pv command transport buffer (CTB)
> protocol is implemented which is a simple pv command buffer ring with pv
> command descriptor used to perform guest-2-gvt single direction commucation
> between guest and host GVTg.
>
> with this CTB, guest can send PV command with PV data to host to perform PV
> commands in host side.
>
> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_pvinfo.h |   1 +
>  drivers/gpu/drm/i915/i915_vgpu.c   | 195 ++++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/i915/i915_vgpu.h   |  53 ++++++++++
>  3 files changed, 247 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_pvinfo.h b/drivers/gpu/drm/i915/i915_pvinfo.h
> index 1d44876..ded93c5 100644
> --- a/drivers/gpu/drm/i915/i915_pvinfo.h
> +++ b/drivers/gpu/drm/i915/i915_pvinfo.h
> @@ -49,6 +49,7 @@ enum vgt_g2v_type {
>  	VGT_G2V_EXECLIST_CONTEXT_CREATE,
>  	VGT_G2V_EXECLIST_CONTEXT_DESTROY,
>  	VGT_G2V_SHARED_PAGE_REGISTER,
> +	VGT_G2V_PV_SEND_TRIGGER,
>  	VGT_G2V_MAX,
>  };
>  
> diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
> index 8b2b451..e856eff 100644
> --- a/drivers/gpu/drm/i915/i915_vgpu.c
> +++ b/drivers/gpu/drm/i915/i915_vgpu.c
> @@ -370,6 +370,183 @@ int intel_vgt_balloon(struct i915_ggtt *ggtt)
>   * i915 vgpu PV support for Linux
>   */
>  
> +/**
> + * wait_for_desc_update - Wait for the command buffer descriptor update.
> + * @desc:	buffer descriptor
> + * @fence:	response fence
> + * @status:	placeholder for status
> + *
> + * GVTg will update command buffer descriptor with new fence and status
> + * after processing the command identified by the fence. Wait for
> + * specified fence and then read from the descriptor status of the
> + * command.
> + *
> + * Return:
> + * *	0 response received (status is valid)
> + * *	-ETIMEDOUT no response within hardcoded timeout
> + */
> +static int wait_for_desc_update(struct vgpu_pv_ct_buffer_desc *desc,
> +		u32 fence, u32 *status)
> +{
> +	int err;
> +
> +#define done (READ_ONCE(desc->fence) == fence)
> +	err = wait_for_us(done, 5);
> +	if (err)
> +		err = wait_for(done, 10);
> +#undef done
> +
> +	if (unlikely(err)) {
> +		DRM_ERROR("CT: fence %u failed; reported fence=%u\n",
> +				fence, desc->fence);

drm_err() please.

> +	}
> +
> +	*status = desc->status;

Please have a blank line before the return. Recommended throughout the
series.

> +	return err;
> +}
> +
> +/**
> + * CTB Guest to GVT request
> + *
> + * Format of the CTB Guest to GVT request message is as follows::
> + *
> + *      +------------+---------+---------+---------+---------+
> + *      |   msg[0]   |   [1]   |   [2]   |   ...   |  [n-1]  |
> + *      +------------+---------+---------+---------+---------+
> + *      |   MESSAGE  |       MESSAGE PAYLOAD                 |
> + *      +   HEADER   +---------+---------+---------+---------+
> + *      |            |    0    |    1    |   ...   |    n    |
> + *      +============+=========+=========+=========+=========+
> + *      |  len >= 1  |  FENCE  |     request specific data   |
> + *      +------+-----+---------+---------+---------+---------+
> + *
> + *                   ^-----------------len-------------------^
> + */
> +static int pv_command_buffer_write(struct i915_virtual_gpu_pv *pv,
> +		const u32 *action, u32 len /* in dwords */, u32 fence)
> +{
> +	struct vgpu_pv_ct_buffer_desc *desc = pv->ctb.desc;
> +	u32 head = desc->head / 4;	/* in dwords */
> +	u32 tail = desc->tail / 4;	/* in dwords */
> +	u32 size = desc->size / 4;	/* in dwords */
> +	u32 used;			/* in dwords */
> +	u32 header;
> +	u32 *cmds = pv->ctb.cmds;
> +	unsigned int i;
> +
> +	GEM_BUG_ON(desc->size % 4);
> +	GEM_BUG_ON(desc->head % 4);
> +	GEM_BUG_ON(desc->tail % 4);
> +	GEM_BUG_ON(tail >= size);
> +
> +	 /* tail == head condition indicates empty */
> +	if (tail < head)
> +		used = (size - head) + tail;
> +	else
> +		used = tail - head;
> +
> +	/* make sure there is a space including extra dw for the fence */
> +	if (unlikely(used + len + 1 >= size))
> +		return -ENOSPC;
> +
> +	/*
> +	 * Write the message. The format is the following:
> +	 * DW0: header (including action code)
> +	 * DW1: fence
> +	 * DW2+: action data
> +	 */
> +	header = (len << PV_CT_MSG_LEN_SHIFT) |
> +		 (PV_CT_MSG_WRITE_FENCE_TO_DESC) |
> +		 (action[0] << PV_CT_MSG_ACTION_SHIFT);
> +
> +	cmds[tail] = header;
> +	tail = (tail + 1) % size;
> +
> +	cmds[tail] = fence;
> +	tail = (tail + 1) % size;
> +
> +	for (i = 1; i < len; i++) {
> +		cmds[tail] = action[i];
> +		tail = (tail + 1) % size;
> +	}
> +
> +	/* now update desc tail (back in bytes) */
> +	desc->tail = tail * 4;
> +	GEM_BUG_ON(desc->tail > desc->size);
> +
> +	return 0;
> +}
> +
> +static u32 pv_get_next_fence(struct i915_virtual_gpu_pv *pv)
> +{
> +	/* For now it's trivial */
> +	return ++pv->next_fence;
> +}
> +
> +static int pv_send(struct drm_i915_private *i915,
> +		const u32 *action, u32 len, u32 *status)
> +{
> +	struct i915_virtual_gpu *vgpu = &i915->vgpu;
> +	struct i915_virtual_gpu_pv *pv = vgpu->pv;
> +
> +	struct vgpu_pv_ct_buffer_desc *desc = pv->ctb.desc;
> +
> +	u32 fence;
> +	int err;
> +
> +	GEM_BUG_ON(!len);
> +	GEM_BUG_ON(len & ~PV_CT_MSG_LEN_MASK);
> +
> +	fence = pv_get_next_fence(pv);
> +	err = pv_command_buffer_write(pv, action, len, fence);
> +	if (unlikely(err))
> +		goto unlink;
> +
> +	i915->vgpu.pv->notify(i915);
> +
> +	err = wait_for_desc_update(desc, fence, status);
> +	if (unlikely(err))
> +		goto unlink;
> +
> +	if ((*status)) {
> +		err = -EIO;
> +		goto unlink;
> +	}
> +
> +	err = (*status);
> +unlink:
> +	return err;
> +}
> +
> +static int intel_vgpu_pv_send_command_buffer(struct drm_i915_private *i915,
> +		u32 *action, u32 len)
> +{
> +	struct i915_virtual_gpu *vgpu = &i915->vgpu;
> +	unsigned long flags;
> +
> +	u32 status = ~0; /* undefined */
> +	int ret;
> +
> +	spin_lock_irqsave(&vgpu->pv->lock, flags);
> +
> +	ret = pv_send(i915, action, len, &status);
> +	if (unlikely(ret < 0)) {
> +		DRM_ERROR("PV: send action %#X failed; err=%d status=%#X\n",
> +			  action[0], ret, status);
> +	} else if (unlikely(ret)) {
> +		DRM_ERROR("PV: send action %#x returned %d (%#x)\n",
> +				action[0], ret, ret);

drm_err() please.

> +	}
> +
> +	spin_unlock_irqrestore(&vgpu->pv->lock, flags);
> +	return ret;
> +}
> +
> +static void intel_vgpu_pv_notify_mmio(struct drm_i915_private *dev_priv)
> +{
> +	I915_WRITE(vgtif_reg(g2v_notify), VGT_G2V_PV_SEND_TRIGGER);

Please do not add any more I915_WRITE() uses. intel_uncore_write() please.

> +}
> +
>  /*
>   * shared_page setup for VGPU PV features
>   */
> @@ -385,7 +562,7 @@ static int intel_vgpu_setup_shared_page(struct drm_i915_private *i915,
>  
>  	/* We allocate 1 page shared between guest and GVT for data exchange.
>  	 *       _______________________________
> -	 *      |version                        |
> +	 *      |version|PV_DESCs(SEND)         |
>  	 *      |_______________________________PAGE/8
>  	 *      |                               |
>  	 *      |_______________________________PAGE/4
> @@ -393,7 +570,7 @@ static int intel_vgpu_setup_shared_page(struct drm_i915_private *i915,
>  	 *      |                               |
>  	 *      |                               |
>  	 *      |_______________________________PAGE/2
> -	 *      |                               |
> +	 *      |PV_CMDs(SEND)                  |
>  	 *      |                               |
>  	 *      |                               |
>  	 *      |                               |
> @@ -403,6 +580,8 @@ static int intel_vgpu_setup_shared_page(struct drm_i915_private *i915,
>  	 *      |_______________________________|
>  	 *
>  	 * 0 offset: PV version area
> +	 * PAGE/4 offset: PV command buffer command descriptor area
> +	 * PAGE/2 offset: PV command buffer command data area
>  	 */
>  
>  	base =  (struct gvt_shared_page *)get_zeroed_page(GFP_KERNEL);
> @@ -441,6 +620,18 @@ static int intel_vgpu_setup_shared_page(struct drm_i915_private *i915,
>  	DRM_INFO("vgpu PV ver major %d and minor %d\n", ver_maj, ver_min);
>  	i915->vgpu.pv = pv;
>  	pv->shared_page = base;
> +
> +	/* setup PV command buffer ptr */
> +	pv->ctb.cmds = (void *)base + PV_CMD_OFF;
> +	pv->ctb.desc = (void *)base + PV_DESC_OFF;
> +	pv->ctb.desc->size = PAGE_SIZE/2;
> +	pv->ctb.desc->addr = PV_CMD_OFF;
> +
> +	/* setup PV command buffer callback */
> +	pv->send = intel_vgpu_pv_send_command_buffer;
> +	pv->notify = intel_vgpu_pv_notify_mmio;
> +	spin_lock_init(&pv->lock);
> +
>  	return ret;
>  err:
>  	__free_page(virt_to_page(base));
> diff --git a/drivers/gpu/drm/i915/i915_vgpu.h b/drivers/gpu/drm/i915/i915_vgpu.h
> index aeef20f..f2826f9 100644
> --- a/drivers/gpu/drm/i915/i915_vgpu.h
> +++ b/drivers/gpu/drm/i915/i915_vgpu.h
> @@ -31,6 +31,8 @@ struct i915_ggtt;
>  
>  #define PV_MAJOR        0
>  #define PV_MINOR        1
> +#define PV_DESC_OFF     (PAGE_SIZE/256)
> +#define PV_CMD_OFF      (PAGE_SIZE/2)
>  
>  /* define different PV capabilities */
>  enum pv_caps {
> @@ -43,8 +45,59 @@ struct gvt_shared_page {
>  	u16 ver_minor;
>  };
>  
> +/*
> + * Definition of the command transport message header (DW0)
> + *
> + * bit[0..4]	message len (in dwords)
> + * bit[5..7]	reserved
> + * bit[8..8]	write fence to desc
> + * bit[9..15]	reserved
> + * bit[16..31]	action code
> + */
> +#define PV_CT_MSG_LEN_SHIFT             0
> +#define PV_CT_MSG_LEN_MASK              0x1F
> +#define PV_CT_MSG_WRITE_FENCE_TO_DESC   (1 << 8)
> +#define PV_CT_MSG_ACTION_SHIFT          16
> +#define PV_CT_MSG_ACTION_MASK           0xFFFF
> +
> +/* PV command transport buffer descriptor */
> +struct vgpu_pv_ct_buffer_desc {
> +	u32 addr;		/* gpa address */
> +	u32 size;		/* size in bytes */
> +	u32 head;		/* offset updated by GVT */
> +	u32 tail;		/* offset updated by owner */
> +
> +	u32 fence;		/* fence updated by GVT */
> +	u32 status;		/* status updated by GVT */
> +} __packed;
> +
> +/** PV single command transport buffer.
> + *
> + * A single command transport buffer consists of two parts, the header
> + * record (command transport buffer descriptor) and the actual buffer which
> + * holds the commands.
> + *
> + * @desc: pointer to the buffer descriptor
> + * @cmds: pointer to the commands buffer
> + */
> +struct vgpu_pv_ct_buffer {
> +	struct vgpu_pv_ct_buffer_desc *desc;
> +	u32 *cmds;
> +};
> +

Again, another name prefix that is not in line with the rest of the file
or driver.

>  struct i915_virtual_gpu_pv {
>  	struct gvt_shared_page *shared_page;
> +
> +	/* PV command buffer support */
> +	struct vgpu_pv_ct_buffer ctb;
> +	u32 next_fence;
> +
> +	/* To serialize the vgpu PV send actions */
> +	spinlock_t lock;
> +
> +	/* VGPU's PV specific send function */
> +	int (*send)(struct drm_i915_private *dev_priv, u32 *data, u32 len);
> +	void (*notify)(struct drm_i915_private *dev_priv);
>  };
>  
>  void intel_vgpu_detect(struct drm_i915_private *i915);

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
