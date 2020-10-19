Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13A82924BD
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 19 Oct 2020 11:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9201A6E8DF;
	Mon, 19 Oct 2020 09:39:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E886E8DF;
 Mon, 19 Oct 2020 09:39:56 +0000 (UTC)
IronPort-SDR: ZPTpCuL7wippWyqR8pHkwAqC2RdNAxohwGBZQ0+HXLCT4tZySGRXPmp4zJRPoYJPsMNIKStYGd
 BiF1CidLLFuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="167073074"
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
 d="asc'?scan'208";a="167073074"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 02:39:55 -0700
IronPort-SDR: 7mzmnKM9OxVJ95ACLB9bWRMpBzrUnTMR1ifp4GnadhDA4TYYNYFWxK+SCPnZmu5xmsd5xw2R47
 YIK0E2roO1fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
 d="asc'?scan'208";a="347373974"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 19 Oct 2020 02:39:54 -0700
Date: Mon, 19 Oct 2020 17:19:09 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Stefan Fritsch <sf@sfritsch.de>
Subject: Re: [Intel-gfx] drm/i915: Detecting Vt-d when running as guest os
Message-ID: <20201019091909.GQ27141@zhen-hp.sh.intel.com>
References: <alpine.DEB.2.21.2010161716270.29164@manul.sfritsch.de>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010161716270.29164@manul.sfritsch.de>
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
Cc: Xiong Zhang <xiong.y.zhang@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1341317811=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1341317811==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XFI+TFG+M3u0jUjZ"
Content-Disposition: inline


--XFI+TFG+M3u0jUjZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.10.16 17:19:19 +0200, Stefan Fritsch wrote:
> Hi,
>=20
> if Linux is running as a guest and the host is doing igd-pass-thorugh wit=
h=20
> VT-d enabled, the i915 driver does not work all that great. The most=20
> obvious problem is that there are dozens of 'Fault errors on pipe A'=20
> errrors logged per second, but depending on the hardware there can be=20
> other issues, too. I will send a patch to rate-limit that message in a=20
> separate mail.
>=20
> The i915 has various quirks for VT-d and these should be enabled even if=
=20
> Linux is running as a guest and does itself have iommu enabled. I have=20
> checked that making intel_vtd_active() form i915_drv.h return true makes=
=20
> the error messages go away.  How could Linux detect this situation? Maybe=
=20
> simply check the Hypervisor cpuid bit? Or would you prefer a module=20
> parameter, or a combination of both? Or is there another way to detect=20
> that VT-d is enabled for the igd device?
>=20

I think that's right, although I haven't tried to force intel_vtd_active()
for guest, but I did see those fault errors on some machine. You can use
hypervisor cpuid bit, and need to seperate case for GVT which is detected by
intel_vgpu_active(), but I'm not sure if this should be taken in nested cas=
e,
suppose those quirks should still work?

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--XFI+TFG+M3u0jUjZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX41aDQAKCRCxBBozTXgY
J2abAJ9FBRfy/XCAuzyBXvZ7qYdAtg5qXACgiCm75OZX0nqudHKex0UjrVbsUlw=
=vIUZ
-----END PGP SIGNATURE-----

--XFI+TFG+M3u0jUjZ--

--===============1341317811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1341317811==--
