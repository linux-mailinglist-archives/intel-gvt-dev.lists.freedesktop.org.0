Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B6C71764E
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 31 May 2023 07:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC6010E1AE;
	Wed, 31 May 2023 05:41:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADB110E1AE;
 Wed, 31 May 2023 05:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685511685; x=1717047685;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=RpVMw+4SRn5u8uvcelTCsZwi/eR3rnsSUVJjGzP4e3o=;
 b=em2p527Fk64OkzN6Sqq7KVHE2869B6Q5GFFC82g14uKoEWK1IaAHjbHd
 7tJP3cCIEho5huWMNRA+grNAmtW1YYdWRoofBQc3qfVdWtVi2YnMrhKz1
 JA8unuCeGbuipn7E1vB8OUlD8Kdin/QYGKbIsY/F4cX9JI3ue7QZdTXmp
 eIHHJkiH2lmZmj2ewal37x6Ajtv4r8bn5X4oAVFhbc2oLbStASxb7stKr
 Ke/SifCLgs6/ujInKyhOSYxyUTrWwfMipUq7r9dQeV9OPz5ATElWEgsv0
 PtyGHe4Hk3Hd6h36TQrnrwEicMtRv5+rdWSspMoDmFTHpGlsv9VVgcGW3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="335489704"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
 d="asc'?scan'208";a="335489704"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 22:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="739802309"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
 d="asc'?scan'208";a="739802309"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.160.45])
 by orsmga001.jf.intel.com with ESMTP; 30 May 2023 22:41:22 -0700
Date: Wed, 31 May 2023 13:39:59 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH RESEND] drm/i915/gvt: remove unused variable gma_bottom
 in command parser
Message-ID: <ZHbdr8YdISKvFrWD@debian-scheme>
References: <20230531020411.18987-1-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="gmwJSrN/Xz+govn6"
Content-Disposition: inline
In-Reply-To: <20230531020411.18987-1-zhi.a.wang@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--gmwJSrN/Xz+govn6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023.05.31 02:04:11 +0000, Zhi Wang wrote:
> Remove unused variable gma_bottom in scan_workload() and scan_wa_ctx().
> commit be1da7070aea ("drm/i915/gvt: vGPU command scanner") introduces
> gma_bottom in several functions to calculate the size of the command
> buffer. However, some of them are set but actually unused.
>=20
> When compiling the code with ccflags -Wunused-but-set-variable, gcc
> throws warnings.
>=20
> Remove unused variables to avoid the gcc warnings. Tested via compiling
> the code with ccflags -Wunused-but-set-variable.
>=20
> Fixes: be1da7070aea ("drm/i915/gvt: vGPU command scanner")
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> ---

Good with me. I think I also caught this before but never send the change..
Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index 3c4ae1da0d41..05f9348b7a9d 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -2833,7 +2833,7 @@ static int command_scan(struct parser_exec_state *s,
> =20
>  static int scan_workload(struct intel_vgpu_workload *workload)
>  {
> -	unsigned long gma_head, gma_tail, gma_bottom;
> +	unsigned long gma_head, gma_tail;
>  	struct parser_exec_state s;
>  	int ret =3D 0;
> =20
> @@ -2843,7 +2843,6 @@ static int scan_workload(struct intel_vgpu_workload=
 *workload)
> =20
>  	gma_head =3D workload->rb_start + workload->rb_head;
>  	gma_tail =3D workload->rb_start + workload->rb_tail;
> -	gma_bottom =3D workload->rb_start +  _RING_CTL_BUF_SIZE(workload->rb_ct=
l);
> =20
>  	s.buf_type =3D RING_BUFFER_INSTRUCTION;
>  	s.buf_addr_type =3D GTT_BUFFER;
> @@ -2874,7 +2873,7 @@ static int scan_workload(struct intel_vgpu_workload=
 *workload)
>  static int scan_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
>  {
> =20
> -	unsigned long gma_head, gma_tail, gma_bottom, ring_size, ring_tail;
> +	unsigned long gma_head, gma_tail, ring_size, ring_tail;
>  	struct parser_exec_state s;
>  	int ret =3D 0;
>  	struct intel_vgpu_workload *workload =3D container_of(wa_ctx,
> @@ -2891,7 +2890,6 @@ static int scan_wa_ctx(struct intel_shadow_wa_ctx *=
wa_ctx)
>  			PAGE_SIZE);
>  	gma_head =3D wa_ctx->indirect_ctx.guest_gma;
>  	gma_tail =3D wa_ctx->indirect_ctx.guest_gma + ring_tail;
> -	gma_bottom =3D wa_ctx->indirect_ctx.guest_gma + ring_size;
> =20
>  	s.buf_type =3D RING_BUFFER_INSTRUCTION;
>  	s.buf_addr_type =3D GTT_BUFFER;
> --=20
> 2.25.1
>=20

--gmwJSrN/Xz+govn6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCZHbdqQAKCRCxBBozTXgY
JyyDAJ9Fa1Z5rEddXYPHbkhPOn6q8zGnbQCghWt4z1LfytzK2I8UMAg2rooLSSM=
=Dxxr
-----END PGP SIGNATURE-----

--gmwJSrN/Xz+govn6--
