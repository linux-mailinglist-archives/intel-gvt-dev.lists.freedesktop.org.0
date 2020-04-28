Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5731BB46D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 Apr 2020 05:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407E56E063;
	Tue, 28 Apr 2020 03:17:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A08E6E063
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 Apr 2020 03:17:07 +0000 (UTC)
IronPort-SDR: c+8iq9wLUbjbC65dwk2LYOoGJBsgh9LckOij5B0imvel1s75+a/I/cOWDBWApIZsQIB1D+5htK
 85qZ/gXmIC2Q==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 20:17:06 -0700
IronPort-SDR: KFJsAK5/ItCkVl4cgfa9bQaVuDdMQIe87bLHg+/eVjCiwel3ltdI+t1vswEpOr152y9tZ0PEFJ
 y4oubO0brw5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,326,1583222400"; 
 d="asc'?scan'208";a="257481568"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga003.jf.intel.com with ESMTP; 27 Apr 2020 20:17:05 -0700
Date: Tue, 28 Apr 2020 11:02:53 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Zhao, Yan Y" <yan.y.zhao@intel.com>
Subject: Re: [PATCH v2 2/2] drm/i915/gvt: Support PPGTT table load command
Message-ID: <20200428030253.GL18545@zhen-hp.sh.intel.com>
References: <20200426025802.2839-2-zhenyuw@linux.intel.com>
 <20200426052803.GD12879@joy-OptiPlex-7040>
 <20200426065823.GC18545@zhen-hp.sh.intel.com>
 <20200426071736.GD18545@zhen-hp.sh.intel.com>
 <20200426075928.GE12879@joy-OptiPlex-7040>
 <20200426115145.GE18545@zhen-hp.sh.intel.com>
 <20200427025456.GF12879@joy-OptiPlex-7040>
 <20200427072149.GG12879@joy-OptiPlex-7040>
 <20200427092631.GH18545@zhen-hp.sh.intel.com>
 <F22B14EC3CFBB843AD3E03B6B78F2C6A4C4EF39D@shsmsx102.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <F22B14EC3CFBB843AD3E03B6B78F2C6A4C4EF39D@shsmsx102.ccr.corp.intel.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Zhang, Tina" <tina.zhang@intel.com>
Content-Type: multipart/mixed; boundary="===============0886296623=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0886296623==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kr14OxHsRwZHHqxS"
Content-Disposition: inline


--kr14OxHsRwZHHqxS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.04.28 00:41:48 +0000, Zhao, Yan Y wrote:
>=20
> > On 2020.04.27 03:21:49 -0400, Yan Zhao wrote:
> > > > >
> > > > > I think the step is just to restore guest context and run through
> > > > > loaded shadow mm, we only need to recover last guest pdp after
> > > > > workload run.
> > > > >
> > > > sorry. sent too fast.
> > > > I mean why not just update workload->shadow_mm and
> > > > workload->shadow_mm->ppgtt_mm.guest_pdps, when lri pdp is found?
> > > >
> > > 1. if lri pdp1 (not the same as shadow_mm) and lri pdp2 (the same as
> > > shadow_mm) are executed successively, we should not update the guest
> > > pdp.
> >=20
> > Actually we should, to replace with shadow ppgtt ptr also for same as
> > shadow_mm case, otherwise wrong pdps would be loaded to HW. Next
> > version will fix that.
> >=20
> > > 2. if there's a save inhibit bit set in the workload, we cannot update
> > > the guest context.
> >=20
> > yep, looks currently we don't care about save inhibit but just update g=
uest
> > context. We might do this later.
> >=20
> > > 3. there may be other cases to cause last entry in lri_shadow_mm no
> > > aligning with the final one in workload.
> > > so I think the safest way to update guest context is to find the
> > > guest_pdps according to pdps in shadow context.
> >=20
> > Hmm, I think it's safe now to mark last ppgtt LRI cmd as last context s=
tate
> > because I can't think of other ways might affect that. And to find gues=
t pdps,
> > we have to walk through all shadow mm which seems not worth to me.
> >=20
> No need to walk through all shadow mms.
> Just shadow mms for current workload, and you can start from the most pos=
sible one.

Current shadow mm list is for per vgpu instead of per workload, so in this =
patch
which adds new list for all possible shadow mm per workload.

> Why not choose the most robust way ?  (like save inhibit. it's possible t=
hat we might miss something)
>

I think it's robust because we know exactly what the result should be
for hw behavior emulation. How about to add a debug func to double
check if context pdps matches? So in normal operation it won't bother.

Thanks

> >=20
> > >
> > > > > > > > >
> > > > > > > > > and what's the reason for us to use a lri_shadow_mm list?
> > > > > > > >
> > > > > > > > As in theory there could be multiple ppgtt loads in one ring
> > > > > > > > submission, and previous code always assumes one e.g put
> > > > > > > > older scanned shadow mm if found another one, which was not
> > > > > > > > right to me. So here just uses a link to track all possible=
 loads.
> > > > > > > >
> > > > > > > > >
> > > > > > > > >
> >=20
> > --
> > Open Source Technology Center, Intel ltd.
> >=20
> > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--kr14OxHsRwZHHqxS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXqec3QAKCRCxBBozTXgY
J+eUAJ42XrhF2tbCkaLjqaldxwwZ2OBygwCfTS/QZYZzthhPlVcpF+LlIStI6Jw=
=YabN
-----END PGP SIGNATURE-----

--kr14OxHsRwZHHqxS--

--===============0886296623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0886296623==--
