Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A50B1BA02B
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 Apr 2020 11:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E349A6E1A2;
	Mon, 27 Apr 2020 09:40:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66086E1A2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 Apr 2020 09:40:43 +0000 (UTC)
IronPort-SDR: uU53kUMTNsGlBJ7ojegGUecrLldanS7jrlvAFHbfaYxdQzV3/LqAVpsOH6s+8f3+aJ9bFUIqWc
 stOE5Xe0n3ZA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 02:40:43 -0700
IronPort-SDR: t8Qax2SxzV71VN9t3GGVGE/NZ//Dbyg90PntASPB3nhT7BIyPHcu7TJ1SPOlpD1V7qVQj2hE2J
 2AOEHBU7ajgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,323,1583222400"; 
 d="asc'?scan'208";a="246079015"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga007.jf.intel.com with ESMTP; 27 Apr 2020 02:40:41 -0700
Date: Mon, 27 Apr 2020 17:26:31 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v2 2/2] drm/i915/gvt: Support PPGTT table load command
Message-ID: <20200427092631.GH18545@zhen-hp.sh.intel.com>
References: <20200318135322.13788-1-tina.zhang@intel.com>
 <20200426025802.2839-2-zhenyuw@linux.intel.com>
 <20200426052803.GD12879@joy-OptiPlex-7040>
 <20200426065823.GC18545@zhen-hp.sh.intel.com>
 <20200426071736.GD18545@zhen-hp.sh.intel.com>
 <20200426075928.GE12879@joy-OptiPlex-7040>
 <20200426115145.GE18545@zhen-hp.sh.intel.com>
 <20200427025456.GF12879@joy-OptiPlex-7040>
 <20200427072149.GG12879@joy-OptiPlex-7040>
MIME-Version: 1.0
In-Reply-To: <20200427072149.GG12879@joy-OptiPlex-7040>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Tina Zhang <tina.zhang@intel.com>
Content-Type: multipart/mixed; boundary="===============0672445012=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0672445012==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="df+09Je9rNq3P+GE"
Content-Disposition: inline


--df+09Je9rNq3P+GE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.04.27 03:21:49 -0400, Yan Zhao wrote:
> > >=20
> > > I think the step is just to restore guest context and run through
> > > loaded shadow mm, we only need to recover last guest pdp after
> > > workload run.
> > >
> > sorry. sent too fast.
> > I mean why not just update workload->shadow_mm and
> > workload->shadow_mm->ppgtt_mm.guest_pdps, when lri pdp is found?
> >
> 1. if lri pdp1 (not the same as shadow_mm) and lri pdp2 (the same as
> shadow_mm) are executed successively, we should not update the guest
> pdp.

Actually we should, to replace with shadow ppgtt ptr also for same as
shadow_mm case, otherwise wrong pdps would be loaded to HW. Next version
will fix that.

> 2. if there's a save inhibit bit set in the workload, we cannot
> update the guest context.

yep, looks currently we don't care about save inhibit but just update
guest context. We might do this later.

> 3. there may be other cases to cause last entry in lri_shadow_mm no
> aligning with the final one in workload.
> so I think the safest way to update guest context is to find the
> guest_pdps according to pdps in shadow context.

Hmm, I think it's safe now to mark last ppgtt LRI cmd as last context
state because I can't think of other ways might affect that. And to
find guest pdps, we have to walk through all shadow mm which seems not
worth to me.

Thanks

>=20
> > > > > > >=20
> > > > > > > and what's the reason for us to use a lri_shadow_mm list?
> > > > > >=20
> > > > > > As in theory there could be multiple ppgtt loads in one ring
> > > > > > submission, and previous code always assumes one e.g put older =
scanned
> > > > > > shadow mm if found another one, which was not right to me. So h=
ere
> > > > > > just uses a link to track all possible loads.
> > > > > >=20
> > > > > > >=20
> > > > > > >=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--df+09Je9rNq3P+GE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXqalRwAKCRCxBBozTXgY
J1pJAJ0VJB4ZmoNZyGWSJec4OuowUIP0xwCfZHjdArwfL1vIuGFGM976ECYfyaY=
=nA4s
-----END PGP SIGNATURE-----

--df+09Je9rNq3P+GE--

--===============0672445012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0672445012==--
