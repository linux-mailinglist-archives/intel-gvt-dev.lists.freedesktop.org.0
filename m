Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272B64C0ECC
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 23 Feb 2022 10:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C614610F1C9;
	Wed, 23 Feb 2022 09:02:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388E510F1CA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Feb 2022 09:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645606977; x=1677142977;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Hy/0GKHKejf/NNs0DZlwRaXDA60FrRTRV3Mi5EfN6x4=;
 b=AbGP3xgjsTwKfKSkBGICaybPc4nB0NcWiWJO2nyz0rP7FbBTGZZt84dX
 jUhHW6MppsHYsZCpiZVYMzMCKgTNr+kVMhN09B/dQozKC1P4VfzxnxxKh
 YX2W/xjW7ao2jHdJiasXv2PuHrvgCHXqASOE1eR9lHNxK4qi6GYLie4fv
 SgZ1js1zFen2J6bPDCj05Y9PWCyQDjscumTPOBr8kzhg8A/s+fPqgbNxC
 pQV9eu5L6iJpWkB/Hxy5Re1keJHWynMXA96U5zqt7/vKt0zgOaBDnWMXN
 H8hqTyKGXt5ZPmnkj/RKWCb9TdjgP8JwY1TUwQw3mgJm+slt1YAQDdnAO g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="315146590"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
 d="asc'?scan'208";a="315146590"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 01:02:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
 d="asc'?scan'208";a="543247107"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.59])
 by fmsmga007.fm.intel.com with ESMTP; 23 Feb 2022 01:02:54 -0800
Date: Wed, 23 Feb 2022 16:43:18 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: add the missing mdev attribute "name"
Message-ID: <20220223084318.GG1100@zhen-hp.sh.intel.com>
References: <20220222150532.9090-1-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="KrHCbChajFcK0yQE"
Content-Disposition: inline
In-Reply-To: <20220222150532.9090-1-zhi.a.wang@intel.com>
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
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--KrHCbChajFcK0yQE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.02.22 10:05:32 -0500, Zhi Wang wrote:
> The mdev attribute "name" is required by some middle software, e.g.
> KubeVirt, an open source SW that manages VM on Kubernetes cluster uses
> the mdev sysfs directory/file structure to discover mediated device in
> nodes in the cluster.
>=20
> v2:
>=20
> - Fix the missing defination in gvt_type_attrs. (Zhenyu)
>=20
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Hui Chun Ong <hui.chun.ong@intel.com>
> Cc: Terrence Xu <terrence.xu@intel.com>
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index 20b82fb036f8..da9d9f05985f 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -186,14 +186,30 @@ static ssize_t description_show(struct mdev_type *m=
type,
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
>  	&mdev_type_attr_device_api.attr,
>  	&mdev_type_attr_description.attr,
> +	&mdev_type_attr_name.attr,
>  	NULL,
>  };
> =20

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks!

--KrHCbChajFcK0yQE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYhXzoQAKCRCxBBozTXgY
J5pFAKCRPs9uxmeCoBOY37mUyZHz2vlFFgCgk/SwsYEzwhy04gwGyyIhNX0pmR4=
=MmPu
-----END PGP SIGNATURE-----

--KrHCbChajFcK0yQE--
