Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB006195156
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 27 Mar 2020 07:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8296E988;
	Fri, 27 Mar 2020 06:34:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099DC6E988
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 27 Mar 2020 06:34:21 +0000 (UTC)
IronPort-SDR: QeWo6/ZaCQCVNbyvE4N8y2QRyFbE/oat0h367jLjag+ZRsLLXfgCJTkbQNZHguxZuqkF1HotHF
 giec5vJqq/1A==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 23:34:21 -0700
IronPort-SDR: Qs8s4f1r9MjgsSFTvEJSHqqfg5IKKA+/EwsBM23zK2uAiss8E5EVtwZBAfDo3eTiV+s02T73Nd
 hhgsRybD1diw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; 
 d="asc'?scan'208";a="236537736"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga007.jf.intel.com with ESMTP; 26 Mar 2020 23:34:19 -0700
Date: Fri, 27 Mar 2020 14:21:17 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 1/2]
 Documentation/driver-api/vfio-mediated-device.rst: update for aggregation
 support
Message-ID: <20200327062117.GH8880@zhen-hp.sh.intel.com>
References: <20200326054136.2543-1-zhenyuw@linux.intel.com>
 <20200326054136.2543-2-zhenyuw@linux.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7EAB69@SHSMSX104.ccr.corp.intel.com>
 <20200326082142.GC8880@zhen-hp.sh.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7ECF0E@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7ECF0E@SHSMSX104.ccr.corp.intel.com>
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
Cc: "Jiang, Dave" <dave.jiang@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0863794205=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0863794205==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pr2uf1USn+1lHhL+"
Content-Disposition: inline


--pr2uf1USn+1lHhL+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.27 06:16:11 +0000, Tian, Kevin wrote:
> > From: Zhenyu Wang
> > Sent: Thursday, March 26, 2020 4:22 PM
> >=20
> > On 2020.03.26 08:17:20 +0000, Tian, Kevin wrote:
> > > > From: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > > Sent: Thursday, March 26, 2020 1:42 PM
> > > >
> > > > Update doc for mdev aggregation support. Describe mdev generic
> > > > parameter directory under mdev device directory.
> > > >
> > > > Cc: Kevin Tian <kevin.tian@intel.com>
> > > > Cc: "Jiang, Dave" <dave.jiang@intel.com>
> > > > Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > > ---
> > > >  .../driver-api/vfio-mediated-device.rst       | 19 +++++++++++++++=
++++
> > > >  1 file changed, 19 insertions(+)
> > > >
> > > > diff --git a/Documentation/driver-api/vfio-mediated-device.rst
> > > > b/Documentation/driver-api/vfio-mediated-device.rst
> > > > index 25eb7d5b834b..29c29432a847 100644
> > > > --- a/Documentation/driver-api/vfio-mediated-device.rst
> > > > +++ b/Documentation/driver-api/vfio-mediated-device.rst
> > > > @@ -269,6 +269,9 @@ Directories and Files Under the sysfs for Each
> > mdev
> > > > Device
> > > >    |--- [$MDEV_UUID]
> > > >           |--- remove
> > > >           |--- mdev_type {link to its type}
> > > > +         |--- mdev [optional]
> > > > +	     |--- aggregated_instances [optional]
> > > > +	     |--- max_aggregation [optional]
> > > >           |--- vendor-specific-attributes [optional]
> > > >
> > > >  * remove (write only)
> > > > @@ -281,6 +284,22 @@ Example::
> > > >
> > > >  	# echo 1 > /sys/bus/mdev/devices/$mdev_UUID/remove
> > > >
> > > > +* mdev directory (optional)
> > >
> > > It sounds confusing to me when seeing a 'mdev' directory under a
> > > mdev instance. How could one tell which attribute should put inside
> > > or outside of 'mdev'?
> > >
> >=20
> > After mdev create you get uuid directory under normal device path, so
> > from that point a 'mdev' directory can just tell this is a mdev
> > device. And it's proposed by Alex before.
>=20
> I didn't quite get. Isn't $MDEV_UUID plus mdev_type already tell this is
> a mdev device? If it is insufficient, then we're broken already since the=
re
> is no such 'mdev' sub-directory before.
>

yep, I ignored mdev_type link there. The original purpose is to have a
general agreed directory to put generic parameters on mdev.=20

> Alex?
>=20
> >=20
> > Currently only mdev core could create attribute e.g 'remove' under
> > device dir, vendor specific attrs need to be in attrs group. So 'mdev'
> > directory here tries to be optional generic interface.
>=20
> I'm a bit confused. Then why cannot the new nodes exposed through
> vendor specific attributes? I may overlook previous discussion why using
> attrs group doesn't work here. ????

Vendor driver e.g vfio-ccw or future SIOV driver is free to have
custom attributes for mdev resource definition. If you choose that
way, fine it's just defined by vendor. But if utilize common mdev
parameter attributes, you get common defined resource config method
instead.

>=20
> >=20
> > > > +
> > > > +Vendor driver could create mdev directory to specify extra generic
> > > > parameters
> > > > +on mdev device by its type. Currently aggregation parameters are
> > defined.
> > > > +Vendor driver should provide both items to support.
> > > > +
> > > > +1) aggregated_instances (read/write)
> > > > +
> > > > +Set target aggregated instances for device. Reading will show curr=
ent
> > > > +count of aggregated instances. Writing value larger than
> > max_aggregation
> > > > +would fail and return error.
> > >
> > > Can one write a value multiple-times and at any time?
> > >
> >=20
> > yeah, of coz multiple times, but normally won't succeed after open.
> >=20
> > > > +
> > > > +2) max_aggregation (read only)
> > > > +
> > > > +Show maxium instances for aggregation.
> > > > +
> > >
> > > "show maximum-allowed instances which can be aggregated for this
> > device". is
> > > this value static or dynamic? if dynamic then the user is expected to=
 read
> > this
> > > field before every write. worthy of some clarification here.
> >=20
> > yeah, user needs to read this before setting actual number, either stat=
ic or
> > dynamic
> > depends on vendor resource type.
>=20
> Then adding above information might make the description clearer.
>

Sure.

Thanks

> > > >  Mediated device Hot plug
> > > >  ------------------------
> > > >
> > > > --
> > > > 2.25.1
> > >
> >=20
> > --
> > Open Source Technology Center, Intel ltd.
> >=20
> > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--pr2uf1USn+1lHhL+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXn2bXQAKCRCxBBozTXgY
J6hyAJ9XY82tEnzre25UQTo8ChGxJSzNagCfa/XraYcGwrYaCs5davu9xjeC/gI=
=zTrn
-----END PGP SIGNATURE-----

--pr2uf1USn+1lHhL+--

--===============0863794205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0863794205==--
