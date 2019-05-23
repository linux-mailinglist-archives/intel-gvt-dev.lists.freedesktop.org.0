Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8321827A04
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 May 2019 12:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4309789D7B;
	Thu, 23 May 2019 10:07:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C928389D7B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 May 2019 10:07:12 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP; 23 May 2019 03:07:12 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga002.jf.intel.com with ESMTP; 23 May 2019 03:07:11 -0700
Date: Thu, 23 May 2019 18:06:06 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: Add set_ggtt_entry tracing event
Message-ID: <20190523100606.GV12913@zhen-hp.sh.intel.com>
References: <20190522221114.3548-1-tina.zhang@intel.com>
 <20190523024628.GM12913@zhen-hp.sh.intel.com>
 <237F54289DF84E4997F34151298ABEBC8761D637@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <237F54289DF84E4997F34151298ABEBC8761D637@SHSMSX101.ccr.corp.intel.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1692918551=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1692918551==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TfggMnVLY53OX7Tb"
Content-Disposition: inline


--TfggMnVLY53OX7Tb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.23 09:33:18 +0000, Zhang, Tina wrote:
>=20
>=20
> > -----Original Message-----
> > From: Zhenyu Wang [mailto:zhenyuw@linux.intel.com]
> > Sent: Thursday, May 23, 2019 10:46 AM
> > To: Zhang, Tina <tina.zhang@intel.com>
> > Cc: intel-gvt-dev@lists.freedesktop.org
> > Subject: Re: [PATCH v2] drm/i915/gvt: Add set_ggtt_entry tracing event
> >=20
> > On 2019.05.23 06:11:14 +0800, Tina Zhang wrote:
> > > Add set_ggtt_entry tracing event.
> > >
> > > v2:
> > > - Add index field. (Zhenyu)
> > >
> > > Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gvt/gtt.c   |  1 +
> > >  drivers/gpu/drm/i915/gvt/trace.h | 22 ++++++++++++++++++++++
> > >  2 files changed, 23 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c
> > > b/drivers/gpu/drm/i915/gvt/gtt.c index c2f7d20f6346..15216c5b40aa
> > > 100644
> > > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > > @@ -629,6 +629,7 @@ static void ggtt_set_host_entry(struct
> > intel_vgpu_mm *mm,
> > >  	struct intel_gvt_gtt_pte_ops *pte_ops =3D mm->vgpu->gvt-
> > >gtt.pte_ops;
> > >
> > >  	GEM_BUG_ON(mm->type !=3D INTEL_GVT_MM_GGTT);
> > > +	trace_set_ggtt_entry(mm->vgpu->id, entry->val64, index);
> > >
> > >  	pte_ops->set_entry(NULL, entry, index, false, 0, mm->vgpu);  } diff
> > > --git a/drivers/gpu/drm/i915/gvt/trace.h
> > > b/drivers/gpu/drm/i915/gvt/trace.h
> > > index 6d787750d279..981cc36eb50f 100644
> > > --- a/drivers/gpu/drm/i915/gvt/trace.h
> > > +++ b/drivers/gpu/drm/i915/gvt/trace.h
> > > @@ -373,6 +373,28 @@ TRACE_EVENT(render_mmio,
> > >  		  __entry->old_val, __entry->new_val)  );
> > >
> > > +TRACE_EVENT(set_ggtt_entry,
> > > +	TP_PROTO(int id, unsigned long address,
> > > +		    unsigned long index),
> > > +
> >=20
> > Better stick with u64 for address type and use proper 0x%llx below for =
printk.
> About type, do you mean ggtt or ppgtt? We only trace ggtt here. Thanks.
>=20

I mean for ggtt entry's val64.

> >=20
> > > +	TP_ARGS(id, address, index),
> > > +
> > > +	TP_STRUCT__entry(
> > > +		__field(int, id)
> > > +		__field(unsigned long, address)
> > > +		__field(unsigned long, index)
> > > +	),
> > > +
> > > +	TP_fast_assign(
> > > +		__entry->id =3D id;
> > > +		__entry->address =3D address;
> > > +		__entry->index =3D index;
> > > +	),
> > > +
> > > +	TP_printk("vgpu%d:set ggtt entry 0x%lx, index 0x%lx\n",
> > > +		  __entry->id, __entry->address, __entry->index) );
> > > +
> > >  #endif /* _GVT_TRACE_H_ */
> > >
> > >  /* This part must be out of protection */
> > > --
> > > 2.17.1
> > >
> >=20
> > --
> > Open Source Technology Center, Intel ltd.
> >=20
> > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--TfggMnVLY53OX7Tb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXOZwjgAKCRCxBBozTXgY
JxlsAJ9e2keXEZ/8eOatdpqXUgd7R6ZrLQCePNKuAncus74IIcOwmRPsWZxfQ9w=
=0hIy
-----END PGP SIGNATURE-----

--TfggMnVLY53OX7Tb--

--===============1692918551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1692918551==--
