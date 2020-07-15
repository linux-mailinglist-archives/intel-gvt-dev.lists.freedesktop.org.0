Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7344822074B
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Jul 2020 10:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEA06EA57;
	Wed, 15 Jul 2020 08:31:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0A66EA57
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Jul 2020 08:31:39 +0000 (UTC)
IronPort-SDR: 1Du6rRyJ1q8cwMm4SfFOOQSLdkCgfU4OrjvQ9GGywIY1WyFQ/oZEB7FA+koplsmYlQKjHdBxDh
 bg8P5W3Hdaug==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="136562472"
X-IronPort-AV: E=Sophos;i="5.75,354,1589266800"; d="scan'208";a="136562472"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 01:31:39 -0700
IronPort-SDR: bgT689SWz4DVmaCoWobdGz1Fq5oX1a0HMiDAJ1JTPfrmW4mtQCCp3ovwFJbuHPhGLpJlDsvMvG
 7V2lf1OwjaXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,354,1589266800"; d="scan'208";a="308178009"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by fmsmga004.fm.intel.com with ESMTP; 15 Jul 2020 01:31:34 -0700
Date: Wed, 15 Jul 2020 16:20:41 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200715082040.GA13136@joy-OptiPlex-7040>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <20200714102129.GD25187@redhat.com>
 <20200714101616.5d3a9e75@x1.home> <20200714171946.GL2728@work-vm>
 <20200714145948.17b95eb3@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714145948.17b95eb3@x1.home>
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 kwankhede@nvidia.com, eauger@redhat.com, xin-ran.wang@intel.com,
 corbet@lwn.net, openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, eskultet@redhat.com, jian-feng.ding@intel.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, zhenyuw@linux.intel.com,
 hejie.xu@intel.com, bao.yumeng@zte.com.cn, smooney@redhat.com,
 intel-gvt-dev@lists.freedesktop.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 cohuck@redhat.com, dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 02:59:48PM -0600, Alex Williamson wrote:
> On Tue, 14 Jul 2020 18:19:46 +0100
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> =

> > * Alex Williamson (alex.williamson@redhat.com) wrote:
> > > On Tue, 14 Jul 2020 11:21:29 +0100
> > > Daniel P. Berrang=E9 <berrange@redhat.com> wrote:
> > >   =

> > > > On Tue, Jul 14, 2020 at 07:29:57AM +0800, Yan Zhao wrote:  =

> > > > > hi folks,
> > > > > we are defining a device migration compatibility interface that h=
elps upper
> > > > > layer stack like openstack/ovirt/libvirt to check if two devices =
are
> > > > > live migration compatible.
> > > > > The "devices" here could be MDEVs, physical devices, or hybrid of=
 the two.
> > > > > e.g. we could use it to check whether
> > > > > - a src MDEV can migrate to a target MDEV,
> > > > > - a src VF in SRIOV can migrate to a target VF in SRIOV,
> > > > > - a src MDEV can migration to a target VF in SRIOV.
> > > > >   (e.g. SIOV/SRIOV backward compatibility case)
> > > > > =

> > > > > The upper layer stack could use this interface as the last step t=
o check
> > > > > if one device is able to migrate to another device before trigger=
ing a real
> > > > > live migration procedure.
> > > > > we are not sure if this interface is of value or help to you. ple=
ase don't
> > > > > hesitate to drop your valuable comments.
> > > > > =

> > > > > =

> > > > > (1) interface definition
> > > > > The interface is defined in below way:
> > > > > =

> > > > >              __    userspace
> > > > >               /\              \
> > > > >              /                 \write
> > > > >             / read              \
> > > > >    ________/__________       ___\|/_____________
> > > > >   | migration_version |     | migration_version |-->check migrati=
on
> > > > >   ---------------------     ---------------------   compatibility
> > > > >      device A                    device B
> > > > > =

> > > > > =

> > > > > a device attribute named migration_version is defined under each =
device's
> > > > > sysfs node. e.g. (/sys/bus/pci/devices/0000\:00\:02.0/$mdev_UUID/=
migration_version).
> > > > > userspace tools read the migration_version as a string from the s=
ource device,
> > > > > and write it to the migration_version sysfs attribute in the targ=
et device.
> > > > > =

> > > > > The userspace should treat ANY of below conditions as two devices=
 not compatible:
> > > > > - any one of the two devices does not have a migration_version at=
tribute
> > > > > - error when reading from migration_version attribute of one devi=
ce
> > > > > - error when writing migration_version string of one device to
> > > > >   migration_version attribute of the other device
> > > > > =

> > > > > The string read from migration_version attribute is defined by de=
vice vendor
> > > > > driver and is completely opaque to the userspace.
> > > > > for a Intel vGPU, string format can be defined like
> > > > > "parent device PCI ID" + "version of gvt driver" + "mdev type" + =
"aggregator count".
> > > > > =

> > > > > for an NVMe VF connecting to a remote storage. it could be
> > > > > "PCI ID" + "driver version" + "configured remote storage URL"
> > > > > =

> > > > > for a QAT VF, it may be
> > > > > "PCI ID" + "driver version" + "supported encryption set".
> > > > > =

> > > > > (to avoid namespace confliction from each vendor, we may prefix a=
 driver name to
> > > > > each migration_version string. e.g. i915-v1-8086-591d-i915-GVTg_V=
5_8-1)  =

> > > =

> > > It's very strange to define it as opaque and then proceed to describe
> > > the contents of that opaque string.  The point is that its contents
> > > are defined by the vendor driver to describe the device, driver versi=
on,
> > > and possibly metadata about the configuration of the device.  One
> > > instance of a device might generate a different string from another.
> > > The string that a device produces is not necessarily the only string
> > > the vendor driver will accept, for example the driver might support
> > > backwards compatible migrations.  =

> > =

> > (As I've said in the previous discussion, off one of the patch series)
> > =

> > My view is it makes sense to have a half-way house on the opaqueness of
> > this string; I'd expect to have an ID and version that are human
> > readable, maybe a device ID/name that's human interpretable and then a
> > bunch of other cruft that maybe device/vendor/version specific.
> > =

> > I'm thinking that we want to be able to report problems and include the
> > string and the user to be able to easily identify the device that was
> > complaining and notice a difference in versions, and perhaps also use
> > it in compatibility patterns to find compatible hosts; but that does
> > get tricky when it's a 'ask the device if it's compatible'.
> =

> In the reply I just sent to Dan, I gave this example of what a
> "compatibility string" might look like represented as json:
> =

> {
>   "device_api": "vfio-pci",
>   "vendor": "vendor-driver-name",
>   "version": {
>     "major": 0,
>     "minor": 1
>   },
>   "vfio-pci": { // Based on above device_api
>     "vendor": 0x1234, // Values for the exposed device
>     "device": 0x5678,
>       // Possibly further parameters for a more specific match
>   },
>   "mdev_attrs": [
>     { "attribute0": "VALUE" }
>   ]
> }
> =

> Are you thinking that we might allow the vendor to include a vendor
> specific array where we'd simply require that both sides have matching
> fields and values?  ie.
> =

>   "vendor_fields": [
>     { "unknown_field0": "unknown_value0" },
>     { "unknown_field1": "unknown_value1" },
>   ]
> =

> We could certainly make that part of the spec, but I can't really
> figure the value of it other than to severely restrict compatibility,
> which the vendor could already do via the version.major value.  Maybe
> they'd want to put a build timestamp, random uuid, or source sha1 into
> such a field to make absolutely certain compatibility is only determined
> between identical builds?  Thanks,
>
Yes, I agree kernel could expose such sysfs interface to educate
openstack how to filter out devices. But I still think the proposed
migration_version (or rename to migration_compatibility) interface is
still required for libvirt to do double check.

In the following scenario: =

1. openstack chooses the target device by reading sysfs interface (of json
format) of the source device. And Openstack are now pretty sure the two
devices are migration compatible.
2. openstack asks libvirt to create the target VM with the target device
and start live migration.
3. libvirt now receives the request. so it now has two choices:
(1) create the target VM & target device and start live migration directly
(2) double check if the target device is compatible with the source
device before doing the remaining tasks.

Because the factors to determine whether two devices are live migration
compatible are complicated and may be dynamically changing, (e.g. driver
upgrade or configuration changes), and also because libvirt should not
totally rely on the input from openstack, I think the cost for libvirt is
relatively lower if it chooses to go (2) than (1). At least it has no
need to cancel migration and destroy the VM if it knows it earlier.

So, it means the kernel may need to expose two parallel interfaces:
(1) with json format, enumerating all possible fields and comparing
methods, so as to indicate openstack how to find a matching target device
(2) an opaque driver defined string, requiring write and test in target,
which is used by libvirt to make sure device compatibility, rather than
rely on the input accurateness from openstack or rely on kernel driver
implementing the compatibility detection immediately after migration
start.

Does it make sense?

Thanks
Yan








_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
