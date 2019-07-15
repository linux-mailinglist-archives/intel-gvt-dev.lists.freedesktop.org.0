Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE10682B1
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Jul 2019 05:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E208972B;
	Mon, 15 Jul 2019 03:27:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC028972B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 15 Jul 2019 03:27:25 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jul 2019 20:27:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,492,1557212400"; 
 d="asc'?scan'208";a="318555455"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga004.jf.intel.com with ESMTP; 14 Jul 2019 20:27:23 -0700
Date: Mon, 15 Jul 2019 11:24:20 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Lu, Kechen" <kechen.lu@intel.com>
Subject: Re: [RFC] Display Refresh Events Delivering Poc Combining Vblanks
 and Pageflips
Message-ID: <20190715032420.GC16681@zhen-hp.sh.intel.com>
References: <31185F57AF7C4B4F87C41E735C23A6FE64C87F@shsmsx102.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <31185F57AF7C4B4F87C41E735C23A6FE64C87F@shsmsx102.ccr.corp.intel.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Zhang, Tina" <tina.zhang@intel.com>
Content-Type: multipart/mixed; boundary="===============0186923918=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0186923918==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Content-Disposition: inline


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.07.12 10:37:23 +0000, Lu, Kechen wrote:
> Hi,
> =20
> As the discussions we have before about the vblank and pageflip events sh=
ows
> that these two display event delivering favors have their own drawbacks, =
i.e.
>=20
>  1. vblanks would trigger 60 times per second constantly but sometimes ca=
use
>     extra and unnecessary handling and performance drops if no pageflip
>     happens, though it can avoid overwhelmed events in such cases like mo=
ving
>     the cursor frequently causing userspace window manager ui overhead
>  2. pageflip events only would be embarrassing when happening to a single
>     framebuffer like in Linux textmode console, almost no pageflips are
>     triggered, as a consequence, the userspace does not refresh the displ=
ay
>     while framebuffer updates, thus user experience drops. Plus, just lik=
e the
>     vblanks, if overwhelmed events deliver to userspace, the performance =
drops
>     as well
>=20
> =20
> These days we tried some ways to make tradeoff and take the advantage of =
the
> both two favors. To be brief, the basic idea is to deliver display refresh
> events at the vblank, and we skip some unneccessay vblank events if there=
 is no
> cursor/primay pageflip happens during this period checking the flip_done_=
event
> bitmap. In addition, if we happen to a single framebuffer case, i.e. no
> pageflip happens in a certain period, we still deliver all vblank events =
to
> userspace.
> =20
> To simplify the events delivering, we have only one eventfd responsible f=
or
> these display refresh events, using partitioned 8 byte eventfd count valu=
e to
> designate different events and up to eight. Here we define two events, i.=
e.
> console refresh and cursor refresh events and its corresponding increasem=
ent
> value, e.g. for primary(or console) framebuffer refresh events
> DISPLAY_CON_REFRESH_EVENT, the increased val is in highest one byte. When
> handling the event, if this byte has value, userspace knows the console r=
efresh
> events delivered.

Better just say that is primary plane event, userspace won't be necessary t=
o tell
difference from either console text mode or UI page flip, it'd still use vf=
io gfx
API to get refreshed fb then. So this gives userspace hint on which plane t=
o refresh.

> =20
> If after some vblanks there is no pageflip, we would assume current case =
is
> single framebuffer and deliver all the vblank events to notify userspace =
to
> update. Although we still have some tricks to determine if this single
> framebuffer has updates and skip ones without update, these tricks such as
> using checksum or hash to compare the framebuffer content are
> computing-intensive and consuming much cpu resource when idle. So to sing=
le
> framebuffer case, delivering fully vblank events are great tradeoff.

I think vblank cycle is upper bound, but we can use some heuristic
method to check update between real page flips through command or
plane reg change or e.g cursor movement, etc. But anyway that's driver
implementation details, we'd better expose API change to align first.

> =20
> Here is the POC you can have a try, kernel upstream in branch topic/
> display_event: https://github.com/intel/gvt-linux/tree/topic/display_even=
t ,
> topic/display_event: https://github.com/intel/Igvtg-qemu/tree/topic/
> display_event.
> =20

Would be easier if you can just send patches for comment.

thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXSvx5AAKCRCxBBozTXgY
JzWkAKCRybR4vJ7Ubsf1NVrYQ5hnrTr90gCeKdG+jWOAn99o5swq9IsUTIGYUsE=
=FU3S
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--

--===============0186923918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0186923918==--
