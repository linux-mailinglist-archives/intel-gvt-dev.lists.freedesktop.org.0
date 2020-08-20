Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DEC24AD49
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 20 Aug 2020 05:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60A86E892;
	Thu, 20 Aug 2020 03:27:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC346E892
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 20 Aug 2020 03:27:35 +0000 (UTC)
IronPort-SDR: vNqe9lvWTf6elTuT2Wx9Z1d3NmarCOk3Kw49mhvZkkv2EwOAC748hA5fl/1N5eFVGLfl0Z3htJ
 z7qzq1pf13zA==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="216764975"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="216764975"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 20:27:34 -0700
IronPort-SDR: UqP0IOWieCFyHRnd1vZQD2aXoRbEIKc+/gr6oUyySSR3mhwyApXJ6ijvH5c/4s3hX8nJNnHCRQ
 2wmgSpyXPOOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="327281681"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 19 Aug 2020 20:27:28 -0700
Date: Thu, 20 Aug 2020 11:09:51 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200820030951.GA24121@joy-OptiPlex-7040>
References: <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <BY5PR12MB4322C9D1A66C4657776A1383DC5C0@BY5PR12MB4322.namprd12.prod.outlook.com>
 <20200819033035.GA21172@joy-OptiPlex-7040>
 <20200819115021.004427a3@x1.home>
 <20200820001810.GD21172@joy-OptiPlex-7040>
 <20200819211345.0d9daf03@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819211345.0d9daf03@x1.home>
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, "eauger@redhat.com" <eauger@redhat.com>,
 "xin-ran.wang@intel.com" <xin-ran.wang@intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "openstack-discuss@lists.openstack.org"
 <openstack-discuss@lists.openstack.org>,
 "shaohe.feng@intel.com" <shaohe.feng@intel.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 Parav Pandit <parav@mellanox.com>,
 "jian-feng.ding@intel.com" <jian-feng.ding@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "hejie.xu@intel.com" <hejie.xu@intel.com>,
 "bao.yumeng@zte.com.cn" <bao.yumeng@zte.com.cn>,
 Jiri Pirko <jiri@mellanox.com>, "eskultet@redhat.com" <eskultet@redhat.com>,
 Parav Pandit <parav@nvidia.com>, "smooney@redhat.com" <smooney@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, "dinechin@redhat.com" <dinechin@redhat.com>,
 "devel@ovirt.org" <devel@ovirt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Aug 19, 2020 at 09:13:45PM -0600, Alex Williamson wrote:
> On Thu, 20 Aug 2020 08:18:10 +0800
> Yan Zhao <yan.y.zhao@intel.com> wrote:
> 
> > On Wed, Aug 19, 2020 at 11:50:21AM -0600, Alex Williamson wrote:
> > <...>
> > > > > > > What I care about is that we have a *standard* userspace API for
> > > > > > > performing device compatibility checking / state migration, for use by
> > > > > > > QEMU/libvirt/ OpenStack, such that we can write code without countless
> > > > > > > vendor specific code paths.
> > > > > > >
> > > > > > > If there is vendor specific stuff on the side, that's fine as we can
> > > > > > > ignore that, but the core functionality for device compat / migration
> > > > > > > needs to be standardized.    
> > > > > > 
> > > > > > To summarize:
> > > > > > - choose one of sysfs or devlink
> > > > > > - have a common interface, with a standardized way to add
> > > > > >   vendor-specific attributes
> > > > > > ?    
> > > > > 
> > > > > Please refer to my previous email which has more example and details.    
> > > > hi Parav,
> > > > the example is based on a new vdpa tool running over netlink, not based
> > > > on devlink, right?
> > > > For vfio migration compatibility, we have to deal with both mdev and physical
> > > > pci devices, I don't think it's a good idea to write a new tool for it, given
> > > > we are able to retrieve the same info from sysfs and there's already an
> > > > mdevctl from Alex (https://github.com/mdevctl/mdevctl).
> > > > 
> > > > hi All,
> > > > could we decide that sysfs is the interface that every VFIO vendor driver
> > > > needs to provide in order to support vfio live migration, otherwise the
> > > > userspace management tool would not list the device into the compatible
> > > > list?
> > > > 
> > > > if that's true, let's move to the standardizing of the sysfs interface.
> > > > (1) content
> > > > common part: (must)
> > > >    - software_version: (in major.minor.bugfix scheme)
> > > >    - device_api: vfio-pci or vfio-ccw ...
> > > >    - type: mdev type for mdev device or
> > > >            a signature for physical device which is a counterpart for
> > > > 	   mdev type.
> > > > 
> > > > device api specific part: (must)
> > > >   - pci id: pci id of mdev parent device or pci id of physical pci
> > > >     device (device_api is vfio-pci)  
> > > 
> > > As noted previously, the parent PCI ID should not matter for an mdev
> > > device, if a vendor has a dependency on matching the parent device PCI
> > > ID, that's a vendor specific restriction.  An mdev device can also
> > > expose a vfio-pci device API without the parent device being PCI.  For
> > > a physical PCI device, shouldn't the PCI ID be encompassed in the
> > > signature?  Thanks,
> > >   
> > you are right. I need to put the PCI ID as a vendor specific field.
> > I didn't do that because I wanted all fields in vendor specific to be
> > configurable by management tools, so they can configure the target device
> > according to the value of a vendor specific field even they don't know
> > the meaning of the field.
> > But maybe they can just ignore the field when they can't find a matching
> > writable field to configure the target.
> 
> 
> If fields can be ignored, what's the point of reporting them?  Seems
> it's no longer a requirement.  Thanks,
> 
sorry about the confusion. I mean this condition:
about to migrate, openstack searches if there are existing matching
MDEVs,
if yes, i.e. all common/vendor specific fields match, then just create
a VM with the matching target MDEV. (in this condition, the PCI ID field
is not ignored);
if not, openstack tries to create one MDEV according to mdev_type, and
configures MDEV according to the vendor specific attributes.
as PCI ID is not a configurable field, it just ignore the field.

Thanks
Yan

 
 
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
