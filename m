Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD55A355B5
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Jun 2019 06:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0C0894EB;
	Wed,  5 Jun 2019 04:06:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39253894EB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Jun 2019 04:06:23 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 21:06:22 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga006.jf.intel.com with ESMTP; 04 Jun 2019 21:06:20 -0700
Date: Wed, 5 Jun 2019 12:04:46 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v2 1/3] vfio: Use capability chains to handle device
 specific irq
Message-ID: <20190605040446.GW9684@zhen-hp.sh.intel.com>
References: <20190604095534.10337-1-tina.zhang@intel.com>
 <20190604095534.10337-2-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190604095534.10337-2-tina.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============2007378364=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2007378364==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bE2XbrxqIoa/xW9+"
Content-Disposition: inline


--bE2XbrxqIoa/xW9+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.06.04 17:55:32 +0800, Tina Zhang wrote:
> Caps the number of irqs with fixed indexes and uses capability chains
> to chain device specific irqs.
>=20
> VFIO vGPU leverages this mechanism to trigger primary plane and cursor
> plane page flip event to the user space.
>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  include/uapi/linux/vfio.h | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 02bb7ad6e986..9b5e25937c7d 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -444,11 +444,31 @@ struct vfio_irq_info {
>  #define VFIO_IRQ_INFO_MASKABLE		(1 << 1)
>  #define VFIO_IRQ_INFO_AUTOMASKED	(1 << 2)
>  #define VFIO_IRQ_INFO_NORESIZE		(1 << 3)
> +#define VFIO_IRQ_INFO_FLAG_CAPS		(1 << 4) /* Info supports caps */
>  	__u32	index;		/* IRQ index */
> +	__u32	cap_offset;	/* Offset within info struct of first cap */
>  	__u32	count;		/* Number of IRQs within this index */

This would break ABI for get irq info. I think irq cap chain can just follow
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
> +#define VFIO_IRQ_TYPE_GFX				(1)
> +#define VFIO_IRQ_SUBTYPE_GFX_PRI_PLANE_FLIP		(1)
> +#define VFIO_IRQ_SUBTYPE_GFX_CUR_PLANE_FLIP		(2)
> +

Really need to split for different planes? I'd like a VFIO_IRQ_SUBTYPE_GFX_=
DISPLAY_EVENT
so user space can probe change for all.

>  /**
>   * VFIO_DEVICE_SET_IRQS - _IOW(VFIO_TYPE, VFIO_BASE + 10, struct vfio_ir=
q_set)
>   *
> @@ -550,7 +570,8 @@ enum {
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

--bE2XbrxqIoa/xW9+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXPc/XgAKCRCxBBozTXgY
J14tAJ4spOUUHHjI7VDGf6v2HLVSukewqwCfQAqvU+E12da+D4hdzCsT6skO92Q=
=7ecn
-----END PGP SIGNATURE-----

--bE2XbrxqIoa/xW9+--

--===============2007378364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============2007378364==--
