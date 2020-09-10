Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBAD263CE3
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Sep 2020 08:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8B06E039;
	Thu, 10 Sep 2020 06:01:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6C16E039
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Sep 2020 06:01:34 +0000 (UTC)
IronPort-SDR: vULjARylAmBBtFBTFG1nBSk2PFpqbcFOWT/GW8rDRisjQqpQ09q93lWW/hzVj10zb9880rI2V7
 9Lgjmk+9/zRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="157755286"
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; 
 d="asc'?scan'208";a="157755286"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 23:01:33 -0700
IronPort-SDR: GuFDpgbFKrH8CkNPsqAKvdCEGwtjO1AcFETxEJaF+aFbgSYBXnUnZaSnw7Ok2GUQpoY+S3yzEy
 YqoiB+rzzwrA==
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; 
 d="asc'?scan'208";a="480756709"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 23:01:26 -0700
Date: Thu, 10 Sep 2020 13:42:09 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: Night Color not working in guests
Message-ID: <20200910054209.GL28614@zhen-hp.sh.intel.com>
References: <65f0f6f8995ea6431b25d74fd6562f331f255317.camel@cyberus-technology.de>
MIME-Version: 1.0
In-Reply-To: <65f0f6f8995ea6431b25d74fd6562f331f255317.camel@cyberus-technology.de>
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
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0863543322=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0863543322==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5xSkJheCpeK0RUEJ"
Content-Disposition: inline


--5xSkJheCpeK0RUEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.09.09 10:58:38 +0200, Julian Stecklina wrote:
> Hello everyone,
>=20
> we noticed that any of the Night Color modes in Gnome and KDE don't work =
in
> guests when they run with vGPUs. This is pretty easy to reproduce: Pick a=
 GNOME
> or KDE Live CD and try to enable Night Color (KDE) or Night Light (GNOME).
>=20
> This is a bit of a minor issue, but I wonder what would be missing to mak=
e this
> work. Is there anything missing in Qemu or this is something that the med=
iator
> needs to handle. Does anyone have an idea?
>=20

I personally don't use KDE and little with GNOME. What's function those nig=
ht modes
depend on? Display gamma config or something else?

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--5xSkJheCpeK0RUEJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX1m8sQAKCRCxBBozTXgY
J5PqAJ4keVfZQMa2JU7tXJDs3yc1AhhVZACfYhOeCW3XJM9CqaEGIGHIZPePLjw=
=sSMO
-----END PGP SIGNATURE-----

--5xSkJheCpeK0RUEJ--

--===============0863543322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0863543322==--
