Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BABD591ED
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 28 Jun 2019 05:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3741D6E87B;
	Fri, 28 Jun 2019 03:24:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492956E87B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jun 2019 03:24:17 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 20:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,426,1557212400"; 
 d="asc'?scan'208";a="185498337"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga004.fm.intel.com with ESMTP; 27 Jun 2019 20:24:14 -0700
Date: Fri, 28 Jun 2019 11:21:49 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [RFC PATCH v3 0/4] Deliver vGPU display vblank event to userspace
Message-ID: <20190628032149.GD9684@zhen-hp.sh.intel.com>
References: <20190627033802.1663-1-tina.zhang@intel.com>
 <20190627062231.57tywityo6uyhmyd@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC876835E5@SHSMSX101.ccr.corp.intel.com>
 <20190627103133.6ekdwazggi5j5lcl@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20190627103133.6ekdwazggi5j5lcl@sirius.home.kraxel.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Zhang,
 Tina" <tina.zhang@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============0972622002=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0972622002==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g++0NlQhRgFs6nMu"
Content-Disposition: inline


--g++0NlQhRgFs6nMu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.06.27 12:31:33 +0200, Gerd Hoffmann wrote:
> > >   Hi,
> > >=20
> > > > Instead of delivering page flip events, we choose to post display
> > > > vblank event. Handling page flip events for both primary plane and
> > > > cursor plane may make user space quite busy, although we have the
> > > > mask/unmask mechansim for mitigation. Besides, there are some cases
> > > > that guest app only uses one framebuffer for both drawing and displ=
ay.
> > > > In such case, guest OS won't do the plane page flip when the
> > > > framebuffer is updated, thus the user land won't be notified about =
the
> > > updated framebuffer.
> > >=20
> > > What happens when the guest is idle and doesn't draw anything to the
> > > framebuffer?
> > The vblank event will be delivered to userspace as well, unless guest O=
S disable the pipe.
> > Does it make sense to vfio/display?
>=20
> Getting notified only in case there are actual display updates would be
> a nice optimization, assuming the hardware is able to do that.  If the
> guest pageflips this is obviously trivial.  Not sure this is possible in
> case the guest renders directly to the frontbuffer.
>=20
> What exactly happens when the guest OS disables the pipe?  Is a vblank
> event delivered at least once?  That would be very useful because it
> will be possible for userspace to stop polling altogether without
> missing the "guest disabled pipe" event.
>=20

It looks like purpose to use vblank here is to replace user space
polling totally by kernel event? Which just act as display update
event to replace user space timer to make it query and update
planes? Although in theory vblank is not appropriate for this which
doesn't align with plane update or possible front buffer rendering at
all, but looks it's just a compromise e.g not sending event for every
cursor position change, etc.

I think we need to define semantics for this event properly, e.g user
space purely depends on this event for display update, the opportunity
for issuing this event is controlled by driver when it's necessary for
update, etc. Definitely not named as vblank event or only issue at vblank,
that need to happen for other plane change too.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--g++0NlQhRgFs6nMu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXRWHzQAKCRCxBBozTXgY
J//gAKCL699dZmXJ8voP2zTIzkbKlkEaoACfREQYSfPIUcqIAJ8iRylTd7kOOY0=
=hNje
-----END PGP SIGNATURE-----

--g++0NlQhRgFs6nMu--

--===============0972622002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0972622002==--
