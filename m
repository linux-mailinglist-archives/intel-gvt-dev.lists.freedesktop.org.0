Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1761A18CC
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Apr 2020 01:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172806E05A;
	Tue,  7 Apr 2020 23:50:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F446E05A;
 Tue,  7 Apr 2020 23:50:25 +0000 (UTC)
IronPort-SDR: Vwe6hzIyMM3IU79gTpf2u2hmx9thgwDhDgnv8BXeS/4C1RXufBYFLMItWCHlgNwckRTqM4QLhi
 KCph6i65Io4g==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 16:50:24 -0700
IronPort-SDR: aMcKpv6w5WgdMuPw6uz3qk5z7/28I+ec2uC/NyFGg3z5heem77eAPYpeD1UEDifKgs47GgQj9d
 IUGJ0+Fx1Smw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; 
 d="asc'?scan'208";a="240122291"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga007.jf.intel.com with ESMTP; 07 Apr 2020 16:50:21 -0700
Date: Wed, 8 Apr 2020 07:36:53 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-next-fixes
Message-ID: <20200407233653.GC11247@zhen-hp.sh.intel.com>
References: <20200331070025.GB16629@zhen-hp.sh.intel.com>
 <20200331162644.GA3779315@intel.com>
 <20200403030507.GQ16629@zhen-hp.sh.intel.com>
 <20200403175033.GA3997092@intel.com>
 <20200407080256.GU16629@zhen-hp.sh.intel.com>
 <20200407133559.GB4170610@intel.com> <87wo6rier4.fsf@intel.com>
MIME-Version: 1.0
In-Reply-To: <87wo6rier4.fsf@intel.com>
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
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, Dave Airlie <airlied@gmail.com>
Content-Type: multipart/mixed; boundary="===============1479808020=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1479808020==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline


--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.04.07 16:53:19 +0300, Jani Nikula wrote:
> On Tue, 07 Apr 2020, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > On Tue, Apr 07, 2020 at 04:02:56PM +0800, Zhenyu Wang wrote:
> >> On 2020.04.03 10:50:33 -0700, Rodrigo Vivi wrote:
> >> >=20
> >> > +Dave and Daniel,
> >> >=20
> >> > >=20
> >> > > I forgot to mention one thing for 5.7. We've fixed to change guest=
 mem r/w
> >> > > from KVM to use new VFIO dma r/w instead in this series: https://p=
atchwork.freedesktop.org/series/72038/
> >> > >=20
> >> > > As this depends on VFIO tree and looks VFIO pull for 5.7 is not se=
ttled down
> >> > > yet, we'd need to backmerge and send pull against vfio merge for 5=
=2E7.
> >> >=20
> >> > I'm not sure if I'm following on which backmerge you are willing
> >> > us to do here. And for me it looks like late for 5.7 already.
> >> >=20
> >> > Maybe you mean we ack all of this to go through vfio flow
> >> > then once that is settled drm backmerge and then drm-intel backmerge
> >> > and you backmerge...
> >> >=20
> >> > Is that what you want?
> >> >=20
> >>=20
> >> My purpose is to get GVT side fixes of guest memory r/w through new
> >> vfio dma r/w interface in 5.7. As vfio 5.7-rc1 pull has already been
> >> merged in linus master, looks just want drm-intel backmerge now then
> >> could send gvt side fixes. Ok for you?
> >
> > I'm afraid it is too late for that. That would depend on backmerge
> > of drm itself as well... And we are in a point that we are about to
> > move from drm-next to drm-fixes.
>=20
> *If* they're fixes, drm-intel-fixes rebases on v5.7-rc1 or -rc2, and if
> they can send a gvt fixes pull based on that, it could work out.
>=20

yeah, that's also what I'm thinking about. Here's more background.

In gvt we need to access guest pages in some places, our current way
is to call KVM interface, but it turns out later that this interface
is supposed to be used by arch code only and what we should actually
depend on is using IOVA for guest page access instead of using guest
physical address by KVM. So we tried to add IOVA based guest r/w
support for VFIO and change gvt to use that. In that way they're real
fixes to me.

> >
> > Also looking to the patches itself they look more content for -next
> > than -fixes and our window with drm closed on -rc6

I understand that but the patches mostly for vfio interface hadn't been
finalized during rc6 window..

> >
> > So it looks to me that this will have to wait for the 5.8.
> >
> > One good suggestion I heard from Daniel for cases like this in the
> > future is the use of topic branches so things don't get spread into
> > multiple versions like this.
> >

Good idea. Does that mean such topic branch could be merged during
e.g -rc1 merge window?

Thanks

> >>=20
> >> Sorry for late reply, I was out for a short vacation.
> >
> > Sorry for not been able to help further here
> >
> > Thanks,
> > Rodrigo.
> >
> >>=20
> >> Thanks
> >>=20
> >> --=20
> >> Open Source Technology Center, Intel ltd.
> >>=20
> >> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
> >
> >
>=20
> --=20
> Jani Nikula, Intel Open Source Graphics Center

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXo0OlQAKCRCxBBozTXgY
J2VXAJ98j1NHNtQmH/r0g5w0Ok/xpHUsowCgnFe7Iv+V8x3GcNEH+MO7RlAQEV0=
=C6I8
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--

--===============1479808020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1479808020==--
