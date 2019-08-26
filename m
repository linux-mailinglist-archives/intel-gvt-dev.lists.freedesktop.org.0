Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBAD9C7A3
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 26 Aug 2019 05:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B866E13B;
	Mon, 26 Aug 2019 03:16:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF546E13B;
 Mon, 26 Aug 2019 03:16:51 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Aug 2019 20:16:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,431,1559545200"; 
 d="asc'?scan'208";a="263804410"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga001.jf.intel.com with ESMTP; 25 Aug 2019 20:16:49 -0700
Date: Mon, 26 Aug 2019 11:12:10 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: to make vgpu ppgtt notificaiton
 as atomic operation
Message-ID: <20190826031210.GB29455@zhen-hp.sh.intel.com>
References: <1566543451-13955-1-git-send-email-xiaolin.zhang@intel.com>
 <156654711627.27716.4474982727513548344@skylake-alporthouse-com>
 <073732E20AE4C540AE91DBC3F07D4460876D3410@SHSMSX107.ccr.corp.intel.com>
 <156654932243.27716.13325423141754929364@skylake-alporthouse-com>
MIME-Version: 1.0
In-Reply-To: <156654932243.27716.13325423141754929364@skylake-alporthouse-com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Zhang,
 Xiaolin" <xiaolin.zhang@intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0347508939=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0347508939==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Content-Disposition: inline


--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.08.23 09:35:22 +0100, Chris Wilson wrote:
> Quoting Zhang, Xiaolin (2019-08-23 09:07:01)
> > On 08/23/2019 03:58 PM, Chris Wilson wrote:
> > > Quoting Xiaolin Zhang (2019-08-23 07:57:31)
> > >> vgpu ppgtt notification was split into 2 steps, the first step is to
> > >> update PVINFO's pdp register and then write PVINFO's g2v_notify regi=
ster
> > >> with action code to tirgger ppgtt notification to GVT side.
> > >>
> > >> currently these steps were not atomic operations due to no any prote=
ction,
> > >> so it is easy to enter race condition state during the MTBF, stress =
and
> > >> IGT test to cause GPU hang.
> > >>
> > >> the solution is to add a lock to make vgpu ppgtt notication as atomic
> > >> operation.
> > >>
> > >> Cc: stable@vger.kernel.org
> > >> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> > >> ---
> > >>  drivers/gpu/drm/i915/i915_drv.h     | 1 +
> > >>  drivers/gpu/drm/i915/i915_gem_gtt.c | 4 ++++
> > >>  drivers/gpu/drm/i915/i915_vgpu.c    | 1 +
> > >>  3 files changed, 6 insertions(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/=
i915_drv.h
> > >> index eb31c16..32e17c4 100644
> > >> --- a/drivers/gpu/drm/i915/i915_drv.h
> > >> +++ b/drivers/gpu/drm/i915/i915_drv.h
> > >> @@ -961,6 +961,7 @@ struct i915_frontbuffer_tracking {
> > >>  };
> > >> =20
> > >>  struct i915_virtual_gpu {
> > >> +       struct mutex lock;
> > >>         bool active;
> > >>         u32 caps;
> > >>  };
> > >> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i=
915/i915_gem_gtt.c
> > >> index 2cd2dab..ff0b178 100644
> > >> --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
> > >> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
> > >> @@ -833,6 +833,8 @@ static int gen8_ppgtt_notify_vgt(struct i915_ppg=
tt *ppgtt, bool create)
> > >>         enum vgt_g2v_type msg;
> > >>         int i;
> > >> =20
> > >> +       mutex_lock(&dev_priv->vgpu.lock);
> > >> +
> > >>         if (create)
> > >>                 atomic_inc(px_used(ppgtt->pd)); /* never remove */
> > >>         else
> > >> @@ -860,6 +862,8 @@ static int gen8_ppgtt_notify_vgt(struct i915_ppg=
tt *ppgtt, bool create)
> > >> =20
> > >>         I915_WRITE(vgtif_reg(g2v_notify), msg);
> > >> =20
> > > How do you know the operation is complete and it is now safe to
> > > overwrite the data regs?
> > > -Chris
> > >
> > by design, the data reg value is copied out to use, so as long as the
> > action and data is operated together, how long the operation is not a
> > issue and  it is safe to overwrite the data regs with new action next t=
ime.
>=20
> When and how quickly is it copied? Consider that it will be immediately
> overwritten by the next packet. Does the vgpu mmio write cause the
> calling CPU to be trapped?

yeah, mmio write will always be trapped, this data is got in notify
mmio reg write trap handler. We need to add doc to tell that for
current gvt notify interface, client needs to ensure serialized write
but without data overwrite.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXWNOCgAKCRCxBBozTXgY
JzzRAJ0X7LbFKhBwy4X/+yw15A/XA4mnegCdHFH6sMkgG0A4ZdteToz+xg8BFzA=
=gV9R
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--

--===============0347508939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0347508939==--
