Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B83072BD6A
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 May 2019 04:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7580D89AB9;
	Tue, 28 May 2019 02:52:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E59D89AB9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 May 2019 02:52:45 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 19:52:44 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga002.jf.intel.com with ESMTP; 27 May 2019 19:52:42 -0700
Date: Tue, 28 May 2019 10:51:27 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/2] vfio: ABI for setting mdev display flip eventfd
Message-ID: <20190528025127.GI29553@zhen-hp.sh.intel.com>
References: <20190527084312.8872-1-tina.zhang@intel.com>
 <20190527084312.8872-2-tina.zhang@intel.com>
 <20190527090741.GE29553@zhen-hp.sh.intel.com>
 <20190527122237.uhd7qm62h6wfv5w7@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20190527122237.uhd7qm62h6wfv5w7@sirius.home.kraxel.org>
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, hang.yuan@intel.com,
 alex.williamson@redhat.com, zhiyuan.lv@intel.com,
 Tina Zhang <tina.zhang@intel.com>, intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0777277632=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0777277632==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z9ECzHErBrwFF8sy"
Content-Disposition: inline


--z9ECzHErBrwFF8sy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.27 14:22:37 +0200, Gerd Hoffmann wrote:
> On Mon, May 27, 2019 at 05:07:41PM +0800, Zhenyu Wang wrote:
> > On 2019.05.27 16:43:11 +0800, Tina Zhang wrote:
> > > Add VFIO_DEVICE_SET_GFX_FLIP_EVENTFD ioctl command to set eventfd
> > > based signaling mechanism to deliver vGPU framebuffer page flip
> > > event to userspace.
> >=20
> > Should we add probe to see if driver can support gfx flip event?
>=20
> Userspace can simply call VFIO_DEVICE_SET_GFX_FLIP_EVENTFD and see if it
> worked.  If so -> use the eventfd.  Otherwise take the fallback path
> (timer based polling).  I can't see any advantage a separate feature
> probe steps adds.
>=20

Then we need to define error return which means driver doesn't support
e.g -ENOTTY, and driver shouldn't return that for other possible
failure, so user space won't get confused.

I think if we can define this as generic display event notification?
Not necessarily just for flip, just a display change notification to
let user space query current state.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--z9ECzHErBrwFF8sy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXOyiLwAKCRCxBBozTXgY
Jy7ZAJ9IHhuCGPDYDK9ZUsQm0JS1aSlYrQCfZ2G/aRCELpKd+cSxiSFDvUAuhnM=
=AbnB
-----END PGP SIGNATURE-----

--z9ECzHErBrwFF8sy--

--===============0777277632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0777277632==--
