Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE158492AF
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  5 Feb 2024 04:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB3F1122F6;
	Mon,  5 Feb 2024 03:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJLqEPMX";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA611122F6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  5 Feb 2024 03:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707102787; x=1738638787;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=lIjT/YoKVLiD5zuj8un6xWI3LP9yC/MdSP9BDgT2Tno=;
 b=SJLqEPMXeF2KT9KMkT3Mc1JxA38fnOlTiaxgkt7eP5KxMuTTqhUjcFF3
 blTReC0L0ckawX6VqsIVcT4FkXo1YILbva2uB5109DELqUuryeau7yTK0
 +5oa+mwflLubbsiJdZ7LIEo9jFYHa7UzmphZCRJBJD9xpKiZC8Zc9EpGB
 RU48GMQQuaPB5Mus1oSqi4j/dKnshcGb8Tm97kLcU5YromNybG8jpNOMf
 qqHTDvCsUtRY/pLz2POCjg0yLwDhprtbHqE0PjXWGvFu74BNXp5hhVSzb
 1bDJcdjNfXGhVA5ZOiVk+NM9/cxUb76hYQN3z41/+IBMR5KsH7RezggdL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="17857208"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
 d="asc'?scan'208";a="17857208"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2024 19:13:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; d="asc'?scan'208";a="5210577"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.160.45])
 by orviesa005.jf.intel.com with ESMTP; 04 Feb 2024 19:13:02 -0800
Date: Mon, 5 Feb 2024 11:14:04 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: Update Zhi Wang's email address
Message-ID: <ZcBSfGgaiwl9XKBJ@debian-scheme>
References: <20240130212743.7727-1-zhi.wang.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="2ut7cf4FfTHHAhyy"
Content-Disposition: inline
In-Reply-To: <20240130212743.7727-1-zhi.wang.linux@gmail.com>
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--2ut7cf4FfTHHAhyy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2024.01.30 21:27:43 +0000, Zhi Wang wrote:
> Update my email address to zhi.wang.linux@gmail.com.
>=20
> CC: Zhenyu Wang <zhenyuw@linux.intel.com>
> Signed-off-by: Zhi Wang <zhi.wang.linux@gmail.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 32a47aa6aa76..3d36696e99a6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10801,7 +10801,7 @@ F:	drivers/gpio/gpio-tangier.h
> =20
>  INTEL GVT-g DRIVERS (Intel GPU Virtualization)
>  M:	Zhenyu Wang <zhenyuw@linux.intel.com>
> -M:	Zhi Wang <zhi.a.wang@intel.com>
> +M:	Zhi Wang <zhi.wang.linux@gmail.com>
>  L:	intel-gvt-dev@lists.freedesktop.org
>  L:	intel-gfx@lists.freedesktop.org
>  S:	Supported
> --=20

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>


--2ut7cf4FfTHHAhyy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCZcBSeAAKCRCxBBozTXgY
J0RuAJ9r95uuneWLQJtZV9GlkRSa2zFCLgCgk78ICR6hOexTzxf/YyfoC0vQfAk=
=TnMN
-----END PGP SIGNATURE-----

--2ut7cf4FfTHHAhyy--
