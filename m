Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD4C2184B1
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Jul 2020 12:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7142D6E1F4;
	Wed,  8 Jul 2020 10:11:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7836A6E20A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  8 Jul 2020 10:11:12 +0000 (UTC)
IronPort-SDR: 1vETtLtUPXbUXyNmWlaH4jYxDar2ezkxEOVbI/xwjwli96Sfz8CJIWhpZUaWB14SXgyg/ZF5VI
 deRwlEMfV//Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="212710595"
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; 
 d="asc'?scan'208";a="212710595"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 03:11:11 -0700
IronPort-SDR: 4/UQ6DIl/YT719hpkwXRIcpiDUMEFWgGnWANCNoYVp3wNWcNxKlLm3HOA+h9JY4aROiRX65OXV
 mVfclXO2b51w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; 
 d="asc'?scan'208";a="358059438"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga001.jf.intel.com with ESMTP; 08 Jul 2020 03:11:10 -0700
Date: Wed, 8 Jul 2020 17:54:18 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v3 0/2] VFIO mdev aggregated resources handling
Message-ID: <20200708095418.GQ27035@zhen-hp.sh.intel.com>
References: <20200326054136.2543-1-zhenyuw@linux.intel.com>
 <20200408055824.2378-1-zhenyuw@linux.intel.com>
 <MWHPR11MB1645CC388BF45FD2E6309C3C8C660@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200707190634.4d9055fe@x1.home>
 <MWHPR11MB16454BF5C1BF4D5D22F0B2B38C670@MWHPR11MB1645.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB16454BF5C1BF4D5D22F0B2B38C670@MWHPR11MB1645.namprd11.prod.outlook.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: multipart/mixed; boundary="===============0143061610=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0143061610==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bi5JUZtvcfApsciF"
Content-Disposition: inline


--bi5JUZtvcfApsciF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.07.08 06:31:00 +0000, Tian, Kevin wrote:
> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Wednesday, July 8, 2020 9:07 AM
> >=20
> > On Tue, 7 Jul 2020 23:28:39 +0000
> > "Tian, Kevin" <kevin.tian@intel.com> wrote:
> >=20
> > > Hi, Alex,
> > >
> > > Gentle ping... Please let us know whether this version looks good.
> >=20
> > I figured this is entangled with the versioning scheme.  There are
> > unanswered questions about how something that assumes a device of a
> > given type is software compatible to another device of the same type
> > handles aggregation and how the type class would indicate compatibility
> > with an aggregated instance.  Thanks,
> >=20
>=20
> Yes, this open is an interesting topic. I didn't closely follow the versi=
oning
> scheme discussion. Below is some preliminary thought in my mind:
>=20
> --
> First, let's consider migrating an aggregated instance:
>=20
> A conservative policy is to check whether the compatible type is supporte=
d=20
> on target device and whether available instances under that type can affo=
rd=20
> the ask of the aggregated instance. Compatibility check in this scheme is=
=20
> separated from aggregation check, then no change is required to the curre=
nt=20
> versioning interface.

In last mdev's aggregation series, no aggregation info is exposed in mdev t=
ype
until instance creates, so that would cause possible conflict w/o that info=
, e.g
type might have avail instances but not actually provide aggregation. Then =
=66rom
that point of view, either require to add new flag because current 'descrip=
tion'
is useless or change versioning interface or require to be different type..

>=20
> Then there comes a case where the target device doesn't handle aggregation
> but support a different type which however provides compatible capabiliti=
es=20
> and same resource size as the aggregated instance expects. I guess this is
> one puzzle how to check compatibility between such types. One possible
> extension is to introduce a non_aggregated_list  to indicate compatible=
=20
> non-aggregated types for each aggregated instance. Then mgmt.. stack=20
> just loop the compatible list if the conservative policy fails.  I didn't=
 think=20
> carefully about what format is reasonable here. But if we agree that an
> separate interface is required to support such usage, then this may come
> later after the basic migration_version interface is completed.
> --
>=20
> Another scenario is about migrating a non-aggregated instance to a device
> handling aggregation. Then there is an open whether an aggregated type=20
> can be used to back the non-aggregated instance in case of no available=
=20
> instance under the original type claimed by non-aggregated instance.=20
> This won't happen in KVMGT, because all vGPU types share the same=20
> resource pool. Allocating instance under one type also decrement availabl=
e=20
> instances under other types. So if we fail to find available instance und=
er=20
> type-A (with 4x resource of type-B), then we will also fail to create an
>  aggregated instance (aggregate=3D4) under type-B. therefore, we just=20
> need stick to basic type compatibility check for non-aggregated instance.=
=20
> And I feel this assumption can be applied to other devices handling=20
> aggregation. It doesn't make sense for two types to claim compatibility=
=20
> (only with resource size difference) when their resources are allocated
> from different pools (which usually implies different capability or QOS/
> SLA difference). With this assumption, we don't need provide another
> interface to indicate compatible aggregated types for non-aggregated
> interface.
> --
>=20
> I may definitely overlook something here, but if above analysis sounds
> reasonable, then this series could be decoupled from the versioning=20
> scheme discussion based on conservative policy for now. :)
>=20
> Thanks
> Kevin
>=20
> >=20
> >=20
> > > > From: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > > Sent: Wednesday, April 8, 2020 1:58 PM
> > > >
> > > > Hi,
> > > >
> > > > This is a refresh on previous series:
> > > > https://patchwork.kernel.org/cover/11208279/
> > > > and https://patchwork.freedesktop.org/series/70425/
> > > >
> > > > Current mdev device create interface depends on fixed mdev type, wh=
ich
> > > > get uuid from user to create instance of mdev device. If user wants=
 to
> > > > use customized number of resource for mdev device, then only can
> > > > create new mdev type for that which may not be flexible. This
> > > > requirement comes not only from to be able to allocate flexible
> > > > resources for KVMGT, but also from Intel scalable IO virtualization
> > > > which would use vfio/mdev to be able to allocate arbitrary resources
> > > > on mdev instance. More info on [1] [2] [3].
> > > >
> > > > As we agreed that for current opaque mdev device type, we'd still
> > > > explore management interface based on mdev sysfs definition. And th=
is
> > > > one tries to follow Alex's previous suggestion to create generic
> > > > parameters under 'mdev' directory for each device, so vendor driver
> > > > could provide support like as other defined mdev sysfs entries.
> > > >
> > > > For mdev type with aggregation support, files as "aggregated_instan=
ces"
> > > > and "max_aggregation" should be created under 'mdev' directory. E.g
> > > >
> > > > /sys/devices/pci0000:00/0000:00:02.0/<UUID>/mdev/
> > > >    |-- aggregated_instances
> > > >    |-- max_aggregation
> > > >
> > > > "aggregated_instances" is used to set or return current number of
> > > > instances for aggregation, which can not be larger than
> > "max_aggregation".
> > > >
> > > > The first patch is to update the document for new mdev parameter
> > directory.
> > > > The second one is to add aggregation support in GVT driver.
> > > >
> > > > References:
> > > > [1] https://software.intel.com/en-us/download/intel-virtualization-
> > > > technology-for-directed-io-architecture-specification
> > > > [2] https://software.intel.com/en-us/download/intel-scalable-io-
> > > > virtualization-technical-specification
> > > > [3] https://schd.ws/hosted_files/lc32018/00/LC3-SIOV-final.pdf
> > > >
> > > > Changelog:
> > > > v3:
> > > > - add more description for sysfs entries
> > > > - rebase GVT support
> > > > - rename accounting function
> > > >
> > > > Zhenyu Wang (2):
> > > >   Documentation/driver-api/vfio-mediated-device.rst: update for
> > > >     aggregation support
> > > >   drm/i915/gvt: mdev aggregation type
> > > >
> > > >  .../driver-api/vfio-mediated-device.rst       |  22 +++
> > > >  drivers/gpu/drm/i915/gvt/aperture_gm.c        |  44 +++--
> > > >  drivers/gpu/drm/i915/gvt/gtt.c                |   9 +-
> > > >  drivers/gpu/drm/i915/gvt/gvt.c                |   7 +-
> > > >  drivers/gpu/drm/i915/gvt/gvt.h                |  42 +++--
> > > >  drivers/gpu/drm/i915/gvt/kvmgt.c              | 115 +++++++++++-
> > > >  drivers/gpu/drm/i915/gvt/vgpu.c               | 172 ++++++++++++--=
----
> > > >  7 files changed, 317 insertions(+), 94 deletions(-)
> > > >
> > > > --
> > > > 2.25.1
> > >
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--bi5JUZtvcfApsciF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXwWXygAKCRCxBBozTXgY
Jya1AJ4rDVFRBZlB3WZbLyWHAj00K4b6TACgnguG+w6uFVuP7RkU05w7A8RBRx0=
=XnZZ
-----END PGP SIGNATURE-----

--bi5JUZtvcfApsciF--

--===============0143061610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0143061610==--
