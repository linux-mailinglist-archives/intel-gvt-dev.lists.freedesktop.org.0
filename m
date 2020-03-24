Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357241903C5
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 Mar 2020 04:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D91892F8;
	Tue, 24 Mar 2020 03:06:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE44892F8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 24 Mar 2020 03:06:24 +0000 (UTC)
IronPort-SDR: g9gtolaKdgzuqLVVoNBSl+omXTsj7S4dz906j+i2tGDJZuK8O0/cXyvucD/DTkIHVk6mPnSUVU
 H4ObE9tgamFw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 20:06:23 -0700
IronPort-SDR: yOIdI1f5aacKI6p/oNJuaBaQhJ7yiJXRCku85yVZTzhcJq1dakvTSl359H6QwjPifH416r+dGR
 IEObe8YhC6aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,298,1580803200"; 
 d="asc'?scan'208";a="249848995"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga006.jf.intel.com with ESMTP; 23 Mar 2020 20:06:22 -0700
Date: Tue, 24 Mar 2020 10:53:27 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Set defaults to transcoder mn reg
Message-ID: <20200324025327.GV8880@zhen-hp.sh.intel.com>
References: <20200320030249.5759-1-tina.zhang@intel.com>
 <20200320035550.GC8880@zhen-hp.sh.intel.com>
 <BN6PR11MB16662C95A3B964B7AD8AB52B89F10@BN6PR11MB1666.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR11MB16662C95A3B964B7AD8AB52B89F10@BN6PR11MB1666.namprd11.prod.outlook.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0549187832=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0549187832==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bDDjztrZmyyMv72E"
Content-Disposition: inline


--bDDjztrZmyyMv72E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.24 00:45:42 +0000, Zhang, Tina wrote:
>=20
>=20
> > -----Original Message-----
> > From: intel-gvt-dev <intel-gvt-dev-bounces@lists.freedesktop.org> On Be=
half
> > Of Zhenyu Wang
> > Sent: Friday, March 20, 2020 11:56 AM
> > To: Zhang, Tina <tina.zhang@intel.com>
> > Cc: intel-gvt-dev@lists.freedesktop.org
> > Subject: Re: [PATCH] drm/i915/gvt: Set defaults to transcoder mn reg
> >=20
> > On 2020.03.20 11:02:49 +0800, Tina Zhang wrote:
> > > GVT-g provides guest with dp type connectors and does the dp emulatio=
ns.
> > > For crtc timing, GVT-g just copys the parameters from host, which is
> > > fine when host has dp type connectors as the vgpu's crtc timing never
> > > goes to hardware and the reasonable data got by guest is mostly for
> > > the sanity checking and clock related calculating.
> > >
> > > But when host doesn't have any dp ports, GVT-g may get invalid data
> > > from dp related timing registers on host. And those invalid data
> > > cannot let guest pass the sanity checking.
> > >
> > > So, solve the issue by providing reasonable defauts for the transcoder
> > > mn registers no matter whether host has or has not dp type connectors.
> > >
> > > Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gvt/display.c | 23 +++++++++++++++++++++++
> > >  1 file changed, 23 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gvt/display.c
> > > b/drivers/gpu/drm/i915/gvt/display.c
> > > index a83df2f84eb9..44185cda0905 100644
> > > --- a/drivers/gpu/drm/i915/gvt/display.c
> > > +++ b/drivers/gpu/drm/i915/gvt/display.c
> > > @@ -167,6 +167,17 @@ static u8 dpcd_fix_data[DPCD_HEADER_SIZE] =3D {
> > >  	0x12, 0x014, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
> > > };
> > >
> > > +/* Set defaults to transcoder nm registers to gererate reasonable cr=
tc
> > clock */
> > > +#define PIPE_MN_REG_NUM	0x4
> > > +
> > > +static u32 trans_m_n[4] =3D {
> > > +	/*
> > > +	 * PIPE_LINK_M1, PIPE_LINK_N1, PIPE_DATA_M1, PIPE_DATA_N1
> > > +	 * generate crtc.clock =3D 89099 kHz
> > > +	 */
> > > +	0x46666, 0x80000, 0x7e34cccc, 0x800000
> >=20
> > I can't remember clearly, but is this clock related to our virtual EDID=
 mode
> > timing? Would that be different for different mode? e.g If we want to e=
xtend
> > for 4k resolution, does this need to be changed as well?
> According to https://01.org/sites/default/files/documentation/intel-gfx-p=
rm-osrc-skl-vol12-display.pdf page171, they don't come from edid.=20
>

Pixel rate clock is from modeline timing, e.g 30/60hz refresh would have di=
fferent clock.

> It seems things won't go bad, as we don't let the clock go on hardware re=
ally. So far we didn't see any kernel complains about those values. And we =
can check it again when 4k is introduced.
>

Pls at least note the m/n value in above calculation and what's mode clock
generated against, instead of just register value which is vague to underst=
and.

> Cheers,
> Tina=20
>=20
> >=20
> > > +};
> > > +
> > >  static void emulate_monitor_status_change(struct intel_vgpu *vgpu)  {
> > >  	struct drm_i915_private *dev_priv =3D vgpu->gvt->gt->i915; @@ -
> > 233,6
> > > +244,10 @@ static void emulate_monitor_status_change(struct intel_vgpu
> > *vgpu)
> > >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_B)) |=3D
> > DDI_BUF_CTL_ENABLE;
> > >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_B)) &=3D
> > ~DDI_BUF_IS_IDLE;
> > >  		vgpu_vreg_t(vgpu, SDEISR) |=3D SDE_PORTB_HOTPLUG_CPT;
> > > +		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) =3D
> > trans_m_n[0];
> > > +		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) =3D
> > trans_m_n[1];
> > > +		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) =3D
> > trans_m_n[2];
> > > +		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) =3D
> > trans_m_n[3];
> > >  	}
> > >
> > >  	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) { @@ -253,6
> > > +268,10 @@ static void emulate_monitor_status_change(struct intel_vgpu
> > *vgpu)
> > >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_C)) |=3D
> > DDI_BUF_CTL_ENABLE;
> > >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_C)) &=3D
> > ~DDI_BUF_IS_IDLE;
> > >  		vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D
> > SFUSE_STRAP_DDIC_DETECTED;
> > > +		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) =3D
> > trans_m_n[0];
> > > +		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) =3D
> > trans_m_n[1];
> > > +		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) =3D
> > trans_m_n[2];
> > > +		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) =3D
> > trans_m_n[3];
> > >  	}
> > >
> > >  	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_D)) { @@ -273,6
> > > +292,10 @@ static void emulate_monitor_status_change(struct intel_vgpu
> > *vgpu)
> > >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_D)) |=3D
> > DDI_BUF_CTL_ENABLE;
> > >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_D)) &=3D
> > ~DDI_BUF_IS_IDLE;
> > >  		vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D
> > SFUSE_STRAP_DDID_DETECTED;
> > > +		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) =3D
> > trans_m_n[0];
> > > +		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) =3D
> > trans_m_n[1];
> > > +		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) =3D
> > trans_m_n[2];
> > > +		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) =3D
> > trans_m_n[3];
> > >  	}
> > >
> > >  	if ((IS_SKYLAKE(dev_priv) || IS_KABYLAKE(dev_priv) ||
> > > --
> > > 2.17.1
> > >
> > > _______________________________________________
> > > intel-gvt-dev mailing list
> > > intel-gvt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> >=20
> > --
> > Open Source Technology Center, Intel ltd.
> >=20
> > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--bDDjztrZmyyMv72E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXnl2JwAKCRCxBBozTXgY
JwTFAJ9ekqbL7MvnECW4JTSqD/C5ZV1O4wCfdYoisdd+PD0wDYOXNYfan7n/9WM=
=TB1X
-----END PGP SIGNATURE-----

--bDDjztrZmyyMv72E--

--===============0549187832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0549187832==--
