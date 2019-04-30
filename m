Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9363CEECE
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 30 Apr 2019 04:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2432689369;
	Tue, 30 Apr 2019 02:39:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD6289369
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Apr 2019 02:39:15 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 19:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,412,1549958400"; 
 d="asc'?scan'208";a="341972180"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga005.fm.intel.com with ESMTP; 29 Apr 2019 19:39:14 -0700
Date: Tue, 30 Apr 2019 10:39:01 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Gimbitskii, Aleksei" <aleksei.gimbitskii@intel.com>
Subject: Re: [PATCH v3 5/6] drm/i915/gvt: Assign NULL to the pointer after
 memory free.
Message-ID: <20190430023901.GI12913@zhen-hp.sh.intel.com>
References: <20190423120413.30929-1-aleksei.gimbitskii@intel.com>
 <20190423120413.30929-6-aleksei.gimbitskii@intel.com>
 <20190425031406.GX17995@zhen-hp.sh.intel.com>
 <40634fbc-3569-e5c4-2741-3a40ab67e198@intel.com>
 <1EB9BA72F2F5144BB1A5812E11248EAD18E13437@irsmsx105.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1EB9BA72F2F5144BB1A5812E11248EAD18E13437@irsmsx105.ger.corp.intel.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Xu, Colin" <colin.xu@intel.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1208221306=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1208221306==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sLx0z+5FKKtIVDwd"
Content-Disposition: inline


--sLx0z+5FKKtIVDwd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.04.29 12:22:06 +0000, Gimbitskii, Aleksei wrote:
> Thanks for the reminding and sorry that I forget to mention that.  But we=
 think that if we add this error message here, probably we also need to add=
 the error message in other similar places, which seems a bit over too much=
=2E How about we still follow the existing style?
>

Then instead of use-after-free, just remove that error message,
and provide cleaner error message in future if helpful.

> -----Original Message-----
> From: Xu, Colin=20
> Sent: Thursday, April 25, 2019 8:32 AM
> To: Gimbitskii, Aleksei <aleksei.gimbitskii@intel.com>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>; intel-gvt-dev@lists.freedeskto=
p.org; Wang, Zhi A <zhi.a.wang@intel.com>
> Subject: Re: [PATCH v3 5/6] drm/i915/gvt: Assign NULL to the pointer afte=
r memory free.
>=20
>=20
> On 2019-04-25 11:14, Zhenyu Wang wrote:
> > On 2019.04.23 15:04:12 +0300, Aleksei Gimbitskii wrote:
> >> The klocwork static code analyzer complains about using pointer after=
=20
> >> being freed, because further we pass it to the gvt_vgpu_err() function.
> >> Assign pointer to be NULL intentionaly, to meet requirements of the=20
> >> code analyzer.
> >>
> >> This patch fixed the issue #648 reported as error by klocwork.
> >>
> >> Signed-off-by: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
> >> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> >> Cc: Zhi Wang <zhi.a.wang@intel.com>
> >> ---
> >>   drivers/gpu/drm/i915/gvt/gtt.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c=20
> >> b/drivers/gpu/drm/i915/gvt/gtt.c index 061499a38f4d..927753a59a1e=20
> >> 100644
> >> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> >> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> >> @@ -1106,6 +1106,7 @@ static struct intel_vgpu_ppgtt_spt=20
> >> *ppgtt_populate_spt_by_guest_entry(
> >>  =20
> >>   err_free_spt:
> >>   	ppgtt_free_spt(spt);
> >> +	spt =3D NULL;
> >>   err:
> >>   	gvt_vgpu_err("fail: shadow page %p guest entry 0x%llx type %d\n",
> >>   		     spt, we->val64, we->type);
> > I think we can remove this error message which doesn't tell the reason=
=20
> > to fail at all, but have err message in earlier path where we can=20
> > indicate the reason.
>=20
> Seem like miss my comment in v2.
>=20
> I would suggest add different msg before the two "goto err_free_spt",
>=20
> then in this err_free_stp label you could just return without print the
>=20
> same msg as err. Otherwise you can't tell the reason from the same err.
>=20
> >
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
>=20
> --
> Best Regards,
> Colin Xu
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--sLx0z+5FKKtIVDwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXMe1RQAKCRCxBBozTXgY
JzS3AJ9KUkkWM+cEwvCbkYgwEKtCJId5wACdFF65RPR3IV4C7POl3GjcGJnpVPo=
=4lgK
-----END PGP SIGNATURE-----

--sLx0z+5FKKtIVDwd--

--===============1208221306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1208221306==--
