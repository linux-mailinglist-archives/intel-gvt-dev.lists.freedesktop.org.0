Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6845F625618
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Nov 2022 10:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F3210E79F;
	Fri, 11 Nov 2022 09:02:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A5D10E798;
 Fri, 11 Nov 2022 09:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668157373; x=1699693373;
 h=date:from:to:cc:subject:message-id:reply-to:mime-version;
 bh=AD60VY4t4OczLdL+YxJQEYtzKl7qvfpWMfP9Xz7+X1I=;
 b=XQ4BGIYbzjQ+ws3N42wtrNdp6vPH2mao/WSfUIHpN8ev2SLlHNDDQxWU
 61WhL5LwlvUW1ElcpFsrPi9Hry3AeObHyY2pNLJDzwIbpYIdoYWOWPYol
 AfHSVqkDyk1h2eTX4etaF+E8SkPL6gHsGNEsHejXKHVzBvgy32a0sHSHC
 luEPsA8qk3ewiYW05x4zlYIbHTRDLS9HUCSb49JnvNti1kWaQLB1vPSuF
 vWvW0B9tfXK3qqrFIcUjPkq4dkmoisCYxTQEbakNUtEvUFk8bamsOiNqc
 9ik6NQjillS4h/YsXSg4GXgEM2v6WfFECI5zVpROlWiW6lvGR0bIgouvt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="338329604"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; 
 d="asc'?scan'208";a="338329604"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 01:02:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="639951661"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; 
 d="asc'?scan'208";a="639951661"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga007.fm.intel.com with ESMTP; 11 Nov 2022 01:02:40 -0800
Date: Fri, 11 Nov 2022 17:02:08 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20221111090208.GQ30028@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="bX/mw5riLlTkt+Gv"
Content-Disposition: inline
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--bX/mw5riLlTkt+Gv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's two fixes from Sean for 6.1 kernel, which is to fix kvm
reference in gvt. No regression found in our test.

Thanks!
---
The following changes since commit f0c4d9fc9cc9462659728d168387191387e903cc:

  Linux 6.1-rc4 (2022-11-06 15:07:11 -0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-fixes-2022-11-11

for you to fetch changes up to 3c9fd44b9330adc5006653566f3d386784b2080e:

  drm/i915/gvt: Unconditionally put reference to KVM when detaching vGPU (2022-11-11 13:21:52 +0800)

----------------------------------------------------------------
gvt-fixes-2022-11-11

- kvm reference fix from Sean

----------------------------------------------------------------
Sean Christopherson (2):
      drm/i915/gvt: Get reference to KVM iff attachment to VM is successful
      drm/i915/gvt: Unconditionally put reference to KVM when detaching vGPU

 drivers/gpu/drm/i915/gvt/kvmgt.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)


--bX/mw5riLlTkt+Gv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY24PkAAKCRCxBBozTXgY
J8HQAJ9dofDxsqkhMkju28ELQhJTeVC9MACfVJzYFOKHaJAEvK8h1iYgW3axhtI=
=ixMp
-----END PGP SIGNATURE-----

--bX/mw5riLlTkt+Gv--
