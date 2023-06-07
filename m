Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE7A725A9C
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  7 Jun 2023 11:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0906210E202;
	Wed,  7 Jun 2023 09:35:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E55A10E202;
 Wed,  7 Jun 2023 09:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686130553; x=1717666553;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=trhv7h9IG7DmXJDoQa/DWBGh35gl0791+hj+oGpzWns=;
 b=gvwq9FPpL0cVMU3Zj0RNQLHsTQRzi68wG6JAKU8RK4eVBUHhb+fhJELt
 RDq294S+ko8/0sYewpeIETS4THfQ4Ehonv0wIBXNAS2y2+t+GXVv8I4h6
 rX78IWEeIxD5Of4dKeEYzUM2Sl9mQP7pjxZrUTP3XMBCEA4f2Lv5rxcW5
 O8NUt8v0pmqERFtxhn64Z+atp+/w2OVxO4Mky8PmUu2bMrExWooHMhL3z
 1opuC3dwnLY3YCvQtClhvbE7kkeIEN1irauuncR9fWJGaqeVMcMjItW5W
 EOPp3iJ7FABpX6oZYWOx1Syt1eNhepwo/Wml1EwDx2nxa9ZECOI/75GVl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="355792979"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
 d="asc'?scan'208";a="355792979"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 02:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="956142992"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
 d="asc'?scan'208";a="956142992"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.160.45])
 by fmsmga006.fm.intel.com with ESMTP; 07 Jun 2023 02:35:50 -0700
Date: Wed, 7 Jun 2023 17:34:40 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH RESEND] drm/i915/gvt: remove unused variable gma_bottom
 in command parser
Message-ID: <ZIBPMHS9xHL9PgH0@debian-scheme>
References: <20230531020411.18987-1-zhi.a.wang@intel.com>
 <ZHbdr8YdISKvFrWD@debian-scheme> <878rd4hmvk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="W7Tn6xEA4wo95xg6"
Content-Disposition: inline
In-Reply-To: <878rd4hmvk.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.wang.linux@gmail.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--W7Tn6xEA4wo95xg6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023.05.31 12:27:11 +0300, Jani Nikula wrote:
> On Wed, 31 May 2023, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> > On 2023.05.31 02:04:11 +0000, Zhi Wang wrote:
> >> Remove unused variable gma_bottom in scan_workload() and scan_wa_ctx().
> >> commit be1da7070aea ("drm/i915/gvt: vGPU command scanner") introduces
> >> gma_bottom in several functions to calculate the size of the command
> >> buffer. However, some of them are set but actually unused.
> >>=20
> >> When compiling the code with ccflags -Wunused-but-set-variable, gcc
> >> throws warnings.
> >>=20
> >> Remove unused variables to avoid the gcc warnings. Tested via compiling
> >> the code with ccflags -Wunused-but-set-variable.
> >>=20
> >> Fixes: be1da7070aea ("drm/i915/gvt: vGPU command scanner")
> >> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> >> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> >> Cc: intel-gvt-dev@lists.freedesktop.org
> >> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> >> ---
> >
> > Good with me. I think I also caught this before but never send the chan=
ge..
> > Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
>=20
> I'd like to pick this up via drm-intel-next if that's all right.
>=20

Sorry for missed this. Pls feel free to do so. I'll sync to check anything =
left in gvt tree.

Thanks.

--W7Tn6xEA4wo95xg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCZIBPKwAKCRCxBBozTXgY
J8CkAKCT5sJ4uDv4+3Duv7ml75ZtTqHxgACfQ5IELgYD28kQmhDStqHC7voinPs=
=tiTc
-----END PGP SIGNATURE-----

--W7Tn6xEA4wo95xg6--
