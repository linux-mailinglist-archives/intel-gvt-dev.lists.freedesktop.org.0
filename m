Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E791C327F6
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  3 Jun 2019 07:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CD5896E4;
	Mon,  3 Jun 2019 05:22:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCD1896E4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  3 Jun 2019 05:22:02 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jun 2019 22:22:01 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga005.fm.intel.com with ESMTP; 02 Jun 2019 22:22:00 -0700
Date: Mon, 3 Jun 2019 13:20:32 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>
Subject: Re: [PATCH v6] drm/i915/gvt: save RING_HEAD into vreg when vgpu
 switched out
Message-ID: <20190603052031.GH9684@zhen-hp.sh.intel.com>
References: <1559530553-9244-1-git-send-email-xiaolin.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1559530553-9244-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1777834497=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1777834497==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYYhpFXgKVw71fwr"
Content-Disposition: inline


--mYYhpFXgKVw71fwr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.06.03 10:55:53 +0800, Xiaolin Zhang wrote:
> Save RING_HEAD into vgpu reg when vgpu switched out and report
> it's value back to guest.
>=20
> v6: addressed comment for ring head wrap count support. (Zhenyu)
> v5: ring head wrap count support.
> v4: updated HEAD/TAIL with guest value, not host value. (Yan Zhao)
> v3: save RING HEAD/TAIL vgpu reg in save_ring_hw_state. (Zhenyu Wang)
> v2: save RING_TAIL as well during vgpu mmio switch to meet ring_is_idle
> condition. (Fred Gao)
> v1: based on input from Weinan. (Weinan Li)
>=20
> [zhenyuw: Include this fix for possible future guest kernel that
> would utilize RING_HEAD for hangcheck.]
>=20
> Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---

Applied this, thanks!

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--mYYhpFXgKVw71fwr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXPSuHwAKCRCxBBozTXgY
J3l6AJ0VgKHOLq6/5AnDiflQ80R85MsfJwCeKZ5N+8ipW53Xq0z77dh3hxrdmMs=
=pZbE
-----END PGP SIGNATURE-----

--mYYhpFXgKVw71fwr--

--===============1777834497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1777834497==--
