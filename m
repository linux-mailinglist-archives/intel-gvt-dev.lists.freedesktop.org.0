Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56633F2DD8
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 20 Aug 2021 16:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04816EAA4;
	Fri, 20 Aug 2021 14:17:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370546EAA4;
 Fri, 20 Aug 2021 14:17:28 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 13C3E6736F; Fri, 20 Aug 2021 16:17:25 +0200 (CEST)
Date: Fri, 20 Aug 2021 16:17:24 +0200
From: Christoph Hellwig <hch@lst.de>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: refactor the i915 GVT support
Message-ID: <20210820141724.GA29034@lst.de>
References: <DM4PR11MB5549EC882AA6076F3468274DCAEA9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210728175925.GU1721383@nvidia.com> <20210729072022.GB31896@lst.de>
 <20210803094315.GF13928@zhen-hp.sh.intel.com>
 <20210803143058.GA1721383@nvidia.com>
 <20210804052606.GG13928@zhen-hp.sh.intel.com> <20210816173458.GA9183@lst.de>
 <20210817010851.GW13928@zhen-hp.sh.intel.com>
 <20210817052203.GX13928@zhen-hp.sh.intel.com>
 <20210819082929.GB13928@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819082929.GB13928@zhen-hp.sh.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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

On Thu, Aug 19, 2021 at 04:29:29PM +0800, Zhenyu Wang wrote:
> I'm working on below patch to resolve this. But I met a weird issue in
> case when building i915 as module and also kvmgt module, it caused
> busy wait on request_module("kvmgt") when boot, it doesn't happen if
> building i915 into kernel. I'm not sure what could be the reason?

Luis, do you know if there is a problem with a request_module from
a driver ->probe routine that is probably called by a module_init
function itself?

In the meantime I'll try to reproduce it locally, but I always had a
hard time getting useful results out of a modular i915, especially
when combined with module paramters. (no blame on i915, just the problem
with modules needed early on).

> 
> > But the problem I see is that after moving gvt device model (gvt/*.c
> > except kvmgt.c) into kvmgt module, we'll have issue with initial mmio
> > state which current gvt relies on, that is in design supposed to get
> > initial HW state before i915 driver has taken any operation.  Before
> > we can ensure that, I think we may only remove MPT part first but
> > still keep gvt device model as part of i915 with config. I'll try to
> > split that out.
> 
> Sorry I misread the code that as we always request kvmgt module when
> gvt init, so it should still apply original method that this isn't a
> problem. Our current validation result has shown no regression as well.

What does initial mmio state mean?  This is something new to me.  But
as you said in this mail unless I missed something very big it should
work the same as before.

> -static inline void intel_context_unpin(struct intel_context *ce)
> +static inline void _intel_context_unpin(struct intel_context *ce)
>  {
>  	if (!ce->ops->sched_disable) {
>  		__intel_context_do_unpin(ce, 1);
> @@ -150,6 +150,7 @@ static inline void intel_context_unpin(struct intel_context *ce)
>  		}
>  	}
>  }
> +void intel_context_unpin(struct intel_context *ce);

Looking at intel_context_unpin/_intel_context_unpin is there really
a need to have this inline to start with?  It don't see much the compiler
could optimize by inlining it.
