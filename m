Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9011F2F955
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 30 May 2019 11:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453806E13A;
	Thu, 30 May 2019 09:23:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB346E13A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 May 2019 09:23:53 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 02:23:52 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga006.fm.intel.com with ESMTP; 30 May 2019 02:23:51 -0700
Date: Thu, 30 May 2019 17:22:30 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
Subject: Re: [PATCH v4 0/2] Fix issues reported by klocwork
Message-ID: <20190530092230.GF3211@zhen-hp.sh.intel.com>
References: <20190502095922.31917-1-aleksei.gimbitskii@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190502095922.31917-1-aleksei.gimbitskii@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0683031553=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0683031553==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XStn23h1fwudRqtG"
Content-Disposition: inline


--XStn23h1fwudRqtG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.02 12:59:20 +0300, Aleksei Gimbitskii wrote:
> The klocwork static code analyzer found 11 critical issues and 7 error
> issues in GVT-g source code. After the analyzation, one critical issue
> and 6 "errors" was concluded as harmless. This patchset fixes other
> cases, which might cause potential issues in future.
>=20
> v4:
> - Minor changes to one error message in patch 1. (Colin Xu)=20
> - After discusion we agreed that patch 2 remains unmodified.
>=20
> v3:
> - Remove typedef and let the enumeration starts from zero. (Zhi Wang)
>=20
> V2:
> - Print some error messages if page table type is invalid. (Colin Xu)
> - Increase the size of the buffer. (Colin Xu)
> - Initialize fb_info.obj in vgpu_get_plane_info(). (Colin Xu)
>=20
> Aleksei Gimbitskii (2):
>   drm/i915/gvt: Check if cur_pt_type is valid
>   drm/i915/gvt: Assign NULL to the pointer after memory free.
>=20

Applied these. For second one, pls check to refine error message later.

thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--XStn23h1fwudRqtG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXO+g1gAKCRCxBBozTXgY
J13GAKCd2HvbnX77d+1TuycjPixYabol0ACfXEqaXVof/+XEdYZutmbRbvdVFqE=
=rF9I
-----END PGP SIGNATURE-----

--XStn23h1fwudRqtG--

--===============0683031553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0683031553==--
