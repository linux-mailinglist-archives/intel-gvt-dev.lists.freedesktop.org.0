Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9839D21D16D
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 Jul 2020 10:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F812891DC;
	Mon, 13 Jul 2020 08:12:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6FE891DC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 Jul 2020 08:12:25 +0000 (UTC)
IronPort-SDR: 3thQZC1J9NKyN82VX9vxWXBZrrQOiSGaqIetV40bDp2lq7ANJRx3I9+wwJBXLHYHPAjxRkirQ5
 OgBKRCbtMIRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9680"; a="166685217"
X-IronPort-AV: E=Sophos;i="5.75,346,1589266800"; 
 d="asc'?scan'208";a="166685217"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 01:12:25 -0700
IronPort-SDR: uSZlwNpKmyJ/Kf1Sbv1Uadv692qpf72PbL6QylgDTe26c/Q8gskDdVDyuMc3onVpGpA+9LZD9H
 3031brN6xJiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,346,1589266800"; 
 d="asc'?scan'208";a="268307736"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga007.fm.intel.com with ESMTP; 13 Jul 2020 01:12:24 -0700
Date: Mon, 13 Jul 2020 15:55:21 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH v2 0/3] Fix ppgtt_mm destroy and pv_notified reset logic
 during vGPU D3->D0
Message-ID: <20200713075521.GJ27035@zhen-hp.sh.intel.com>
References: <20200709071002.247960-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200709071002.247960-1-colin.xu@intel.com>
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
Cc: kevin.tian@intel.com, intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0801801879=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0801801879==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p1Od3smaOkJqivj4"
Content-Disposition: inline


--p1Od3smaOkJqivj4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.07.09 15:09:55 +0800, Colin Xu wrote:
> The patch set fix issues when vGPU transit D3->D0:
> Do not invalidate & destroy ppgtt_mm in dmlr when D3->D0.
> Do not reset pv_notified in dmlr when D3->D0.
>=20
> v2:
> - Revise commit message to more accurate description. (Kevin)
> - Split patch by logic. (Zhenyu)
>=20
> Colin Xu (3):
>   drm/i915/gvt: Do not destroy ppgtt_mm during vGPU D3->D0.
>   drm/i915/gvt: Do not reset pv_notified when vGPU transit from D3->D0
>   drm/i915/gvt: Remove intel_vgpu_reset_gtt() since no one use it.
>=20
>  drivers/gpu/drm/i915/gvt/cfg_space.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/gtt.c       | 20 +-------------------
>  drivers/gpu/drm/i915/gvt/gtt.h       |  3 ++-
>  drivers/gpu/drm/i915/gvt/gvt.h       |  3 +++
>  drivers/gpu/drm/i915/gvt/vgpu.c      | 20 +++++++++++++++++---
>  5 files changed, 47 insertions(+), 23 deletions(-)
>=20

Looks fine to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--p1Od3smaOkJqivj4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXwwTaQAKCRCxBBozTXgY
J1agAJ0S6QsHs5qa3KSnaMnWnZ8Fdir3AgCfV7RUTUmu/pM8sTc6UWSyea8UbfA=
=Dmgd
-----END PGP SIGNATURE-----

--p1Od3smaOkJqivj4--

--===============0801801879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0801801879==--
