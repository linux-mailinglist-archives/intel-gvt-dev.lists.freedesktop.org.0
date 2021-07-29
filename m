Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7088C3D9E3E
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 29 Jul 2021 09:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC5B6ECA9;
	Thu, 29 Jul 2021 07:20:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33E26ECA9;
 Thu, 29 Jul 2021 07:20:26 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4BF4767373; Thu, 29 Jul 2021 09:20:23 +0200 (CEST)
Date: Thu, 29 Jul 2021 09:20:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: refactor the i915 GVT support
Message-ID: <20210729072022.GB31896@lst.de>
References: <20210721155355.173183-1-hch@lst.de>
 <DM4PR11MB55496531B246A4604FC86998CAE49@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210722112636.wj277vqhg4dez5ug@sirius.home.kraxel.org>
 <20210727121224.GA2145868@nvidia.com>
 <DM4PR11MB5549EC882AA6076F3468274DCAEA9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210728175925.GU1721383@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728175925.GU1721383@nvidia.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 02:59:25PM -0300, Jason Gunthorpe wrote:
> On Wed, Jul 28, 2021 at 01:38:58PM +0000, Wang, Zhi A wrote:
> 
> > I guess those APIs you were talking about are KVM-only. For other
> > hypervisors, e.g. Xen, ARCN cannot use the APIs you mentioned. Not
> > sure if you have already noticed that VFIO is KVM-only right now.
> 
> There is very little hard connection between VFIO and KVM, so no, I
> don't think that is completely true.

The only connection is the SET_KVM notifier as far as I can tell.
Which is used by a total of two drivers, including i915/gvt.  That
being said gvt does not only use vfio, but also does quite a few
direct cals to KVM.

> In an event, an in-tree version of other hypervisor support for GVT
> needs to go through enabling VFIO support so that the existing API
> multiplexers we have can be used properly, not adding a shim layer
> trying to recreate VFIO inside a GPU driver.

Yes.  And if we go back to actually looking at the series a lot of
it just removes entirely pointless indirect calls that go to generic
code and not even the kvm code, or questionable data structure designs.
If we were to support another upstream hypervisor we'd just need to
union a few fields in struct intel_gpu and maybe introduce a few
methods.  Preferably in a way that avoids expensive indirect calls
in the fast path.
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
