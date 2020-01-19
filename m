Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0379141B40
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 19 Jan 2020 03:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249236E1BD;
	Sun, 19 Jan 2020 02:49:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C7B6E1BA;
 Sun, 19 Jan 2020 02:49:33 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jan 2020 18:49:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,336,1574150400"; 
 d="asc'?scan'208";a="424865977"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.14])
 by fmsmga005.fm.intel.com with ESMTP; 18 Jan 2020 18:49:31 -0800
Date: Sun, 19 Jan 2020 10:37:43 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/gvt: Wean gvt off
 dev_priv->engine[]
Message-ID: <20200119023743.GA12595@zhen-hp.sh.intel.com>
References: <20191016183902.13614-1-chris@chris-wilson.co.uk>
 <20191016183902.13614-2-chris@chris-wilson.co.uk>
 <20191021053724.GB8745@zhen-hp.sh.intel.com>
 <157164501001.24426.17278525357815707355@skylake-alporthouse-com>
 <87ftgegllz.fsf@intel.com>
MIME-Version: 1.0
In-Reply-To: <87ftgegllz.fsf@intel.com>
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
Cc: "Ding, Zhuocheng" <zhuocheng.ding@intel.com>,
 intel-gfx@lists.freedesktop.org,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: multipart/mixed; boundary="===============1108269690=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1108269690==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.01.17 17:15:36 +0200, Jani Nikula wrote:
> On Mon, 21 Oct 2019, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > Quoting Zhenyu Wang (2019-10-21 06:37:24)
> >> On 2019.10.16 19:39:02 +0100, Chris Wilson wrote:
> >> > Stop trying to escape out of the gvt layer to find the engine that we
> >> > initially setup for use with gvt. Record the engines during initiali=
sation
> >> > and use them henceforth.
> >> >=20
> >> > add/remove: 1/4 grow/shrink: 22/28 up/down: 341/-1410 (-1069)
> >> >=20
> >> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> >> > ---
> >>=20
> >> Thanks for this cleanup! Quick review seems good to me, although it
> >> looks pretty fine for me on ring_id replacement, this big one also
> >> includes other changes like indent fix, debugfs item change, etc.
> >> Could we split them for easier merge? Can have a gvt developer to
> >> help on that.
> >
> > Just make gvt/ checkpatch clean so that CI doesn't reject patches
> > because the surrounding code does not conform to coding style.
>=20
> Sadly this has fallen between the cracks. Could someone pick this up
> again please, maybe from the gvt team?
>=20

yes, I've had one person to help on this one, will refresh this later.

Thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXiPA9wAKCRCxBBozTXgY
J3zlAJ9S0eysluJWoImkRifeDKnNrlghlACeJ+v84P4cD3e6kw8raKaLLKc+doI=
=AXZW
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--

--===============1108269690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1108269690==--
