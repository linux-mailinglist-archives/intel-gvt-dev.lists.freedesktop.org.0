Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 819131A0930
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 Apr 2020 10:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3544289DFD;
	Tue,  7 Apr 2020 08:16:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EA389DDD;
 Tue,  7 Apr 2020 08:16:26 +0000 (UTC)
IronPort-SDR: wNyD7TPcTkyvuUbk29LSmORS277ZcJpK7M1DeQSRdMcN5Q3NLXZrPbIJ2a53kVYLugS9z7g9o7
 MmG17tmViatg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 01:16:25 -0700
IronPort-SDR: uUUxSvUMF/9a2u3/lJr2RVovgTv1prut62xYebCkkFuLe+l+8EkobO3jYqgWQpCdkriCFBA7Mh
 91js4XZJLi9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,353,1580803200"; 
 d="asc'?scan'208";a="286157430"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga002.fm.intel.com with ESMTP; 07 Apr 2020 01:16:22 -0700
Date: Tue, 7 Apr 2020 16:02:56 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-next-fixes
Message-ID: <20200407080256.GU16629@zhen-hp.sh.intel.com>
References: <20200331070025.GB16629@zhen-hp.sh.intel.com>
 <20200331162644.GA3779315@intel.com>
 <20200403030507.GQ16629@zhen-hp.sh.intel.com>
 <20200403175033.GA3997092@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200403175033.GA3997092@intel.com>
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
Cc: "Zhao, Yan Y" <yan.y.zhao@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, Dave Airlie <airlied@gmail.com>
Content-Type: multipart/mixed; boundary="===============1171992530=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1171992530==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TMgB3/Ch1aWgZB1L"
Content-Disposition: inline


--TMgB3/Ch1aWgZB1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.04.03 10:50:33 -0700, Rodrigo Vivi wrote:
>=20
> +Dave and Daniel,
>=20
> >=20
> > I forgot to mention one thing for 5.7. We've fixed to change guest mem =
r/w
> > from KVM to use new VFIO dma r/w instead in this series: https://patchw=
ork.freedesktop.org/series/72038/
> >=20
> > As this depends on VFIO tree and looks VFIO pull for 5.7 is not settled=
 down
> > yet, we'd need to backmerge and send pull against vfio merge for 5.7.
>=20
> I'm not sure if I'm following on which backmerge you are willing
> us to do here. And for me it looks like late for 5.7 already.
>=20
> Maybe you mean we ack all of this to go through vfio flow
> then once that is settled drm backmerge and then drm-intel backmerge
> and you backmerge...
>=20
> Is that what you want?
>=20

My purpose is to get GVT side fixes of guest memory r/w through new
vfio dma r/w interface in 5.7. As vfio 5.7-rc1 pull has already been
merged in linus master, looks just want drm-intel backmerge now then
could send gvt side fixes. Ok for you?

Sorry for late reply, I was out for a short vacation.

Thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--TMgB3/Ch1aWgZB1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXowzsAAKCRCxBBozTXgY
J/XEAKCCWcl8X/Hylh80WjrMGUvTrWz/uQCfYrSZ/7PHbMx4iz9xmy4v7WRb9YI=
=mcl9
-----END PGP SIGNATURE-----

--TMgB3/Ch1aWgZB1L--

--===============1171992530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1171992530==--
