Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 945471A19B8
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Apr 2020 03:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4936E18E;
	Wed,  8 Apr 2020 01:58:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBEC6E175;
 Wed,  8 Apr 2020 01:58:13 +0000 (UTC)
IronPort-SDR: Z7RfLCd55kTr+ztyiazHNLLMoyStR7qXiK9uKaE7v1NevkJSOoIlQsJeOy+846r8FCYbydDDw2
 QbD3XQRLdPjw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 18:58:13 -0700
IronPort-SDR: A4X7dV6qT3+K0DSyPnNmCF/GDGceFfXtbdjKlTt2reQA/4yUPH+2z0aFGXOBusNPqoYjKMJCp7
 QnQtn4VLkifQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; 
 d="asc'?scan'208";a="254650039"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga006.jf.intel.com with ESMTP; 07 Apr 2020 18:58:06 -0700
Date: Wed, 8 Apr 2020 09:44:37 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/6] i915/gvt: remove unused xen bits
Message-ID: <20200408014437.GF11247@zhen-hp.sh.intel.com>
References: <20200404094101.672954-1-hch@lst.de>
 <20200404094101.672954-4-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200404094101.672954-4-hch@lst.de>
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
Cc: Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, io-uring@vger.kernel.org,
 Zhi Wang <zhi.a.wang@intel.com>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: multipart/mixed; boundary="===============0417533901=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0417533901==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HnQK338I3UIa/qiP"
Content-Disposition: inline


--HnQK338I3UIa/qiP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.04.04 11:40:58 +0200, Christoph Hellwig wrote:
> No Xen support anywhere here.  Remove a dead declaration and an unused
> include.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

We'll keep that off-tree.

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks

>  drivers/gpu/drm/i915/gvt/gvt.c       | 1 -
>  drivers/gpu/drm/i915/gvt/hypercall.h | 2 --
>  2 files changed, 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gv=
t.c
> index 9e1787867894..c7c561237883 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.c
> +++ b/drivers/gpu/drm/i915/gvt/gvt.c
> @@ -31,7 +31,6 @@
>   */
> =20
>  #include <linux/types.h>
> -#include <xen/xen.h>
>  #include <linux/kthread.h>
> =20
>  #include "i915_drv.h"
> diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/=
gvt/hypercall.h
> index b17c4a1599cd..b79da5124f83 100644
> --- a/drivers/gpu/drm/i915/gvt/hypercall.h
> +++ b/drivers/gpu/drm/i915/gvt/hypercall.h
> @@ -79,6 +79,4 @@ struct intel_gvt_mpt {
>  	bool (*is_valid_gfn)(unsigned long handle, unsigned long gfn);
>  };
> =20
> -extern struct intel_gvt_mpt xengt_mpt;
> -
>  #endif /* _GVT_HYPERCALL_H_ */
> --=20
> 2.25.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--HnQK338I3UIa/qiP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXo0shQAKCRCxBBozTXgY
J8WgAJ0VW4AV47S/NYsttohA4zN5UaISYwCcDrId8F/1nTizuYFrFCCaENgnHw4=
=EI9a
-----END PGP SIGNATURE-----

--HnQK338I3UIa/qiP--

--===============0417533901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0417533901==--
