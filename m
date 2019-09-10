Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D39DAAE264
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 10 Sep 2019 04:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D4589E98;
	Tue, 10 Sep 2019 02:42:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7029989E8C;
 Tue, 10 Sep 2019 02:42:12 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Sep 2019 19:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,487,1559545200"; 
 d="asc'?scan'208";a="385182132"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga006.fm.intel.com with ESMTP; 09 Sep 2019 19:42:09 -0700
Date: Tue, 10 Sep 2019 10:36:57 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-next-fixes
Message-ID: <20190910023657.GA12949@zhen-hp.sh.intel.com>
References: <20190906054255.GC3458@zhen-hp.sh.intel.com>
 <20190909172416.GB20172@intel.com>
 <f631f702240c0ecb99e94171f26e951f4e76911a.camel@intel.com>
 <20190909223510.GA19671@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190909223510.GA19671@intel.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "airlied@redhat.com" <airlied@redhat.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1095789886=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1095789886==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.09.09 15:35:10 -0700, Rodrigo Vivi wrote:
> On Mon, Sep 09, 2019 at 02:54:59PM -0700, Vetter, Daniel wrote:
> > On Mon, 2019-09-09 at 10:24 -0700, Rodrigo Vivi wrote:
> > > Hi guys,
> > >=20
> > > On Fri, Sep 06, 2019 at 01:42:55PM +0800, Zhenyu Wang wrote:
> > > > Hi,
> > > >=20
> > > > Here's gvt-next-fixes with two recent fixes, one for recent
> > > > guest hang regression and another for guest reset fix.
> > > >=20
> > > > Thanks.
> > > > --
> > > > The following changes since commit
> > > > c36beba6b296b3c05a0f29753b04775e5ae23886:
> > > >=20
> > > >   drm/i915: Seal races between async GPU cancellation, retirement
> > > > and signaling (2019-05-13 13:53:35 +0300)
> > > >=20
> > > > are available in the Git repository at:
> > > >=20
> > > >   https://github.com/intel/gvt-linux.git tags/gvt-next-fixes-2019-
> > > > 09-06
> > > >=20
> > > > for you to fetch changes up to
> > > > 4a5322560aa235efa84c0aa34c00e5749a0792fd:
> > > >=20
> > > >   drm/i915/gvt: update RING_START reg of vGPU when the context is
> > > > submitted to i915 (2019-09-06 13:39:09 +0800)
> > >=20
> > > $ dim pull-request-next-fixes
> > > Using drm/drm-next as the upstream
> > > dim: 4a5322560aa2 ("drm/i915/gvt: update RING_START reg of vGPU when
> > > the context is submitted to i915"): Link tag missing.
> > > dim: 0a3242bdb477 ("drm/i915/gvt: update vgpu workload head pointer
> > > correctly"): Link tag missing.
> > > dim: ERROR: issues in commits detected, aborting
> > >=20
> > > I wonder how I should proceed here. In the past I was always
> > > bypasssing dim,
> > > but now that drm maintainers also use dim I'm sure this will blow up
> > > there anyways.
> > >=20
> > > But gvt patches are not tracked on our CI individually hence they
> > > don't
> > > have Links.
> > >=20
> > > Jani, Joonas, how are you guys handling this?
> > >=20
> > > Daniel, Dave, ideas?
> >=20
> > dim doesn't require Link: tags yet for pull requests (because most drm
> > trees aren't managed by dim and so lack them).
>=20
> I'm confused now.
>=20
> function dim_pull_request
> calls
> checkpatch_commit_push_range 1 "$upstream..$branch"
> (except for drm-intel-next)
>=20
> and checkpatch_commit_push checks for the link.
>=20
> So if you also use dim for your pull request I'm wondering how you
> are not getting that....
>=20
> In the past whenever I had this problem on dinf I commented out the
> link check but end up never coming back to solve the problem properly.
> I just wondering that now that dim is in use on drm level if I bypass
> here it becomes a problem for you.
>=20
> thoughts?

Although gvt is not fully in CI yet, we do have patchwork that I can
add Link: tag, that should be easy for you. Sorry that I wasn't awared
it's required for dim.

>=20
> > Until we change that,
> > with some doc patches and proper bikeshed on dri-devel I think it's
> > fine if gvt is missing them. At least from a drm.git pov.
> >=20
> > What you guys want to do for drm-intel.git is entirely up to you.
> > -Daniel
> > >=20
> > > Thanks,
> > > Rodrigo.
> > >=20
> > > > ----------------------------------------------------------------
> > > > gvt-next-fixes-2019-09-06
> > > >=20
> > > > - Fix guest context head pointer update for hang (Xiaolin)
> > > > - Fix guest context ring state for reset (Weinan)
> > > >=20
> > > > ----------------------------------------------------------------
> > > > Weinan Li (1):
> > > >       drm/i915/gvt: update RING_START reg of vGPU when the context
> > > > is submitted to i915
> > > >=20
> > > > Xiaolin Zhang (1):
> > > >       drm/i915/gvt: update vgpu workload head pointer correctly
> > > >=20
> > > >  drivers/gpu/drm/i915/gvt/scheduler.c | 45
> > > > +++++++++++++++++++++++++-----------
> > > >  1 file changed, 32 insertions(+), 13 deletions(-)
> > > >=20
> > > >=20
> > > > --=20
> > > > Open Source Technology Center, Intel ltd.
> > > >=20
> > > > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
> > >=20
> > >=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXXcMSQAKCRCxBBozTXgY
J9oNAJ48zkHXHmqnAzZ6+rw38eGdsCW2ZACeMTqIKrBGSrvcoQkJnRib1DqJM5w=
=7r6r
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--

--===============1095789886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1095789886==--
