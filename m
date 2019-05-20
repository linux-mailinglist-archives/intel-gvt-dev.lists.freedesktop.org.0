Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C7D22B77
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 20 May 2019 07:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E00D891C0;
	Mon, 20 May 2019 05:56:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C150E891C0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 20 May 2019 05:56:34 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 May 2019 22:56:34 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga004.fm.intel.com with ESMTP; 19 May 2019 22:56:33 -0700
Date: Mon, 20 May 2019 13:55:35 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gvt: Add set_ggtt_entry tracing event
Message-ID: <20190520055535.GF12913@zhen-hp.sh.intel.com>
References: <20190520053649.5906-1-tina.zhang@intel.com>
 <20190520053649.5906-2-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190520053649.5906-2-tina.zhang@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0285153456=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0285153456==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IQxisP7nphoKJAnk"
Content-Disposition: inline


--IQxisP7nphoKJAnk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.20 13:36:48 +0800, Tina Zhang wrote:
> Add set_ggtt_entry tracing event.
>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c   |  1 +
>  drivers/gpu/drm/i915/gvt/trace.h | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index c2f7d20f6346..dcc207f04b75 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -629,6 +629,7 @@ static void ggtt_set_host_entry(struct intel_vgpu_mm =
*mm,
>  	struct intel_gvt_gtt_pte_ops *pte_ops =3D mm->vgpu->gvt->gtt.pte_ops;
> =20
>  	GEM_BUG_ON(mm->type !=3D INTEL_GVT_MM_GGTT);
> +	trace_set_ggtt_entry(mm->vgpu->id, entry->val64);
>

yep, adding trace is good for this, and assume we also need index info too.
Also for this issue, we might also add type validation for entry as well.

>  	pte_ops->set_entry(NULL, entry, index, false, 0, mm->vgpu);
>  }
> diff --git a/drivers/gpu/drm/i915/gvt/trace.h b/drivers/gpu/drm/i915/gvt/=
trace.h
> index 6d787750d279..69c374868146 100644
> --- a/drivers/gpu/drm/i915/gvt/trace.h
> +++ b/drivers/gpu/drm/i915/gvt/trace.h
> @@ -373,6 +373,25 @@ TRACE_EVENT(render_mmio,
>  		  __entry->old_val, __entry->new_val)
>  );
> =20
> +TRACE_EVENT(set_ggtt_entry,
> +	TP_PROTO(int id, unsigned long address),
> +
> +	TP_ARGS(id, address),
> +
> +	TP_STRUCT__entry(
> +		__field(int, id)
> +		__field(unsigned long, address)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->id =3D id;
> +		__entry->address =3D address;
> +	),
> +
> +	TP_printk("vgpu%d:set ggtt entry 0x%lx \n",
> +		  __entry->id, __entry->address)
> +);
> +
>  #endif /* _GVT_TRACE_H_ */
> =20
>  /* This part must be out of protection */
> --=20
> 2.17.1
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--IQxisP7nphoKJAnk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXOJBVwAKCRCxBBozTXgY
J0OzAKCFVW0Lckvfo+qbGfU0KEjw+bj6YgCeJtaZOM0bbQlxbSLilttCjBuFt4c=
=7Ymg
-----END PGP SIGNATURE-----

--IQxisP7nphoKJAnk--

--===============0285153456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0285153456==--
