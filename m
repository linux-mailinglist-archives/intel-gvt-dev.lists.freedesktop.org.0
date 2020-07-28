Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0781323004F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 Jul 2020 05:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB0C6E14B;
	Tue, 28 Jul 2020 03:36:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDEF6E148;
 Tue, 28 Jul 2020 03:36:27 +0000 (UTC)
IronPort-SDR: PnoQjObb059p8JGN2IpBePWJvLGjaIXEfI4Chrux9kwvrXBqGu3Fhm/LEZtqK0ISDr1LjVHTfC
 i80e/TpdzlKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="139179187"
X-IronPort-AV: E=Sophos;i="5.75,404,1589266800"; 
 d="asc'?scan'208";a="139179187"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 20:36:26 -0700
IronPort-SDR: T8Rx9frCqAgVlb+AF3OvQwsvylacxNWAHHrKCBNX/P5mDndXb7NVi/H9iLEf8EazK5nESqCdxD
 y8AhfhQCXacg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,404,1589266800"; 
 d="asc'?scan'208";a="312456099"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2020 20:36:23 -0700
Date: Tue, 28 Jul 2020 11:18:46 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-next
Message-ID: <20200728031846.GW27035@zhen-hp.sh.intel.com>
References: <20200720080541.GT27035@zhen-hp.sh.intel.com>
 <159532948169.9008.15612685518487144837@jlahtine-desk.ger.corp.intel.com>
 <20200722004217.GA27035@zhen-hp.sh.intel.com>
 <215475D8-668C-48F7-B2D0-8D82E9836CE5@intel.com>
MIME-Version: 1.0
In-Reply-To: <215475D8-668C-48F7-B2D0-8D82E9836CE5@intel.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============0209456017=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0209456017==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tzjrJU3+iJ6c5SNx"
Content-Disposition: inline


--tzjrJU3+iJ6c5SNx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.07.27 16:39:58 +0000, Vivi, Rodrigo wrote:
>=20
>=20
> > On Jul 21, 2020, at 5:42 PM, Zhenyu Wang <zhenyuw@linux.intel.com> wrot=
e:
> >=20
> > On 2020.07.21 14:04:41 +0300, Joonas Lahtinen wrote:
> >> Quoting Zhenyu Wang (2020-07-20 11:05:41)
> >>>=20
> >>> Hi,
> >>>=20
> >>> Sorry that this might be a bit late as last week our QA people were
> >>> busy on something else..So this is gvt changes queued for 5.9 which is
> >>> to improve guest suspend/resume with proper PCI PM state tracking for
> >>> resource handling, e.g ppgtt. Hopefully this could still be in queue
> >>> for 5.9.
> >>=20
> >> Is this a regression fix to a problem introduced by previous
> >> gvt-next PR targeting 5.9?
> >>=20
> >> Or is it an incremental improvement over 5.8?
> >>=20
> >=20
> > Second case. This is incremental improvement. Guest suspend/resume
> > did work somehow before but has bad performance and possible failure
> > with some guest versions.
>=20
> I'm afraid Jani already sent the last pull request towards 5.9.
> So if there are fixes inside this pull request this should move to the -n=
ext-fixes
>=20
> and the remaining improvements to another 5.10 pull request
>=20

Got it. I'll split out those fixes for another pull.

Thanks

--tzjrJU3+iJ6c5SNx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXx+ZFgAKCRCxBBozTXgY
J8hnAKCNlEMEiK3JtlshbwUaHWdbGQrvoQCdEzYBBc6mTjhBlkF904e7uTK9Los=
=ULNX
-----END PGP SIGNATURE-----

--tzjrJU3+iJ6c5SNx--

--===============0209456017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0209456017==--
