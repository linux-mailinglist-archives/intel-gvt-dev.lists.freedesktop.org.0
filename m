Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC4662099E
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Nov 2022 07:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121F010E0F0;
	Tue,  8 Nov 2022 06:39:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B00310E0F0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Nov 2022 06:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667889586; x=1699425586;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=fk53m+pi6SFxU8n9j+oS9DeyQ/Em9ioEFA7IQJ8byR4=;
 b=KfeskFlslU8vAny+MHwd7pQCjYaNtV1qNctEGTYkMk+Jye8+qeff9kHl
 Ug/eaLVGyjE4fMjkeLZj3kjF9XqFb8YZFTUHyFE600gOygTWzmlgp2psK
 lRgKdzbdIgkPkvSpDhm5Ja4BFRiXWgau6HElcePLsRTdiH04p+pF47xwB
 6RIa7Bj+jw+tEkmXUvhp3cHhrEZRP3ExyWs1bw4fIj2d9NGzPhuaDwG+7
 aFT/mesET/w8sXxTMd3GbWszRyrn9QzSTbmwrAwS00oapS9Mq2nMI10ia
 U1C+Q+CtoyCYrRTqSBabBjaRjrGmZLHcHrJW0UVuLSfhhisqWMJTXKAmr A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="309328034"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
 d="asc'?scan'208";a="309328034"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 22:39:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="699803041"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
 d="asc'?scan'208";a="699803041"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga008.fm.intel.com with ESMTP; 07 Nov 2022 22:39:24 -0800
Date: Tue, 8 Nov 2022 14:38:59 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zhi Wang <zhi.wang.linux2@gmail.com>
Subject: Re: [PATCH 3/3] drm/i915/gvt: show the vGPU status in debugfs
Message-ID: <20221108063859.GI30028@zhen-hp.sh.intel.com>
References: <20221104145652.1570-1-zhi.a.wang@intel.com>
 <20221104145652.1570-3-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="TiqCXmo5T1hvSQQg"
Content-Disposition: inline
In-Reply-To: <20221104145652.1570-3-zhi.a.wang@intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.11.04 14:56:52 +0000, Zhi Wang wrote:
> After using atomic operation to change the vGPU status, showing the vGPU
> status in the debugfs requires to be updated. This patch adds back the
> function of showing vGPU status in the debugfs.
>=20
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/debugfs.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gv=
t/debugfs.c
> index bb301bc974a4..a930ba89ac86 100644
> --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> @@ -151,6 +151,20 @@ DEFINE_SIMPLE_ATTRIBUTE(vgpu_scan_nonprivbb_fops,
>  			vgpu_scan_nonprivbb_get, vgpu_scan_nonprivbb_set,
>  			"0x%llx\n");
> =20
> +static int vgpu_status_get(void *data, u64 *val)
> +{
> +	struct intel_vgpu *vgpu =3D (struct intel_vgpu *)data;
> +

Need *val =3D 0;

> +	if (test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
> +		*val |=3D (1 << INTEL_VGPU_STATUS_ATTACHED);
> +	if (test_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status))
> +		*val |=3D (1 << INTEL_VGPU_STATUS_ACTIVE);
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx=
\n");
> +
>  /**
>   * intel_gvt_debugfs_add_vgpu - register debugfs entries for a vGPU
>   * @vgpu: a vGPU
> @@ -166,6 +180,8 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vg=
pu)
>  			    &vgpu_mmio_diff_fops);
>  	debugfs_create_file("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
>  			    &vgpu_scan_nonprivbb_fops);
> +	debugfs_create_file("status", 0644, vgpu->debugfs, vgpu,
> +			    &vgpu_status_fops);
>  }
> =20
>  /**
> --=20
> 2.25.1
>=20

With above change.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY2n5gwAKCRCxBBozTXgY
JzaoAJ9djBdb2ZeGIQ4uJ1P3DsO1dlJyYwCfWipj8H6E1mNC3JBCevvK1N/BIiU=
=+Da/
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--
