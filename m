Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0419AF1FB
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 30 Apr 2019 10:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACAF88F9A;
	Tue, 30 Apr 2019 08:23:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF49D88F9A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Apr 2019 08:23:54 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 01:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,413,1549958400"; 
 d="asc'?scan'208";a="342078890"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga006.fm.intel.com with ESMTP; 30 Apr 2019 01:23:51 -0700
Date: Tue, 30 Apr 2019 16:23:37 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Li, Weinan Z" <weinan.z.li@intel.com>
Subject: Re: [PATCH v3 1/4] drm/i915/gvt: use cmd to restore in-context mmios
 to hw for gen9 platform
Message-ID: <20190430082337.GO12913@zhen-hp.sh.intel.com>
References: <20190429081309.15428-1-yan.y.zhao@intel.com>
 <9BD218709B5F2A4F96F08B4A3B98A897733F29CA@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <9BD218709B5F2A4F96F08B4A3B98A897733F29CA@SHSMSX101.ccr.corp.intel.com>
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
 <intel-gvt-dev@lists.freedesktop.org>, "Zhao, Yan Y" <yan.y.zhao@intel.com>
Content-Type: multipart/mixed; boundary="===============0347577443=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0347577443==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iSeZnk6FyAS3EJ1y"
Content-Disposition: inline


--iSeZnk6FyAS3EJ1y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.04.29 08:38:59 +0000, Li, Weinan Z wrote:
> > -----Original Message-----
> > From: Zhao, Yan Y
> > Sent: Monday, April 29, 2019 4:13 PM
> > To: intel-gvt-dev@lists.freedesktop.org
> > Cc: Zhao, Yan Y <yan.y.zhao@intel.com>; Li, Weinan Z <weinan.z.li@intel=
=2Ecom>
> > Subject: [PATCH v3 1/4] drm/i915/gvt: use cmd to restore in-context mmi=
os
> > to hw for gen9 platform
> >=20
> > for restore-inhibit context, hardware will not load in-context mmios (e=
ngine
> > context part) to hardware, but hardware will save the mmio values in
> > hardware back to context image. So, in order to save correct values of =
vGPU
> > back to context image, values of vGPU mmios have to be loaded into
> > hardware first for restore-inhibit context.
> >=20
> > In this patch, the mechanism is applied to all gen9 platform.
> >=20
> > The reason excluding gen8 platforms is only because of lacking of testi=
ng on
> > those platforms.
> >=20
> > v2: update vreg when scanning indirect context for inhibit context for
> > gen9
> >=20
> > Cc: Weinan Li <weinan.z.li@intel.com>
> > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/cmd_parser.c   | 14 +++++++++-----
> >  drivers/gpu/drm/i915/gvt/mmio_context.c |  5 ++---
> >  drivers/gpu/drm/i915/gvt/scheduler.c    |  4 +---
> >  3 files changed, 12 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > index ab002cfd3cab..5cb59c0b4bbe 100644
> > --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > @@ -896,12 +896,16 @@ static int cmd_reg_handler(struct
> > parser_exec_state *s,
> >  	}
> >=20
> >  	/* TODO
> > -	 * Right now only scan LRI command on KBL and in inhibit context.
> > -	 * It's good enough to support initializing mmio by lri command in
> > -	 * vgpu inhibit context on KBL.
> > +	 * In order to let workload with inhibit context to generate
> > +	 * correct image data into memory, vregs values will be loaded to
> > +	 * hw via LRIs in the workload with inhibit context. But as
> > +	 * indirect context is loaded prior to LRIs in workload, we don't
> > +	 * want reg values specified in indirect context overwritten by
> > +	 * LRIs in workloads. So, when scanning an indirect context, we
> > +	 * update reg values in it into vregs, so LRIs in workload with
> > +	 * inhibit context will restore with correct values
> >  	 */
> > -	if ((IS_KABYLAKE(s->vgpu->gvt->dev_priv)
> > -		|| IS_COFFEELAKE(s->vgpu->gvt->dev_priv)) &&
> > +	if (IS_GEN(gvt->dev_priv, 9) &&
> >  			intel_gvt_mmio_is_in_ctx(gvt, offset) &&
> >  			!strncmp(cmd, "lri", 3)) {
> >  		intel_gvt_hypervisor_read_gpa(s->vgpu,
> > diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c
> > b/drivers/gpu/drm/i915/gvt/mmio_context.c
> > index e7e14c842be4..a51c51b2c82e 100644
> > --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> > +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> > @@ -469,11 +469,10 @@ static void switch_mmio(struct intel_vgpu *pre,
> >  			continue;
> >  		/*
> >  		 * No need to do save or restore of the mmio which is in context
> > -		 * state image on kabylake, it's initialized by lri command and
> > +		 * state image on gen9, it's initialized by lri command and
> >  		 * save or restore with context together.
> >  		 */
> > -		if ((IS_KABYLAKE(dev_priv) || IS_BROXTON(dev_priv)
> > -			|| IS_COFFEELAKE(dev_priv)) && mmio->in_context)
> > +		if (IS_GEN(dev_priv, 9) && mmio->in_context)
> >  			continue;
> >=20
> >  		// save
>=20
> @@ -392,9 +392,7 @@ static void switch_mocs(struct intel_vgpu *pre, struc=
t intel_vgpu *next,
>                 return;
>=20
>         if (ring_id =3D=3D RCS0 &&
> -           (IS_KABYLAKE(dev_priv) ||
> -            IS_BROXTON(dev_priv) ||
> -            IS_COFFEELAKE(dev_priv)))
> +           IS_GEN(dev_priv, 9))
>                 return;
> we can ignore the MOCS save/restore if it's RCS, since it's in context MM=
IO.
>

Why it is not skipped on SKL now?

> > diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c
> > b/drivers/gpu/drm/i915/gvt/scheduler.c
> > index 8998fa5ab198..1f3ba8efb994 100644
> > --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> > +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> > @@ -299,9 +299,7 @@ static int copy_workload_to_ring_buffer(struct
> > intel_vgpu_workload *workload)
> >  	void *shadow_ring_buffer_va;
> >  	u32 *cs;
> >=20
> > -	if ((IS_KABYLAKE(req->i915) || IS_BROXTON(req->i915)
> > -		|| IS_COFFEELAKE(req->i915))
> > -		&& is_inhibit_context(req->hw_context))
> > +	if (IS_GEN(req->i915, 9) && is_inhibit_context(req->hw_context))
> >  		intel_vgpu_restore_inhibit_context(vgpu, req);
> >=20
> >  	/* allocate shadow ring buffer */
> > --
> > 2.17.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--iSeZnk6FyAS3EJ1y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXMgGCQAKCRCxBBozTXgY
J7i4AJwKIIU7z9gk0MoZ5r9LTixCsB7FyQCfZeASvnmFz65HxqmebaOgAuLDQms=
=zn4+
-----END PGP SIGNATURE-----

--iSeZnk6FyAS3EJ1y--

--===============0347577443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0347577443==--
