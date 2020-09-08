Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC7E260EB0
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Sep 2020 11:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBB16E7D0;
	Tue,  8 Sep 2020 09:32:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0AF6E7D0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Sep 2020 09:32:30 +0000 (UTC)
IronPort-SDR: f6io4P+YVF4zzyZubZtarUNCKbEw450Hg73kgotIPcsNHXrpFqotzDr43vme+u9uAVaJAeDiA+
 syzUzySbQ8MA==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="155502596"
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
 d="asc'?scan'208";a="155502596"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 02:32:30 -0700
IronPort-SDR: 6uGtNLAsUwoe11zg7BCTpQgsJjb9706c5SOUdTubcPUvgoEyDz9IQb6bE5PwAA51/ubCNeAioE
 qOI0CcrOZyLA==
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
 d="asc'?scan'208";a="448716170"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 02:32:28 -0700
Date: Tue, 8 Sep 2020 17:13:15 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <Colin.Xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Add F_CMD_ACCESS for some GEN9 SKU WA MMIO
 access
Message-ID: <20200908091315.GC1426@zhen-hp.sh.intel.com>
References: <20200819010801.53411-1-colin.xu@intel.com>
 <0afb4950-13e2-5556-825f-514b82c49748@intel.com>
MIME-Version: 1.0
In-Reply-To: <0afb4950-13e2-5556-825f-514b82c49748@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1154104068=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1154104068==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.09.08 15:25:33 +0800, Colin Xu wrote:
> Pin for review.
>

Looks good to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

> On 2020-08-19 09:08, Colin Xu wrote:
> > Without F_CMD_ACCESS, guest LRI cmd will fail due to "access to
> > non-render register" when init below WAs:
> > WaDisableDynamicCreditSharing: GAMT_CHKN_BIT_REG
> > WaCompressedResourceSamplerPbeMediaNewHashMode: MMCD_MISC_CTRL
> >=20
> > So add F_CMD_ACCESS to the two MMIO.
> >=20
> > Signed-off-by: Colin Xu <colin.xu@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gvt/handlers.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915=
/gvt/handlers.c
> > index d55cb43c9bd4..840572add2d4 100644
> > --- a/drivers/gpu/drm/i915/gvt/handlers.c
> > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> > @@ -2922,7 +2922,7 @@ static int init_skl_mmio_info(struct intel_gvt *g=
vt)
> >   	MMIO_D(GEN9_MEDIA_PG_IDLE_HYSTERESIS, D_SKL_PLUS);
> >   	MMIO_D(GEN9_RENDER_PG_IDLE_HYSTERESIS, D_SKL_PLUS);
> >   	MMIO_DFH(GEN9_GAMT_ECO_REG_RW_IA, D_SKL_PLUS, F_CMD_ACCESS, NULL, NU=
LL);
> > -	MMIO_DH(MMCD_MISC_CTRL, D_SKL_PLUS, NULL, NULL);
> > +	MMIO_DFH(MMCD_MISC_CTRL, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> >   	MMIO_DH(CHICKEN_PAR1_1, D_SKL_PLUS, NULL, NULL);
> >   	MMIO_D(DC_STATE_EN, D_SKL_PLUS);
> >   	MMIO_D(DC_STATE_DEBUG, D_SKL_PLUS);
> > @@ -3138,7 +3138,7 @@ static int init_skl_mmio_info(struct intel_gvt *g=
vt)
> >   	MMIO_DFH(GEN9_WM_CHICKEN3, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
> >   		 NULL, NULL);
> > -	MMIO_D(GAMT_CHKN_BIT_REG, D_KBL | D_CFL);
> > +	MMIO_DFH(GAMT_CHKN_BIT_REG, D_KBL | D_CFL, F_CMD_ACCESS, NULL, NULL);
> >   	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS);
> >   	return 0;
>=20
> --=20
> Best Regards,
> Colin Xu
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX1dLKgAKCRCxBBozTXgY
JxEDAJ9MU5e0eq7Coe68wn933rZLnyujEwCeKKVWECore+wEKilrNk1ZIoRYJvc=
=6osc
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--

--===============1154104068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1154104068==--
