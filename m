Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F016F87287
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  9 Aug 2019 08:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D1D6ED02;
	Fri,  9 Aug 2019 06:58:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467CE6ED02
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  9 Aug 2019 06:58:19 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 23:58:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; 
 d="asc'?scan'208";a="182829014"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Aug 2019 23:58:17 -0700
Date: Fri, 9 Aug 2019 14:54:17 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Double check batch buffer size after copy
Message-ID: <20190809065417.GA7194@zhen-hp.sh.intel.com>
References: <20190729004220.3171-1-tina.zhang@intel.com>
 <20190729032735.GP8319@zhen-hp.sh.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190729032735.GP8319@zhen-hp.sh.intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Yan Zhao <yan.y.zhao@intel.com>,
 zhiyuan.lv@intel.com, hang.yuan@intel.com
Content-Type: multipart/mixed; boundary="===============0381992604=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0381992604==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.07.29 11:27:35 +0800, Zhenyu Wang wrote:
> On 2019.07.29 08:42:20 +0800, Tina Zhang wrote:
> > Double check the size of the privilege buffer to make sure the size
> > remains unchanged after copy.
>=20
> It's confusing when reading the commit description vs. below actual code,
> which doesn't double check the size but detect the batch end instead.
>

Tina, could you improve the description and resend this?

> >=20
> > v3:
> > - To get the right offset of the batch buffer end cmd. (Yan)
> >=20
> > v2:
> > - Use lightweight way to audit batch buffer end. (Yan)
> >=20
> > Cc: Yan Zhao <yan.y.zhao@intel.com>
> > Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/cmd_parser.c | 39 +++++++++++++++++++++++++--
> >  1 file changed, 37 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i9=
15/gvt/cmd_parser.c
> > index 6ea88270c818..a641e3ee1fe4 100644
> > --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > @@ -1661,7 +1661,9 @@ static int batch_buffer_needs_scan(struct parser_=
exec_state *s)
> >  	return 1;
> >  }
> > =20
> > -static int find_bb_size(struct parser_exec_state *s, unsigned long *bb=
_size)
> > +static int find_bb_size(struct parser_exec_state *s,
> > +			unsigned long *bb_size,
> > +			unsigned long *bb_end_cmd_offset)
> >  {
> >  	unsigned long gma =3D 0;
> >  	const struct cmd_info *info;
> > @@ -1673,6 +1675,7 @@ static int find_bb_size(struct parser_exec_state =
*s, unsigned long *bb_size)
> >  		s->vgpu->gtt.ggtt_mm : s->workload->shadow_mm;
> > =20
> >  	*bb_size =3D 0;
> > +	*bb_end_cmd_offset =3D 0;
> > =20
> >  	/* get the start gm address of the batch buffer */
> >  	gma =3D get_gma_bb_from_cmd(s, 1);
> > @@ -1708,6 +1711,10 @@ static int find_bb_size(struct parser_exec_state=
 *s, unsigned long *bb_size)
> >  				/* chained batch buffer */
> >  				bb_end =3D true;
> >  		}
> > +
> > +		if (bb_end)
> > +			*bb_end_cmd_offset =3D *bb_size;
> > +
> >  		cmd_len =3D get_cmd_length(info, cmd) << 2;
> >  		*bb_size +=3D cmd_len;
> >  		gma +=3D cmd_len;
> > @@ -1716,12 +1723,36 @@ static int find_bb_size(struct parser_exec_stat=
e *s, unsigned long *bb_size)
> >  	return 0;
> >  }
> > =20
> > +static int audit_bb_end(struct parser_exec_state *s, void *va)
> > +{
> > +	struct intel_vgpu *vgpu =3D s->vgpu;
> > +	u32 cmd =3D *(u32 *)va;
> > +	const struct cmd_info *info;
> > +
> > +	info =3D get_cmd_info(s->vgpu->gvt, cmd, s->ring_id);
> > +	if (info =3D=3D NULL) {
> > +		gvt_vgpu_err("unknown cmd 0x%x, opcode=3D0x%x, addr_type=3D%s, ring =
%d, workload=3D%p\n",
> > +			cmd, get_opcode(cmd, s->ring_id),
> > +			(s->buf_addr_type =3D=3D PPGTT_BUFFER) ?
> > +			"ppgtt" : "ggtt", s->ring_id, s->workload);
> > +		return -EBADRQC;
> > +	}
> > +
> > +	if ((info->opcode =3D=3D OP_MI_BATCH_BUFFER_END) ||
> > +	    ((info->opcode =3D=3D OP_MI_BATCH_BUFFER_START) &&
> > +	     (BATCH_BUFFER_2ND_LEVEL_BIT(cmd) =3D=3D 0)))
> > +		return 0;
> > +
> > +	return -EBADRQC;
> > +}
> > +
> >  static int perform_bb_shadow(struct parser_exec_state *s)
> >  {
> >  	struct intel_vgpu *vgpu =3D s->vgpu;
> >  	struct intel_vgpu_shadow_bb *bb;
> >  	unsigned long gma =3D 0;
> >  	unsigned long bb_size;
> > +	unsigned long bb_end_cmd_offset;
> >  	int ret =3D 0;
> >  	struct intel_vgpu_mm *mm =3D (s->buf_addr_type =3D=3D GTT_BUFFER) ?
> >  		s->vgpu->gtt.ggtt_mm : s->workload->shadow_mm;
> > @@ -1732,7 +1763,7 @@ static int perform_bb_shadow(struct parser_exec_s=
tate *s)
> >  	if (gma =3D=3D INTEL_GVT_INVALID_ADDR)
> >  		return -EFAULT;
> > =20
> > -	ret =3D find_bb_size(s, &bb_size);
> > +	ret =3D find_bb_size(s, &bb_size, &bb_end_cmd_offset);
> >  	if (ret)
> >  		return ret;
> > =20
> > @@ -1788,6 +1819,10 @@ static int perform_bb_shadow(struct parser_exec_=
state *s)
> >  		goto err_unmap;
> >  	}
> > =20
> > +	ret =3D audit_bb_end(s, bb->va + start_offset + bb_end_cmd_offset);
> > +	if (ret)
> > +		goto err_unmap;
> > +
> >  	INIT_LIST_HEAD(&bb->list);
> >  	list_add(&bb->list, &s->workload->shadow_bb);
> > =20
> > --=20
> > 2.17.1
> >=20
>=20
> --=20
> Open Source Technology Center, Intel ltd.
>=20
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827



> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXU0YmQAKCRCxBBozTXgY
J640AJ9sVz1eXeruelz4VWNA/oez8CqOpACggsGAwSdPwr8S4KZo+eCNcjSWKfk=
=lCq3
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--

--===============0381992604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0381992604==--
