Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0298A143821
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 Jan 2020 09:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5676E202;
	Tue, 21 Jan 2020 08:21:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C816E202
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 21 Jan 2020 08:21:22 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 00:21:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,345,1574150400"; d="scan'208";a="215459015"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga007.jf.intel.com with ESMTP; 21 Jan 2020 00:21:19 -0800
Date: Tue, 21 Jan 2020 03:12:07 -0500
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 2/2] drm/i915/gvt: subsitute kvm_read/write_guest with
 vfio_dma_rw
Message-ID: <20200121081207.GE1759@joy-OptiPlex-7040>
References: <20200115034132.2753-1-yan.y.zhao@intel.com>
 <20200115035455.12417-1-yan.y.zhao@intel.com>
 <20200115130651.29d7e9e0@w520.home>
 <20200116054941.GB1759@joy-OptiPlex-7040>
 <20200116083729.40983f38@w520.home>
 <20200119100637.GD1759@joy-OptiPlex-7040>
 <20200120130157.0ee7042d@w520.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120130157.0ee7042d@w520.home>
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
 "peterx@redhat.com" <peterx@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Jan 21, 2020 at 04:01:57AM +0800, Alex Williamson wrote:
> On Sun, 19 Jan 2020 05:06:37 -0500
> Yan Zhao <yan.y.zhao@intel.com> wrote:
> 
> > On Thu, Jan 16, 2020 at 11:37:29PM +0800, Alex Williamson wrote:
> > > On Thu, 16 Jan 2020 00:49:41 -0500
> > > Yan Zhao <yan.y.zhao@intel.com> wrote:
> > >   
> > > > On Thu, Jan 16, 2020 at 04:06:51AM +0800, Alex Williamson wrote:  
> > > > > On Tue, 14 Jan 2020 22:54:55 -0500
> > > > > Yan Zhao <yan.y.zhao@intel.com> wrote:
> > > > >     
> > > > > > As a device model, it is better to read/write guest memory using vfio
> > > > > > interface, so that vfio is able to maintain dirty info of device IOVAs.
> > > > > > 
> > > > > > Compared to kvm interfaces kvm_read/write_guest(), vfio_dma_rw() has ~600
> > > > > > cycles more overhead on average.
> > > > > > 
> > > > > > -------------------------------------
> > > > > > |    interface     | avg cpu cycles |
> > > > > > |-----------------------------------|
> > > > > > | kvm_write_guest  |     1554       |
> > > > > > | ----------------------------------|
> > > > > > | kvm_read_guest   |     707        |
> > > > > > |-----------------------------------|
> > > > > > | vfio_dma_rw(w)   |     2274       |
> > > > > > |-----------------------------------|
> > > > > > | vfio_dma_rw(r)   |     1378       |
> > > > > > -------------------------------------    
> > > > > 
> > > > > In v1 you had:
> > > > > 
> > > > > -------------------------------------
> > > > > |    interface     | avg cpu cycles |
> > > > > |-----------------------------------|
> > > > > | kvm_write_guest  |     1546       |
> > > > > | ----------------------------------|
> > > > > | kvm_read_guest   |     686        |
> > > > > |-----------------------------------|
> > > > > | vfio_iova_rw(w)  |     2233       |
> > > > > |-----------------------------------|
> > > > > | vfio_iova_rw(r)  |     1262       |
> > > > > -------------------------------------
> > > > > 
> > > > > So the kvm numbers remained within +0.5-3% while the vfio numbers are
> > > > > now +1.8-9.2%.  I would have expected the algorithm change to at least
> > > > > not be worse for small accesses and be better for accesses crossing
> > > > > page boundaries.  Do you know what happened?
> > > > >    
> > > > I only tested the 4 interfaces in GVT's environment, where most of the
> > > > guest memory accesses are less than one page.
> > > > And the different fluctuations should be caused by the locks.
> > > > vfio_dma_rw contends locks with other vfio accesses which are assumed to
> > > > be abundant in the case of GVT.  
> > > 
> > > Hmm, so maybe it's time to convert vfio_iommu.lock from a mutex to a
> > > rwsem?  Thanks,
> > >   
> > 
> > hi Alex
> > I tested your rwsem patches at (https://lkml.org/lkml/2020/1/16/1869).
> > They works without any runtime error at my side. :) 
> > However, I found out that the previous fluctuation may be because I didn't
> > take read/write counts in to account.
> > For example. though the two tests have different avg read/write cycles,
> > their average cycles are almost the same.
> >  ______________________________________________________________________
> > |        | avg read |            | avg write |            |            |
> > |        | cycles   | read cnt   | cycles    | write cnt  | avg cycles |
> > |----------------------------------------------------------------------|
> > | test 1 |   1339   | 29,587,120 |  2258     | 17,098,364 |    1676    |
> > | test 2 |   1340   | 28,454,262 |  2238     | 16,501,788 |    1670    |
> >  ----------------------------------------------------------------------
> > 
> > After measuring the exact read/write cnt and cycles of a specific workload,
> > I get below findings:
> > 
> > (1) with single VM running glmark2 inside.
> > glmark2: 40M+ read+write cnt, among which 63% is read.
> > among reads, 48% is of PAGE_SIZE, the rest is less than a page.
> > among writes, 100% is less than a page.
> > 
> >  __________________________________________________
> > |       cycles         | read | write |  avg | inc |
> > |--------------------------------------------------|
> > | kvm_read/write_page  |  694 |  1506 |  993 |  /  |
> > |--------------------------------------------------|
> > |  vfio_dma_rw(mutex)  | 1340 |  2248 | 1673 | 680 |
> > |--------------------------------------------------|
> > | vfio_dma_rw(rwsem r) | 1323 |  2198 | 1645 | 653 |
> >  ---------------------------------------------------
> > 
> > so vfio_dma_rw generally has 650+ more cycles per each read/write.
> > While kvm->srcu is of 160 cycles on average with one vm is running, the
> > cycles spending on locks for vfio_dma_rw spread like this:
> >  ___________________________
> > |        cycles       | avg |
> > |---------------------------|
> > |     iommu->lock     | 117 |
> > |---------------------------|
> > |   vfio.group_lock   | 108 |
> > |---------------------------|
> > | group->unbound_lock | 114 |
> > |---------------------------|
> > |  group->device_lock | 115 |
> > |---------------------------|
> > |     group->mutex    | 113 |
> >  ---------------------------
> > 
> > I measured the cycles for a mutex without any contention is 104 cycles
> > on average (including time for get_cycles() and measured in the same way
> > as other locks). So the contention of a single lock in a single vm
> > environment is light. probably because there's a vgpu lock hold in GVT already.
> > 
> > (2) with two VMs each running glmark2 inside.
> > The contention increases a little.
> > 
> >  ___________________________________________________
> > |       cycles         | read | write |  avg | inc  |
> > |---------------------------------------------------|
> > | kvm_read/write_page  | 1035 |  1832 | 1325 |  /   |
> > |---------------------------------------------------|
> > |  vfio_dma_rw(mutex)  | 2104 |  2886 | 2390 | 1065 |
> > |---------------------------------------------------|
> > | vfio_dma_rw(rwsem r) | 1965 |  2778 | 2260 | 935  |
> >  ---------------------------------------------------
> > 
> > 
> >  -----------------------------------------------
> > |     avg cycles       |   one VM   |  two VMs  |
> > |-----------------------------------------------|
> > |  iommu lock (mutex)  |     117    |   150     |
> > |-----------------------------------|-----------|
> > | iommu lock (rwsem r) |     117    |   156     |
> > |-----------------------------------|-----------|
> > |   kvm->srcu          |     160    |   213     |
> >  -----------------------------------------------
> > 
> > In the kvm case, avg cycles increased 332 cycles, while kvm->srcu only costed
> > 213 cycles. The rest 109 cycles may be spent on atomic operations.
> > But I didn't measure them, as get_cycles() operation itself would influence final
> > cycles by ~20 cycles.
> 
> It seems like we need to extend the vfio external user interface so
> that GVT-g can hold the group and container user references across
> multiple calls.  For instance if we had a
> vfio_group_get_external_user_from_dev() (based on
> vfio_group_get_external_user()) then i915 could get an opaque
> vfio_group pointer which it could use to call vfio_group_dma_rw() which
> would leave us with only the iommu rw_sem locking.  i915 would release
> the reference with vfio_group_put_external_user() when the device is
> released.  The same could be done with the pin pages interface to
> streamline that as well.  Thoughts?  Thanks,
>
hi Alex,
it works!
now the average vfio_dma_rw cycles can reduced to 1198. 
one thing I want to propose is that, in sight of dma->task is always user
space process, instead of calling get_task_mm(dma->task), can we just use
"mmget_not_zero(dma->task->mm)"? in this way, the avg cycles can
further reduce to 1051.

Thanks
Yan

> 
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
