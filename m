Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 071C324AD32
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 20 Aug 2020 05:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679566E891;
	Thu, 20 Aug 2020 03:14:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCCF6E891
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 20 Aug 2020 03:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597893241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1uL6oaieNOxO0lNuxORuGUFqqOmdlfIgO2Muo0Z8fB0=;
 b=Be0wtKOa18ByTcojhcNs+lKtLjWcF13LD0mPh2blKsq1+WmSoyIsh8IeS8sWyH6+JbMbUq
 4ZFKluQNfy8OtCiAOXlYs86PQKVoO/V2pCR7/3h64tbyMDqog6KOz8Hg1YtqY4Q4cY2N2x
 KzxiFgEAn7VA5UtLcP8iMK+bxlrQNxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-AueevQPFNxOMCGZ_BIsASA-1; Wed, 19 Aug 2020 23:13:58 -0400
X-MC-Unique: AueevQPFNxOMCGZ_BIsASA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0140802B47;
 Thu, 20 Aug 2020 03:13:54 +0000 (UTC)
Received: from x1.home (ovpn-112-71.phx2.redhat.com [10.3.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75CD27A40D;
 Thu, 20 Aug 2020 03:13:46 +0000 (UTC)
Date: Wed, 19 Aug 2020 21:13:45 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200819211345.0d9daf03@x1.home>
In-Reply-To: <20200820001810.GD21172@joy-OptiPlex-7040>
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
 <20200820001810.GD21172@joy-OptiPlex-7040>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, "dinechin@redhat.com" <dinechin@redhat.com>,
 "devel@ovirt.org" <devel@ovirt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 20 Aug 2020 08:18:10 +0800
Yan Zhao <yan.y.zhao@intel.com> wrote:

> On Wed, Aug 19, 2020 at 11:50:21AM -0600, Alex Williamson wrote:
> <...>
> > > > > > What I care about is that we have a *standard* userspace API for
> > > > > > performing device compatibility checking / state migration, for use by
> > > > > > QEMU/libvirt/ OpenStack, such that we can write code without countless
> > > > > > vendor specific code paths.
> > > > > >
> > > > > > If there is vendor specific stuff on the side, that's fine as we can
> > > > > > ignore that, but the core functionality for device compat / migration
> > > > > > needs to be standardized.    
> > > > > 
> > > > > To summarize:
> > > > > - choose one of sysfs or devlink
> > > > > - have a common interface, with a standardized way to add
> > > > >   vendor-specific attributes
> > > > > ?    
> > > > 
> > > > Please refer to my previous email which has more example and details.    
> > > hi Parav,
> > > the example is based on a new vdpa tool running over netlink, not based
> > > on devlink, right?
> > > For vfio migration compatibility, we have to deal with both mdev and physical
> > > pci devices, I don't think it's a good idea to write a new tool for it, given
> > > we are able to retrieve the same info from sysfs and there's already an
> > > mdevctl from Alex (https://github.com/mdevctl/mdevctl).
> > > 
> > > hi All,
> > > could we decide that sysfs is the interface that every VFIO vendor driver
> > > needs to provide in order to support vfio live migration, otherwise the
> > > userspace management tool would not list the device into the compatible
> > > list?
> > > 
> > > if that's true, let's move to the standardizing of the sysfs interface.
> > > (1) content
> > > common part: (must)
> > >    - software_version: (in major.minor.bugfix scheme)
> > >    - device_api: vfio-pci or vfio-ccw ...
> > >    - type: mdev type for mdev device or
> > >            a signature for physical device which is a counterpart for
> > > 	   mdev type.
> > > 
> > > device api specific part: (must)
> > >   - pci id: pci id of mdev parent device or pci id of physical pci
> > >     device (device_api is vfio-pci)  
> > 
> > As noted previously, the parent PCI ID should not matter for an mdev
> > device, if a vendor has a dependency on matching the parent device PCI
> > ID, that's a vendor specific restriction.  An mdev device can also
> > expose a vfio-pci device API without the parent device being PCI.  For
> > a physical PCI device, shouldn't the PCI ID be encompassed in the
> > signature?  Thanks,
> >   
> you are right. I need to put the PCI ID as a vendor specific field.
> I didn't do that because I wanted all fields in vendor specific to be
> configurable by management tools, so they can configure the target device
> according to the value of a vendor specific field even they don't know
> the meaning of the field.
> But maybe they can just ignore the field when they can't find a matching
> writable field to configure the target.


If fields can be ignored, what's the point of reporting them?  Seems
it's no longer a requirement.  Thanks,

Alex


> > >   - subchannel_type (device_api is vfio-ccw) 
> > >  
> > > vendor driver specific part: (optional)
> > >   - aggregator
> > >   - chpid_type
> > >   - remote_url
> > > 
> > > NOTE: vendors are free to add attributes in this part with a
> > > restriction that this attribute is able to be configured with the same
> > > name in sysfs too. e.g.
> > > for aggregator, there must be a sysfs attribute in device node
> > > /sys/devices/pci0000:00/0000:00:02.0/882cc4da-dede-11e7-9180-078a62063ab1/intel_vgpu/aggregator,
> > > so that the userspace tool is able to configure the target device
> > > according to source device's aggregator attribute.
> > > 
> > > 
> > > (2) where and structure
> > > proposal 1:
> > > |- [path to device]
> > >   |--- migration
> > >   |     |--- self
> > >   |     |    |-software_version
> > >   |     |    |-device_api
> > >   |     |    |-type
> > >   |     |    |-[pci_id or subchannel_type]
> > >   |     |    |-<aggregator or chpid_type>
> > >   |     |--- compatible
> > >   |     |    |-software_version
> > >   |     |    |-device_api
> > >   |     |    |-type
> > >   |     |    |-[pci_id or subchannel_type]
> > >   |     |    |-<aggregator or chpid_type>
> > > multiple compatible is allowed.
> > > attributes should be ASCII text files, preferably with only one value
> > > per file.
> > > 
> > > 
> > > proposal 2: use bin_attribute.
> > > |- [path to device]
> > >   |--- migration
> > >   |     |--- self
> > >   |     |--- compatible
> > > 
> > > so we can continue use multiline format. e.g.
> > > cat compatible
> > >   software_version=0.1.0
> > >   device_api=vfio_pci
> > >   type=i915-GVTg_V5_{val1:int:1,2,4,8}
> > >   pci_id=80865963
> > >   aggregator={val1}/2
> > > 
> > > Thanks
> > > Yan
> > >   
> >   
> 

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
