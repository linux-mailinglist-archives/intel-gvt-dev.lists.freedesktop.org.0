Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60CF26258A
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Sep 2020 05:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695DF6E21A;
	Wed,  9 Sep 2020 03:01:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B566E21A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  9 Sep 2020 03:00:58 +0000 (UTC)
IronPort-SDR: RMsMrQyCfWKQjSur44fxGjeJBUPdYtimMrQoAuji6QZOxLHdqnYvmeQ9SdAa0PEz1pC8MnIEib
 cV9ZdKdvhfaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="157536513"
X-IronPort-AV: E=Sophos;i="5.76,408,1592895600"; 
 d="asc'?scan'208";a="157536513"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 20:00:49 -0700
IronPort-SDR: hcjgiC8idSsz9MVOLB+JpfAuLO24zoOOjcyRoVX143DbGxDqZESW2Si8F1UGojUjQ7yM+fjVaZ
 pFWHgdcx3C8g==
X-IronPort-AV: E=Sophos;i="5.76,408,1592895600"; 
 d="asc'?scan'208";a="449036708"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 20:00:48 -0700
Date: Wed, 9 Sep 2020 10:41:33 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <Colin.Xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Skip writing 0 to HWSP during D3 resume
Message-ID: <20200909024133.GG28614@zhen-hp.sh.intel.com>
References: <20200819010953.55350-1-colin.xu@intel.com>
 <20200908091518.GE1426@zhen-hp.sh.intel.com>
 <7c369be0-d2bb-692b-e207-fd042fd11380@intel.com>
 <20200909020420.GE28614@zhen-hp.sh.intel.com>
 <da21010d-c366-b69b-1045-8ab840e646e5@intel.com>
MIME-Version: 1.0
In-Reply-To: <da21010d-c366-b69b-1045-8ab840e646e5@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: multipart/mixed; boundary="===============0745303510=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0745303510==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.09.09 10:51:04 +0800, Colin Xu wrote:
>=20
> On 2020-09-09 10:04, Zhenyu Wang wrote:
> > On 2020.09.09 08:37:53 +0800, Colin Xu wrote:
> > > On 2020-09-08 17:15, Zhenyu Wang wrote:
> > > > On 2020.08.19 09:09:53 +0800, Colin Xu wrote:
> > > > > Guest driver may reset HWSP to 0 as init value during D3->D0:
> > > > > The full sequence is:
> > > > > - Boot ->D0
> > > > > - Update HWSP
> > > > > - D0->D3
> > > > > - ...In D3 state...
> > > > > - D3->D0
> > > > > - DMLR reset.
> > > > > - Set engine HWSP to 0.
> > > > > - Set engine ring mode to 0.
> > > > > - Set engine HWSP to correct value.
> > > > > - Set engine ring mode to correct value.
> > > > > Ring mode is masked register so set 0 won't take effect.
> > > > > However HWPS addr 0 is considered as invalid GGTT address which w=
ill
> > > > > report error like:
> > > > > gvt: vgpu 1: write invalid HWSP address, reg:0x2080, value:0x0
> > > > >=20
> > > > So looks this is to handle that wrong error message but function is
> > > > still same, right?
> > > Yes that's right. Current logic can guarantee that only correct HWSP =
write
> > > from guest are accepted by GVT. Invalid HWSP address will be dropped =
and
> > > won't be submitted to HW. During resume, correct HWSP will be updated
> > > eventually updated. If pv_notified is set, the intermediate HWSP zero=
-out
> > > can be ignored until hit next reset.
> > Might just move that error into debug message instead of putting
> > effort on tracking guest state without much gain..
> Sometimes such invalid HWSP addr write msg may still be helpful. If put t=
hem
> into gvt_dbg_mmio without considering different case, may miss the
> information. So this change put real error into gvt_vgpu_err, but put
> expected zero out to gvt_dbg_mmio.

Could you elaborate what would be helpful? The current error message
doesn't really help end user I think, but only for developer, so it
makes more sense to turn into debug.

> >=20
> > > > > During vGPU in D3, per-engine HWSP gpa remains valid so we can sk=
ip
> > > > > update HWSP in this case.
> > > > > Check both pv_notified and previous engine HWSP gpa, if pv already
> > > > > notified and previous HWSP gpa is valid, we skip this HWSP init a=
nd
> > > > > let later HWSP write update the correct value. We also need zero =
out
> > > > > per-engine HWSP gpa on engine reset to make sure hws_pga is valid.
> > > > >=20
> > > > > Signed-off-by: Colin Xu <colin.xu@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/i915/gvt/handlers.c | 30 ++++++++++++++++++++-=
--------
> > > > >    drivers/gpu/drm/i915/gvt/vgpu.c     |  7 +++++++
> > > > >    2 files changed, 28 insertions(+), 9 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/dr=
m/i915/gvt/handlers.c
> > > > > index 840572add2d4..72860aaf1656 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/handlers.c
> > > > > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> > > > > @@ -1489,12 +1489,6 @@ static int hws_pga_write(struct intel_vgpu=
 *vgpu, unsigned int offset,
> > > > >    	const struct intel_engine_cs *engine =3D
> > > > >    		intel_gvt_render_mmio_to_engine(vgpu->gvt, offset);
> > > > > -	if (!intel_gvt_ggtt_validate_range(vgpu, value, I915_GTT_PAGE_S=
IZE)) {
> > > > > -		gvt_vgpu_err("write invalid HWSP address, reg:0x%x, value:0x%x=
\n",
> > > > > -			      offset, value);
> > > > > -		return -EINVAL;
> > > > > -	}
> > > > > -
> > > > >    	/*
> > > > >    	 * Need to emulate all the HWSP register write to ensure host=
 can
> > > > >    	 * update the VM CSB status correctly. Here listed registers =
can
> > > > > @@ -1505,9 +1499,27 @@ static int hws_pga_write(struct intel_vgpu=
 *vgpu, unsigned int offset,
> > > > >    			     offset);
> > > > >    		return -EINVAL;
> > > > >    	}
> > > > > -	vgpu->hws_pga[engine->id] =3D value;
> > > > > -	gvt_dbg_mmio("VM(%d) write: 0x%x to HWSP: 0x%x\n",
> > > > > -		     vgpu->id, value, offset);
> > > > > +
> > > > > +	if (!intel_gvt_ggtt_validate_range(vgpu, value, I915_GTT_PAGE_S=
IZE)) {
> > > > > +		u32 old =3D vgpu->hws_pga[engine->id];
> > > > > +
> > > > > +		/* Skip zero out RING_HWS_PGA during D3 resume */
> > > > > +		if (vgpu->pv_notified && value =3D=3D 0 &&
> > > > > +		    intel_gvt_ggtt_validate_range(vgpu, old,
> > > > > +						  I915_GTT_PAGE_SIZE)) {
> > > > > +			gvt_dbg_mmio("Skip zero out HWSP address, reg:0x%x, "
> > > > > +				     "value:0x%x\n", offset, value);
> > > > > +
> > > > > +		} else {
> > > > > +			gvt_vgpu_err("write invalid HWSP address, reg:0x%x, "
> > > > > +				     "value:0x%x\n", offset, value);
> > > > > +			return -EINVAL;
> > > > > +		}
> > > > > +	} else {
> > > > > +		vgpu->hws_pga[engine->id] =3D value;
> > > > > +		gvt_dbg_mmio("VM(%d) write: 0x%x to HWSP: 0x%x\n",
> > > > > +			     vgpu->id, value, offset);
> > > > > +	}
> > > > >    	return intel_vgpu_default_mmio_write(vgpu, offset, &value, by=
tes);
> > > > >    }
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i9=
15/gvt/vgpu.c
> > > > > index 8fa9b31a2484..e0e073045d83 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> > > > > +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> > > > > @@ -558,6 +558,9 @@ void intel_gvt_reset_vgpu_locked(struct intel=
_vgpu *vgpu, bool dmlr,
> > > > >    	intel_vgpu_reset_submission(vgpu, resetting_eng);
> > > > >    	/* full GPU reset or device model level reset */
> > > > >    	if (engine_mask =3D=3D ALL_ENGINES || dmlr) {
> > > > > +		struct intel_engine_cs *engine;
> > > > > +		intel_engine_mask_t tmp;
> > > > > +
> > > > >    		intel_vgpu_select_submission_ops(vgpu, ALL_ENGINES, 0);
> > > > >    		if (engine_mask =3D=3D ALL_ENGINES)
> > > > >    			intel_vgpu_invalidate_ppgtt(vgpu);
> > > > > @@ -588,6 +591,10 @@ void intel_gvt_reset_vgpu_locked(struct inte=
l_vgpu *vgpu, bool dmlr,
> > > > >    			else
> > > > >    				vgpu->pv_notified =3D false;
> > > > >    		}
> > > > > +
> > > > > +		for_each_engine_masked(engine, gvt->gt, engine_mask, tmp) {
> > > > > +			vgpu->hws_pga[engine->id] =3D 0;
> > > > > +		}
> > > > >    	}
> > > > >    	vgpu->resetting_eng =3D 0;
> > > > > --=20
> > > > > 2.28.0
> > > > >=20
> > > > > _______________________________________________
> > > > > intel-gvt-dev mailing list
> > > > > intel-gvt-dev@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> > > --=20
> > > Best Regards,
> > > Colin Xu
> > >=20
> --=20
> Best Regards,
> Colin Xu
>=20

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX1hA3QAKCRCxBBozTXgY
J9N2AJ4iC4TMLU3Y48Jz1aolXf/dDj0hegCdGARVFBGe4DGLZ0ms67UbB0A7RxU=
=jb2F
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--

--===============0745303510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0745303510==--
