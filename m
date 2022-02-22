Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C784B4BFB84
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 22 Feb 2022 16:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8E910E9AF;
	Tue, 22 Feb 2022 15:01:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E81B10E9AF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 22 Feb 2022 15:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645542090; x=1677078090;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=trAKmacdwHnlKkWR+cn5lJZtvh4useZg4zbtP4jkKhg=;
 b=lA7dxamRB06eh0RrnALfIIOelO/bI9bN2ag0QipDAnNkIhLDd0SnDyBC
 29q0sC+7wxirE1UtKG2k90l30MkmqxNHhsBcxjPtBfwzfnTWW6dLE1h+P
 YmrfuAIY892k+J3+PTeJ15EIV0XFgIX39zmhIbs3G4trjpUlGlVgpepPw
 QX9eygmZozCOXcEQjCoidqrT2DA4yEVgaW1uaA6CbBre4i4zsRp9pN+4d
 jtbRIo8C51J8UXEG3UFMVuvKUFgidLsWWkKRJupntrhAr7pSxKVO1hJ0g
 1nlAvW/kd4H3dSDndUXA9KqWTw1FAh7DmZea79ko0C+gWOMsNfzZbCGfr A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249302129"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
 d="asc'?scan'208";a="249302129"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:01:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
 d="asc'?scan'208";a="606715811"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.59])
 by fmsmga004.fm.intel.com with ESMTP; 22 Feb 2022 07:01:26 -0800
Date: Tue, 22 Feb 2022 22:41:52 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: add the missing mdev attribute "name"
Message-ID: <20220222144152.GD1100@zhen-hp.sh.intel.com>
References: <20220222114602.460-1-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="eVzOFob/8UvintSX"
Content-Disposition: inline
In-Reply-To: <20220222114602.460-1-zhi.a.wang@intel.com>
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
Cc: Terrence Xu <terrence.xu@intel.com>, Hui Chun Ong <hui.chun.ong@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com,
 zhenyuw@linux.intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--eVzOFob/8UvintSX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.02.22 06:46:02 -0500, Zhi Wang wrote:
> The mdev attribute "name" is required by some middle software, e.g.
> KubeVirt, an open source SW that manages VM on Kubernetes cluster uses
> the mdev sysfs directory/file structure to discover mediated device in
> nodes in the cluster.
>=20
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Hui Chun Ong <hui.chun.ong@intel.com>
> Cc: Terrence Xu <terrence.xu@intel.com>
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index 20b82fb036f8..306b394848b0 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -186,9 +186,24 @@ static ssize_t description_show(struct mdev_type *mt=
ype,
>  		       type->weight);
>  }
> =20
> +static ssize_t name_show(struct mdev_type *mtype,
> +			       struct mdev_type_attribute *attr, char *buf)
> +{
> +	struct intel_vgpu_type *type;
> +	struct intel_gvt *gvt =3D kdev_to_i915(mtype_get_parent_dev(mtype))->gv=
t;
> +
> +	type =3D &gvt->types[mtype_get_type_group_id(mtype)];
> +	if (!type)
> +		return 0;
> +
> +	return sprintf(buf, "%s\n", type->name);
> +}
> +
> +
>  static MDEV_TYPE_ATTR_RO(available_instances);
>  static MDEV_TYPE_ATTR_RO(device_api);
>  static MDEV_TYPE_ATTR_RO(description);
> +static MDEV_TYPE_ATTR_RO(name);
> =20
>  static struct attribute *gvt_type_attrs[] =3D {
>  	&mdev_type_attr_available_instances.attr,

Shouldn't that be included in gvt_type_attrs[] as well?

--eVzOFob/8UvintSX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iFwEARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYhT2JwAKCRCxBBozTXgY
JwefAJj2552lViZrH1g4TyFOKeTQyr99AJ4kAPnX/IFUJI/IJz9K7wjV4Cl5RA==
=FOFb
-----END PGP SIGNATURE-----

--eVzOFob/8UvintSX--
