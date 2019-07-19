Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D0D6E0E2
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Jul 2019 08:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175D76E583;
	Fri, 19 Jul 2019 06:08:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D9F6E583
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 Jul 2019 06:08:57 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 23:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,281,1559545200"; 
 d="asc'?scan'208";a="170814276"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga003.jf.intel.com with ESMTP; 18 Jul 2019 23:08:53 -0700
Date: Fri, 19 Jul 2019 14:05:40 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Kechen Lu <kechen.lu@intel.com>
Subject: Re: [RFC PATCH v4 1/6] vfio: Define device specific irq type
 capability
Message-ID: <20190719060540.GC28809@zhen-hp.sh.intel.com>
References: <20190718155640.25928-1-kechen.lu@intel.com>
 <20190718155640.25928-2-kechen.lu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190718155640.25928-2-kechen.lu@intel.com>
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
 zhenyuw@linux.intel.com, Tina Zhang <tina.zhang@intel.com>,
 Eric Auger <eric.auger@redhat.com>, alex.williamson@redhat.com,
 kraxel@redhat.com, hang.yuan@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com, zhiyuan.lv@intel.com
Content-Type: multipart/mixed; boundary="===============1462914583=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1462914583==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1ccMZA6j1vT5UqiK"
Content-Disposition: inline


--1ccMZA6j1vT5UqiK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.07.18 23:56:35 +0800, Kechen Lu wrote:
> From: Tina Zhang <tina.zhang@intel.com>
>=20
> Cap the number of irqs with fixed indexes and use capability chains
> to chain device specific irqs.
>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  include/uapi/linux/vfio.h | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 8f10748dac79..be6adab4f759 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -448,11 +448,27 @@ struct vfio_irq_info {
>  #define VFIO_IRQ_INFO_MASKABLE		(1 << 1)
>  #define VFIO_IRQ_INFO_AUTOMASKED	(1 << 2)
>  #define VFIO_IRQ_INFO_NORESIZE		(1 << 3)
> +#define VFIO_IRQ_INFO_FLAG_CAPS		(1 << 4) /* Info supports caps */
>  	__u32	index;		/* IRQ index */
>  	__u32	count;		/* Number of IRQs within this index */
> +	__u32	cap_offset;	/* Offset within info struct of first cap */

This still breaks ABI as argsz would be updated with this new field, so it =
would
cause compat issue. I think my last suggestion was to assume cap list start=
s after
vfio_irq_info.

>  };
>  #define VFIO_DEVICE_GET_IRQ_INFO	_IO(VFIO_TYPE, VFIO_BASE + 9)
> =20
> +/*
> + * The irq type capability allows irqs unique to a specific device or
> + * class of devices to be exposed.
> + *
> + * The structures below define version 1 of this capability.
> + */
> +#define VFIO_IRQ_INFO_CAP_TYPE      3
> +
> +struct vfio_irq_info_cap_type {
> +	struct vfio_info_cap_header header;
> +	__u32 type;     /* global per bus driver */
> +	__u32 subtype;  /* type specific */
> +};
> +
>  /**
>   * VFIO_DEVICE_SET_IRQS - _IOW(VFIO_TYPE, VFIO_BASE + 10, struct vfio_ir=
q_set)
>   *
> @@ -554,7 +570,8 @@ enum {
>  	VFIO_PCI_MSIX_IRQ_INDEX,
>  	VFIO_PCI_ERR_IRQ_INDEX,
>  	VFIO_PCI_REQ_IRQ_INDEX,
> -	VFIO_PCI_NUM_IRQS
> +	VFIO_PCI_NUM_IRQS =3D 5	/* Fixed user ABI, IRQ indexes >=3D5 use   */
> +				/* device specific cap to define content */
>  };
> =20
>  /*
> --=20
> 2.17.1
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--1ccMZA6j1vT5UqiK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXTFdtAAKCRCxBBozTXgY
J+A6AKCdu+X82qvxu8+c+G7Xf2KT4EPb+QCcDuu89yudz4pTfaN3llmqJsIf1LQ=
=mAF2
-----END PGP SIGNATURE-----

--1ccMZA6j1vT5UqiK--

--===============1462914583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1462914583==--
