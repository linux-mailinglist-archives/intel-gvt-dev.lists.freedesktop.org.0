Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6296213D405
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Jan 2020 06:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39976EBE3;
	Thu, 16 Jan 2020 05:58:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D6F6EBE3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 16 Jan 2020 05:58:54 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 21:58:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,325,1574150400"; d="scan'208";a="218408846"
Received: from unknown (HELO joy-OptiPlex-7040) ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 15 Jan 2020 21:58:51 -0800
Date: Thu, 16 Jan 2020 00:49:41 -0500
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 2/2] drm/i915/gvt: subsitute kvm_read/write_guest with
 vfio_dma_rw
Message-ID: <20200116054941.GB1759@joy-OptiPlex-7040>
References: <20200115034132.2753-1-yan.y.zhao@intel.com>
 <20200115035455.12417-1-yan.y.zhao@intel.com>
 <20200115130651.29d7e9e0@w520.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115130651.29d7e9e0@w520.home>
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Jan 16, 2020 at 04:06:51AM +0800, Alex Williamson wrote:
> On Tue, 14 Jan 2020 22:54:55 -0500
> Yan Zhao <yan.y.zhao@intel.com> wrote:
> 
> > As a device model, it is better to read/write guest memory using vfio
> > interface, so that vfio is able to maintain dirty info of device IOVAs.
> > 
> > Compared to kvm interfaces kvm_read/write_guest(), vfio_dma_rw() has ~600
> > cycles more overhead on average.
> > 
> > -------------------------------------
> > |    interface     | avg cpu cycles |
> > |-----------------------------------|
> > | kvm_write_guest  |     1554       |
> > | ----------------------------------|
> > | kvm_read_guest   |     707        |
> > |-----------------------------------|
> > | vfio_dma_rw(w)   |     2274       |
> > |-----------------------------------|
> > | vfio_dma_rw(r)   |     1378       |
> > -------------------------------------
> 
> In v1 you had:
> 
> -------------------------------------
> |    interface     | avg cpu cycles |
> |-----------------------------------|
> | kvm_write_guest  |     1546       |
> | ----------------------------------|
> | kvm_read_guest   |     686        |
> |-----------------------------------|
> | vfio_iova_rw(w)  |     2233       |
> |-----------------------------------|
> | vfio_iova_rw(r)  |     1262       |
> -------------------------------------
> 
> So the kvm numbers remained within +0.5-3% while the vfio numbers are
> now +1.8-9.2%.  I would have expected the algorithm change to at least
> not be worse for small accesses and be better for accesses crossing
> page boundaries.  Do you know what happened?
>
I only tested the 4 interfaces in GVT's environment, where most of the
guest memory accesses are less than one page.
And the different fluctuations should be caused by the locks.
vfio_dma_rw contends locks with other vfio accesses which are assumed to
be abundant in the case of GVT.

> > Comparison of benchmarks scores are as blow:
> > ------------------------------------------------------
> > |  avg score  | kvm_read/write_guest  | vfio_dma_rw  |
> > |----------------------------------------------------|
> > |   Glmark2   |         1284          |    1296      |
> > |----------------------------------------------------|
> > |  Lightsmark |         61.24         |    61.27     |
> > |----------------------------------------------------|
> > |  OpenArena  |         140.9         |    137.4     |
> > |----------------------------------------------------|
> > |   Heaven    |          671          |     670      |
> > ------------------------------------------------------
> > No obvious performance downgrade found.
> > 
> > Cc: Kevin Tian <kevin.tian@intel.com>
> > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/kvmgt.c | 26 +++++++-------------------
> >  1 file changed, 7 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > index bd79a9718cc7..17edc9a7ff05 100644
> > --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > @@ -1966,31 +1966,19 @@ static int kvmgt_rw_gpa(unsigned long handle, unsigned long gpa,
> >  			void *buf, unsigned long len, bool write)
> >  {
> >  	struct kvmgt_guest_info *info;
> > -	struct kvm *kvm;
> > -	int idx, ret;
> > -	bool kthread = current->mm == NULL;
> > +	int ret;
> > +	struct intel_vgpu *vgpu;
> > +	struct device *dev;
> >  
> >  	if (!handle_valid(handle))
> >  		return -ESRCH;
> >  
> >  	info = (struct kvmgt_guest_info *)handle;
> > -	kvm = info->kvm;
> > -
> > -	if (kthread) {
> > -		if (!mmget_not_zero(kvm->mm))
> > -			return -EFAULT;
> > -		use_mm(kvm->mm);
> > -	}
> > -
> > -	idx = srcu_read_lock(&kvm->srcu);
> > -	ret = write ? kvm_write_guest(kvm, gpa, buf, len) :
> > -		      kvm_read_guest(kvm, gpa, buf, len);
> > -	srcu_read_unlock(&kvm->srcu, idx);
> > +	vgpu = info->vgpu;
> > +	dev = mdev_dev(vgpu->vdev.mdev);
> >  
> > -	if (kthread) {
> > -		unuse_mm(kvm->mm);
> > -		mmput(kvm->mm);
> > -	}
> > +	ret = write ? vfio_dma_rw(dev, gpa, buf, len, true) :
> > +			vfio_dma_rw(dev, gpa, buf, len, false);
> 
> As Paolo suggested previously, this can be simplified:
> 
> ret = vfio_dma_rw(dev, gpa, buf, len, write);
>
> >  
> >  	return ret;
> 
> Or even more simple, remove the ret variable:
> 
> return vfio_dma_rw(dev, gpa, buf, len, write);
> 
oh, it seems that I missed Paolo's mail. will change it. thank you!

Thanks
Yan
> 
> >  }
> 
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
