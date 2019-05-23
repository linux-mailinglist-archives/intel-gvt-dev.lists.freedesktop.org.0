Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432B927488
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 May 2019 04:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA69489C52;
	Thu, 23 May 2019 02:47:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A2A89C52
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 May 2019 02:47:34 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 19:47:33 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga008.jf.intel.com with ESMTP; 22 May 2019 19:47:32 -0700
Date: Thu, 23 May 2019 10:46:28 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: Add set_ggtt_entry tracing event
Message-ID: <20190523024628.GM12913@zhen-hp.sh.intel.com>
References: <20190522221114.3548-1-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190522221114.3548-1-tina.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0353223383=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0353223383==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KKlV3Q509gERURet"
Content-Disposition: inline


--KKlV3Q509gERURet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.23 06:11:14 +0800, Tina Zhang wrote:
> Add set_ggtt_entry tracing event.
>=20
> v2:
> - Add index field. (Zhenyu)
>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c   |  1 +
>  drivers/gpu/drm/i915/gvt/trace.h | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index c2f7d20f6346..15216c5b40aa 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -629,6 +629,7 @@ static void ggtt_set_host_entry(struct intel_vgpu_mm =
*mm,
>  	struct intel_gvt_gtt_pte_ops *pte_ops =3D mm->vgpu->gvt->gtt.pte_ops;
> =20
>  	GEM_BUG_ON(mm->type !=3D INTEL_GVT_MM_GGTT);
> +	trace_set_ggtt_entry(mm->vgpu->id, entry->val64, index);
> =20
>  	pte_ops->set_entry(NULL, entry, index, false, 0, mm->vgpu);
>  }
> diff --git a/drivers/gpu/drm/i915/gvt/trace.h b/drivers/gpu/drm/i915/gvt/=
trace.h
> index 6d787750d279..981cc36eb50f 100644
> --- a/drivers/gpu/drm/i915/gvt/trace.h
> +++ b/drivers/gpu/drm/i915/gvt/trace.h
> @@ -373,6 +373,28 @@ TRACE_EVENT(render_mmio,
>  		  __entry->old_val, __entry->new_val)
>  );
> =20
> +TRACE_EVENT(set_ggtt_entry,
> +	TP_PROTO(int id, unsigned long address,
> +		    unsigned long index),
> +

Better stick with u64 for address type and use proper 0x%llx below for prin=
tk.

> +	TP_ARGS(id, address, index),
> +
> +	TP_STRUCT__entry(
> +		__field(int, id)
> +		__field(unsigned long, address)
> +		__field(unsigned long, index)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->id =3D id;
> +		__entry->address =3D address;
> +		__entry->index =3D index;
> +	),
> +
> +	TP_printk("vgpu%d:set ggtt entry 0x%lx, index 0x%lx\n",
> +		  __entry->id, __entry->address, __entry->index)
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

--KKlV3Q509gERURet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXOYJhAAKCRCxBBozTXgY
J+lwAJ96w1ilIFgvmpi7+4Cx2oUsilUWggCfa5pjtG75pa38PHd3EHFgOTrLmN0=
=fcQV
-----END PGP SIGNATURE-----

--KKlV3Q509gERURet--

--===============0353223383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0353223383==--
