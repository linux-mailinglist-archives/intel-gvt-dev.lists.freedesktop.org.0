Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47855327E9
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  3 Jun 2019 07:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0081890F5;
	Mon,  3 Jun 2019 05:15:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474DB890F5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  3 Jun 2019 05:15:43 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jun 2019 22:15:43 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga005.fm.intel.com with ESMTP; 02 Jun 2019 22:15:42 -0700
Date: Mon, 3 Jun 2019 13:14:13 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: add F_CMD_ACCESS flag for wa regs
Message-ID: <20190603051413.GG9684@zhen-hp.sh.intel.com>
References: <20190531073348.26490-1-weinan.z.li@intel.com>
 <20190603034845.GA8675@joy-OptiPlex-7040>
MIME-Version: 1.0
In-Reply-To: <20190603034845.GA8675@joy-OptiPlex-7040>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Weinan Li <weinan.z.li@intel.com>
Content-Type: multipart/mixed; boundary="===============1581035111=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1581035111==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kadn00tgSopKmJ1H"
Content-Disposition: inline


--kadn00tgSopKmJ1H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On 2019.06.02 23:48:45 -0400, Yan Zhao wrote:
> Acked-by: Yan Zhao <yan.y.zhao@intel.com>
>

Thanks for the patch and review! Applied this.

> On Fri, May 31, 2019 at 03:33:48PM +0800, Weinan Li wrote:
> > Instead of updating by MMIO write, all of the wa regs are initialized by
> > wa_ctx. From host side, it should make this behavior as expected, add
> > 'F_CMD_ACCESS' flag to these regs and allow access by commands.
> >=20
> > [  123.557608] gvt: vgpu 2: srm access to non-render register (b11c)
> > [  123.563728] gvt: vgpu 2: MI_STORE_REGISTER_MEM handler error
> > [  123.569409] gvt: vgpu 2: cmd parser error
> > [  123.573424] 0x0
> > [  123.573425] 0x24
> >=20
> > [  123.578686] gvt: vgpu 2: scan workload error
> > [  123.582958] GVT Internal error  for the guest
> > [  123.587317] Now vgpu 2 will enter failsafe mode.
> > [  123.591938] gvt: vgpu 2: failed to submit desc 0
> > [  123.596557] gvt: vgpu 2: fail submit workload on ring 0
> > [  123.601786] gvt: vgpu 2: fail to emulate MMIO write 00002230 len 4
> >=20
> > Signed-off-by: Weinan Li <weinan.z.li@intel.com>
> > Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/handlers.c | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915=
/gvt/handlers.c
> > index 7732caa1a546..a6ade66349bd 100644
> > --- a/drivers/gpu/drm/i915/gvt/handlers.c
> > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> > @@ -1924,7 +1924,8 @@ static int init_generic_mmio_info(struct intel_gv=
t *gvt)
> >  	MMIO_DFH(_MMIO(0x20dc), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL=
);
> >  	MMIO_DFH(_3D_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
> >  	MMIO_DFH(_MMIO(0x2088), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL=
);
> > -	MMIO_DFH(_MMIO(0x20e4), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL=
);
> > +	MMIO_DFH(FF_SLICE_CS_CHICKEN2, D_ALL,
> > +		 F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
> >  	MMIO_DFH(_MMIO(0x2470), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL=
);
> >  	MMIO_DFH(GAM_ECOCHK, D_ALL, F_CMD_ACCESS, NULL, NULL);
> >  	MMIO_DFH(GEN7_COMMON_SLICE_CHICKEN1, D_ALL, F_MODE_MASK | F_CMD_ACCES=
S,
> > @@ -3028,7 +3029,7 @@ static int init_skl_mmio_info(struct intel_gvt *g=
vt)
> >  	MMIO_D(CSR_HTP_SKL, D_SKL_PLUS);
> >  	MMIO_D(CSR_LAST_WRITE, D_SKL_PLUS);
> > =20
> > -	MMIO_D(BDW_SCRATCH1, D_SKL_PLUS);
> > +	MMIO_DFH(BDW_SCRATCH1, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> > =20
> >  	MMIO_D(SKL_DFSM, D_SKL_PLUS);
> >  	MMIO_D(DISPIO_CR_TX_BMU_CR0, D_SKL_PLUS);
> > @@ -3041,8 +3042,8 @@ static int init_skl_mmio_info(struct intel_gvt *g=
vt)
> >  	MMIO_D(RPM_CONFIG0, D_SKL_PLUS);
> >  	MMIO_D(_MMIO(0xd08), D_SKL_PLUS);
> >  	MMIO_D(RC6_LOCATION, D_SKL_PLUS);
> > -	MMIO_DFH(GEN7_FF_SLICE_CS_CHICKEN1, D_SKL_PLUS, F_MODE_MASK,
> > -		NULL, NULL);
> > +	MMIO_DFH(GEN7_FF_SLICE_CS_CHICKEN1, D_SKL_PLUS,
> > +		 F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
> >  	MMIO_DFH(GEN9_CS_DEBUG_MODE1, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
> >  		NULL, NULL);
> > =20
> > @@ -3061,7 +3062,7 @@ static int init_skl_mmio_info(struct intel_gvt *g=
vt)
> >  	MMIO_D(_MMIO(0x46520), D_SKL_PLUS);
> > =20
> >  	MMIO_D(_MMIO(0xc403c), D_SKL_PLUS);
> > -	MMIO_D(_MMIO(0xb004), D_SKL_PLUS);
> > +	MMIO_DFH(GEN8_GARBCNTL, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> >  	MMIO_DH(DMA_CTRL, D_SKL_PLUS, NULL, dma_ctrl_write);
> > =20
> >  	MMIO_D(_MMIO(0x65900), D_SKL_PLUS);
> > @@ -3273,7 +3274,7 @@ static int init_bxt_mmio_info(struct intel_gvt *g=
vt)
> >  	MMIO_D(GEN8_PUSHBUS_ENABLE, D_BXT);
> >  	MMIO_D(GEN8_PUSHBUS_SHIFT, D_BXT);
> >  	MMIO_D(GEN6_GFXPAUSE, D_BXT);
> > -	MMIO_D(GEN8_L3SQCREG1, D_BXT);
> > +	MMIO_DFH(GEN8_L3SQCREG1, D_BXT, F_CMD_ACCESS, NULL, NULL);
> > =20
> >  	MMIO_DFH(GEN9_CTX_PREEMPT_REG, D_BXT, F_CMD_ACCESS, NULL, NULL);
> > =20
> > --=20
> > 2.17.1
> >=20
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--kadn00tgSopKmJ1H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXPSspAAKCRCxBBozTXgY
J2PSAJ9L7PXLFwmwE8WT4h+0NgHDLGnGQACfZdw8/RiNNJPl+7iTuhkmQdLol/k=
=Li3x
-----END PGP SIGNATURE-----

--kadn00tgSopKmJ1H--

--===============1581035111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1581035111==--
