Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 871CD189561
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Mar 2020 06:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4E56E864;
	Wed, 18 Mar 2020 05:35:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C5A6E864
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 18 Mar 2020 05:35:39 +0000 (UTC)
IronPort-SDR: 4cTbS3YwRyvJ0drGRluJue1tnhcZSjmLLQtjeTyJXdIBUtFg07tI0B3cDTyUETP/EbnwsTC7C/
 I3QVnPwDR8KA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 22:35:38 -0700
IronPort-SDR: JrdQNTyYAUb3L+h9ReSsPhRN5tUu21FDEAUnKBvPyZjBAPqQQVx5FAfo4QEfV0zsHKNOyaMJ31
 Fy+w0WOwciyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,566,1574150400"; 
 d="asc'?scan'208";a="391326077"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga004.jf.intel.com with ESMTP; 17 Mar 2020 22:35:37 -0700
Date: Wed, 18 Mar 2020 13:22:55 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Xu, Colin" <colin.xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Set up-limit of BB size to 2GB.
Message-ID: <20200318052255.GT8880@zhen-hp.sh.intel.com>
References: <20190603064744.7298-1-colin.xu@intel.com>
 <20190604075156.GQ9684@zhen-hp.sh.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190604075156.GQ9684@zhen-hp.sh.intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Colin Xu <colin.xu@intel.com>
Content-Type: multipart/mixed; boundary="===============0122980317=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0122980317==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i7KxW38SoMauyveo"
Content-Disposition: inline


--i7KxW38SoMauyveo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On 2019.06.04 15:51:56 +0800, Zhenyu Wang wrote:
> On 2019.06.03 14:47:44 +0800, Colin Xu wrote:
> > Set default maximum batch buffer size to 2GB to prevent overflow.
> >=20
> > Signed-off-by: Colin Xu <colin.xu@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/cmd_parser.c | 6 ++++++
> >  drivers/gpu/drm/i915/gvt/gvt.h        | 2 ++
> >  2 files changed, 8 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i9=
15/gvt/cmd_parser.c
> > index 7c7b711942cd..02cedb34b859 100644
> > --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > @@ -1710,6 +1710,12 @@ static int find_bb_size(struct parser_exec_state=
 *s, unsigned long *bb_size)
> >  		}
> >  		cmd_len =3D get_cmd_length(info, cmd) << 2;
> >  		*bb_size +=3D cmd_len;
> > +		if (*bb_size > INTEL_GVT_MAX_BB_LENGTH_DEFAULT) {
> > +			gvt_vgpu_err("BB len exceeds max limit 0x%llx\n",
> > +				     INTEL_GVT_MAX_BB_LENGTH_DEFAULT);
> > +			*bb_size =3D 0;
> > +			return -EOVERFLOW;
> > +		}
> >  		gma +=3D cmd_len;
> >  	} while (!bb_end);
> > =20
> > diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/=
gvt.h
> > index b54f2bdc13a4..a5e3ec97993b 100644
> > --- a/drivers/gpu/drm/i915/gvt/gvt.h
> > +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> > @@ -231,6 +231,8 @@ struct intel_vgpu {
> >  	u32 scan_nonprivbb;
> >  };
> > =20
> > +#define INTEL_GVT_MAX_BB_LENGTH_DEFAULT	0x80000000
> > +
>=20
> Could we use more readable form e.g GB(2)?
>=20
> >  /* validating GM healthy status*/
> >  #define vgpu_is_vm_unhealthy(ret_val) \
> >  	(((ret_val) =3D=3D -EBADRQC) || ((ret_val) =3D=3D -EFAULT))
> > --=20

Review Yan's another patch reminds of this one, looks we didn't follow up y=
et.
This should still be a good guard right?

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--i7KxW38SoMauyveo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXnGwLwAKCRCxBBozTXgY
J0XQAJ95TFRmeIYJZC49CkIXWaeRee/IsgCgmZ7iWfepJDmEP33BCzMmlJQ1U0E=
=16wV
-----END PGP SIGNATURE-----

--i7KxW38SoMauyveo--

--===============0122980317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0122980317==--
