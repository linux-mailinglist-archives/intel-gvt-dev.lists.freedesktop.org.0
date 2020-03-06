Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E5117B3B2
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  6 Mar 2020 02:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DC76EC49;
	Fri,  6 Mar 2020 01:21:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C966EC49
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  6 Mar 2020 01:21:52 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 17:21:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,520,1574150400"; d="scan'208";a="229900252"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga007.jf.intel.com with ESMTP; 05 Mar 2020 17:21:49 -0800
Date: Thu, 5 Mar 2020 20:12:24 -0500
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v3 1/7] vfio: allow external user to get vfio group from
 device
Message-ID: <20200306011224.GA1530@joy-OptiPlex-7040>
References: <20200224084350.31574-1-yan.y.zhao@intel.com>
 <20200224084641.31696-1-yan.y.zhao@intel.com>
 <20200224121504.367cdfb4@w520.home>
 <20200225033542.GE30338@joy-OptiPlex-7040>
 <20200305120149.52f71551@w520.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305120149.52f71551@w520.home>
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

On Fri, Mar 06, 2020 at 03:01:49AM +0800, Alex Williamson wrote:
> On Mon, 24 Feb 2020 22:35:42 -0500
> Yan Zhao <yan.y.zhao@intel.com> wrote:
> 
> > On Tue, Feb 25, 2020 at 03:15:04AM +0800, Alex Williamson wrote:
> > > On Mon, 24 Feb 2020 03:46:41 -0500
> > > Yan Zhao <yan.y.zhao@intel.com> wrote:
> > >   
> > > > external user is able to
> > > > 1. add a device into an vfio group  
> > > 
> > > How so?  The device is added via existing mechanisms, the only thing
> > > added here is an interface to get a group reference from a struct
> > > device.
> > >   
> > > > 2. call vfio_group_get_external_user_from_dev() with the device pointer
> > > > to get vfio_group associated with this device and increments the container
> > > > user counter to prevent the VFIO group from disposal before KVM exits.
> > > > 3. When the external KVM finishes, it calls vfio_group_put_external_user()
> > > > to release the VFIO group.
> > > > 
> > > > Suggested-by: Alex Williamson <alex.williamson@redhat.com>
> > > > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > > > ---
> > > >  drivers/vfio/vfio.c  | 37 +++++++++++++++++++++++++++++++++++++
> > > >  include/linux/vfio.h |  2 ++
> > > >  2 files changed, 39 insertions(+)
> > > > 
> > > > diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> > > > index c8482624ca34..914bdf4b9d73 100644
> > > > --- a/drivers/vfio/vfio.c
> > > > +++ b/drivers/vfio/vfio.c
> > > > @@ -1720,6 +1720,43 @@ struct vfio_group *vfio_group_get_external_user(struct file *filep)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(vfio_group_get_external_user);
> > > >  
> > > > +/**
> > > > + * External user API, exported by symbols to be linked dynamically.
> > > > + *
> > > > + * The protocol includes:
> > > > + * 1. External user add a device into a vfio group
> > > > + *
> > > > + * 2. The external user calls vfio_group_get_external_user_from_dev()
> > > > + * with the device pointer
> > > > + * to verify that:
> > > > + *	- there's a vfio group associated with it and is initialized;
> > > > + *	- IOMMU is set for the vfio group.
> > > > + * If both checks passed, vfio_group_get_external_user_from_dev()
> > > > + * increments the container user counter to prevent
> > > > + * the VFIO group from disposal before KVM exits.
> > > > + *
> > > > + * 3. When the external KVM finishes, it calls
> > > > + * vfio_group_put_external_user() to release the VFIO group.
> > > > + * This call decrements the container user counter.
> > > > + */  
> > > 
> > > I don't think we need to duplicate this whole comment block for a
> > > _from_dev() version of the existing vfio_group_get_external_user().
> > > Please merge the comments.  
> > ok. but I have a question: for an external user, as it already has group
> > fd, it can use vfio_group_get_external_user() directly, is there a
> > necessity for it to call vfio_group_get_external_user_from_dev() ?
> > 
> > If an external user wants to call this interface, it needs to first get
> > device fd, passes the device fd to kernel and kernel retrieves the pointer
> > to struct device, right?
> 
> If you have the fd already, then yeah, let's not add a _from_dev()
> version, but how would an mdev vendor driver have the fd?  IIRC, the
> existing interface is designed this way to allow the user to prove
> ownership, whereas using a _from_dev() interface would be for trusted
> parts of the kernel, where we can theoretically trust that code isn't
> simply locating a device in order to perform malicious actions in the
> user (because they'd have more direct ways than this to be malicious to
> the user already).

ok, thanks for this explanation!

> > > > +
> > > > +struct vfio_group *vfio_group_get_external_user_from_dev(struct device *dev)
> > > > +{
> > > > +	struct vfio_group *group;
> > > > +	int ret;
> > > > +
> > > > +	group = vfio_group_get_from_dev(dev);
> > > > +	if (!group)
> > > > +		return ERR_PTR(-ENODEV);
> > > > +
> > > > +	ret = vfio_group_add_container_user(group);
> > > > +	if (ret)
> > > > +		return ERR_PTR(ret);  
> > > 
> > > Error path leaks group reference.
> > >  
> > oops, sorry for that.
> > 
> > > > +
> > > > +	return group;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(vfio_group_get_external_user_from_dev);
> > > > +
> > > >  void vfio_group_put_external_user(struct vfio_group *group)
> > > >  {
> > > >  	vfio_group_try_dissolve_container(group);
> > > > diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> > > > index e42a711a2800..2e1fa0c7396f 100644
> > > > --- a/include/linux/vfio.h
> > > > +++ b/include/linux/vfio.h
> > > > @@ -94,6 +94,8 @@ extern void vfio_unregister_iommu_driver(
> > > >   */
> > > >  extern struct vfio_group *vfio_group_get_external_user(struct file *filep);
> > > >  extern void vfio_group_put_external_user(struct vfio_group *group);
> > > > +extern
> > > > +struct vfio_group *vfio_group_get_external_user_from_dev(struct device *dev);  
> > > 
> > > Slight cringe at this line wrap, personally would prefer to wrap the
> > > args as done repeatedly elsewhere in this file.  Thanks,
> > >  
> > yeah, I tried to do in that way, but the name of this interface is too long,
> > as well as its return type, it passes 80 characters limit even with just one
> > arg...
> > 
> > is it better to wrap in below way?
> > extern struct vfio_group *vfio_group_get_external_user_from_dev(struct device
> > 								*dev);
> > 
> > or just a shorter interface name?
> > extern struct vfio_group *vfio_group_get_user_from_dev(struct device *dev);
> 
> I'd probably tend towards the former, keeping "external" in the name
> makes it clear that it belongs to a certain class of functions with
> similar conventions.  Thanks,
> 
Got it!
Thanks!

Yan
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
