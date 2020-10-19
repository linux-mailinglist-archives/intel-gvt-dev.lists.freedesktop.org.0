Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E776292535
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 19 Oct 2020 12:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168336E90A;
	Mon, 19 Oct 2020 10:12:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083906E908;
 Mon, 19 Oct 2020 10:12:31 +0000 (UTC)
IronPort-SDR: lMQxmViRERj5z1Wa5HXJe0ZdT6Xoa4HVVPwd6KOvuM+TnNziJWn7icXKuNaBuaw7oopv2LwJjH
 4woJy0sPAJtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="167077833"
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
 d="asc'?scan'208";a="167077833"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 03:12:31 -0700
IronPort-SDR: QAkhykOynkRPNmOtZtcFg+mxpnuKty8IksG3Fe2wADXJqyyGG9TbdIsI9NIy2It7HTl2v6s8vq
 QV9qS45c6kAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
 d="asc'?scan'208";a="347380690"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 19 Oct 2020 03:12:29 -0700
Date: Mon, 19 Oct 2020 17:51:44 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] drm/i915: Detecting Vt-d when running as guest os
Message-ID: <20201019095143.GT27141@zhen-hp.sh.intel.com>
References: <alpine.DEB.2.21.2010161716270.29164@manul.sfritsch.de>
 <20201019091909.GQ27141@zhen-hp.sh.intel.com>
 <160310145891.29774.10656325770923178249@build.alporthouse.com>
MIME-Version: 1.0
In-Reply-To: <160310145891.29774.10656325770923178249@build.alporthouse.com>
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
Cc: Xiong Zhang <xiong.y.zhang@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 intel-gfx@lists.freedesktop.org, Stefan Fritsch <sf@sfritsch.de>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: multipart/mixed; boundary="===============0958653656=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0958653656==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wc6dtGz1CZgs+5WP"
Content-Disposition: inline


--wc6dtGz1CZgs+5WP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.10.19 10:57:38 +0100, Chris Wilson wrote:
> Quoting Zhenyu Wang (2020-10-19 10:19:09)
> > On 2020.10.16 17:19:19 +0200, Stefan Fritsch wrote:
> > > Hi,
> > >=20
> > > if Linux is running as a guest and the host is doing igd-pass-thorugh=
 with=20
> > > VT-d enabled, the i915 driver does not work all that great. The most=
=20
> > > obvious problem is that there are dozens of 'Fault errors on pipe A'=
=20
> > > errrors logged per second, but depending on the hardware there can be=
=20
> > > other issues, too. I will send a patch to rate-limit that message in =
a=20
> > > separate mail.
> > >=20
> > > The i915 has various quirks for VT-d and these should be enabled even=
 if=20
> > > Linux is running as a guest and does itself have iommu enabled. I hav=
e=20
> > > checked that making intel_vtd_active() form i915_drv.h return true ma=
kes=20
> > > the error messages go away.  How could Linux detect this situation? M=
aybe=20
> > > simply check the Hypervisor cpuid bit? Or would you prefer a module=
=20
> > > parameter, or a combination of both? Or is there another way to detec=
t=20
> > > that VT-d is enabled for the igd device?
> > >=20
> >=20
> > I think that's right, although I haven't tried to force intel_vtd_activ=
e()
> > for guest, but I did see those fault errors on some machine. You can use
> > hypervisor cpuid bit, and need to seperate case for GVT which is detect=
ed by
> > intel_vgpu_active(), but I'm not sure if this should be taken in nested=
 case,
> > suppose those quirks should still work?
>=20
> Do we need it for gvt since the guest has no access to HW, so the host
> should be doing all the vt'd w/a. (In particular, the scanout overfetch
> causing the problems here.) E.g. in gvt, the guest framebuffer is
> transported via magics to the host, and the host creates a GGTT entry
> for it.

GVT doesn't require vt-d at all. Current gvt display is fully virtualized,
so if by any way that map guest framebuffer directly on host display, it
should still be handled by i915 with possible vt-d workaround for alignment.
And looks some other vt-d w/a just brings unnecessary actions for gvt guest.
So I think we should stick with real vt-d case.

>=20
> For detecting a hypervisor, following on from the KVM_CPUID_SIGNATURE
> hint, we find arch/x86 does detect_hypervisor_platform() at load which
> populates EXPORT_SYMBOL(x86_hyper_type)
>=20
> So something like,
>=20
> #include <asm/hypervisor.h>
> @@ -1764,7 +1766,7 @@ static inline bool intel_vtd_active(void)
>         if (intel_iommu_gfx_mapped)
>                 return true;
>  #endif
> -       return false;
> +       return x86_hyper_type !=3D X86_HYPER_NATIVE;
>  }
>=20
> should work.
> -Chris

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--wc6dtGz1CZgs+5WP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX41hrwAKCRCxBBozTXgY
JwPZAJ9WGmbRqdCeqiAbDOwJmxfWXH3ChACbB2vMbNGGMXZRAexPUNv7O/OPZ7U=
=D2Sl
-----END PGP SIGNATURE-----

--wc6dtGz1CZgs+5WP--

--===============0958653656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0958653656==--
