Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F1E2B566E
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 17 Nov 2020 02:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DF06E0CA;
	Tue, 17 Nov 2020 01:55:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354E26E0CA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 17 Nov 2020 01:55:26 +0000 (UTC)
IronPort-SDR: +A27ymhPjBJKym5J0JbonoyOAL3GUTui2Z9A7YBglpnPCmh6Iz+7n+3sgvlslt3vjfqpkzIeDY
 Jb2D+jCjxq+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="150696221"
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
 d="asc'?scan'208";a="150696221"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 17:55:23 -0800
IronPort-SDR: HuETh7br7ZJAgfUGeg23wzNrKRSefPvMMFxJSe994CSM1m8t1aHVyqvdZREbo/EQYbhAuoiSYP
 tATXVBd1ZTjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
 d="asc'?scan'208";a="532058742"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga006.fm.intel.com with ESMTP; 16 Nov 2020 17:55:21 -0800
Date: Tue, 17 Nov 2020 09:40:53 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: [PATCH] i915/drm/gvt: treat intel_gvt_mpt as const in gvt code
Message-ID: <20201117014053.GA23899@zhen-hp.sh.intel.com>
References: <20201111172811.558443-1-julian.stecklina@cyberus-technology.de>
MIME-Version: 1.0
In-Reply-To: <20201111172811.558443-1-julian.stecklina@cyberus-technology.de>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0153801868=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0153801868==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.11.11 18:28:11 +0100, Julian Stecklina wrote:
> The current interface of intel_gvt_register_hypervisor() expects a
> non-const pointer to struct intel_gvt_mpt, even though the mediator
> never modifies (or should modifiy) the content of this struct.
>=20
> Change the function signature and relevant struct members to const to
> properly express the API's intent and allow instances of intel_gvt_mpt
> to be allocated as const.
>=20
> While I was here, I also made KVM's instance of this struct const to
> reduce the number of writable function pointers in the kernel.
>=20
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Signed-off-by: Julian Stecklina <julian.stecklina@cyberus-technology.de>
> ---

Looks good to me. Thanks!

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX7MqGQAKCRCxBBozTXgY
J8rfAJwJLkzOFqDRfPUdLNmLXWo9YOpn6gCgidOVxATe2mc+wFXOLaAJCwwMFyk=
=xGwJ
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--

--===============0153801868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0153801868==--
