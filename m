Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB5D9FA42
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 28 Aug 2019 08:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABB989958;
	Wed, 28 Aug 2019 06:12:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C734789958
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 28 Aug 2019 06:12:36 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 23:12:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; 
 d="asc'?scan'208";a="210036256"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga002.fm.intel.com with ESMTP; 27 Aug 2019 23:12:35 -0700
Date: Wed, 28 Aug 2019 14:07:52 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: update vgpu workload head pointer
 correctly
Message-ID: <20190828060752.GB4868@zhen-hp.sh.intel.com>
References: <1566895163-3772-1-git-send-email-xiaolin.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1566895163-3772-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0243836824=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0243836824==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Content-Disposition: inline


--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.08.27 16:39:23 +0800, Xiaolin Zhang wrote:
> when creating a vGPU workload, the guest context head pointer should
> be updated correctly by comparing with the exsiting workload in the
> guest worklod queue including the current running context.
>=20
> in some situation, there is a running context A and then received 2 new
> vGPU workload context B and A. in the new workload context A, it's head
> pointer should be updated with the running context A's tail.
>=20
> Fixes: 09975b861aa0 ("drm/i915/execlists: Disable preemption under GVT")
> Fixes: 22b7a426bbe1 ("drm/i915/execlists: Preempt-to-busy")
>=20
> v2: walk through guest workload list in backward way.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> ---

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks for the fix!

>  drivers/gpu/drm/i915/gvt/scheduler.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index 8940fa8..166b998 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -1438,9 +1438,6 @@ static int prepare_mm(struct intel_vgpu_workload *w=
orkload)
>  #define same_context(a, b) (((a)->context_id =3D=3D (b)->context_id) && \
>  		((a)->lrca =3D=3D (b)->lrca))
> =20
> -#define get_last_workload(q) \
> -	(list_empty(q) ? NULL : container_of(q->prev, \
> -	struct intel_vgpu_workload, list))
>  /**
>   * intel_vgpu_create_workload - create a vGPU workload
>   * @vgpu: a vGPU
> @@ -1460,7 +1457,7 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu,=
 int ring_id,
>  {
>  	struct intel_vgpu_submission *s =3D &vgpu->submission;
>  	struct list_head *q =3D workload_q_head(vgpu, ring_id);
> -	struct intel_vgpu_workload *last_workload =3D get_last_workload(q);
> +	struct intel_vgpu_workload *last_workload =3D NULL;
>  	struct intel_vgpu_workload *workload =3D NULL;
>  	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
>  	u64 ring_context_gpa;
> @@ -1486,15 +1483,20 @@ intel_vgpu_create_workload(struct intel_vgpu *vgp=
u, int ring_id,
>  	head &=3D RB_HEAD_OFF_MASK;
>  	tail &=3D RB_TAIL_OFF_MASK;
> =20
> -	if (last_workload && same_context(&last_workload->ctx_desc, desc)) {
> -		gvt_dbg_el("ring id %d cur workload =3D=3D last\n", ring_id);
> -		gvt_dbg_el("ctx head %x real head %lx\n", head,
> -				last_workload->rb_tail);
> -		/*
> -		 * cannot use guest context head pointer here,
> -		 * as it might not be updated at this time
> -		 */
> -		head =3D last_workload->rb_tail;
> +	list_for_each_entry_reverse(last_workload, q, list) {
> +
> +		if (same_context(&last_workload->ctx_desc, desc)) {
> +			gvt_dbg_el("ring id %d cur workload =3D=3D last\n",
> +					ring_id);
> +			gvt_dbg_el("ctx head %x real head %lx\n", head,
> +					last_workload->rb_tail);
> +			/*
> +			 * cannot use guest context head pointer here,
> +			 * as it might not be updated at this time
> +			 */
> +			head =3D last_workload->rb_tail;
> +			break;
> +		}
>  	}
> =20
>  	gvt_dbg_el("ring id %d begin a new workload\n", ring_id);
> --=20
> 2.7.4
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXWYaOAAKCRCxBBozTXgY
J3bmAJ9AClMvXTn6U7fw7NfsDl5SlLck2ACfZyjXn7rd8ODWjCR1s1aZuCZEjfs=
=QCGW
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--

--===============0243836824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0243836824==--
