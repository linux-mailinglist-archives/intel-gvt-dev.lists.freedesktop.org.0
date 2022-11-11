Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CF3625305
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Nov 2022 06:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B03410E202;
	Fri, 11 Nov 2022 05:17:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B7010E009;
 Fri, 11 Nov 2022 05:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668143849; x=1699679849;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=ql328E2NG2zRXgk89uFvUx0p6YzxyXQHLwUbNDKXi8k=;
 b=VEZLWH0HBb/Jvp9sFWcM5NbxxxNe+Z8Ck2pSMbo5z0d3bTE/MBM2AXUy
 8ov6M2IVT++vDWTcWU1WZ0epQAE6JCHcEtbQQiu7vi/xpCtTGTh2fZZZF
 Ymd6IyjyGCXW9iYdTu5NOZg+qC5B9Obv71hhgHYWzwdIbPBDlJSZHkp1F
 /Z7Or0ViGgqrQcbZo+BxWlAoiaKGKRdWgKxMVkq31vlbnv0fIXD2Uqx0J
 yqIKUgGRYtw4a2l7jXy9KbkPVqqzH8EchBwwvR98MYu4Td30cH/AzHo6E
 9aeX/Ft9q5gMZz4w9jS4NpAk8pQAmmGKyXY8empMfZVkJ1lKlTl65MEgB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="311531050"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; 
 d="asc'?scan'208";a="311531050"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 21:17:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="639894622"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; 
 d="asc'?scan'208";a="639894622"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga007.fm.intel.com with ESMTP; 10 Nov 2022 21:17:27 -0800
Date: Fri, 11 Nov 2022 13:16:55 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 0/2] drm/i915/gvt: Fix for KVM refcounting bug
Message-ID: <20221111051655.GO30028@zhen-hp.sh.intel.com>
References: <20221111002225.2418386-1-seanjc@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Rmm1Stw9KgbdL9/H"
Content-Disposition: inline
In-Reply-To: <20221111002225.2418386-1-seanjc@google.com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--Rmm1Stw9KgbdL9/H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.11.11 00:22:23 +0000, Sean Christopherson wrote:
> Bug fix and cleanup related to KVM refcounting.  Found by inspection while
> attempting to clean up KVM's page-tracker APIs.
>=20
> Compile tested only!
>=20
> Sean Christopherson (2):
>   drm/i915/gvt: Get reference to KVM iff attachment to VM is successful
>   drm/i915/gvt: Unconditionally put reference to KVM when detaching vGPU
>=20
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20

Thanks, Sean! and Kevin's review. Pushed this to fixes tree, will issue
regression test before going upstream.

--Rmm1Stw9KgbdL9/H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY23awgAKCRCxBBozTXgY
J2EMAKCa/3JJB5jBs4Y27kn2yBiYr6NLmgCfaefRrTdWjykmFApwicOZO21ZUQg=
=/qdW
-----END PGP SIGNATURE-----

--Rmm1Stw9KgbdL9/H--
