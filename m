Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933C918E73E
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 22 Mar 2020 07:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1261F6E04A;
	Sun, 22 Mar 2020 06:57:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89A86E04A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 22 Mar 2020 06:57:56 +0000 (UTC)
IronPort-SDR: xBbvmKlo0/2fbsIRKCE44lpb9kY1kMue9rM+Y+FPdtIRYOmwAnp0GvfylZ6Mx0MnDwJejbHR93
 HN70wNujuADA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2020 23:57:56 -0700
IronPort-SDR: 8BQWYV6GTLE8Wsp3mJPao2v9dz9xOR47n5MgTD0D1uva1DrBuxmgHigQ9QZAAVQ8UcTNhPnQbF
 gQp3vP64oxew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,291,1580803200"; 
 d="asc'?scan'208";a="445452291"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga005.fm.intel.com with ESMTP; 21 Mar 2020 23:57:55 -0700
Date: Sun, 22 Mar 2020 14:45:04 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: GVT State Save/Restore
Message-ID: <20200322064504.GM8880@zhen-hp.sh.intel.com>
References: <460869e24c55da66c43e3cbdf77b4af5f9a0bbeb.camel@cyberus-technology.de>
MIME-Version: 1.0
In-Reply-To: <460869e24c55da66c43e3cbdf77b4af5f9a0bbeb.camel@cyberus-technology.de>
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
 Thomas Prescher <thomas.prescher@cyberus-technology.de>,
 Intel GVT Dev <intel-gvt-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0817533096=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0817533096==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+mQKy/8VjtYrTtD4"
Content-Disposition: inline


--+mQKy/8VjtYrTtD4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.20 11:49:46 +0100, Julian Stecklina wrote:
> Hi everyone,
>=20
> I'm researching what needs to be done to enable VMs with a GVT device to =
be
> saved to disk and restored. This is similar to live migration in the sens=
e that
> state of the vGPU needs to be serialized and deserialized, but simpler, b=
ecause
> no dirty page tracking is needed.
>=20
> I've seen work and discussions towards full live migration support:
> - https://www.spinics.net/lists/kvm/msg195198.html
> - https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg09242.html
> -=20
> https://events17.linuxfoundation.org/sites/events/files/slides/Live%20mig=
ration%20with%20mdev%20device%20-%202017_0.pdf
>=20
> It doesn't seem like any of the patches actually made it upstream. Are th=
ere
> some newer PoC patches to look at or did I miss some functionality in the
> mediator?
>=20

cc Yan, who is working on upstream VFIO interface and GVT change for migrat=
ion.

We have an old topic branch on https://github.com/intel/gvt-linux/commits/t=
opic/gvt-migration-yan
which had working GVT migration support based on older interface proposal.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--+mQKy/8VjtYrTtD4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXncJcAAKCRCxBBozTXgY
J7N7AJ9v7StT7mjW6EnuZcjWcV5jQX/vXwCgk+BJ3hSDJuygb5X+3mjJtPOQTiM=
=Gbnc
-----END PGP SIGNATURE-----

--+mQKy/8VjtYrTtD4--

--===============0817533096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0817533096==--
