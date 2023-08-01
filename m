Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1F176A77C
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Aug 2023 05:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCED10E0CD;
	Tue,  1 Aug 2023 03:29:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E3D10E0CD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  1 Aug 2023 03:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690860553; x=1722396553;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=C2YVsBjp3Z8RyS/O7a/fFqb+JyiboncZPL0aY1k791c=;
 b=JNpJSzOb/FeoXe0Y8dYWk8XhzQ3lHHMqWxD2/w0WsLSq6Hxb4eBrAtvR
 ttuP03R9lfEl17AzBLxszF6q3QjmqAqkxStwonPDdERjtwViKuCYyDPZS
 h9HCbG5ZJkxpqkRaT2gL7M3kioKhI4GeHJ3nhUkA8VSdQZ84E+Gtdh0Py
 WmQJFYsg8nJ56z7cm3jL1AXV1mmCbekg8Nwj4QE0QHiw7PcjvukKQ9mul
 8oQgDX3Y2n0cM3eJUaJ3Yz5SrLGhmQXlBSc6mu0YMXhZalxJYQTyV021I
 MGFUNZkIJwlCAzTOlycoxrDWAP7/QDIIoVUdvBESxtVaRYBAxrzLVefC5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="433023026"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
 d="asc'?scan'208";a="433023026"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 20:29:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="798499214"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
 d="asc'?scan'208";a="798499214"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.160.45])
 by fmsmga004.fm.intel.com with ESMTP; 31 Jul 2023 20:29:11 -0700
Date: Tue, 1 Aug 2023 11:29:42 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Storm Silva <stormmsilva@gmail.com>
Subject: Re: [PATCH] golden_hw_state failed with error -2
Message-ID: <ZMh8JkbaMyOYRjy7@debian-scheme>
References: <CAA+VxyetHKaseu8eTGjy9bO4uk4Qej-fr6pvqbBA_reJFbDpRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="g5MR7l/W26cMp1wi"
Content-Disposition: inline
In-Reply-To: <CAA+VxyetHKaseu8eTGjy9bO4uk4Qej-fr6pvqbBA_reJFbDpRg@mail.gmail.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--g5MR7l/W26cMp1wi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023.07.18 14:27:28 -0700, Storm Silva wrote:
> Hello, my name is Storm Silva. I submitted an issue in the intel-gvt GitH=
ub
> repo at=A0https://github.com/intel/gvt-linux/issues/212=A0and have also s=
ubmitted=A0a
> pull request which would fix issues #212 and #77 at=A0https://github.com/=
intel/
> gvt-linux/pull/215 but was told that requests should be sent to this emai=
l to
> get merged. Can someone please take a look at this? It is a simple one-li=
ne fix
> replacing=A0
> ret =3D request_firmware(&fw, path, gvt->gt->i915->drm.dev); with
> ret =3D firmware_request_nowarn(&fw, path, gvt->gt->i915->drm.dev); Thank=
 you!

Hi, event the fix is simple, but still need to follow kernel patch submissi=
on practice.
Could you send your patch directly to mail list? You can do that with git-s=
end-email.

thanks

--g5MR7l/W26cMp1wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCZMh8IQAKCRCxBBozTXgY
J+qsAJ9dp0eo2fUrCoZci3O9zGRxh4q3aQCdHx5z5ZMGc0EaT3OKQ3bVO+HBdgg=
=umIK
-----END PGP SIGNATURE-----

--g5MR7l/W26cMp1wi--
