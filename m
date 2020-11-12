Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF562AFFE3
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 12 Nov 2020 07:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E96E6E134;
	Thu, 12 Nov 2020 06:53:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB446E134
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 12 Nov 2020 06:53:26 +0000 (UTC)
IronPort-SDR: tdw39OXMnDgVZpWDKS5QVXcJgWaAU92NhDiueNTg+caab4tLI17CCSY5Uo+99fcUeJLJCcnERW
 vPehmYU/ybXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="170375243"
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
 d="asc'?scan'208";a="170375243"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 22:53:25 -0800
IronPort-SDR: VW8kCk28Weuv18RLzKj+BaZqRmJpsN6o3Fr+BGYmJJEZJ3I2A7L2yG2rXbdTh2ADTxcehVjqmd
 IYro3RTGspQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
 d="asc'?scan'208";a="360877622"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2020 22:53:22 -0800
Date: Thu, 12 Nov 2020 14:39:04 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH] i915/gvt: Set ENHANCED_FRAME_CAP bit
Message-ID: <20201112063904.GB1239@zhen-hp.sh.intel.com>
References: <20200921065807.247847-1-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200921065807.247847-1-tina.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0955153637=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0955153637==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OOq1TgGhe8eTwFBO"
Content-Disposition: inline


--OOq1TgGhe8eTwFBO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.09.21 02:58:07 -0400, Tina Zhang wrote:
> Specification says the bit7 of the DPCD MAX_LANE_COUNT (offset 0x02) must
> be set to 1 when comes to the displayport version 1.2. This patch respects
> the definition.
>=20
> W/o this patch, guest i915 driver can only set the resolution to 1024*768,
> and complains about the unsuccessful link training:
>=20
> [    5.692193] i915 0000:00:02.0: [drm] *ERROR* index 0, lane_count 1 Lin=
k Training Unsuccessful

>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index 7ba16ddfe75f..d7898e87791f 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -164,7 +164,7 @@ static unsigned char virtual_dp_monitor_edid[GVT_EDID=
_NUM][EDID_SIZE] =3D {
> =20
>  /* let the virtual display supports DP1.2 */
>  static u8 dpcd_fix_data[DPCD_HEADER_SIZE] =3D {
> -	0x12, 0x014, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
> +	0x12, 0x014, 0x84, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
>  };
> =20
>  static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
> --

OK, looks this follows spec for DPCD 1.2 requirement. Btw, pls write proper=
 component as
drm/i915/gvt in title next time.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks!

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--OOq1TgGhe8eTwFBO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX6zYiAAKCRCxBBozTXgY
J75vAJ9tWCwIzapWXJw2L5ksIUN3gWFyzACff9h9Om27ddR9XrQwnyBnyQ1IHyk=
=37cj
-----END PGP SIGNATURE-----

--OOq1TgGhe8eTwFBO--

--===============0955153637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0955153637==--
