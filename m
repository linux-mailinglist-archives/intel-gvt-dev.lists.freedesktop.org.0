Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF5854C1D4
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Jun 2022 08:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF8710FDE2;
	Wed, 15 Jun 2022 06:28:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2002E10F76B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Jun 2022 06:28:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 37FB567373; Wed, 15 Jun 2022 08:28:41 +0200 (CEST)
Date: Wed, 15 Jun 2022 08:28:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 03/13] vfio/mdev: simplify mdev_type handling
Message-ID: <20220615062840.GB22728@lst.de>
References: <20220614045428.278494-1-hch@lst.de>
 <20220614045428.278494-4-hch@lst.de>
 <BN9PR11MB5276A3DCE429292860FD85F58CAA9@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276A3DCE429292860FD85F58CAA9@BN9PR11MB5276.namprd11.prod.outlook.com>
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Jun 14, 2022 at 10:06:16AM +0000, Tian, Kevin wrote:
> > +	gvt->mdev_types = kcalloc(num_types, sizeof(*gvt->mdev_types),
> > +			     GFP_KERNEL);
> > +	if (!gvt->mdev_types) {
> > +		kfree(gvt->types);
> > +		return -ENOMEM;
> > +	}
> > +
> >  	min_low = MB_TO_BYTES(32);
> >  	for (i = 0; i < num_types; ++i) {
> >  		if (low_avail / vgpu_types[i].low_mm == 0)
> > @@ -150,19 +157,21 @@ int intel_gvt_init_vgpu_types(struct intel_gvt *gvt)
> >  						   high_avail /
> > vgpu_types[i].high_mm);
> 
> there is a memory leak a few lines above:
> 
> if (vgpu_types[i].weight < 1 ||
> 	vgpu_types[i].weight > VGPU_MAX_WEIGHT)
> 	return -EINVAL;
> 
> both old code and this patch forgot to free the buffers upon error.

Yeah.  I'll add a patch to the beginning of the series to fix the
existing leak and will then make sure to not leak the new allocation
either.
