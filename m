Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C53F594CE
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 28 Jun 2019 09:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2196E890;
	Fri, 28 Jun 2019 07:26:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF736E899
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Jun 2019 07:26:05 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jun 2019 00:26:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,426,1557212400"; 
 d="asc'?scan'208";a="337831152"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga005.jf.intel.com with ESMTP; 28 Jun 2019 00:26:01 -0700
Date: Fri, 28 Jun 2019 15:23:36 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [RFC PATCH v3 0/4] Deliver vGPU display vblank event to userspace
Message-ID: <20190628072336.GI9684@zhen-hp.sh.intel.com>
References: <20190627033802.1663-1-tina.zhang@intel.com>
 <20190627062231.57tywityo6uyhmyd@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC876835E5@SHSMSX101.ccr.corp.intel.com>
 <20190627103133.6ekdwazggi5j5lcl@sirius.home.kraxel.org>
 <20190628032149.GD9684@zhen-hp.sh.intel.com>
 <20190628054346.3uc3k4c4cffrqcy3@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20190628054346.3uc3k4c4cffrqcy3@sirius.home.kraxel.org>
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
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Zhang, Tina" <tina.zhang@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1691814411=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1691814411==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rKA5vZE+r0k9Fj4x"
Content-Disposition: inline


--rKA5vZE+r0k9Fj4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.06.28 07:43:46 +0200, Gerd Hoffmann wrote:
> On Fri, Jun 28, 2019 at 11:21:49AM +0800, Zhenyu Wang wrote:
> > On 2019.06.27 12:31:33 +0200, Gerd Hoffmann wrote:
> > > > >   Hi,
> > > > >=20
> > > > > > Instead of delivering page flip events, we choose to post displ=
ay
> > > > > > vblank event. Handling page flip events for both primary plane =
and
> > > > > > cursor plane may make user space quite busy, although we have t=
he
> > > > > > mask/unmask mechansim for mitigation. Besides, there are some c=
ases
> > > > > > that guest app only uses one framebuffer for both drawing and d=
isplay.
> > > > > > In such case, guest OS won't do the plane page flip when the
> > > > > > framebuffer is updated, thus the user land won't be notified ab=
out the
> > > > > updated framebuffer.
> > > > >=20
> > > > > What happens when the guest is idle and doesn't draw anything to =
the
> > > > > framebuffer?
> > > > The vblank event will be delivered to userspace as well, unless gue=
st OS disable the pipe.
> > > > Does it make sense to vfio/display?
> > >=20
> > > Getting notified only in case there are actual display updates would =
be
> > > a nice optimization, assuming the hardware is able to do that.  If the
> > > guest pageflips this is obviously trivial.  Not sure this is possible=
 in
> > > case the guest renders directly to the frontbuffer.
> > >=20
> > > What exactly happens when the guest OS disables the pipe?  Is a vblank
> > > event delivered at least once?  That would be very useful because it
> > > will be possible for userspace to stop polling altogether without
> > > missing the "guest disabled pipe" event.
> > >=20
> >=20
> > It looks like purpose to use vblank here is to replace user space
> > polling totally by kernel event? Which just act as display update
> > event to replace user space timer to make it query and update
> > planes?
>=20
> I think it makes sense to design it that way, so userspace will either
> use the events (when supported by the driver) or a timer (fallback if
> not) but not both.

Agree. It's more of a userspace choice.

>=20
> > Although in theory vblank is not appropriate for this which
> > doesn't align with plane update or possible front buffer rendering at
> > all, but looks it's just a compromise e.g not sending event for every
> > cursor position change, etc.
> >=20
> > I think we need to define semantics for this event properly, e.g user
> > space purely depends on this event for display update, the opportunity
> > for issuing this event is controlled by driver when it's necessary for
> > update, etc. Definitely not named as vblank event or only issue at vbla=
nk,
> > that need to happen for other plane change too.
>=20
> I think it should be "display update notification", i.e. userspace
> should check for plane changes and update the display.
>=20
> Most events will probably come from vblank (typically plane update are
> actually committed at vblank time to avoid tearing, right?).  That is an
> implementation detail though.
>=20

Yeah, vblank should be a good time, although driver might also do
optimization e.g checking actual plane change between vblank to see if
there's any real change, etc. Also that will depend on driver
implementation.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--rKA5vZE+r0k9Fj4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXRXAeAAKCRCxBBozTXgY
JzcJAJ99sboSlBBi5kAeve4/+OCTN6lXIACdGzcAGEF9FVJ0lUnUKRRsuvkmp/Y=
=qe3W
-----END PGP SIGNATURE-----

--rKA5vZE+r0k9Fj4x--

--===============1691814411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1691814411==--
