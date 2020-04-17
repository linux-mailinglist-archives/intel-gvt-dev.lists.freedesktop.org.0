Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46AA1ADA0A
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Apr 2020 11:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740AD6E3E3;
	Fri, 17 Apr 2020 09:34:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66FA6E3E3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 17 Apr 2020 09:34:18 +0000 (UTC)
IronPort-SDR: +9WDKQTU67ngiuFsbJxdYO4ix3LxVpbRWfhoI7yI4b9fq9dU/kPsT69RITvQ8s86ttDrQWfMqI
 ws/aHMVEVAeQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 02:34:17 -0700
IronPort-SDR: BUdH0w8JHFkicvk3LzAqEwxnqG7lNrfULPSOwGoB0EqKtK+jP0+F/NDQM0GkU7l1kps9Hg/mf8
 zauqxoH86ROQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; 
 d="asc'?scan'208";a="428173311"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga005.jf.intel.com with ESMTP; 17 Apr 2020 02:34:16 -0700
Date: Fri, 17 Apr 2020 17:20:28 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v7] drm/i915/gvt: skip populate shadow context if guest
 context not changed
Message-ID: <20200417092028.GZ11247@zhen-hp.sh.intel.com>
References: <20200417091334.32628-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200417091334.32628-1-yan.y.zhao@intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0236927179=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0236927179==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7ZMy3ZKywLyoHonN"
Content-Disposition: inline


--7ZMy3ZKywLyoHonN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.04.17 05:13:34 -0400, Yan Zhao wrote:
> Software is not expected to populate engine context except when using
> restore inhibit bit or golden state to initialize it for the first time.
>=20
> Therefore, if a newly submitted guest context is the same as the last
> shadowed one, no need to populate its engine context from guest again.
>=20
> Currently using lrca + ring_context_gpa to identify whether two guest
> contexts are the same.
>=20
> The reason of why context id is not included as an identifier is that
> i915 recently changed the code and context id is only unique for a
> context when OA is enabled. And when OA is on, context id is generated
> based on lrca. Therefore, in that case, if two contexts are of the same
> lrca, they have identical context ids as well.
> (This patch also works with old guest kernel like 4.20.)
>=20
> for guest context, if its ggtt entry is modified after last context
> shadowing, it is also deemed as not the same context as last shadowed one.
>=20
> v7:
> -removed local variable "valid". use the one in s->last_ctx diretly
>=20
> v6:
> -change type of lrca of last ctx to be u32. as currently it's all
> protected by vgpu lock (Kevin Tian)
> -reset valid of last ctx to false once it needs to be repopulated before
> population completes successfully (Kevin Tian)
>=20
> v5:
> -merge all 3 patches into one patch  (Zhenyu Wang)
>=20
> v4:
> - split the series into 3 patches.
> - don't turn on optimization until last patch in this series (Kevin Tian)
> - define lrca to be atomic in this patch rather than update its type in
> the second patch (Kevin Tian)
>=20
> v3: updated commit message to describe engine context and context id
> clearly (Kevin Tian)
> v2: rebased to 5.6.0-rc4+Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
>=20
> Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Suggested-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---

Applied. Thanks for the review!

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--7ZMy3ZKywLyoHonN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXpl03AAKCRCxBBozTXgY
J0UqAJ0aAiM3vmOp88NDaXbigcrjMZ+r/wCeJT3pGk43HszZL9s7+ba76B1lUzY=
=9cEH
-----END PGP SIGNATURE-----

--7ZMy3ZKywLyoHonN--

--===============0236927179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0236927179==--
