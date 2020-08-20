Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7CF24AC3D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 20 Aug 2020 02:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BA06E889;
	Thu, 20 Aug 2020 00:33:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC9A6E889
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 20 Aug 2020 00:33:24 +0000 (UTC)
IronPort-SDR: 0E7NogZ5SiJZxeJJVsSwRdY8U3Ow6uJqXrbe2OgbhSj78l3zfenOFC1iH92vaDWSXsTbpLGagv
 Wdp7uaUzg9YA==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="154482741"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="154482741"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 17:33:24 -0700
IronPort-SDR: gHgmTiZOP2ECOe79zhr7KaaCp4SRRAatx8FwyHbiE4er4rQQL0yeODlz+FwXB1tj3OY5VhPnw0
 NGQk5njwWUwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="327250487"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 19 Aug 2020 17:33:17 -0700
Date: Thu, 20 Aug 2020 08:18:10 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200820001810.GD21172@joy-OptiPlex-7040>
References: <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <BY5PR12MB4322C9D1A66C4657776A1383DC5C0@BY5PR12MB4322.namprd12.prod.outlook.com>
 <20200819033035.GA21172@joy-OptiPlex-7040>
 <20200819115021.004427a3@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819115021.004427a3@x1.home>
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

On Wed, Aug 19, 2020 at 11:50:21AM -0600, Alex Williamson wrote:
<...>
> > > > > What I care about is that we have a *standard* userspace API for
> > > > > performing device compatibility checking / state migration, for use by
> > > > > QEMU/libvirt/ OpenStack, such that we can write code without countless
> > > > > vendor specific code paths.
> > > > >
> > > > > If there is vendor specific stuff on the side, that's fine as we can
> > > > > ignore that, but the core functionality for device compat / migration
> > > > > needs to be standardized.  
> > > > 
> > > > To summarize:
> > > > - choose one of sysfs or devlink
> > > > - have a common interface, with a standardized way to add
> > > >   vendor-specific attributes
> > > > ?  
> > > 
> > > Please refer to my previous email which has more example and details.  
> > hi Parav,
> > the example is based on a new vdpa tool running over netlink, not based
> > on devlink, right?
> > For vfio migration compatibility, we have to deal with both mdev and physical
> > pci devices, I don't think it's a good idea to write a new tool for it, given
> > we are able to retrieve the same info from sysfs and there's already an
> > mdevctl from Alex (https://github.com/mdevctl/mdevctl).
> > 
> > hi All,
> > could we decide that sysfs is the interface that every VFIO vendor driver
> > needs to provide in order to support vfio live migration, otherwise the
> > userspace management tool would not list the device into the compatible
> > list?
> > 
> > if that's true, let's move to the standardizing of the sysfs interface.
> > (1) content
> > common part: (must)
> >    - software_version: (in major.minor.bugfix scheme)
> >    - device_api: vfio-pci or vfio-ccw ...
> >    - type: mdev type for mdev device or
> >            a signature for physical device which is a counterpart for
> > 	   mdev type.
> > 
> > device api specific part: (must)
> >   - pci id: pci id of mdev parent device or pci id of physical pci
> >     device (device_api is vfio-pci)
> 
> As noted previously, the parent PCI ID should not matter for an mdev
> device, if a vendor has a dependency on matching the parent device PCI
> ID, that's a vendor specific restriction.  An mdev device can also
> expose a vfio-pci device API without the parent device being PCI.  For
> a physical PCI device, shouldn't the PCI ID be encompassed in the
> signature?  Thanks,
> 
you are right. I need to put the PCI ID as a vendor specific field.
I didn't do that because I wanted all fields in vendor specific to be
configurable by management tools, so they can configure the target device
according to the value of a vendor specific field even they don't know
the meaning of the field.
But maybe they can just ignore the field when they can't find a matching
writable field to configure the target.

Thanks
Yan


> >   - subchannel_type (device_api is vfio-ccw) 
> >  
> > vendor driver specific part: (optional)
> >   - aggregator
> >   - chpid_type
> >   - remote_url
> > 
> > NOTE: vendors are free to add attributes in this part with a
> > restriction that this attribute is able to be configured with the same
> > name in sysfs too. e.g.
> > for aggregator, there must be a sysfs attribute in device node
> > /sys/devices/pci0000:00/0000:00:02.0/882cc4da-dede-11e7-9180-078a62063ab1/intel_vgpu/aggregator,
> > so that the userspace tool is able to configure the target device
> > according to source device's aggregator attribute.
> > 
> > 
> > (2) where and structure
> > proposal 1:
> > |- [path to device]
> >   |--- migration
> >   |     |--- self
> >   |     |    |-software_version
> >   |     |    |-device_api
> >   |     |    |-type
> >   |     |    |-[pci_id or subchannel_type]
> >   |     |    |-<aggregator or chpid_type>
> >   |     |--- compatible
> >   |     |    |-software_version
> >   |     |    |-device_api
> >   |     |    |-type
> >   |     |    |-[pci_id or subchannel_type]
> >   |     |    |-<aggregator or chpid_type>
> > multiple compatible is allowed.
> > attributes should be ASCII text files, preferably with only one value
> > per file.
> > 
> > 
> > proposal 2: use bin_attribute.
> > |- [path to device]
> >   |--- migration
> >   |     |--- self
> >   |     |--- compatible
> > 
> > so we can continue use multiline format. e.g.
> > cat compatible
> >   software_version=0.1.0
> >   device_api=vfio_pci
> >   type=i915-GVTg_V5_{val1:int:1,2,4,8}
> >   pci_id=80865963
> >   aggregator={val1}/2
> > 
> > Thanks
> > Yan
> > 
> 
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
