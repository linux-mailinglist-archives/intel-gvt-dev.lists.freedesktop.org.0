Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4CA6E110
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Jul 2019 08:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0656E584;
	Fri, 19 Jul 2019 06:37:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1419A6E584
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 Jul 2019 06:37:58 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 23:37:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,281,1559545200"; 
 d="asc'?scan'208";a="367166291"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga005.fm.intel.com with ESMTP; 18 Jul 2019 23:37:55 -0700
Date: Fri, 19 Jul 2019 14:34:43 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Kechen Lu <kechen.lu@intel.com>
Subject: Re: [RFC PATCH v4 6/6] drm/i915/gvt: Add cursor plane reg update
 trap emulation handler
Message-ID: <20190719063443.GE28809@zhen-hp.sh.intel.com>
References: <20190718155640.25928-1-kechen.lu@intel.com>
 <20190718155640.25928-7-kechen.lu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190718155640.25928-7-kechen.lu@intel.com>
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
Cc: kevin.tian@intel.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhenyuw@linux.intel.com, hang.yuan@intel.com, alex.williamson@redhat.com,
 zhiyuan.lv@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com, kraxel@redhat.com
Content-Type: multipart/mixed; boundary="===============0382120050=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0382120050==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DqhR8hV3EnoxUkKN"
Content-Disposition: inline


--DqhR8hV3EnoxUkKN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.07.18 23:56:40 +0800, Kechen Lu wrote:
> This patch adds the cursor plane CURBASE reg update trap handler
> in order to :
>=20
> - Deliver the cursor refresh event at each vblank emulation,
> the flip_done_event bit check is supposed to do here. If cursor
> plane updates happen, deliver the cursor refresh events.
>=20
> - Support the sync and async cursor plane updates and
> corresponding cursor plane flip interrupts reporting.
>=20
> Signed-off-by: Kechen Lu <kechen.lu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display.c   | 11 +++++++++++
>  drivers/gpu/drm/i915/gvt/handlers.c  | 27 ++++++++++++++++++++++++---
>  drivers/gpu/drm/i915/gvt/interrupt.c |  7 +++++++
>  drivers/gpu/drm/i915/gvt/interrupt.h |  3 +++
>  4 files changed, 45 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index df52e4b4c1b0..a0accc51d44f 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -399,6 +399,7 @@ static void emulate_vblank_on_pipe(struct intel_vgpu =
*vgpu, int pipe)
>  		[PIPE_C] =3D PIPE_C_VBLANK,
>  	};
>  	int pri_flip_event =3D SKL_FLIP_EVENT(pipe, PLANE_PRIMARY);
> +	int cur_flip_event =3D CURSOR_A_FLIP_DONE + pipe;
>  	int event;
>  	u64 eventfd_signal_val =3D 0;
>  	static int pageflip_count;
> @@ -417,6 +418,11 @@ static void emulate_vblank_on_pipe(struct intel_vgpu=
 *vgpu, int pipe)
>  			pageflip_count +=3D PAGEFLIP_INC_COUNT;
>  		}
> =20
> +		if (event =3D=3D cur_flip_event) {
> +			eventfd_signal_val +=3D DISPLAY_CUR_REFRESH_EVENT_INC;
> +			pageflip_count +=3D PAGEFLIP_INC_COUNT;
> +		}
> +
>  		intel_vgpu_trigger_virtual_event(vgpu, event);
>  	}
> =20
> @@ -430,6 +436,11 @@ static void emulate_vblank_on_pipe(struct intel_vgpu=
 *vgpu, int pipe)
>  			eventfd_signal_val +=3D DISPLAY_PRI_REFRESH_EVENT_INC;
>  			pageflip_count +=3D PAGEFLIP_INC_COUNT;
>  		}
> +
> +		if (event =3D=3D PLANE_CURSOR) {
> +			eventfd_signal_val +=3D DISPLAY_CUR_REFRESH_EVENT_INC;
> +			pageflip_count +=3D PAGEFLIP_INC_COUNT;
> +		}
>  	}
> =20
>  	if (--pageflip_count < 0) {
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 6ad29c4f08e5..821ff88977d8 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -767,6 +767,27 @@ static int pri_surf_mmio_write(struct intel_vgpu *vg=
pu, unsigned int offset,
>  	return 0;
>  }
> =20
> +#define CURBASE_TO_PIPE(reg) \
> +	calc_index(offset, _CURABASE, _CURBBASE, 0, CURBASE(PIPE_C))
> +
> +static int cur_surf_mmio_write(struct intel_vgpu *vgpu, unsigned int off=
set,
> +		void *p_data, unsigned int bytes)
> +{
> +	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> +	u32 pipe =3D CURBASE_TO_PIPE(offset);
> +	int event =3D CURSOR_A_FLIP_DONE + pipe;
> +
> +	write_vreg(vgpu, offset, p_data, bytes);
> +
> +	if (vgpu_vreg_t(vgpu, CURCNTR(pipe)) & PLANE_CTL_ASYNC_FLIP) {
> +		intel_vgpu_trigger_virtual_event(vgpu, event);
> +		set_bit(PLANE_CURSOR, vgpu->display.async_flip_event[pipe]);
> +	} else
> +		set_bit(event, vgpu->irq.flip_done_event[pipe]);
> +
> +	return 0;
> +}
> +
>  #define SPRSURF_TO_PIPE(offset) \
>  	calc_index(offset, _SPRA_SURF, _SPRB_SURF, 0, SPRSURF(PIPE_C))
> =20
> @@ -1955,9 +1976,9 @@ static int init_generic_mmio_info(struct intel_gvt =
*gvt)
>  	MMIO_D(CURPOS(PIPE_B), D_ALL);
>  	MMIO_D(CURPOS(PIPE_C), D_ALL);
> =20
> -	MMIO_D(CURBASE(PIPE_A), D_ALL);
> -	MMIO_D(CURBASE(PIPE_B), D_ALL);
> -	MMIO_D(CURBASE(PIPE_C), D_ALL);
> +	MMIO_DH(CURBASE(PIPE_A), D_ALL, NULL, cur_surf_mmio_write);
> +	MMIO_DH(CURBASE(PIPE_B), D_ALL, NULL, cur_surf_mmio_write);
> +	MMIO_DH(CURBASE(PIPE_C), D_ALL, NULL, cur_surf_mmio_write);

I think we should also track cursor pos change right?

> =20
>  	MMIO_D(CUR_FBC_CTL(PIPE_A), D_ALL);
>  	MMIO_D(CUR_FBC_CTL(PIPE_B), D_ALL);
> diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/=
gvt/interrupt.c
> index 951681813230..9c2b9d2e1529 100644
> --- a/drivers/gpu/drm/i915/gvt/interrupt.c
> +++ b/drivers/gpu/drm/i915/gvt/interrupt.c
> @@ -113,6 +113,9 @@ static const char * const irq_name[INTEL_GVT_EVENT_MA=
X] =3D {
>  	[SPRITE_A_FLIP_DONE] =3D "Sprite Plane A flip done",
>  	[SPRITE_B_FLIP_DONE] =3D "Sprite Plane B flip done",
>  	[SPRITE_C_FLIP_DONE] =3D "Sprite Plane C flip done",
> +	[CURSOR_A_FLIP_DONE] =3D "Cursor Plane A flip done",
> +	[CURSOR_B_FLIP_DONE] =3D "Cursor Plane B flip done",
> +	[CURSOR_C_FLIP_DONE] =3D "Cursor Plane C flip done",
> =20
>  	[PCU_THERMAL] =3D "PCU Thermal Event",
>  	[PCU_PCODE2DRIVER_MAILBOX] =3D "PCU pcode2driver mailbox event",
> @@ -593,6 +596,10 @@ static void gen8_init_irq(
>  		SET_BIT_INFO(irq, 4, SPRITE_A_FLIP_DONE, INTEL_GVT_IRQ_INFO_DE_PIPE_A);
>  		SET_BIT_INFO(irq, 4, SPRITE_B_FLIP_DONE, INTEL_GVT_IRQ_INFO_DE_PIPE_B);
>  		SET_BIT_INFO(irq, 4, SPRITE_C_FLIP_DONE, INTEL_GVT_IRQ_INFO_DE_PIPE_C);
> +
> +		SET_BIT_INFO(irq, 6, CURSOR_A_FLIP_DONE, INTEL_GVT_IRQ_INFO_DE_PIPE_A);
> +		SET_BIT_INFO(irq, 6, CURSOR_B_FLIP_DONE, INTEL_GVT_IRQ_INFO_DE_PIPE_B);
> +		SET_BIT_INFO(irq, 6, CURSOR_C_FLIP_DONE, INTEL_GVT_IRQ_INFO_DE_PIPE_C);
>  	}
> =20
>  	/* GEN8 interrupt PCU events */
> diff --git a/drivers/gpu/drm/i915/gvt/interrupt.h b/drivers/gpu/drm/i915/=
gvt/interrupt.h
> index 5313fb1b33e1..158f1c7a23f2 100644
> --- a/drivers/gpu/drm/i915/gvt/interrupt.h
> +++ b/drivers/gpu/drm/i915/gvt/interrupt.h
> @@ -92,6 +92,9 @@ enum intel_gvt_event_type {
>  	SPRITE_A_FLIP_DONE,
>  	SPRITE_B_FLIP_DONE,
>  	SPRITE_C_FLIP_DONE,
> +	CURSOR_A_FLIP_DONE,
> +	CURSOR_B_FLIP_DONE,
> +	CURSOR_C_FLIP_DONE,
> =20
>  	PCU_THERMAL,
>  	PCU_PCODE2DRIVER_MAILBOX,
> --=20
> 2.17.1
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--DqhR8hV3EnoxUkKN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXTFkgwAKCRCxBBozTXgY
J4d8AJ99urqsjYPF0voL37JuWJgmO27bhACfdInwRS5Cx4nZdmSF129gjIl2A38=
=ka4J
-----END PGP SIGNATURE-----

--DqhR8hV3EnoxUkKN--

--===============0382120050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0382120050==--
