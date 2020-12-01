Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 010892C9789
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Dec 2020 07:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB93D6E483;
	Tue,  1 Dec 2020 06:27:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9226E483
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  1 Dec 2020 06:27:39 +0000 (UTC)
IronPort-SDR: wqiSk/L0Q66ePR9bE2SOT30trFS/8bpgtNGyUE3I/TKcvv8Jb8TW+VIwsrHnCahmuNjKro1d8D
 N8vqCUgtDZZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="169273057"
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; d="scan'208";a="169273057"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 22:27:39 -0800
IronPort-SDR: n0LnfeZxK19nBE4Mjjxy8hYCHoVHA5Db03LtjEEkIN//l+oAQ3tvxxqEL0U/TiFq5jSl4PPRPS
 41dadOhgErEg==
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; d="scan'208";a="549428472"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 22:27:37 -0800
Date: Tue, 1 Dec 2020 14:15:02 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 07/10] drm/i915/gvt: introduce a new flag F_CMD_WRITE_PATCH
Message-ID: <20201201061502.GC31495@yzhao56-desk.sh.intel.com>
References: <20201125003626.17806-1-yan.y.zhao@intel.com>
 <20201125004100.18231-1-yan.y.zhao@intel.com>
 <20201201055951.GR16939@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201055951.GR16939@zhen-hp.sh.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Dec 01, 2020 at 01:59:51PM +0800, Zhenyu Wang wrote:
> On 2020.11.25 08:41:00 +0800, Yan Zhao wrote:
> > F_CMD_WRITE_PATCH means command write to this register needs to be patched
> > 
> > Cc: Kevin Tian <kevin.tian@intel.com>
> > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/gvt.h | 32 +++++++++++++++++++++++++++++++-
> >  1 file changed, 31 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
> > index c470e185bc00..27878a18e6b4 100644
> > --- a/drivers/gpu/drm/i915/gvt/gvt.h
> > +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> > @@ -255,6 +255,8 @@ struct intel_gvt_mmio {
> >  #define F_CMD_ACCESS	(1 << 3)
> >  /* This reg has been accessed by a VM */
> >  #define F_ACCESSED	(1 << 4)
> > +/* Value of command write of this reg needs to be patched */
> > +#define F_CMD_WRITE_PATCH	(1 << 5)
> >  /* This reg could be accessed by unaligned address */
> >  #define F_UNALIGN	(1 << 6)
> >  /* This reg is in GVT's mmio save-restor list and in hardware
> > @@ -685,11 +687,39 @@ static inline void intel_gvt_mmio_set_sr_in_ctx(
> >  }
> >  
> >  void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu);
> > +/**
> > + * intel_gvt_mmio_set_cmd_fix_write -
> > + *				mark an MMIO if its cmd write needs to be
> > + *				patched
> > + * @gvt: a GVT device
> > + * @offset: register offset
> > + *
> > + */
> > +static inline void intel_gvt_mmio_set_cmd_fix_write(
> > +			struct intel_gvt *gvt, unsigned int offset)
> > +{
> > +	gvt->mmio.mmio_attribute[offset >> 2] |= F_CMD_WRITE_PATCH;
> 
> It's a bit mismatch for flag and function name, better to align..
>
rename the flag to F_CMD_FIX_WRITE ?

> > +}
> > +
> > +/**
> > + * intel_gvt_mmio_is_cmd_fix_write - check if an mmio's cmd access needs to
> > + * be patched
> > + * @gvt: a GVT device
> > + * @offset: register offset
> > + *
> > + * Returns:
> > + * True if GPU commmand write to an MMIO should be patched
> > + */
> > +static inline bool intel_gvt_mmio_is_cmd_fix_write(
> > +			struct intel_gvt *gvt, unsigned int offset)
> > +{
> > +	return gvt->mmio.mmio_attribute[offset >> 2] & F_CMD_WRITE_PATCH;
> > +}
> > +
> >  void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu);
> >  void intel_gvt_debugfs_init(struct intel_gvt *gvt);
> >  void intel_gvt_debugfs_clean(struct intel_gvt *gvt);
> >  
> > -
> >  #include "trace.h"
> >  #include "mpt.h"
> >  
> > -- 
> > 2.17.1
> > 
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> 
> -- 
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827


_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
